#!/bin/bash

# Check if user passed a highlight
if [ -z "$1" ]; then
  echo "Usage: ./journal.sh \"Your highlight of the day\""
  exit 1
fi

HIGHLIGHT="$1"
TODAY=$(date +"%B %d, %Y")
HEADER="# 📆 $TODAY"

# Check if today's date already exists
if grep -q "$HEADER" journal.md; then
    echo "Today's entry exists. Adding new highlight..."

    # Insert new highlight under today's header safely
    awk -v header="$HEADER" -v highlight="$HIGHLIGHT" '
    BEGIN { added=0 }
    {
        print
        if ($0 == header && !added) {
            print ""
            print "### ✅ Highlight"
            print highlight
            print ""
            added=1
        }
    }
    ' journal.md > temp && mv temp journal.md

else
    # Create a temporary file
    TEMP_FILE=$(mktemp)

    # Add new entry structure
    echo "$HEADER" > "$TEMP_FILE"
    echo "" >> "$TEMP_FILE"
    echo "### ✅ Highlight" >> "$TEMP_FILE"
    echo "$HIGHLIGHT" >> "$TEMP_FILE"
    echo "" >> "$TEMP_FILE"
    echo "### 🌱 Opportunity" >> "$TEMP_FILE"
    echo "(Write your opportunity here)" >> "$TEMP_FILE"
    echo "" >> "$TEMP_FILE"
    echo "### ⚡️ Challenge" >> "$TEMP_FILE"
    echo "(Write your challenge here)" >> "$TEMP_FILE"
    echo "" >> "$TEMP_FILE"

    # Append old journal
    cat journal.md >> "$TEMP_FILE"
    mv "$TEMP_FILE" journal.md

    echo "New daily entry added!"
fi

# Stage for commit
git add journal.md
echo "journal.md staged. Ready to commit!"