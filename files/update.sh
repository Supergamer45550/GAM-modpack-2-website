#!/bin/bash

echo "Do you want to install wget and unzip?"
echo "1 = Yes"
echo "2 = No"
read -p "Your choice: " INSTALL_CHOICE

if [ "$INSTALL_CHOICE" -eq 1 ]; then
    echo "Installing wget and unzip..."
    sudo apt update
    sudo apt install -y wget unzip
fi

read -p "Paste the full path to your Minecraft mods folder: " MOD_FOLDER

ZIP_URL="https://supergamer45550.github.io/GAM-modpack-2-website/files/new_mods.zip"

TEMP_ZIP="/tmp/minecraft_mods.zip"

echo "Downloading mods..."
wget -O "$TEMP_ZIP" "$ZIP_URL"

echo "Extracting mods into $MOD_FOLDER..."
unzip -o "$TEMP_ZIP" -d "$MOD_FOLDER"

echo "Cleaning up..."
rm "$TEMP_ZIP"

echo "✅ Mods installed successfully!"
