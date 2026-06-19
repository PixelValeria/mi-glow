#!/bin/bash
# ================================================
# Mi Glow ✨ Self-Care & Glow Up Assistant
# Made with love by a Venezuelan girl in Caracas 💖
# ================================================

THUGH_PATH="$HOME/Desktop/thugh-tui"

if [ ! -f "${THUGH_PATH}/core/init.sh" ]; then
    echo "❌ Thugh-TUI not found!"
    exit 1
fi

source "${THUGH_PATH}/core/init.sh"

trap 'thugh_screen_restore; echo -e "\n${T_PINK}¡Hasta luego, mi reina! Te quiero 💖${T_RESET}"; exit 0' INT TERM EXIT

thugh_screen_init

while true; do
    tput clear

    thugh_print_logo
    echo -e "${T_PINK}${T_BOLD}    Mi Glow ✨${T_RESET}   ${T_CYAN}Self-Care Assistant${T_RESET}"
    thugh_success "¡Hola hermosa! ¿Cómo estás hoy? 💕"

    echo

    thugh_draw_box "🌺 Main Menu" "$T_PINK"

    thugh_interactive_menu "Choose what you want to do today, reina:" \
        "🌸 Daily Skincare Routine" \
        "💖 Mood & Affirmations" \
        "👗 Outfit Planner" \
        "🛍️ My Beauty Products" \
        "📊 Glow Up Progress" \
        "🌟 Quick Venezuelan Vibes" \
        "Exit"

    case $THUGH_MENU_INDEX in
        0) # Skincare Routine
            thugh_draw_box "🌸 My Skincare Routine" "$T_PINK"
            thugh_checkbox "Mark what you did today:" \
                "Cleanser" \
                "Toner" \
                "Serum / Vitamin C" \
                "Moisturizer" \
                "Sunscreen SPF50" \
                "Lip Mask 💋"
            thugh_success "¡Muy bien! You’re glowing today ✨"
            ;;

        1) # Mood & Affirmations
            thugh_input_text "How are you feeling today? (happy, tired, confident...)" feeling
            thugh_start_spinner $$ "Loading your daily affirmation..."
            sleep 1.5
            thugh_success "💖 Today's Affirmation:"
            echo -e "${T_PINK}\"Eres suficiente, eres hermosa y el mundo es tuyo, mi reina.\"${T_RESET}"
            echo "— From Caracas with love 🌴"
            ;;

        2) # Outfit Planner
            thugh_draw_box "👗 Today's Outfit Idea" "$T_CYAN"
            thugh_table_top "30,35"
            thugh_table_row "30,35" "Category" "Suggestion"
            thugh_table_mid "30,35"
            thugh_table_row "30,35" "Top" "Cropped blouse or floral top"
            thugh_table_row "30,35" "Bottom" "High-waist jeans or flowy skirt"
            thugh_table_row "30,35" "Shoes" "White sneakers or cute sandals"
            thugh_table_row "30,35" "Vibes" "🌸 Fresh & Tropical"
            thugh_table_bot "30,35"
            ;;

        3) # Beauty Products
            thugh_draw_box "🛍️ My Beauty Inventory" "$T_YELLOW"
            thugh_table_top "25,40,20"
            thugh_table_row "25,40,20" "Product" "Name" "Status"
            thugh_table_mid "25,40,20"
            thugh_table_row "25,40,20" "💄" "Red Lipstick" "Almost empty 😢"
            thugh_table_row "25,40,20" "💧" "Hyaluronic Acid" "Full 💖"
            thugh_table_row "25,40,20" "🌿" "Aloe Vera Gel" "Half"
            thugh_table_bot "25,40,20"
            ;;

        4) # Glow Up Progress
            thugh_draw_box "📈 Glow Up Progress" "$T_GREEN"
            echo -e "${T_BOLD}30-Day Glow Challenge${T_RESET}"
            thugh_progress_bar 65 100 "Consistency"
            echo
            thugh_success "¡Estás brillando! Keep going mi vida ✨"
            ;;

        5) # Venezuelan Vibes
            thugh_modal_confirm "🌴 Quick Vibes" "Want a little Venezuelan happiness?"
            if [ $? -eq 0 ]; then
                thugh_success "¡Arepa con queso y un cafecito! ☕🇻🇪"
                echo -e "${T_PINK}Remember: You are as strong and beautiful as the Ávila mountain 💪🌄"
            fi
            ;;

        6) # Exit
            thugh_screen_restore
            echo -e "${T_PINK}¡Besitos! Te amo mucho 💋${T_RESET}"
            exit 0
            ;;
    esac

    echo
    thugh_info "Press any key to return to menu..."
    read -n 1 -s
done
