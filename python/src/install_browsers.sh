#!/bin/bash

# Download chromedriver from: https://sites.google.com/a/chromium.org/chromedriver/downloads
# References: https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver#requirements
#

sudo apt update -y
sudo apt upgrade -y

# Install chrome browser

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f



wget https://chromedriver.storage.googleapis.com/91.0.4472.19/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo chmod +x chromedriver
sudo mv chromedriver /usr/local/bin/

# if you get an error
# WebDriverException: Message: Service chromedriver unexpectedly exited. Status code was: 127
# See: https://stackoverflow.com/questions/49323099/webdriverexception-message-service-chromedriver-unexpectedly-exited-status-co
# You may need to install libnss3
sudo apt-get --fix-broken install -y
sudo apt-get install libnss3 libgbm1 -y

# test if the chromedriver is working
#chromedriver



# Install firefox

sudo apt-get update -y
sudo apt-get install firefox-esr -y

# Install geckodriver
wget https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux32.tar.gz
gunzip geckodriver-v0.29.1-linux32.tar.gz
tar -vxf geckodriver-v0.29.1-linux32.tar
sudo chmod +x geckodriver
sudo mv geckodriver /usr/local/bin/

