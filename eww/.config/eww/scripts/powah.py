#!/bin/python3

import psutil

battery = psutil.sensors_battery()
plugged = battery.power_plugged
percent = battery.percent
time_left = battery.secsleft

# Variable raw outputs
# print(battery)
# print(plugged)
# print(percent)
# print(time_left)

def icon():
    if(plugged == None):
        if(percent >= 100):
            return (" ")
        elif(percent < 100):
            return (" ")
    elif(plugged == True):
        if(percent >= 100):
            return (" ")
        elif(percent < 100):
            return (" ")
    elif(plugged == False):
        if(percent >= 100):
            return (" ")
        elif(percent < 100):
            return (" ")

def percentf():
    percent_formatted = format(percent, '.0f')
    return ("%s%%" % percent_formatted )

def time_remaining():
    if(time_left <= -0):
        return("Plugged in ")
    else:
       min = (time_left / 60)
       hr = (min / 60)
       formatted_hr = format(hr, ".1f")
       return (formatted_hr + " hrs")

def powah():
    print(icon(), end=" ")
    print(percentf())
    # print(time_remaining())

powah()
