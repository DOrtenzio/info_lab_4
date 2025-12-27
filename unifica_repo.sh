#!/bin/bash

# --- CONFIGURAZIONE ---
# Inserisci qui gli URL delle repository che vuoi accorpare
REPOS=(
    "https://github.com/DOrtenzio/s-frontend-java-arrayStringhe-infoLab.git"
    "https://github.com/DOrtenzio/s-frontend-java-array01-infoLab.git"
    "https://github.com/DOrtenzio/s-frontend-java-array-infoLab.git"
    "https://github.com/DOrtenzio/s-frontend-java-funzioni04-infoTeoria.git"
    "https://github.com/DOrtenzio/s-frontend-java-matrici-infoTeoria.git"
    "https://github.com/DOrtenzio/s-frontend-java-escapeCodeEx-infoLab.git"
    "https://github.com/DOrtenzio/s-frontend-javaFx-calcolatriceComplessa-info.git"
    "https://github.com/DOrtenzio/s-frontend-javaFX-calcolatrice-info.git"
)

# Branch principale delle vecchie repo (solitamente 'main' o 'master')
OLD_BRANCH="main"

# --- LOGICA ---
for URL in "${REPOS[@]}"
do
    # Estrae il nome della cartella dall'URL (es. "repo-vecchia-1")
    FOLDER_NAME=$(basename "$URL" .git)

    echo "---------------------------------------------------"
    echo "Inizio importazione di: $FOLDER_NAME"
    echo "---------------------------------------------------"

    # 1. Aggiunge il remote temporaneo
    git remote add "temp_$FOLDER_NAME" "$URL"

    # 2. Fetch dei dati
    git fetch "temp_$FOLDER_NAME"

    # 3. Unione tramite subtree
    # Se il branch non è main, proverà master automaticamente in caso di errore
    if git subtree add --prefix="$FOLDER_NAME" "temp_$FOLDER_NAME" "$OLD_BRANCH" ; then
        echo "✅ Successo: $FOLDER_NAME importata."
    else
        echo "⚠️ Fallito con $OLD_BRANCH, provo con 'master'..."
        git subtree add --prefix="$FOLDER_NAME" "temp_$FOLDER_NAME" master
    fi

    # 4. Rimuove il remote temporaneo
    git remote remove "temp_$FOLDER_NAME"
    
    echo "Fatto."
done

echo "---------------------------------------------------"
echo "Tutte le repo sono state processate!"
echo "Ora puoi fare: git push origin main"