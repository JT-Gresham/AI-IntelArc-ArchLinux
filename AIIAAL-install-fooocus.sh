#!/usr/bin/env bash

source ./libref
source ./AI-IntelArc-ArchLinux_env/bin/activate
aiiaalpkg="fooocus"

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
echo "Changing directory ->$pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux"
cd $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux
echo ""
echo "Cloning official $aiiaalpkg repository to $aiiaalpkg-IntelArc-ArchLinux"

#### GIT CLONE COMMAND  URL HERE ####
git clone "https://github.com/lllyasviel/$aiiaalpkg.git" "/tmp/$aiiaalpkg-IntelArc-ArchLinux"
mv -f "/tmp/$aiiaalpkg-IntelArc-ArchLinux/.git" "$pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/"
git checkout .
rm -r /tmp/$aiiaalpkg-IntelArc-ArchLinux
source $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/libref-$aiiaalpkg
echo ""
echo "Applying AIIAAL modifications to original $aiiaalpkg..."
AIIAAL_update_$aiiaalpkg
echo ""
echo "Installing packages from requirements_versions.txt..."
cd $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux
sleep 1
pip install -r requirements_versions.txt
echo ""
echo "Creating the launcher file ($aiiaalpkg-Start.sh)"
cp user_customize_fooocus_example.sh user_customize_fooocus.sh
touch $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "#!/usr/bin/env bash" > $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/libref" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "source /home/LACII14/Archive-M1/AI/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/libref-$aiiaalpkg" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "source $pdirectory/AI-IntelArc-ArchLinux/AI-IntelArc-ArchLinux_env/bin/activate" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "AIIAAL_update" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh

#### Executable below
echo "AIIAAL_update_$aiiaalpkg" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "Intel_mods" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "python $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/launch.py --port 7865 \"\$@\"" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "sleep 60"
echo "echo "Fooocus is still running in the background. Enter command: fooocus-exit to close down fooocus.""
echo "" >> $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "Setting the new start file to be executable. (Authorization Required)"
sudo chmod +x $pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh
echo "Creating executable link in /usr/bin --> AIIAAL-$aiiaalpkg"
sudo ln -sf "$pdirectory/AI-IntelArc-ArchLinux/$aiiaalpkg-IntelArc-ArchLinux/$aiiaalpkg-Start.sh" "/usr/bin/AIIAAL-$aiiaalpkg"
echo "Installation complete. Start with command: AIIAAL-$aiiaalpkg with any fooocus arguments afterward"
