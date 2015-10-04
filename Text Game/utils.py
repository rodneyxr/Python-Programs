__author__ = 'Rodney'

import os
# a b c d e f g h i j k l m n o p q r s t u v w x y z
# z y x w v u t s r q p o n m l k j i h g f e d c b a

code = {"a": "z0",
        "b": "1y",
        "c": "x9",
        "d": "2w",
        "e": "v8",
        "f": "3u",
        "g": "t7",
        "h": "4s",
        "i": "r6",
        "j": "5q",
        "k": "p5",
        "l": "6o",
        "m": "n4",
        "n": "7m",
        "o": "l3",
        "p": "8k",
        "q": "j2",
        "r": "9i",
        "s": "h1",
        "t": "0g",
        "u": "f2",
        "v": "9e",
        "w": "d3",
        "x": "8c",
        "y": "b4",
        "z": "7a",
        "A": "1z",
        "B": "y0",
        "C": "2x",
        "D": "w9",
        "E": "3v",
        "F": "u8",
        "G": "4t",
        "H": "s7",
        "I": "5r",
        "J": "q6",
        "K": "6p",
        "L": "o5",
        "M": "7n",
        "N": "m4",
        "O": "8l",
        "P": "k3",
        "Q": "9j",
        "R": "i2",
        "S": "0h",
        "T": "g1",
        "U": "9f",
        "V": "e2",
        "W": "8d",
        "X": "c3",
        "Y": "7b",
        "Z": "a4",
        " ": ":)"}

save_file_location = os.curdir + "/saves.dat"


def simple_encrypt(message):
    assert (isinstance(message, str))
    cryptomsg = "$"
    for c in message:
        if c.isnumeric():
            cryptomsg += "x*" + c
            continue
        cryptomsg += code.get(c, "!~" + c)
    cryptomsg += "$"
    return cryptomsg


def simple_decrypt(message):
    new_code = dict(zip(code.values(), code.keys()))
    assert (isinstance(message, str))
    msg = ""
    count = 1
    reading = True
    while count < len(message) - 1:
        token = message[count:count + 2]
        if token == "x*" or token == "!~":
            msg += message[count + 2]
            count += 1
        else:
            msg += new_code.get(token, "?")
        count += 2
        #print(token + " -> " + msg[len(msg) - 1])
    return msg