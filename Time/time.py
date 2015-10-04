# date1.py: class for dates

mon = [None, "Jan", "Feb", "Mar", "Apr",
       "May", "Jun", "Jul", "Aug",
       "Sep", "Oct", "Nov", "Dec"]
days = [0, 31, 28, 31, 30, 31, 30,
        31, 31, 30, 31, 30, 31]


def check_date(y, m, d):
    if m < 1 or m > 12 or d < 0 or d > 31 or y < 0:
        return False
    elif d > 0 and d <= days[m]:
        return True
    elif m == 2 and d == 29 and is_leap(y):
        return True
    else:
        return False
        # ## end of: check_date


def is_leap(y):
    if y % 400 == 0 or (y % 4 == 0 and y % 100 != 0):
        return True
    else:
        return False
        # ## end of: is_leap


class Date(object):
    def __init__(self, y, m, d):
        self.year = y
        self.month = m
        self.day = d
        # ## end of: __init__

    def __str__(self):
        return mon[self.month] + " " + str(self.day) + ", " + str(self.year)
        # ## end of: __str__

    def incr_day(self):
        self.day += 1
        if not (self.month == 2 and is_leap(self.year) and self.day == 29) and self.day > days[self.month]:
            self.day = 1
            self.incr_month()
            # ## end of: incr_day

    def incr_month(self):
        self.month += 1
        if self.month > 12:
            self.month = 1
            self.incr_year()
            # ## end of: incr_month

    def incr_year(self):
        self.year += 1
        # ## end of: incr_year
        # ## end of: date1 class


class Time(Date):
    def __init__(self, mon, day, year, hour, min, sec):
        super().__init__(year, mon, day)
        self.hour = hour
        self.min = min
        self.sec = sec

    def verify_time(self):
        pass

    def incr_sec(self):
        self.sec += 1
        if self.sec is 60:
            self.sec = 0
            self.incr_min()

    def incr_min(self):
        self.min += 1
        if self.min is 60:
            self.min = 0
            self.incr_hour()

    def incr_hour(self):
        self.hour += 1
        if self.hour is 24:
            self.hour = 0
            super().incr_day()

    def __str__(self):
        str = super().__str__()
        str += " %02d:%02d:%02d" % (self.hour, self.min, self.sec)
        return str


def test_time(mon, day, year, hour, min, sec):
    time = Time(mon, day, year, hour, min, sec)
    print("Start Date: ", time, " ")
    time.incr_sec()
    print(" Next sec:  ", time, " ")
    time.incr_sec()
    print(" Next sec:  ", time, " ")
    time.incr_sec()
    print(" Next sec:  ", time, "\n")


test_time(1, 31, 2001, 4, 31, 26)  # Jan 31, 2001 04:31:26
test_time(4, 22, 2004, 23, 59, 58)  # Apr 22, 2004 23:59:58
test_time(1, 31, 2001, 23, 59, 58)  # Jan 31, 2001 23:59:58
test_time(4, 30, 2004, 23, 59, 58)  # Apr 30, 2004 23:59:58
test_time(2, 28, 2004, 23, 59, 58)  # Feb 28, 2004 23:59:58
test_time(2, 28, 1900, 23, 59, 58)  # Feb 28, 1900 23:59:58
test_time(2, 28, 2000, 23, 59, 58)  # Feb 28, 2000 23:59:58
test_time(2, 28, 2001, 23, 59, 58)  # Feb 28, 2001 23:59:58
test_time(12, 31, 2004, 23, 59, 58)  # Dec 31, 2004 23:59:58
test_time(12, 31, 1999, 23, 59, 58)  # Dec 31, 1999 23:59:58