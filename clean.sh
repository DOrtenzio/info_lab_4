#!/bin/bash

REPOS_TO_DELETE=(
    "DOrtenzio/s-frontend-java-arrayStringhe-infoLab"
    "DOrtenzio/s-frontend-java-array01-infoLab"
    "DOrtenzio/s-frontend-java-array-infoLab"
    "DOrtenzio/s-frontend-java-funzioni04-infoTeoria"
    "DOrtenzio/s-frontend-java-matrici-infoTeoria"
    "DOrtenzio/s-frontend-java-escapeCodeEx-infoLab"
    "DOrtenzio/s-frontend-javaFx-calcolatriceComplessa-info"
    "DOrtenzio/s-frontend-javaFX-calcolatrice-info"
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