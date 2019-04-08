#!/usr/bin/env python3

import re
from subprocess import check_output

    # Running 'acpi' in a terminal to show the output
status = check_output(['acpi'], universal_newlines=True)

if not status:
    # stands for no battery found  
    fulltext = "<span color='red'><span font='FontAwesome'>\uf00d \uf240</span></span>"
    percentleft = 100
else:
    # if there is more than one battery in one laptop, the percentage left is
    # available for each battery separately, although state and remaining
    # time for overall block is shown in the status of the first battery
    batteries = status.split("\n")
    state_batteries=[]
    commasplitstatus_batteries=[]
    percentleft_batteries=[]
    time = ""
    for battery in batteries:
        if battery!='':
            state_batteries.append(battery.split(": ")[1].split(", ")[0])
            commasplitstatus = battery.split(", ")
            if not time:
                time = commasplitstatus[-1].strip()
                # check if it matches a time
                time = re.match(r"(\d+):(\d+)", time)
                if time:
                    time = ":".join(time.groups())
                    timeleft = " ({})".format(time)
                else:
                    timeleft = ""

            p = int(commasplitstatus[1].rstrip("%\n"))
            if p>0:
                percentleft_batteries.append(p)
            commasplitstatus_batteries.append(commasplitstatus)
    state = state_batteries[0]
    commasplitstatus = commasplitstatus_batteries[0]
    if percentleft_batteries:
        percentleft = int(sum(percentleft_batteries)/len(percentleft_batteries))
    else:
        percentleft = 0

# FA_LIGHTNING =   \uf0e7  ; emoji = ⚡
# FA_PLUG =       \uf1e6  ; emoji = 🔌
# FA_BATTERY =     \uf240  ; emoji = 🔋
# FA_QUESTION =    \uf128  ; emoji = ❓

    FA_LIGHTNING = "<span color='yellow'><span font='FontAwesome'>\uf0e7</span></span>"
#    FA_PLUG = "<span font='FontAwesome'>\uf1e6</span>"
    FA_PLUG = "🔌"
    FA_BATTERY = "<span font='FontAwesome'>\uf240</span>"
    FA_QUESTION = "<span font='FontAwesome'>\uf0e7</span>"

# FA_BATTERY_1 = 
# FA_BATTERY_2 = 
# FA_BATTERY_3 = 
# FA_BATTERY_4 = 
# FA_BATTERY_5 = 

    FA_BATTERY_1 = "<span font='FontAwesome'>\uf244</span>"
    FA_BATTERY_2 = "<span font='FontAwesome'>\uf241</span>"
    FA_BATTERY_3 = "<span font='FontAwesome'>\uf243</span>"
    FA_BATTERY_4 = "<span font='FontAwesome'>\uf242</span>"
    FA_BATTERY_5 = "<span font='FontAwesome'>\uf240</span>"

    if state == "Discharging":
        if percentleft < 10:
            fulltext = FA_BATTERY_1 + " "
        elif percentleft < 25:
            fulltext = FA_BATTERY_2 + " "
        elif percentleft < 50:
            fulltext = FA_BATTERY_3 + " "
        elif percentleft < 75:
            fulltext = FA_BATTERY_4 + " "
        elif percentleft < 100:
            fulltext = FA_BATTERY_5 + " "
        else:
            fulltext = FA_QUESTION

    elif state == "Full":
        fulltext = FA_PLUG + " "
        timeleft = ""

    elif state == "Unknown":
        fulltext = FA_QUESTION + " " + FA_BATTERY + " "
        timeleft = ""
    else:
        fulltext = FA_LIGHTNING + " " + FA_PLUG + " "


    def color(percent):
        if percent < 10:
            # exit code 33 will turn background red
            return "#FFFFFF"
        if percent < 20:
            return "#FF3300"
        if percent < 30:
            return "#FF6600"
        if percent < 40:
            return "#FF9900"
        if percent < 50:
            return "#FFCC00"
        if percent < 60:
            return "#FFFF00"
        if percent < 70:
            return "#FFFF33"
        if percent < 90:
            return "#FFFF66"
        return "#FFFFFF"

    form =  '<span color="{}">{}%</span>'
    fulltext += form.format(color(percentleft), percentleft)
    fulltext += timeleft

print(fulltext)
print(fulltext)
if percentleft < 10:
    exit(33)
