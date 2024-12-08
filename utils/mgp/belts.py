models = [
    "assaulter",
    "hgunner",
]

colors = [
    "aor1",
    "aor2",
    "blk",
    "cb",
    "khk",
    "mc",
    "mcar",
    "mcb",
    "mct",
    "rgr",
    "tan",
    "wht",
]

def belts():
    to_rename = []
    for model in models:
        for color in colors:
            name = "milgp_v_battle_belt_" + model + "_" + color + "_" + color
            to_rename.append([
                name,
                color,
            ])
    return to_rename

if __name__ == "__main__":
    with open("belts.txt", "w") as f:
        rename = belts()
        for name, color in rename:
            base = "Belt Assaulter"
            if "hgunner" in name:
                base = "Belt Gunner"
            f.write("RENAME(" + name + ",\"" + base + " (" + color.upper() + ")\");\n")
