bases = [
    "black",
    "blue",
    "brown",
    "cyan",
    "gray",
    "navy",
    "orange",
    "purple",
    "red",
    "white",
    "yellow",
]

jeans = [
    "black",
    "denim",
    "gray",
    "khaki",
    "sage",
]

def solid():
    to_rename = []
    for base in bases:
        for jean in jeans:
            name = "casual_solid_" + base + "_" + jean + "_uniform"
            to_rename.append(name)
    return to_rename

if __name__ == "__main__":
    with open("solid.txt", "w") as f:
        rename = solid()
        for name in rename:
            f.write("PICTURE(" + name + ");\n")
