#!/usr/bin/bash
url=$(playerctl metadata mpris:artUrl)
artist=$(playerctl metadata xesam:artist)
album=$(playerctl metadata xesam:album)
metadata=$(printf "$artist - $album")

if [ $url == "No player found" ]
then
  exit
elif [ -f /home/norah/.cache/albumart/"$metadata".png ]
then
  echo /home/norah/.cache/albumart/"$metadata".png
else
  curl -s $url -o /home/norah/.cache/albumart/"$metadata"
  magick /home/norah/.cache/albumart/"$metadata" /home/norah/.cache/albumart/"$metadata".png
  rm /home/norah/.cache/albumart/"$metadata"
  echo /home/norah/.cache/albumart/"$metadata".png
fi
