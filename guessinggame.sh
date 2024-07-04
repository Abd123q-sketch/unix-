#!/bin/bash

# Fonction pour obtenir le nombre de fichiers dans le répertoire actuel
function get_file_count {
    local file_count=$(ls -l | grep "^-" | wc -l)
    echo $file_count
}

# Fonction principale du jeu
function guessing_game {
    correct_count=$(get_file_count)
    
    echo "Bienvenue dans le jeu de devinette sur le nombre de fichiers dans le répertoire courant!"
    echo "Combien de fichiers pensez-vous qu'il y a ici?"

    while true; do
        read -p "Entrez votre estimation: " user_guess

        if ! [[ $user_guess =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre valide."
        elif (( $user_guess < $correct_count )); then
            echo "Votre estimation est trop basse. Essayez encore!"
        elif (( $user_guess > $correct_count )); then
            echo "Votre estimation est trop élevée. Essayez encore!"
        else
            echo "Félicitations! Vous avez deviné correctement le nombre de fichiers: $correct_count"
            break
        fi
    done
}

# Appel de la fonction principale
guessing_game

