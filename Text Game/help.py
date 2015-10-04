__author__ = 'Rodney'

def help(cmd):
    if len(cmd) == 1:
        listCommands()

def listCommands():
    print('''Help:
    - help
    - login
    - save
    - encrypt
    - decrypt
    - exit''')