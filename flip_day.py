import sys

RED_REGULAR = "#[fg=colour09]Red Day"
RED_FLIP = "#[fg=colour09]Red Flip Day"
BLUE_REGULAR = "#[fg=colour14]Blue Day"
BLUE_FLIP = "#[fg=colour14]Blue Flip"
NO_SCHOOL = "#[fg=colour13]No School"

data = "".join(sys.stdin.readlines()).lower()

result = ""

if "red a" in data:
    result = RED_REGULAR
elif "red b" in data:
    result = RED_FLIP
elif "blue a" in data:
    result = BLUE_REGULAR
elif "blue b" in data:
    result = BLUE_FLIP
else:
    result = NO_SCHOOL

result += "#[fg=default]"
print(result)
