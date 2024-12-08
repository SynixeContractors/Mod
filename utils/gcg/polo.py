bases = [
    "black",
    "blue",
    "brown",
    "gray",
    "navy",
    "peach",
    "red",
    "white",
]

jeans = [
    "black",
    "denim",
    "gray",
    "khaki",
    "sage",
]

def polos():
    to_rename = []
    for base in bases:
        for jean in jeans:
            name = "casual_polo_" + base + "_" + jean + "_uniform"
            to_rename.append(name)
    return to_rename

if __name__ == "__main__":
    with open("polos.txt", "w") as f:
        rename = polos()
        for name in rename:
            f.write("PICTURE(" + name + ");\n")
