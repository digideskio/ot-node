#!bin/bash
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

wget https://www.arangodb.com/repositories/arangodb3/xUbuntu_16.04/Release.key
sudo apt-key add Release.key
sudo apt-add-repository 'deb https://www.arangodb.com/repositories/arangodb3/xUbuntu_16.04/ /'
sudo apt-get update -y
echo arangodb3 arangodb3/password password root | debconf-set-selections
echo arangodb3 arangodb3/password_again password root | debconf-set-selections
sudo apt-get install arangodb3
sudo apt-get install sqlite3

export LC_ALL=C

sudo apt-get install -y python3-pip

sudo pip3 install python-arango
sudo pip3 install xmljson
sudo pip3 install python-dotenv

sudo apt-get install git

git clone -b master https://github.com/OriginTrail/ot-node.git
cd ot-node
cp .env.example .env

npm install
echo "Installation complete. Please configure .env file."