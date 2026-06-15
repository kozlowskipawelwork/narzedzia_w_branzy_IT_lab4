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

do_init() {
    repo_url=$(git config --get remote.origin.url 2>/dev/null)
    if [ -z "$repo_url" ]; then
        echo "Brak skonfigurowanego remote 'origin' - nie ma czego sklonowac."
        return 1
    fi
    git clone "$repo_url"
    nazwa=$(basename "$repo_url" .git)
    export PATH="$PATH:$(pwd)/$nazwa"
    echo "Sklonowano repo i dodano do PATH: $(pwd)/$nazwa"
}

show_help() {
    cat <<POMOC
Uzycie: $SCRIPT_NAME [OPCJA] [ARGUMENT]

Dostepne opcje:
  --date           Wyswietla dzisiejsza date
  --logs [N]       Tworzy N plikow logX.txt (domyslnie 100)
  --help           Wyswietla te pomoc
POMOC
}

case "$1" in
    --date|-d)
        show_date
        ;;
    --logs|-l)
        make_logs "$2"
        ;;
    --init)
        do_init
        ;;
    --help|-h)
        show_help
        ;;
    *)
        echo "Nieznana opcja: $1"
        show_help
        exit 1
        ;;
esac
