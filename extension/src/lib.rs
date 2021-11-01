use arma_rs::{rv, rv_callback, rv_handler};
use enigo::{Enigo, Key, KeyboardControllable};

#[macro_use]
extern crate log;

// Server
mod server;

#[rv(thread = true)]
fn get_members() {
    server::get_members();
}

// Client
mod client;

#[rv]
#[allow(unused_must_use)]
fn browser(url: String) -> String {
    webbrowser::open(&url);
    url
}

#[rv]
fn screenshot() {
    Enigo::new().key_click(Key::F12);
}

#[rv]
unsafe fn discord_setup(_steam_id: String, profile_name: String) {
    client::setup(_steam_id, profile_name);
}

#[rv(thread = true)]
#[allow(unused_must_use)]
unsafe fn discord_update(details: String, state: String, image: String, text: String) {
    client::update(details, state, image, text);
}

// General

use log::{Level, LevelFilter, Metadata, Record};
struct ArmaLogger;

impl log::Log for ArmaLogger {
    fn enabled(&self, metadata: &Metadata) -> bool {
        metadata.level() <= Level::Info
    }

    fn log(&self, record: &Record) {
        if self.enabled(record.metadata()) {
            rv_callback!(
                "synixe_log",
                format!("{}", record.level()).to_uppercase(),
                format!("{}", record.args())
            );
        }
    }

    fn flush(&self) {}
}
static LOGGER: ArmaLogger = ArmaLogger;

#[rv_handler]
fn init() {
    log::set_logger(&LOGGER).map(|()| log::set_max_level(LevelFilter::Info));
}
