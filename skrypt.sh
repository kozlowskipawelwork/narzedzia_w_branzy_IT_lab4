#!/usr/bin/env bash
# skrypt.sh - Lab 4 Narzedzia w branzy IT
SCRIPT_NAME=$(basename "$0")

show_date() {
    date
}

make_logs() {
    for ((x=1; x<=100; x++)); do
        plik="log${x}.txt"
        {
            echo "Nazwa pliku: $plik"
            echo "Utworzony przez skrypt: $SCRIPT_NAME"
            echo "Data utworzenia: $(date)"
        } > "$plik"
    done
    echo "Utworzono 100 plikow log."
}

case "$1" in
    --date)
        show_date
        ;;
    --logs)
        make_logs
        ;;
    *)
        echo "Nieznana opcja: $1"
        exit 1
        ;;
esac
