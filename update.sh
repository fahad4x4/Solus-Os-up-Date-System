#!/bin/bash
# A sample Bash script, by Fahad ALGhathbar

echo "Rebuild-db"
sudo eopkg rebuild-db -y 
echo "########################################################"

echo "Check"
sudo eopkg check -y
echo "########################################################"

echo "Update-repo"
sudo eopkg update-repo -y
echo "########################################################"

echo "Upgrade"
sudo eopkg upgrade -y
echo "########################################################"

echo "Flatpak Update"
sudo flatpak update -y
echo "########################################################"

echo "Remove"
sudo eopkg rmo -y 
echo "########################################################"

echo "Clean"
sudo eopkg clean -y 
echo "########################################################"

echo "cp"
sudo eopkg cp -y
echo "########################################################"
