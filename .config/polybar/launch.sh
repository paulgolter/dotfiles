#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch the bar defined as [bar/example] in ./config
polybar example &

echo "Polybar launched..."
