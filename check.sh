#!/bin/sh

# Path to the collected letters file
filepath="CollectedLetters.txt"

# Hidden phrase
phrase=$(printf "\x4C\x49\x4E\x55\x58\x20\x49\x53\x20\x45\x56\x45\x52\x59\x57\x48\x45\x52\x45")

# Count README files recursively
readme_count=$(find . -type f -iname "README" | wc -l)

if [ "$readme_count" -ne 18 ]; then
    echo "There should be 18 unlocked README files. Found $readme_count. Please check."
    exit 1
fi

# Check if the collected letters file exists
if [ -f "$filepath" ]; then
    # Search for the phrase
    if grep -q "$phrase" "$filepath"; then
        echo "All letters collected! Treasure confirmed."

        # -------------------------------
        # Generate command history file
        # -------------------------------

        username=$(whoami)
        history_file="${username}_history.txt"

        # Determine the shell and corresponding history file
        user_shell=$(basename "$SHELL")

        case "$user_shell" in
            bash)
                histfile="$HOME/.bash_history"
                ;;
            zsh)
                histfile="$HOME/.zsh_history"
                ;;
            *)
                histfile="$HOME/.bash_history"  # fallback
                ;;
        esac

        if [ -f "$histfile" ]; then
            cp "$histfile" "$history_file"
            echo "Command history saved to $history_file"
        else
            echo "No shell history file found for $user_shell."
        fi

        # -------------------------------
        # Zip all folders and files
        # -------------------------------

        zip_file="${username}_treasure_hunt.zip"
        zip -r "$zip_file" . -x "$zip_file"
        echo "All files and folders zipped into $zip_file. Please submit the generated file to complete the hunt."

    else
        echo "The full phrase is not yet complete. Keep collecting letters."
    fi
else
    echo "CollectedLetters.txt not found. Make sure you are in the correct folder."
fi
