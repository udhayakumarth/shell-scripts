#!/bin/bash

provisioning() {
    echo -e "\033[48;5;Provisioning Page\033[0m"
    echo -e "Select User Search Option\n\033[32m1\033[0m. Login\n\033[32m2\033[0m. PID"
}

deprovisioning() {
    echo -e "\033[48;5;94mDeprovisioning Page\033[0m"
    echo -e "Enter email: "
}

home_page="true"

#Home Page
while [ "$home_page" = "true" ]
do
    clear
    echo -e "Note: To choose an option, simply enter the number corresponding to your action:\n\n"
    echo -e "\033[48;5;94mHome Page\033[0m\n\033[32m1\033[0m. Provisioning\n\033[32m2\033[0m. Deprovisioning\n\033[32m3\033[0m. Exit\n\n"
    read -p "Enter [1/2/3]: " action

    case $action in
        1)
            provisioning
            ;;
        2)
            deprovisioning
            ;;
        3)
            echo "Exiting the script.."
            home_page ="false"
            ;;
        *)
            echo "Invalid option. Please enter 1, 2, or 3."
            ;;
    esac
done

