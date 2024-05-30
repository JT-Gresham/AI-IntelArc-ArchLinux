#!/usr/bin/env bash
source AI-IntelArc-ArchLinux/libref
####  This file is for you to add any code you want to execute just before fooocus launches.  This will not be updated when AIIAAL or fooocus updates.
####  This is useful if you want to create custom presets and make sure your code, links, etc gets put back after an official update from the fooocus team.
####  I'll include the code I wrote to load my own custom preset as an example.  I didn't wnat to do this every time the fooocus team updated...
echo $(pwd)
#### EXAMPLE CODE ####
#  Change directory to make things easier
cd $pdirectory/AI-IntelArc-ArchLinux
#  Copy files (without overwritting) from my custom preset directory (FOOOCUS_Presets) I created in the AIIAAL shared folder
cp --no-clobber -R shared/FOOOCUS_Presets/* fooocus-IntelArc-ArchLinux/presets/
#  Change into the fooocus directory for the next part.
cd fooocus-IntelArc-ArchLinux/modules
#  Since my name is both capital letters, I need to make a change into a fooocus file so it will recognize my name as "JT" ...not "Jt" (only if needed)
#  This will get pretty jank if I don't define all those strings with single quotes as variables...sed isn't happy about it.
JTentry1="k = k.replace(Jt, JT)"
JTentry2="'sdxl_styles_JT.json'"
fkdupstr1="k = k.replace('(s', '(S')"
fkdupstr2="'sdxl_styles_sai.json',"
  if grep -Fxq "k = k.replace('Jt', 'JT')" sdxl_styles.py
    then
      echo "JT correction entry found in sdxl_styles.py...skipping"
    else
      sed -i 's|$fkdupstr1|${fkdupstr1}\n    $JTentry1|g' sdxl_styles.py
  fi
#  Lastly, I want fooocus to make sure to add my styles only if needed...the 'if' statement makes sure there isn't duplicate lines of code added. 
  if grep -Fxq "sdxl_styles_JT.json" sdxl_styles.py
    then
      echo "JT styles entry found in sdxl_styles.py...skipping"
    else
      sed -i 's|$fkdupstr2|${fkdupstr2}\n          \$JTentry2|g' sdxl_styles.py
  fi
