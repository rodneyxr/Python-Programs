"""
Author : Rodney Rodriguez

This program will read a large data file of 500 entries.
The first line will provide what datum we are working with for that column.
The following lines will provide the actual data entries.

First Name, Last Name, Company, Address, City, County (where applicable), State/Province (where applicable),
ZIP/Postal Code, Phone 1, Phone 2, Email, Web

Example Format:
    "first_name","last_name","company_name","address","city","county","state","zip","phone1","phone2","email","web"

All files are provided as CSV (comma-delimited).
"""

# import Person
from Person import Person


def customsplit(line) -> list:
    """
    @:param - line:str
    Returns a list of data using a comma as the delimiter
    """
    assert (isinstance(line, str))
    q1 = False
    c1 = False
    first = True
    lastindex = 0
    data = []
    for i in range(len(line)):
        if not q1 and line[i] == '"':
            q1 = True
            c1 = False
        elif q1 and line[i] == '"':
            first = False
            data.append(line[lastindex:i + 1].strip('"'))
            q1 = False
            lastindex = i + 2
        elif (not q1 and c1 or first) and line[i] == ",":
            first = False
            datum = line[lastindex:i].strip('"')
            if datum.isnumeric():
                datum = float(datum)
            if datum.is_integer():
                datum = int(datum)
            data.append(datum)
            c1 = False
            lastindex = i + 1
        elif not q1 and not c1 and line[i] == ",":
            c1 = True
    return data


ext = ".csv"
file_name = "us-500"

# Open the file
file = open(file_name + ext, "r")

# Read in the keys (specified by the first line)
keys = file.readline().rstrip().split(",")
for i in range(0, len(keys)):
    keys[i] = keys[i].strip('"')
keys = tuple(keys)
print(keys)

# dump the entries into a list of people
people = []

for line_count in file:
    values = customsplit(line_count.rstrip("\n"))

    # data = dict(zip(keys, values))
    people.append(Person(values))

# print the list of people
for person in people:
    print(person)