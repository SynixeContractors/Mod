use std::{
    sync::{LazyLock, Mutex},
    time::{SystemTime, UNIX_EPOCH},
};

use arma_rs::Group;
use discord_presence::Client;

pub fn group() -> Group {
    Group::new()
        .command("setup", setup)
        .command("update", update)
}

static RPCM: LazyLock<Mutex<Client>> = LazyLock::new(|| {
    let mut client = Client::new(411594868293500938);
    // Must be started before any activity can be set
    client.start();
    Mutex::new(client)
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
    LazyLock::force(&RPCM);
}

pub fn update(details: String, state: String, image: String, text: String) {
    let start = TIMESTAMP
        .lock()
        .ok()
        .map(|mut ts| *ts.get_or_insert_with(now))
        .unwrap_or_else(now);
    let Ok(mut client) = RPCM.lock() else {
        return;
    };
    if let Err(e) = client.set_activity(|a| {
        a.state(state)
            .details(details)
            .assets(|a| a.large_image(image).large_text(text))
            .timestamps(|a| a.start(start))
    }) {
        println!("Failed to update Discord presence: {e}");
    }
}
