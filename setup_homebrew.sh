#!/bin/sh
#
# installs homebrew without sudo priviledges

set -eu

# simply use the argument for path so the script does not need to change
mkdir "$1"
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$1"
