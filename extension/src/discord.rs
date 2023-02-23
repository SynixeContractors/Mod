use std::{sync::Mutex, time::SystemTime};

use arma_rs::Group;
use discord_rpc_sdk::{EventHandlers, RichPresence, RPC};

pub fn group() -> Group {
    Group::new()
        .command("setup", setup)
        .command("update", update)
}

struct Handlers;
impl EventHandlers for Handlers {}

lazy_static::lazy_static! {
    static ref RPCM: Mutex<RPC> =
        Mutex::new(RPC::init::<Handlers>("411594868293500938", true, None).unwrap());
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
    unsafe {
        let presence = RichPresence {
            details: Some(details),
            state: Some(state),
            start_time: TIMESTAMP,
            large_image_key: Some(image),
            large_image_text: Some(text),
            small_image_key: None,
            small_image_text: None,
            party_size: None,
            party_max: None,
            spectate_secret: None,
            join_secret: None,
            ..Default::default()
        };
        RPCM.lock().unwrap().update_presence(presence).unwrap();
    }
}
