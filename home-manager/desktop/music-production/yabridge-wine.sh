#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: yabridge-wine <command> [args...]"
    echo "Example: yabridge-wine winecfg"
    echo "Example: yabridge-wine winetricks corefonts"
    exit 1
fi

export WINEPREFIX="$HOME/.yabridge-wine"
export PATH="$WINE_PATH/bin:$PATH"
exec "$@"
