#!/bin/bash

# delete all the .gitignore files not in the top level directory
trash ./*/.gitignore

# the above misses the one in scripts/common
trash ./scripts/common/.gitignore

# delete the current git setup and initialise a new one
trash ./.git
git init

# remove the REAMDE that is just for github
trash README.md

echo "
  Change the following things: 
    1: The name of the .rmd file
    2: The name of the corresponding .tex file in the .gitignore 
    3: The entry in the makefile called CHANGE-THIS.pdf 
  "

# delete itself
trash $0