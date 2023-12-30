#!/bin/sh

# install dependencies
echo "Do you wish to install dependencies? (Y/n) "
read dependencies

if [[ ${dependencies,,} == "y" ]]; then
  echo 
fi

# move to appropriate folder
mv $(pwd) ~/.config/nvim
cd 
