#!/bin/bash

set -x

for target_version in Alpha Beta RC GM GA; do
    redmine2md redmine-export-*.csv --target-version ${target_version} >  ${target_version}.md
    dos2unix ${target_version}.md
done

# Test if we skipped some
redmine2md redmine-export-*.csv --target-version ${target_version} >  ${target_version}.md
