#!/bin/bash

echo "1 = Install wget and unzip"
echo "2 = Skip"
read -p "Your choice: " INSTALL_CHOICE

if [ "$INSTALL_CHOICE" -eq 1 ]; then
    sudo apt update
    sudo apt install -y wget unzip
fi

read -p "Minecraft mods folder path: " MOD_FOLDER

echo "Choose version:"
echo "1 = 1.3.2"
echo "2 = 1.3.1"
echo "3 = 1.3.0"
echo "4 = 1.2.0"
read -p "Your choice: " VERSION_CHOICE

case "$VERSION_CHOICE" in
	1) VERSION="1.3.2" ;;
    2) VERSION="1.3.1" ;;
    3) VERSION="1.3.0" ;;
    4) VERSION="1.2.0" ;;
    *) exit 1 ;;
esac

ZIP_URL="https://supergamer45550.github.io/GAM-modpack-2-website/files/$VERSION/new_mods.zip"
TEMP_ZIP="/tmp/minecraft_mods.zip"

wget -O "$TEMP_ZIP" "$ZIP_URL"
unzip -o "$TEMP_ZIP" -d "$MOD_FOLDER"
rm "$TEMP_ZIP"