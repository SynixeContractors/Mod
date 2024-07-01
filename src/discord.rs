use std::{sync::Mutex, time::SystemTime};

use arma_rs::Group;
use discord_presence::Client;

pub fn group() -> Group {
    Group::new()
        .command("setup", setup)
        .command("update", update)
}

lazy_static::lazy_static! {
    static ref RPCM: Mutex<Client> =
        Mutex::new(Client::new(411594868293500938));
}

static mut TIMESTAMP: Option<SystemTime> = None;
static mut PROFILE_NAME: String = String::new();

pub fn setup(_steam_id: String, profile_name: String) {
    unsafe {
        TIMESTAMP = Some(SystemTime::now());
        PROFILE_NAME = profile_name;
    }
}

pub fn update(details: String, state: String, image: String, text: String) {
    if let Err(e) = RPCM.lock().unwrap().set_activity(|a| {
        a.state(state)
            .details(details)
            .assets(|a| a.large_image(image).large_text(text))
            .timestamps(|a| {
                a.start(unsafe {
                    TIMESTAMP
                        .unwrap()
                        .duration_since(SystemTime::UNIX_EPOCH)
                        .unwrap()
                        .as_secs()
                })
            })
    }) {
        println!("Failed to update Discord presence: {}", e);
    }
}
