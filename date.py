import datetime
import sys

weekdays = [
    "mo",
    "tu",
    "we",
    "th",
    "fr",
    "sa",
    "su",
]

months = [
    "jan",
    "feb",
    "mar",
    "apr",
    "may",
    "jun",
    "jul",
    "aug",
    "sep",
    "oct",
    "nov",
    "dec",
]


def find_date(arg):
    d = datetime.date.today()

    if arg:
        arg = arg.lower()
        try:
            user_day = int(arg[3:])
            user_month = months.index(arg[:3]) + 1
            while d.month != user_month or d.day != user_day:
                d += datetime.timedelta(1)
        except ValueError:
            user_weekday = weekdays.index(arg[:2])
            d += datetime.timedelta(1)
            while d.weekday() != user_weekday:
                d += datetime.timedelta(1)

    return d


arg = None
if len(sys.argv) > 1:
    arg = sys.argv[1]

print(find_date(arg))
