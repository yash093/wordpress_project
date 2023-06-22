#!/bin/bash

####################### Metadata ##############################

# Script Name: wordpress_script.sh
# Description: A Bash script to create and manage a WordPress site using Docker containers (LEMP stack).
# Version: 1.0
# Author: Yash Aswar
# Date: June 21, 2023

###############################################################



# Check if docker and docker-compose are installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."
    # Install Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
    rm get-docker.sh
    echo "Docker installed successfully."
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Installing Docker Compose..."
    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed successfully."
fi

# Check if a subcommand is provided
if [ -z "$1" ]; then
    cat assets/subcommand_guide.md
    exit 1
fi

# Create a WordPress site
create_site() {
    site_name=$1
    echo "Creating WordPress site: $site_name"

    # Create /etc/hosts entry
    echo "127.0.0.1 $site_name" | sudo tee -a /etc/hosts > /dev/null

    # Start containers
    docker-compose -f docker-compose.yml up -d

    echo "WordPress site created successfully. Open http://$site_name in a browser."
}

# Toggle_site function to enable or disable the site
toggle_site() {
    action=$1

    if [ "$action" = "enable" ]; then
        echo "Enabling the site..."
        docker-compose -f docker-compose.yml start
        echo "Site enabled."
    elif [ "$action" = "disable" ]; then
        echo "Disabling the site..."
        docker-compose -f docker-compose.yml stop
        echo "Site disabled."
    else
        echo "Invalid subcommand. Please specify 'enable' or 'disable'."
        exit 1
    fi
}

# This  function Deletes the site
delete_site() {
    echo "Deleting the site..."
    docker-compose -f docker-compose.yml down --volumes
    sudo sed -i "/$2/d" /etc/hosts
    echo "Site deleted."
}

# Perform the specified subcommand, takes the  input from the user
case "$1" in
    create)
        if [ -z "$2" ]; then
            echo "Please provide a site name."
            exit 1
        fi
        create_site "$2"
        ;;
    toggle)
        toggle_site "$2"
        ;;
    delete)
        if [ -z "$2" ]; then
            echo "Please provide a site name."
            exit 1
        fi
        delete_site "$2"
        ;;
    *)
        echo "Invalid subcommand. Available subcommands: create, toggle, delete."
        exit 1
        ;;
esac
