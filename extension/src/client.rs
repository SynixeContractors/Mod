use std::{sync::Mutex, thread, time::SystemTime};

use arma_rs::rv_callback;
use discord_rpc_sdk::{DiscordUser, EventHandlers, RichPresence, RPC};

use crate::rv_send_callback;

struct Handlers;
impl EventHandlers for Handlers {
    fn ready(user: DiscordUser) {
        thread::spawn(move || {
            thread::sleep(std::time::Duration::from_secs(2));   
            rv_callback!("synixe", "discord_user_ready", format!("D{}", user.user_id), user.username);
        });
    }
}

lazy_static::lazy_static! {
    static ref RPCM: Mutex<RPC> =
        Mutex::new(RPC::init::<Handlers>("411594868293500938", true, None).unwrap());
}

static mut TIMESTAMP: Option<SystemTime> = None;
static mut PROFILE_NAME: String = String::new();

pub unsafe fn setup(_steam_id: String, profile_name: String) {
    TIMESTAMP = Some(SystemTime::now());
    PROFILE_NAME = profile_name;
}

pub unsafe fn update(details: String, state: String, image: String, text: String) {
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
