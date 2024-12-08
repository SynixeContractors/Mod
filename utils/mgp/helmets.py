models = [
    "airframe_01",
    "airframe_01_goggles",
    "airframe_02",
    "airframe_02_goggles",
    "airframe_03",
    "airframe_03_goggles",
    "airframe_04",
    "airframe_04_goggles",
    "airframe_05",
    "airframe_05_goggles",
    "airframe_06",
    "airframe_06_goggles",
    "opscore_01",
    "opscore_01_goggles",
    "opscore_02",
    "opscore_02_goggles",
    "opscore_03",
    "opscore_03_goggles",
    "opscore_04",
    "opscore_04_goggles",
    "opscore_05",
    "opscore_05_goggles",
    "opscore_06",
    "opscore_06_goggles",
]

base_cover = [
    "blk",
    "khk",
    "rgr",
]
base = [
    "aor1",
    "aor2",
    "cb_hexagon",
    "cb",
    "khk_hexagon",
    "mc",
    "rgr_hexagon",
    "wht",
]

headphones = [
    "blk",
    "cb",
    "khk",
    "rgr",
    "wht",
]

covers = [
    "aor1",
    "aor2",
    "blk",
    "cb",
    "m81",
    "mc",
    "mcal",
    "mcar",
    "mcb",
    "mct",
    "rgr",
    "wht",
    "ts",
    "dts",
]

def helmets():
    to_hide = []
    to_rename = []
    for model in models:
        for a in base:
            name = "milgp_h_" + model + "_" + a
            if model.endswith("_01"):
                to_rename.append([
                    name,
                    [a],
                ])
            else:
                to_hide.append(name)
            for hp in headphones:
                name = "milgp_h_" + model + "_" + a + "_" + hp
                if model.endswith("_01"):
                    to_rename.append([
                        name,
                        [a, hp]
                    ])
                else:
                    to_hide.append(name)
        for a in base_cover:
            name = "milgp_h_" + model + "_" + a
            if model.endswith("_01"):
                to_rename.append([
                    name,
                    [a],
                ])
            else:
                to_hide.append(name)
            for hp in headphones:
                name = "milgp_h_" + model + "_" + a + "_" + hp
                if model.endswith("_01"):
                    to_rename.append([
                        name,
                        [a, hp]
                    ])
                else:
                    to_hide.append(name)
                for c in covers:
                    name = "milgp_h_" + model + "_" + a + "_" + hp + "_" + c + "c"
                    if model.endswith("_01"):
                        to_rename.append([
                            name,
                            [a, hp, c]
                        ])
                    else:
                        to_hide.append(name)

    return [to_hide, to_rename]

if __name__ == "__main__":
    with open("helmets.txt", "w") as f:
        hide, rename = helmets()
        for name in hide:
            f.write("HIDE(" + name + ");\n")
        for name, color in rename:
            write_color = ""
            if len(color) == 1:
                write_color = color[0].upper()
            elif len(color) == 2:
                write_color = color[0].upper() + "/" + color[1].upper()
            elif len(color) == 3:
                write_color = color[0].upper() + "/" + color[1].upper() + "/" + color[2].upper() + " Cover"
            helmet = "Airframe"
            if "opscore" in name:
                helmet = "OpsCore"
            f.write("RENAME(" + name + ",\"" + helmet + " (" + write_color + ")\");\n")
