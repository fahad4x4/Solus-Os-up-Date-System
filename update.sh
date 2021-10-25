#!/bin/bash
# A sample Bash script, by Fahad ALGhathbar

echo -e "\e[31mRebuild-db\e[0m"	
	echo 
        sudo eopkg rebuild-db -y 
		
			echo -e "\e[31m########################################################\e[0m"	

		
echo -e "\e[31mCheck\e[0m"
	echo	
		sudo eopkg check -y
					echo -e "\e[31m########################################################\e[0m"	

		
echo -e "\e[31mUpdate-repo\e[0m"
    echo
        sudo eopkg update-repo -y
					echo -e "\e[31m########################################################\e[0m"	

		
echo -e "\e[31mUpgrade\e[0m"
	echo
		sudo eopkg upgrade -y
					echo -e "\e[31m########################################################\e[0m"	

		
echo -e "\e[31mUpdate\e[0m"
	echo
		sudo flatpak update -y
					echo -e "\e[31m########################################################\e[0m"	

		
echo -e "\e[31mRemove\e[0m"
	echo	
		sudo eopkg rmo -y 
					echo -e "\e[31m########################################################\e[0m"	

		
echo -e "\e[31mClean\e[0m"
	echo
		sudo eopkg clean -y 
					echo -e "\e[31m########################################################\e[0m"	

		
echo -e "\e[31mcp\e[0m"
	echo
		sudo eopkg cp -y
					echo -e "\e[31m########################################################\e[0m"	

