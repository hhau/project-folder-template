#!/bin/bash

# delete all the .gitignore files not in the top level directory
trash ./*/.gitignore

# delete the current git setup and initialise a new one
trash ./.git
git init

# remove the REAMDE that is just for github
trash README.md

# delete itself
trash $0