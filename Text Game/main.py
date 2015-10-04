__author__ = 'Rodney'

import os
import sys
sys.path.append(os.getcwd)

import help
from player import Player
import utils


def login(username):
    file = None
    player = Player(username)
    try:
        file = open(os.curdir + "/saves.dat")
    except FileNotFoundError as e:
        print("Error: 'saves.dat' does not exist.")
    finally:
        if file:
            file.close()
    return player


def gameLoop():
    player = None
    line = ''
    print("Enter a command or type 'exit' to stop playing.")
    while line != "exit":
        line = input("> ")
        cmd = line.split()
        if cmd[0] == "help":
            help.help(cmd)
        if cmd[0] == "login":
            if len(cmd) != 2:
                print("** Invalid use of 'login'\n** Use: login <username>")
                continue
            player = login(cmd[1])
            print("Successfully logged in!")
        if cmd[0] == "save":
            if player == None:
                print("** You must login first!\n** Use: login <username>")
                continue
            try:
                player.save()
                print("Player save successful.")
            except Exception as e:
                print(e)
        if cmd[0] == "encrypt":
            msg = utils.simple_encrypt(line[len(cmd[0]) + 1:])
            print(msg)
        if cmd[0] == "decrypt":
            msg = utils.simple_decrypt(line[len(cmd[0]) + 1:])
            print(msg)


gameLoop()