use arma_rs::{Extension, arma};

#[cfg(windows)]
use enigo::{Enigo, Key, KeyboardControllable};

mod discord;

#[allow(unused_must_use)]
fn browser(url: String) -> String {
    webbrowser::open(&url);
    url
}

fn screenshot() {
    Enigo::new().key_click(Key::F12);
}

#[arma]
fn init() -> Extension {
    Extension::build()
        .allow_no_args()
        .group("discord", discord::group())
        .command("browser", browser)
        .command("screenshot", screenshot)
        .finish()
}
