# WordPress Site Creation Using Docker And Docker-Compose

This command-line script is written in Bash and uses Docker and Docker Compose to create a WordPress site with a LEMP stack running inside containers. It provides functionalities to create a site, enable/disable the site, and delete the site. Additionally, it sets up a local mapping for the site's URL

## Table of contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Live Demo](#live-demo)

## Prerequisites

The only Prerequisites are docker and docker-compose. If these tools are not installed, the script will automatically install them for you.

## Installation

To get started with the scripts in this repository, follow these steps:

1. Clone the repository to your local machine using the following command:

   ```shell
   git clone https://github.com/yashh0903/wordpress_project.git

   ```

2. Navigate to the repository directory:

   ```shell
   cd wordpress_project

   ```

3. I have made the script executable already but still you can run the following command:
   ```shell
   chmod 777 wordpress_script.sh
   ```
   or
   ```shell
    chmod +x wordpress_script.sh
   ```

## Usage

To use the script, follow the instructions below.

### Check and Install Docker and Docker Compose

To check if Docker and Docker Compose are installed and install them if necessary, run the script without any arguments:

```shell
./wordpress_script.sh
```

### Create a WordPress Site

To create a WordPress site, provide the site name as a command-line argument. Replace example.com with your desired site name:

```shell
./wordpress_script.sh create example.com
```

- This command will set up a LEMP stack inside Docker containers and create a new WordPress site using the latest version.

- For any reason if docker daemon denies permission, logout and login again then run the script again.

- After successful creation of website it will prompt you to open example.com in browser, similar to this.

![Alt Text](https://github.com/yashh0903/wordpress_project/blob/main/assets/wordpress_site.png)

### Enable or Disable the Site

To enable or disable the site (start or stop the containers), use the toggle subcommand. Replace enable or disable based on your desired action:

```shell
./wordpress_script.sh toggle enable

```

## Delete the Site

To delete the site (remove containers and local files), use the delete command. Replace example.com with the site name you want to delete:

```shell
./wordpress_script.sh delete example.com
```

This command will delete the Docker containers and associated volumes for the specified WordPress site.

## Live Demo

I have created the site running inside the container and deployed it on an AWS EC2 instance. [Click here](http://13.53.114.154/example.com) to access a live demo of the site deployed on an AWS EC2 instance
