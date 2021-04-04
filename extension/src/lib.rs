use arma_rs::{rv, rv_callback, rv_handler};

#[macro_use]
extern crate log;

use serde::Deserialize;

#[derive(Deserialize)]
struct Member {
    pub nick: Option<String>,
    pub user: User,
    pub roles: Vec<u64>,
}

#[derive(Deserialize)]
struct User {
    pub name: String,
    pub bot: bool,
    pub id: String,
}

#[rv(thread = true)]
fn get_members() {
    match reqwest::blocking::Client::new()
        .get("https://dev.dynulo.com/v1/bot/discord/guild/700888247928356905/members")
        .send()
        .unwrap()
        .json::<Vec<Member>>()
    {
        Ok(members) => {
            members.iter().for_each(|m| {
                if !m.user.bot {
                    rv_callback!(
                        "synixe_contractors",
                        "member",
                        if let Some(n) = m.nick.clone() {
                            n
                        } else {
                            m.user.name.clone()
                        },
                        m.user.id.clone(),
                        (m.roles.contains(&826657899589664779) || m.roles.contains(&826657899589664800)).to_string()
                    )
                }
            });
            rv_callback!(
                "synixe_contractors",
                "member_publish",
                ""
            );
        },
        Err(e) => error!("Error fetching loadout: {}", e),
    }
}

use log::{Level, LevelFilter, Metadata, Record};
struct ArmaLogger;

impl log::Log for ArmaLogger {
    fn enabled(&self, metadata: &Metadata) -> bool {
        metadata.level() <= Level::Info
    }

    fn log(&self, record: &Record) {
        if self.enabled(record.metadata()) {
            rv_callback!(
                "synixe_contractors_log",
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
