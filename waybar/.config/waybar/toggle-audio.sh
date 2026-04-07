#!/bin/bash

ANALOG_SINK="alsa_output.pci-0000_00_09.2.analog-stereo"
HDMI_SINK="alsa_output.pci-0000_07_00.1.hdmi-stereo-extra3"

if [ "$1" == "toggle" ]; then
    CURRENT=$(pactl get-default-sink)
    if [ "$CURRENT" == "$ANALOG_SINK" ]; then
        pactl set-default-sink "$HDMI_SINK"
    else
        pactl set-default-sink "$ANALOG_SINK"
    fi
elif [ "$1" == "status" ]; then
    CURRENT=$(pactl get-default-sink)
    if [ "$CURRENT" == "$ANALOG_SINK" ]; then
        echo "󰋋  Analog" 
    elif [ "$CURRENT" == "$HDMI_SINK" ]; then
        echo "󰽟  HDMI" 
    else
        echo "  Audio"
    fi
fi