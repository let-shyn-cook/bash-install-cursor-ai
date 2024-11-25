#!/bin/bash

installCursor() {
    if ! [ -f /opt/cursor.appimage ]; then
        echo "Installing Cursor AI IDE..."

        # URLs for Cursor AppImage and Icon
        CURSOR_URL="https://download.todesktop.com/230313mzl4w4u92/cursor-0.42.5-build-24111460bf2loz1-x86_64.AppImage"
        ICON_URL="https://miro.medium.com/v2/resize:fit:800/0*zWCTHFNFdGAgSw2d"

        # Paths for installation
        APPIMAGE_PATH="/opt/cursor.appimage"
        ICON_PATH="/opt/cursor.png"
        DESKTOP_ENTRY_PATH="/home/$USER/.local/share/applications/cursor.desktop" #you can change this to your path, but it must be in the applications folder

        # Install curl if not installed
        if ! command -v curl &> /dev/null; then
            echo "curl is not installed. Installing..."
            sudo apt-get update
            sudo apt-get install -y curl
        fi

        # Download Cursor AppImage
        echo "Downloading Cursor AppImage..."
        sudo curl -L $CURSOR_URL -o $APPIMAGE_PATH
        sudo chmod +x $APPIMAGE_PATH

        # Download Cursor icon
        echo "Downloading Cursor icon..."
        sudo curl -L $ICON_URL -o $ICON_PATH

        # Create a .desktop entry for Cursor
        echo "Creating .desktop entry for Cursor..."
        mkdir -p $(dirname $DESKTOP_ENTRY_PATH)
        cat > $DESKTOP_ENTRY_PATH <<EOL
[Desktop Entry]
Name=Cursor AI IDE
Exec=$APPIMAGE_PATH --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
EOL

        echo "Cursor AI IDE installation complete. You can find it in your application menu."
    else
        echo "Cursor AI IDE is already installed."
    fi
}

installCursor

