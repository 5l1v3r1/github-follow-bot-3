#!/bin/bash

# Define the countries array
countries=("afghanistan" "albania" "algeria" "andorra" "angola" "argentina" "armenia" "australia" "austria" "azerbaijan" "bahrain" "bangladesh" "belarus" "belgium" "benin" "bhutan" "bolivia" "bosnia_and_herzegovina" "botswana" "brazil" "bulgaria" "burkina_faso" "burundi" "cambodia" "cameroon" "canada" "chad" "chile" "china" "colombia" "congo" "croatia" "cuba" "cyprus" "czechia" "denmark" "dominican_republic" "ecuador" "egypt" "el_salvador" "estonia" "ethiopia" "finland" "france" "georgia" "germany" "ghana" "greece" "guatemala" "honduras" "hong_kong" "hungary" "iceland" "india" "indonesia" "iran" "iraq" "ireland" "israel" "italy" "jamaica" "japan" "jordan" "kazakhstan" "kenya" "kuwait" "laos" "latvia" "lebanon" "lithuania" "luxembourg" "madagascar" "malawi" "malaysia" "maldives" "mali" "malta" "mauritania" "mauritius" "mexico" "moldova" "mongolia" "montenegro" "morocco" "mozambique" "myanmar" "namibia" "nepal" "netherlands" "new_zealand" "nicaragua" "nigeria" "norway" "oman" "pakistan" "palestine" "panama" "paraguay" "peru" "philippines" "poland" "portugal" "qatar" "romania" "russia" "rwanda" "san_marino" "saudi_arabia" "senegal" "serbia" "sierra_leone" "singapore" "slovakia" "slovenia" "south_africa" "south_korea" "spain" "sri_lanka" "sudan" "sweden" "switzerland" "syria" "taiwan" "tanzania" "thailand" "tunisia" "turkey" "uganda" "ukraine" "united_arab_emirates" "united_kingdom" "united_states" "uruguay" "uzbekistan" "venezuela" "vietnam" "yemen" "zambia" "zimbabwe")

num_shells=5  # Specify the number of shells you want to create
command_count=3  # Specify the number of times the bot_follow.py command should be executed

# Prompt the user to enter the desired letter
letter="$1"

# Filter countries starting with the entered letter
filtered_countries=()
for country in "${countries[@]}"; do
    if [[ $country == ${letter}* ]]; then
        filtered_countries+=("$country")
    fi
done

# Check if there are any countries starting with the entered letter
if (( ${#filtered_countries[@]} > 0 )); then
    # Calculate the number of times to run the script
    num_iterations=${#filtered_countries[@]}

    # Run the script for each country in 'filtered_countries'
    for ((i=0; i<num_iterations; i++)); do
        for ((j=1; j<=$command_count; j++)); do
            python bot_follow.py -p "${filtered_countries[$i]}" -m 1000
        done
    done
else
    echo "There are no countries starting with '${letter}'."
fi
