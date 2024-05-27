#!/usr/bin/env bash

echo "########## AI Framework for Intel Arc GPUs on Arch Linux ##########"
echo "##################### fork by JT Gresham #####################"
echo ""
echo "*     This installer requires that you have up-to-date drivers for your Intel Arc GPU."
echo "*     You also need to have Python 3.11 installed since this installer creates your"
echo "           python virtual environment with it. Can be found in AUR (python311)"
echo "*     This installer will check/install a couple of packages via PACMAN. These are installed"
echo "          from the offical Arch repositories so you will be asked to authorize the install with"
echo "          your password."
echo "*     This installer will create a customized start script by using the information you enter."
echo ""
echo "Press enter to continue the installation..."
read go
echo "AIIAAL installer needs to check/install some PACMAN packages...Please authorize to continue..."
sudo pacman -S --needed intel-compute-runtime intel-graphics-compiler ocl-icd opencl-headers 
echo ""
echo "What is the FULL PATH of directory where you want to install \"AI-IntelArc-ArchLinux\"?"
echo "---Exclude the trailing \"/\"---"
read pdirectory
echo ""
echo "Your installation will be installed in $pdirectory/AI-IntelArc-ArchLinux"
echo ""
echo "Changing directory -> $pdirectory"
cd $pdirectory
echo ""
git clone https://github.com/JT-Gresham/AI-IntelArc-ArchLinux.git
echo ""
echo "Changing directory ->$pdirectory/AI-IntelArc-ArchLinux"
cd $pdirectory/AI-IntelArc-ArchLinux
echo ""
echo "Creating python 3.11 environment (AI-IntelArc-ArchLinux_env)"
/usr/bin/python3.11 -m venv AI-IntelArc-ArchLinux_env
echo ""
echo "Activating environment -> AI-IntelArc-ArchLinux_env"
source AI-IntelArc-ArchLinux_env/bin/activate
echo ""
echo "Installing wheel package..."
pip install wheel
echo ""
echo "Installing packages from requirements_AIIAAL.txt..."
pip install -r requirements_AIIAAL.txt
echo ""
echo "Creating the AIIAAL base files..."
touch $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
touch $pdirectory/AI-IntelArc-ArchLinux/libref
echo "pdirectory=\"$pdirectory\"" > $pdirectory/AI-IntelArc-ArchLinux/libref
echo "export LD_LIBRARY_PATH=$pdirectory/AI-IntelArc-ArchLinux/AI-IntelArc-ArchLinux_env/lib" >> $pdirectory/AI-IntelArc-ArchLinux/libref
echo "#!/usr/bin/env bash" > $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "git switch main" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "git pull" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/AI-IntelArc-ArchLinux_env/bin/activate" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/libref" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "Setting the new start file to be executable. (Authorization Required)"
sudo chmod +x $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "Installation complete. Start with command: $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh"
