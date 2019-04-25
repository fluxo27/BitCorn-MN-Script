#/bin/bash

echo "We will update your Bitcorn Masternode right now" 
sudo apt-get -y install unzip
bitcorn-cli stop
rm -rf /usr/local/bin/bitcorn*
mkdir CORNUpdated_1.2.0
cd CORNUpdated_1.2.0
wget https://github.com/BITCORNProject/BITCORN/releases/download/v1.2.0/Bitcorn-1.2.0-daemon-ubuntu_16.04.tar.gz
tar xzvf Bitcorn-1.2.0-daemon-ubuntu_16.04.tar.gz
mv bitcornd /usr/local/bin/bitcornd
mv bitcorn-cli /usr/local/bin/bitcorn-cli
chmod +x /usr/local/bin/bitcorn*
rm -rf ~/.bitcorn/blocks
rm -rf ~/.bitcorn/chainstate
rm -rf ~/.bitcorn/peers.dat
cd ~/.bitcorn/
wget https://github.com/BITCORNProject/BITCORN/releases/download/v1.2.0/bootstrap.zip
unzip bootstrap.zip
echo "addnode=149.28.159.236 add" >> bitcorn.conf
echo "addnode=149.28.164.188 add" >> bitcorn.conf
echo "addnode=45.76.141.47 add" >> bitcorn.conf
echo "addnode=149.28.212.243 add" >> bitcorn.conf
cd ..
cd CORNUpdated_1.2.0
bitcornd -daemon
sleep 10
bitcorn-cli addnode 149.28.159.236 onetry
bitcorn-cli addnode 149.28.164.188 onetry
bitcorn-cli addnode 45.76.141.47 onetry
bitcorn-cli addnode 149.28.212.243 onetry
echo "Masternode Updated!"
echo "Please wait few minutes and start your Masternode again on your Local Wallet"

