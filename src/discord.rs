use std::{
    sync::{
        mpsc::{self, Sender},
        LazyLock, Mutex,
    },
    thread,
    time::{SystemTime, UNIX_EPOCH},
};

use arma_rs::Group;
use discord_presence::Client;

pub fn group() -> Group {
    Group::new()
        .command("setup", setup)
        .command("update", update)
}

struct Update {
    details: String,
    state: String,
    image: String,
    text: String,
    start: u64,
}

/// The Discord client lives on its own thread: `set_activity` blocks until Discord
/// responds (which can take up to the socket's 30s read timeout), and that must
/// never happen on the game thread inside `callExtension`.
static WORKER: LazyLock<Mutex<Sender<Update>>> = LazyLock::new(|| {
    let (tx, rx) = mpsc::channel::<Update>();
    thread::spawn(move || {
        let mut client = Client::new(411594868293500938);
        // Must be started before any activity can be set
        client.start();
        while let Ok(mut update) = rx.recv() {
            // Only the most recent presence matters, skip any that queued up while blocked
            while let Ok(newer) = rx.try_recv() {
                update = newer;
            }
            if let Err(e) = client.set_activity(|a| {
                a.state(update.state)
                    .details(update.details)
                    .assets(|a| a.large_image(update.image).large_text(update.text))
                    .timestamps(|a| a.start(update.start))
            }) {
                println!("Failed to update Discord presence: {e}");
            }
        }
    });
    Mutex::new(tx)
});

static TIMESTAMP: Mutex<Option<u64>> = Mutex::new(None);

fn now() -> u64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_secs())
        .unwrap_or_default()
}

pub fn setup(_steam_id: String, _profile_name: String) {
    if let Ok(mut ts) = TIMESTAMP.lock() {
        *ts = Some(now());
    }
    // Start connecting to Discord now rather than on the first update
    LazyLock::force(&WORKER);
}

pub fn update(details: String, state: String, image: String, text: String) {
    let start = TIMESTAMP
        .lock()
        .ok()
        .map(|mut ts| *ts.get_or_insert_with(now))
        .unwrap_or_else(now);
    if let Ok(tx) = WORKER.lock() {
        let _ = tx.send(Update {
            details,
            state,
            image,
            text,
            start,
        });
    }
}
