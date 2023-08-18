use arma_rs::{arma, Extension};

use enigo::{Enigo, Key, KeyboardControllable};

mod discord;

fn browser(url: String) {
    if let Err(e) = webbrowser::open(&url) {
        println!("Failed to open browser: {}", e);
    }
}

fn screenshot() {
    Enigo::new().key_click(Key::F12);
}

#[arma]
fn init() -> Extension {
    Extension::build()
        .group("discord", discord::group())
        .command("browser", browser)
        .command("screenshot", screenshot)
        .finish()
}
