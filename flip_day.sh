if [ "$HOSTNAME" = "ox-0533.attlocal.net" ]; then
    ~/bin/icalBuddy eventsToday | /Library/Frameworks/Python.framework/Versions/3.3/bin/python3 ~/dotfiles/flip_day.py
fi
