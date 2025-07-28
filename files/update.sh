#!/bin/bash

# Installer prompt
echo "1 = Install wget and unzip"
echo "2 = Skip"
read -p "Your choice: " INSTALL_CHOICE

if [ "$INSTALL_CHOICE" -eq 1 ]; then
    sudo apt update
    sudo apt install -y wget unzip
fi

# Get mods folder path
read -p "Minecraft mods folder path: " MOD_FOLDER

# Version selection
echo "Choose version:"
echo "1 = 1.4.0"
echo "2 = 1.3.2"
echo "3 = 1.3.1"
echo "4 = 1.3.0"
echo "5 = 1.2.0"
echo "6 = Enter custom version"
read -p "Your choice: " VERSION_CHOICE

case "$VERSION_CHOICE" in
	1) Version="1.4.0" ;;
    2) VERSION="1.3.2" ;;
    3) VERSION="1.3.1" ;;
    4) VERSION="1.3.0" ;;
    5) VERSION="1.2.0" ;;
    6) read -p "Enter version manually (e.g., 1.4.0): " VERSION ;;
    *) echo "Invalid choice. Exiting." && exit 1 ;;
esac

# Download and extract mods
ZIP_URL="https://supergamer45550.github.io/GAM-modpack-2-website/files/$VERSION/new_mods.zip"
TEMP_ZIP="/tmp/minecraft_mods.zip"

echo "Downloading mods for version $VERSION..."
wget -O "$TEMP_ZIP" "$ZIP_URL"

if [ $? -ne 0 ]; then
    echo "Download failed. Check if the version exists or if the URL is correct."
    exit 1
fi

echo "Extracting mods..."
unzip -o "$TEMP_ZIP" -d "$MOD_FOLDER"
rm "$TEMP_ZIP"

echo "Mods installed successfully! 🎉"
