#!/usr/bin/env bash

echo "########## AI Framework for Intel Arc GPUs on Arch Linux ##########"
echo "###################### created by JT Gresham ######################"
echo ""
echo "*  This installer requires that you have up-to-date drivers for your Intel Arc GPU."
echo "*  You also need to have Python 3.11 installed since this installer creates your"
echo "       python virtual environment with it. It can be found in the AUR (python311)"
echo "*  This installer will check/install a couple of packages via PACMAN. These are installed"
echo "       from the offical Arch repositories so you will be asked to authorize the install with"
echo "       your password."
echo "*  Installing this framework will provide a more efficient installation of popular AI packages."
echo "   This installation will create custom launchers by using the information you enter here."
echo ""
echo "Press enter to continue the installation..."
read go
echo "AIIAAL installer needs to check/install some PACMAN packages...Please authorize to continue..."
sudo pacman -S --needed intel-compute-runtime intel-graphics-compiler ocl-icd opencl-headers 
echo ""
echo "--- Important Notes:"
echo "   * This directory can get pretty big in size as you add AI Software, LLMs, Checkpoints...etc!"
echo "   * Make sure you've got storage space to accomodate your future needs!"
echo "   * To avoid potential issues, the FULL PATH should not contain any spaces or special characters."
echo ""
echo "What is the FULL PATH of directory where you want to install \"AI-IntelArc-ArchLinux\"?"
echo "---IMPORTANT: Exclude the trailing \"/\"---"
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
echo "export USE_XETLA=OFF" >> $pdirectory/AI-IntelArc-ArchLinux/libref
echo "export SYCL_PI_LEVEL_ZERO_USE_IMMEDIATE_COMMANDLISTS=1" >> $pdirectory/AI-IntelArc-ArchLinux/libref
echo "export SYCL_CACHE_PERSISTENT=1" >> $pdirectory/AI-IntelArc-ArchLinux/libref
echo "#!/usr/bin/env bash" > $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "source $pdirectory/AI-IntelArcArchLinux/libref" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/AI-IntelArc-ArchLinux_env/bin/activate" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "cd $pdirectory/AI-IntelArcArchLinux" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "echo \"Updating AIIAAL if necessary...\"" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "AIIAAL_update" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
echo "Setting the new start file to be executable. (Authorization Required)"
sudo chmod +x $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh
$pdirectory/AI-IntelArc-ArchLinux/librefgen
echo "Installation complete. Start with command: $pdirectory/AI-IntelArc-ArchLinux/AI-Start.sh"
