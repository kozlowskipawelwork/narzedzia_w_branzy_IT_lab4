#!/usr/bin/env bash
# skrypt.sh - Lab 4 Narzedzia w branzy IT
SCRIPT_NAME=$(basename "$0")

show_date() {
    date
}

make_logs() {
    ilosc="${1:-100}"
    for ((x=1; x<=ilosc; x++)); do
        plik="log${x}.txt"
        {
            echo "Nazwa pliku: $plik"
            echo "Utworzony przez skrypt: $SCRIPT_NAME"
            echo "Data utworzenia: $(date)"
        } > "$plik"
    done
    echo "Utworzono $ilosc plikow log."
}

case "$1" in
    --date)
        show_date
        ;;
    --logs)
        make_logs "$2"
        ;;
    *)
        echo "Nieznana opcja: $1"
        exit 1
        ;;
esac
