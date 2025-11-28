#!/bin/bash

# Source the pywal colors
source ~/.cache/wal/colors.sh

# Define your hyprlock configuration file
HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"

# Check if the color file exists
if [ ! -f "$HOME/.cache/wal/colors.sh" ]; then
    echo "Pywal colors not found. Run wal first."
    exit 1
fi

# Create or overwrite the hyprlock configuration file with the new colors
echo "
# -- Hyprlock Configuration --

# Background
background {
  color = \"$color0\"
  image = \"/path/to/your/wallpaper.png\" # Optional: set your wallpaper
}

# Text
text {
  color = \"$color1\"
}

# Input box
input_field {
  color = \"$color2\"
  border_color = \"$color3\"
}

# Text in input box
input_text {
  color = \"$color1\"
}

# Indicator
indicator {
  color = \"$color4\"
}
" > "$HYPRLOCK_CONFIG"

echo "Hyprlock theme updated."
