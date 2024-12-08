colors = [
    "aor1",
    "aor2",
    "blk",
    "cb",
    "gry",
    "khk",
    "m81",
    "mc",
    "rgr",
    "tan",
    "wht",
    "dts",
    "mcar",
    "mcb",
    "mct",
    "ts",
]

hat_models = [
    "cap_01",
    "cap_01_goggles",
    "cap_02",
    "cap_02_goggles",
    "cap_03",
    "cap_03_goggles",
    "cap_backwards_01",
    "cap_backwards_01_goggles",
    "cap_backwards_02",
    "cap_backwards_02_goggles",
    "cap_backwards_03",
    "cap_backwards_03_goggles",
]

def hats():
    to_hide = []
    to_rename = []
    for model in hat_models:
        for a in colors:
            for b in colors:
                if model.endswith("_01") and b == "blk":
                    to_rename.append([
                        "milgp_h_" + model + "_" + a + "_blk",
                        a,
                    ])
                    continue
                name = "milgp_h_" + model + "_" + a + "_" + b
                to_hide.append(name)

    return [to_hide, to_rename]

if __name__ == "__main__":
    with open("hats.txt", "w") as f:
        hide, rename = hats()
        for name in hide:
            f.write("HIDE(" + name + ");\n")
        for name, color in rename:
            if "backwards" in name:
                f.write("RENAME(" + name + ",\"Cap Backwards (" + color.upper() + ")\");\n")
            else:
                f.write("RENAME(" + name + ",\"Cap (" + color.upper() + ")\");\n")
