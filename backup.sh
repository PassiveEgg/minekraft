#!/bin/bash

# === CONFIGURAZIONE ===
USERNAME="PassiveEgg"
TOKEN="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"
REPO="minekraft"  # Cambia se la tua repo ha un altro nome

# === DATA E ORA ITALIANA ===
export TZ=Europe/Rome
DATA_ORA=$(date +"%d-%m-%Y %H:%M:%S")

# === MESSAGGIO DEL COMMIT ===
COMMIT_MESSAGE="Aggiornamento automatico - $DATA_ORA"

# === URL CON TOKEN ===
REMOTE_URL="https://${USERNAME}:${TOKEN}@github.com/${USERNAME}/${REPO}.git"

# === IMPOSTA IL REMOTE ===
git remote set-url origin "$REMOTE_URL"

# === AGGIUNGI, COMMITTA E PUSH ===
git add .

if git diff --cached --quiet; then
    echo "✅ Nessuna modifica da committare."
else
    git commit -m "$COMMIT_MESSAGE"
    echo "📦 Commit creato: $COMMIT_MESSAGE"

    git push origin main
    echo "🚀 Push completato!"
fi
