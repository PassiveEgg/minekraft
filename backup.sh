#!/bin/bash

# === Carica il token ===
export GITHUB_TOKEN=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


# === URL CON TOKEN ===
# git remote set-url origin https://PassiveEgg:$GITHUB_TOKEN@github.com/PassiveEgg/minekraft.git

# Verifica URL remote (opzionale, per debug)
echo "Remote URL: $(git remote get-url origin)"

# === DATA E ORA ITALIANA ===
export TZ=Europe/Rome
DATA_ORA=$(date +"%d-%m-%Y %H:%M:%S")

# === MESSAGGIO DEL COMMIT ===
COMMIT_MESSAGE="Aggiornamento automatico - $DATA_ORA"

# === AGGIUNGI, COMMITTA E PUSH ===
git add .

git commit -m "$COMMIT_MESSAGE"
echo "📦 Commit creato: $COMMIT_MESSAGE"

git push origin main
echo "🚀 Push completato!"

