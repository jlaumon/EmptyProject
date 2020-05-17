#!/bin/sh

set -e

git init

git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
    while read path_key path
    do
        url_key=$(echo $path_key | sed 's/\.path/.url/')
        url=$(git config -f .gitmodules --get "$url_key")
        git submodule add $url $path
    done
	
git submodule init

git add .gitignore
git add *

git commit -m"initial commit"

