def gorkas():
    to_picture = []
    # range 1 to 39
    for i in range(1, 40):
        name = "eou_gorka_" + str(i)
        to_picture.append(name)

    return to_picture

if __name__ == "__main__":
    with open("gorka.txt", "w") as f:
        picture = gorkas()
        for name in picture:
            f.write("PICTURE(" + name + ");\n")
            
