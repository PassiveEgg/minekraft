#!/bin/bash

# === Carica il token ===
GITHUB_TOKEN=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

# === URL CON TOKEN ===
git remote set-url origin https://PassiveEgg:$GITHUB_TOKEN@github.com/PassiveEgg/minekraft.git


# === DATA E ORA ITALIANA ===
export TZ=Europe/Rome
DATA_ORA=$(date +"%d-%m-%Y %H:%M:%S")

# === MESSAGGIO DEL COMMIT ===
COMMIT_MESSAGE="Aggiornamento automatico - $DATA_ORA"


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

