__author__ = 'Rodney'


class Person(object):
    # This class holds all the information about a person

    def __init__(self, attribute):
        # sets all the attributes for a person
        self.firstName = attribute[0]
        self.lastName = attribute[1]
        self.companyName = attribute[2]
        self.address = attribute[3]
        self.city = attribute[4]
        self.country = attribute[5]
        self.state = attribute[6]
        self.zip = attribute[7]
        self.phone1 = attribute[8]
        self.phone2 = attribute[9]
        self.email = attribute[10]
        self.web = attribute[11]
        self.data = {"first_name": self.firstName, "last_name": self.lastName, "company_name": self.companyName,
                     "address": self.address, "city": self.city, "country": self.country, "state": self.state,
                     "zip": self.zip, "phone1": self.phone1, "phone2": self.phone2, "email": self.email,
                     "web": self.web}
        self.keys = ["first_name", "last_name", "company_name", "address", "city", "country", "state", "zip", "phone1",
                     "phone2", "email", "web"]

    def __str__(self):
        # displays the information about a person
        s = "%s %s:\n" % (self.firstName, self.lastName)
        s += "\t%s:\t%s\n" % (self.keys[2], self.companyName)
        s += "\t%s:\t\t%s\n" % (self.keys[3], self.address)
        s += "\t%s:\t\t\t%s\n" % (self.keys[4], self.city)
        s += "\t%s:\t\t%s\n" % (self.keys[5], self.country)
        s += "\t%s:\t\t\t%s\n" % (self.keys[6], self.state)
        s += "\t%s:\t\t\t%s\n" % (self.keys[7], self.zip)
        s += "\t%s:\t\t\t%s\n" % (self.keys[8], self.phone1)
        s += "\t%s:\t\t\t%s\n" % (self.keys[9], self.phone2)
        s += "\t%s:\t\t\t%s\n" % (self.keys[10], self.email)
        s += "\t%s:\t\t\t%s\n" % (self.keys[11], self.web)
        return s

    def getName(self):
        return self.firstName + " " + self.lastName


    def setPersonName(self, first, last):
        # sets the first and last name of a person
        self.firstName = first
        self.lastName = last