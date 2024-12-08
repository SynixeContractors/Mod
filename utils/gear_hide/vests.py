models = [
    "milgp_v_jpc_assaulter_belt",
    "milgp_v_jpc_assaulter",
    "milgp_v_jpc_grenadier_belt",
    "milgp_v_jpc_grenadier",
    "milgp_v_jpc_hgunner_belt",
    "milgp_v_jpc_hgunner",
    "milgp_v_jpc_light_belt",
    "milgp_v_jpc_light",
    "milgp_v_jpc_marksman_belt",
    "milgp_v_jpc_marksman",
    "milgp_v_jpc_medic_belt",
    "milgp_v_jpc_medic",
    "milgp_v_jpc_teamleader_belt",
    "milgp_v_jpc_teamleader",
    "milgp_v_marciras_assaulter_belt",
    "milgp_v_marciras_assaulter",
    "milgp_v_marciras_grenadier_belt",
    "milgp_v_marciras_grenadier",
    "milgp_v_marciras_hgunner_belt",
    "milgp_v_marciras_hgunner",
    "milgp_v_marciras_light_belt",
    "milgp_v_marciras_light",
    "milgp_v_marciras_marksman_belt",
    "milgp_v_marciras_marksman",
    "milgp_v_marciras_medic_belt",
    "milgp_v_marciras_medic",
    "milgp_v_marciras_teamleader_belt",
    "milgp_v_marciras_teamleader",
    "milgp_v_mmac_assaulter_belt",
    "milgp_v_mmac_assaulter",
    "milgp_v_mmac_grenadier_belt",
    "milgp_v_mmac_grenadier",
    "milgp_v_mmac_hgunner_belt",
    "milgp_v_mmac_hgunner",
    "milgp_v_mmac_light_belt",
    "milgp_v_mmac_light",
    "milgp_v_mmac_marksman_belt",
    "milgp_v_mmac_marksman",
    "milgp_v_mmac_medic_belt",
    "milgp_v_mmac_medic",
    "milgp_v_mmac_teamleader_belt",
    "milgp_v_mmac_teamleader",
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

def vests():
    to_rename = []
    for model in models:
        for base in colors:
            for mag in colors:
                name = model + "_" + base + "_" + mag
                if "belt" in name:
                    name += "_" + mag
                to_rename.append([
                    name,
                    base,
                    mag,
                ])

    return to_rename

def vest_name(name):
    if "jpc" in name:
        return "JPC"
    elif "marciras" in name:
        return "MarCiras"
    elif "mmac" in name:
        return "MMAC"
    
def vest_variant(name):
    base = ""
    if "assaulter" in name:
        base = "Assaulter"
    elif "grenadier" in name:
        base = "Grenadier"
    elif "hgunner" in name:
        base = "Gunner"
    elif "light" in name:
        base = "Light"
    elif "marksman" in name:
        base = "Marksman"
    elif "medic" in name:
        base = "Medic"
    elif "teamleader" in name:
        base = "Leader"
    if "belt" in name:
        return base + " + Belt"
    return base

if __name__ == "__main__":
    with open("vests.txt", "w") as f:
        rename = vests()
        for name, base, mag in rename:
            vname = vest_name(name)
            vvar = vest_variant(name)
            f.write("RENAME(" + name + ",\"" + vname + " " + vvar + " (" + base.upper() + "/" + mag.upper() + ")\");\n")
