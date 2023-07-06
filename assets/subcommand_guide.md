## Please follow the next steps:-

1. Check if the docker is running or not

   - sudo systemctl status docker

   if not then type,

   - sudo systemctl start docker / sudo systemctl enable docker

2. If you want to create a new wordpress site then run, "./wordpress_script create {Name of the site}.com"

   - For example - "./wordpress_script create example.com"

3. If you have already created wordpress site and want to eanle it or disable then subcommands available are, enable, disable and delete

   - Enable the site - "./wordpress_script.sh toggle enable"
   - Disable the site - "./wordpress_script.sh toggle disable"

4. If you want to delete the site then,
   - "./wordpress_script.sh delete example.com"
