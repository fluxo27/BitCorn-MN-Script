![Example-Location](https://media.discordapp.net/attachments/491859966261461002/514158760965701632/corn-112.png)

# Bitcorn Node Masternode Setup Guide (Ubuntu 16.04)
This guide will assist you in setting up a Bitcorn Node Masternode on a Linux Server running Ubuntu 16.04. (Use at your own risk)

If you require further assistance contact the support team @ [Discord](https://discord.gg/eJQJeBB)
***
## Requirements
1. **10,000,000 Bitcorn coins.**
2. **A Vultr VPS running Linux Ubuntu 16.04.**
3. **A Windows local wallet.**
4. **An SSH client such as [Bitvise](https://dl.bitvise.com/BvSshClient-Inst.exe)**
***
## Contents
* **Section A**: Creating the VPS within [Vultr](https://www.vultr.com/?ref=7296974).
* **Section B**: Downloading and installing Bitvise.
* **Section C**: Connecting to the VPS and installing the MN script via Bitvise.
* **Section D**: Preparing the local wallet.
* **Section E**: Connecting & Starting the masternode.
***

## Section A: Creating the VPS within [Vultr](https://www.vultr.com/?ref=7296974)
***Step 1***
* Register at [Vultr](https://www.vultr.com/?ref=7296974)
***

***Step 2***
* After you have added funds to your account go [here](https://my.vultr.com/deploy/) to create your Server
***

***Step 3***
* Choose a server location (preferably somewhere close to you)
![Example-Location](https://i.imgur.com/ozi7Bkr.png)
***

***Step 4***
* Choose a server type: Ubuntu 16.04
![Example-OS](https://i.imgur.com/aSMqHUK.png)
***

***Step 5***
* Choose a server size: $3.50 or $5/mo will be fine
![Example-OS](https://i.imgur.com/9CIYekk.png)
***

***Step 6***
* Set a Server Hostname & Label (name it whatever you want)
![Example-hostname](https://i.imgur.com/UxGFmqD.png)
***

***Step 7***
* Click "Deploy now"

![Example-Deploy](https://i.imgur.com/4qpYuH0.png)
***


## Section B: Downloading and installing BitVise.

***Step 1***
* Download Bitvise [here](https://dl.bitvise.com/BvSshClient-Inst.exe)
***

***Step 2***
* Select the correct installer depending upon your operating system. Then follow the install instructions.

![Example-PuttyInstaller](https://i.imgur.com/TmzV977.png)
***


## Section C: Connecting to the VPS & Installing the MN script via Bitvise.

***Step 1***
* Copy your VPS IP (find this within the server tab @ Vultr and clicking on your server.)
![Example-Vultr](https://i.imgur.com/spEVVCy.png)
***

***Step 2***
* Open the bitvise application, Click New Profile and fill in the "Hostname" box with the IP of your VPS then Port number "22".
![Example-PuttyInstaller](https://i.imgur.com/uvc0Ysp.png)
***

***Step 3***
* Input the username "root" and copy your password from the VULTR Server Page.  
* If you want you can save your password to your Bitvise profile just tick the Store Encrypted password in profile.
![Example-RootPass](https://i.imgur.com/JnXQXav.png)
![Example-BitvisePass](https://i.imgur.com/BxVCWFA.png)
***


***Step 4***
* Save your profile and click "Log in" at the bottom of Bitvise

![Example-Save](https://i.imgur.com/uMwBz0N.png)
![Example-LoginBitvise](https://i.imgur.com/BJAGVr6.png)
***

***Step 5***
* Click login at the bottom of the Bitvise client.
![Example-LoginBitvise](https://i.imgur.com/BJAGVr6.png)
***

***Step 6***
* Paste the code below into the Bitvise terminal then press enter (it will just go to a new line)

`wget -N https://raw.githubusercontent.com/BITCORNtimes/BitCorn-MN-Script/master/bitcorn_install.sh`
***

***Step 7***
* Paste the code below into the Bitvise terminal then press enter

`bash bitcorn_install.sh`

![Example-Bash](https://i.imgur.com/VnueFAi.png)

***

***Step 8***
* Sit back and wait for the install (this will take a couple of minutes)
***

***Step 9***
* When prompted to enter your Gen key - press enter (dont enter anything just hit Enter)

![Example-installing](https://i.imgur.com/sLvWd1S.png)
***

***Step 10***
* You will now see all of the relevant information for your server.
* Keep this terminal open as we will need the info for the wallet setup.
![Example-installing](https://i.imgur.com/Q87LcnW.png)
***

## Section D: Preparing the Local wallet

***Step 1***
* Download and install on the local PC / mac the Bitcorn wallet from [here](https://bitcorntimes.com/bitcorn/)
***

***Step 2***
* Send EXACTLY 10,000,000 Bitcorn to a receive address within your wallet.
* If you want to make a secondary address from inside the wallet, File > Reciveving Addresses > New.
***

***Step 3***
* Create a text document to temporarily store information that you will need.
***

***step 4***
* Go to the console within the wallet, Tools > Debug Console 

![Example-console](https://i.imgur.com/sXWA7Ym.png)
***

***Step 5***
* Type the command below and press enter

`masternode outputs`

![Example-outputs](https://i.imgur.com/gynQDX8.png)
***

***Step 6***
* Copy the long key (this is your transaction ID) and the 0 or 1 at the end (this is your output index)
* Paste these into the text document you created earlier as you will need them in the next step.
***

# Section E: Connecting & Starting the masternode

***Step 1***
* Go to the tools tab within the wallet and click "Open Masternode Configuration File"
![Example-create](https://i.imgur.com/hI4bMq5.png)
***

***Step 2***

* Fill in the form.
* For `Alias` type something like "MN01" **don't use spaces**
* The `Address` is the IP and port of your server (this will be in the Bitvise terminal that you still have open); make sure the port is set to **12211**.
* The `Genkey` is your masternode Gen key output (this is also in the Bitvise terminal that you have open).
* The `TxHash` is the transaction ID/long key that you copied to the text file.
* The `Output Index` is the 0 or 1 that you copied to your text file.
![Example-create](https://i.imgur.com/9b1I3bk.png)

Click "File Save"
***

***Step 3***
* Close out of the Config file and back in the Wallet 
* Click on Tools > Debug Console 
* Type > startmasternode alias 0 'wallet alias' and press ENTER (without the commas)
* eg: startmasternode alias 0 cornmn1
***

***step 4***
* Check the status of your masternode within the VPS by using the command below:

`bitcorn-cli masternode status`

`bitcorn-cli getinfo`

*You should see ***status 4***

If you do, congratulations! You have now setup a masternode. If you do not, please contact [support] iamtheDESIKUKKAD#1000 on discord and and I will assist you.  
***

HAPPY REWARDS !!!

