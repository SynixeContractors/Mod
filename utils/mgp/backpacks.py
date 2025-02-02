models = [
    "milgp_bp_Breacher",
    "milgp_bp_hydration",
    "milgp_bp_Pointman",
    "milgp_bp_Tomahawk",
    "milgp_b_patrol_01",
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

def backpacks():
    to_rename = []
    for model in models:
        for base in colors:
            name = model + "_" + base
            to_rename.append([
                name,
                base,
            ])

    return to_rename

def backpack_name(name):
    if "Breacher" in name:
        return "Back Panel Breacher"
    elif "hydration" in name:
        return "Back Panel Hydration"
    elif "Pointman" in name:
        return "Back Panel Pointman"
    elif "Tomahawk" in name:
        return "Back Panel Tomahawk"
    elif "patrol" in name:
        return "Patrol"

if __name__ == "__main__":
    with open("backpacks.txt", "w") as f:
        rename = backpacks()
        for name, base in rename:
            vname = backpack_name(name)
            f.write("RENAME(" + name + ",\"" + vname + " (" + base.upper() + ")\");\n")
