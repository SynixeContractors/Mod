mgp = [
    "milgp_v_battle_belt_assaulter",
    "milgp_v_battle_belt_hgunner"
]

mgp_colors = [
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

battle_belt_colors = [
    "blk",
    "cbr",
    "khk",
    "oli",
    "tna_F",
    "",
]

modular_holster_colors = [
    "black",
    "cbr",
    "khk",
    "olive",
]

def vests():
    vests = []
    for model in mgp:
        for base in mgp_colors:
            name = model + "_" + base + "_" + base
            vests.append(name)
            vests.append("synixe_" + name + "_Light")
            vests.append("synixe_" + name + "_Medium")
            vests.append("synixe_" + name + "_Heavy")
    for bb in battle_belt_colors:
        name = "V_Rangemaster_belt_" + bb
        if bb == "":
            name = "V_Rangemaster_belt"
        vests.append(name)
        vests.append("synixe_" + name + "_Light")
        vests.append("synixe_" + name + "_Medium")
        vests.append("synixe_" + name + "_Heavy")
    for mh in modular_holster_colors:
        name = "Aegis_V_CarrierRigKBT_01_holster_" + mh + "_F"
        vests.append(name)
        vests.append("synixe_" + name + "_Light")
        vests.append("synixe_" + name + "_Medium")
        vests.append("synixe_" + name + "_Heavy")
    vests.append("synixe_Hidden_Ballistic_Vest_01")
    vests.append("synixe_Hidden_Ballistic_Vest_02")
    vests.append("synixe_Hidden_Ballistic_Vest_03")
    return vests

if __name__ == "__main__":
    with open("vests.txt", "w") as f:
        for vest in vests():
            f.write(vest + "\n")
