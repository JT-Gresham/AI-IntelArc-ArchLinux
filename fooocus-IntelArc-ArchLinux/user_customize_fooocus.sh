#!/usr/bin/env bash

####  This file is for you to add any code you want to execute just before fooocus launches.  This will not be updated when AIIAAL or fooocus updates.
####  This is useful if you want to create custom presets and make sure your code, links, etc gets put back after an official update from the fooocus team.
####  I'll include the code I wrote to load my own custom preset as an example.  I didn't wnat to do this every time the fooocus team updated...

#### EXAMPLE CODE ####
#  Change directory to make things easier
cd $pdirectory/AI-IntelArc-ArchLinux
#  Copy files from my custom preset directory I created in the AIIAAL shared folder without overwritting
cp --no-clobber -R shared/FOOOCUS_Presets/* fooocus-IntelArc-ArchLinux/presets/
#  Change into the fooocus directory for the next part.
cd fooocus-IntelArc-ArchLinux/modules
#  Since my name is both capital letters, I need to make a change into a fooocus file so it will recognize my name as "JT" ...not "Jt" (only if needed)
  if grep -Fxq "k = k.replace(\'Jt\', \'JT\')" sdxl_styles.py
    then
      echo "JT correction entry found in sdxl_styles.py...skipping"
    else
      sed 's|k = k.replace(\'(s\', \'(S\')|k = k.replace(\'(s\', \'(S\')\n    k = k.replace(\'Jt\', \'JT\')|g' sdxl_styles.py
  fi
#  Lastly, I want fooocus to make sure to add my styles only if needed...the 'if' statement makes sure there isn't duplicate lines of code added. 
  if grep -Fxq "sdxl_styles_JT.json" sdxl_styles.py
    then
      echo "JT styles entry found in sdxl_styles.py...skipping"
    else
      sed 's|\'sdxl_styles_sai.json,|\'sdxl_styles_sai.json\',\n          \'sdxl_styles_JT.json\',|g' sdxl_styles.py
  fi
