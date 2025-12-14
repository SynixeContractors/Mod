let data = parse_json(HEMTT_VFS.join("addons/tips/worlds.json").open_file().read());
let worlds = data["worlds"];
let tips_raw = data["tips"];

let tips = "";
for tip in tips_raw {
    tips = tips + "\"" + tip + "\",";
}

let cup_worlds = [];
let bi_worlds = [];

for world in worlds {
    if (world[2].contains("CUP")) {
        cup_worlds.push(world);
        continue;
    }
    if (world[2].contains("A3_Map")) {
        bi_worlds.push(world);
        continue;
    }
    let dir = HEMTT_VFS.join("addons/tips/" + world[0]);
    dir.create_dir();
    let config = dir.join("config.cpp").create_file();
    config.write(`
#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "${world[2]}"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

class CfgWorlds {
    class ${world[1]};
    class ${world[0]}: ${world[1]} {
        loadingTexts[] = {${tips}};
    };
};`);
    let script_component = dir.join("script_component.hpp").create_file();
    script_component.write(`
#define COMPONENT tips_${world[0]}
#include "..\\..\\main\\script_mod.hpp"
#include "..\\..\\main\\script_macros.hpp"
`);
}

for group in [[cup_worlds, "cup"], [bi_worlds, "bi"]] {
    let dir = HEMTT_VFS.join("addons/tips/" + group[1]);
    dir.create_dir();
    let config = dir.join("config.cpp").create_file();
    let worlds_cfg = "";
    let required = "";
    let external = [];
    for world in group[0] {
        worlds_cfg = worlds_cfg + `
    class ${world[0]}: ${world[1]} {
        loadingTexts[] = {${tips}};
    };`;
        required = required + `"${world[2]}",`;
        if (!external.contains(world[1])) {
            external.push(world[1]);
        }
    }
    let external_cfg = "";
    for ext in external {
        external_cfg = external_cfg + `    class ${ext};`;
    }
    config.write(`
#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            ${required}
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};
class CfgWorlds { ${external_cfg} ${worlds_cfg} };`);
    let script_component = dir.join("script_component.hpp").create_file();
    script_component.write(`
#define COMPONENT tips_${group[1]}
#include "..\\..\\main\\script_mod.hpp"
#include "..\\..\\main\\script_macros.hpp"
`);
}
