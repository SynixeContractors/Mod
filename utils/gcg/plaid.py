bases = [
    "black",
    "blue",
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

def plaid():
    to_rename = []
    for base in bases:
        for jean in jeans:
            name = "casual_plaid_" + base + "_" + jean + "_uniform"
            to_rename.append(name)
    return to_rename

if __name__ == "__main__":
    with open("plaid.txt", "w") as f:
        rename = plaid()
        for name in rename:
            f.write("PICTURE(" + name + ");\n")
