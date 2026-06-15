#!/usr/bin/env bash
# skrypt.sh - Lab 4 Narzedzia w branzy IT
SCRIPT_NAME=$(basename "$0")

show_date() {
    date
}

case "$1" in
    --date)
        show_date
        ;;
    *)
        echo "Nieznana opcja: $1"
        exit 1
        ;;
esac
