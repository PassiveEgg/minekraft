#!/bin/bash

# Imposta il fuso orario a Italia (CET/CEST)
export TZ=Europe/Rome

# Ottieni data e ora formattata in italiano
DATA_ORA=$(date +"%d-%m-%Y %H:%M:%S")

# Crea messaggio di commit
COMMIT_MESSAGE="Aggiornamento automatico - $DATA_ORA"

# Aggiunge tutti i file modificati/tracciati
git add .

# Fa il commit (solo se ci sono modifiche)
if git diff --cached --quiet; then
    echo "✅ Nessuna modifica da committare."
else
    git commit -m "$COMMIT_MESSAGE"
    echo "📦 Commit creato: $COMMIT_MESSAGE"

    # Fa il push verso origin/main
    git push origin main
    echo "🚀 Push completato!"
fi
