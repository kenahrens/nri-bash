#!/bin/sh

# Function to read a OHINAME sample file and write the result out
translate_file()
{
  ohiname=$1
  in_file=$2
  out_file=$3

  # Read the input file and replace the OHINAME inside it
  input=`cat $in_file | sed -e "s@OHINAME@${ohiname}@"`
  printf "$input" >> $out_file
  echo "Translated file: $out_file"
}

# Start by figuring out the on host integration name
ohiname="$1"
if [[ "$ohiname" == "" ]]; then
  read -p "Enter your new on host integration name: " ohiname
fi

# Check that the name isn't already in use
if [ -d "$ohiname" ]; then
  echo "The on-host integration $ohiname already exists, not generating anything."
else
  # Make the directories
  mkdir "$ohiname" "$ohiname/bin" "$ohiname/config" "$ohiname/definition" "$ohiname/template"
  echo "Made directories under: ./$ohiname"

  # Setup all the files for the project
  translate_file $ohiname "./0-generator/bin/OHINAME.sh" "./$ohiname/bin/$ohiname.sh"
  translate_file $ohiname "./0-generator/config/OHINAME-config.COPYME" "./$ohiname/config/$ohiname-config.COPYME"
  translate_file $ohiname "./0-generator/definition/OHINAME-def.yaml" "./$ohiname/definition/$ohiname-def.yaml"
  translate_file $ohiname "./0-generator/template/OHINAME-template.json" "./$ohiname/template/$ohiname-template.json"
  translate_file $ohiname "./0-generator/install.sh" "./$ohiname/install.sh"
  translate_file $ohiname "./0-generator/README.md" "./$ohiname/README.md"
fi
