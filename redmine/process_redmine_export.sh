#!/bin/bash

echo "Running this script will overwrite content of ../*.md"
echo "Press Enter to continue or Ctrl+C to abort"
read

for target_version in Alpha Beta RC GM GA Postprocessing; do
    echo "Processing ../${target_version}.md"
    redmine2md redmine-export-*.csv --target-version ${target_version} >  ../${target_version}.md
    dos2unix ../${target_version}.md
done

# Issues without target version
redmine2md redmine-export-*.csv --target-version Unsorted >  ../Unsorted.md
dos2unix ../Unsorted.md

# Substitute users with groups defined in [ownership] ../openSUSE-Leap.conf

echo "Current task owners"
grep --no-filename "Responsible:" ../*.md | sort | uniq
# output as of Feb 11th 2020. TODO: Confirm with others on default assignment
#Responsible: AdaLovelace
#Responsible: hellcp
#Responsible: jsegitz
#Responsible: lkocman
echo "Substituting user lkocman"; sed -i "s/Responsible:\ lkocman/Responsible:\ rel-mgmt/"  ../*.md
#Responsible: lnussel
echo "Substituting user lnussel"; sed -i "s/Responsible:\ lnussel/Responsible:\ rel-mgmt/"  ../*.md
#Responsible: mgriessmeier
#Responsible: mlin7442
echo "Substituting user mlin7442"; sed -i "s/Responsible:\ mlin7442/Responsible:\ rel-eng/"  ../*.md
