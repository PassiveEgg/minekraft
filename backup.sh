#!/bin/bash

# === Carica il token ===
source token.env
echo $GITHUB_TOKEN



# === DATA E ORA ITALIANA ===
export TZ=Europe/Rome
DATA_ORA=$(date +"%d-%m-%Y %H:%M:%S")

# === MESSAGGIO DEL COMMIT ===
COMMIT_MESSAGE="Aggiornamento automatico - $DATA_ORA"

# === URL CON TOKEN ===
git remote set-url origin https://PassiveEgg:$GITHUB_TOKEN@github.com/PassiveEgg/minekraft.git

# === AGGIUNGI, COMMITTA E PUSH ===
git add .

if git diff --cached --quiet; then
    echo "✅ Nessuna modifica da committare."
else
    git commit -m "$COMMIT_MESSAGE"
    echo "📦 Commit creato: $COMMIT_MESSAGE"

    git push origin main --force
    echo "🚀 Push completato!"
fi

