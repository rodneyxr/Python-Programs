__author__ = 'Rodney'

import utils


class Player(object):
    def __init__(self, username):
        self.username = username
        self.health = 10
        self.strength = 1
        self.woodcutting = 1

    def write_player_info(self, file):
        try:
            file.write("[Player Info]\n")
            file.write("username={0}\n".format(self.username))
        except Exception as e:
            print("writePlayerInfo Error:", e)

    def write_player_stats(self, file):
        try:
            file.write("[Player Stats]\n")
            file.write("health={0}\n".format(self.health))
            file.write("strength={0}\n".format(self.strength))
            file.write("woodcutting={0}\n".format(self.woodcutting))
        except Exception as e:
            print("writePlayerInfo Error:", e)

    def save(self):
        file = None
        try:
            file = open(utils.save_file_location, "w")
            self.write_player_info(file)
            self.write_player_stats(file)
        except Exception as e:
            print("Player Save Error:", e)
            raise Exception("Error: Player save failed.")
        finally:
            if file:
                file.close()