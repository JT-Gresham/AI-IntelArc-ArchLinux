#!/usr/bin/env bash

source ./libref
source ./AI-IntelArc-ArchLinux_env/bin/activate
aiiaalpkg="ollama"
aiiaaluser=$(whoami)

echo "########## $aiiaalpkg for Intel Arc GPUs on Arch Linux ##########"
echo "##################### framework by JT Gresham #####################"
echo ""
echo "*     This installer requires that you have up-to-date drivers for your Intel Arc GPU."
echo "*     This installer requires that you have the AIIAAL already installed."
echo "*     This installer will create a customized start script by using the information you enter."
echo ""
echo "Press enter to continue the installation..."
read go
echo "Your installation will be installed in $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux"
echo ""
echo "Changing directory -> $pdirectory/AI-IntelArc-ArchLinux"
cd $pdirectory/AI-IntelArc-ArchLinux
echo ""
./AI-Start.sh
echo ""
echo "Activating environment -> AI-IntelArc-ArchLinux_env"
source AI-IntelArc-ArchLinux_env/bin/activate
echo ""
echo "Changing directory ->$pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux"
cd $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux
echo ""
echo "Installing the $aiiaalpkg binary --> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/bin/ollama"
sudo curl -L https://ollama.com/download/ollama-linux-amd64 --create-dirs --output bin/ollama
echo "The base ollama file needs to be made executable. Authorize with sudo user password below."
sudo chmod +x bin/ollama
echo ""
echo "Installing packages from requirements_$aiiaalpkg.txt..."
pip install -r requirements_$aiiaalpkg.txt
echo ""
#Create directory environment and symlinks to contain ollama
mkdir -p "$pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/.ollama"
ln -sf "$pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/.ollama" "~/\.ollama"
ln -sf "$pdirectory/shared/LLMs/" "$pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/\.ollama/models/blobs/"
echo "Initializing ollama with IPEX for your GPU..."
#Create symlinks for ipex, ollama, and openwebui
ln -sf $pdirectory/AI-IntelArc-ArchLinux/AI-IntelArc-ArchLinux_env/bin/ipexrun ipexrun
init-ollama
ln -sf $pdirectory/AI-IntelArc-ArchLinux/AI-IntelArc-ArchLinux_env/bin/open-webui open-webui
#Create launcher file
echo "Creating the launcher file ($aiiaalpkg-Start.sh)"
touch $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "#!/usr/bin/env bash" > $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/libref" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/libref-$aiiaalpkg" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/AI-IntelArc-ArchLinux_env/bin/activate" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "cd $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "source ipex-llm-init --gpu --device Arc" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "./ollama serve &" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "sleep 10" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "ipexrun xpu open-webui serve" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "#This file can be copied and the final python command can be modified with any $aiiaalpkg arguments (like --preset realistic). Just add arguments after entry_with_update.py" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "Setting the new start file to be executable. (Authorization Required)"
sudo chmod +x $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "Installation complete. Start with command--> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh"
