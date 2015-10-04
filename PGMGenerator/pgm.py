import sys

fout = open("image.pgm", "w")
# fout = sys.stdout

BLACK = "0 "
WHITE = "255 "

width = height = 800
tile_size = 100


def generate_header():
    fout.write("P2\n")
    fout.write("{0} {1}\n".format(width, height))
    fout.write("255\n")


def generate_row(black_first):
    black = black_first
    for i in range(0, width):
        if i % tile_size is 0:
            black = not black
        if black:
            fout.write(BLACK)
        else:
            fout.write(WHITE)


def generate_colomns(black_first):
    black = black_first
    for x in range(0, height):
        if x % tile_size is 0:
            black = not black
        generate_row(black)
        fout.write("\n")


generate_header()
generate_colomns(True)