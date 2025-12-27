#!/bin/bash

REPOS_TO_DELETE=(
    "https://github.com/DOrtenzio/pratica1-24.git"
    "https://github.com/DOrtenzio/pratica2-24.git"
    "https://github.com/DOrtenzio/pratica3-24.git"
    "https://github.com/DOrtenzio/pratica3.1-24.git"
    "https://github.com/DOrtenzio/pratica4-24.git"
    "https://github.com/DOrtenzio/pratica5-24.git"
    "https://github.com/DOrtenzio/pratica6-24.git"
    "https://github.com/DOrtenzio/pratica8-25.git"
    "https://github.com/DOrtenzio/pratica9-25.git"
    "https://github.com/DOrtenzio/pratica10-25.git"
    "https://github.com/DOrtenzio/pratica11-25.git"
    "https://github.com/DOrtenzio/pratica12-25.git"
    "https://github.com/DOrtenzio/pratica13-25.git"
    "https://github.com/DOrtenzio/pratica14-25.git"
    "https://github.com/DOrtenzio/pratica15-25.git"
    "https://github.com/DOrtenzio/js-timer.git"
    "https://github.com/DOrtenzio/js-memory.git"
)

# Definiamo il percorso della CLI (visto che Windows non la trova da sola)
GH_PATH="C:/Program Files/GitHub CLI/gh.exe"

for REPO in "${REPOS_TO_DELETE[@]}"
do
    echo "---------------------------------------------------"
    echo "Eliminazione di: $REPO..."
    
    # Eseguiamo il comando usando il percorso completo
    "$GH_PATH" repo delete "$REPO" --yes
done

echo "---------------------------------------------------"
echo "Tutte le repository selezionate sono state eliminate!"