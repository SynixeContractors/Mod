use serde::Deserialize;

use crate::rv_send_callback;
use arma_rs::rv_callback;

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

pub fn get_members() {
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
                        "synixe",
                        "member",
                        if let Some(n) = m.nick.clone() {
                            n
                        } else {
                            m.user.name.clone()
                        },
                        m.user.id.clone(),
                        (m.roles.contains(&826657899589664779)
                            || m.roles.contains(&826657899589664800))
                        .to_string()
                    )
                }
            });
            rv_callback!("synixe", "member_publish", "");
        }
        Err(e) => error!("Error fetching loadout: {}", e),
    }
}
