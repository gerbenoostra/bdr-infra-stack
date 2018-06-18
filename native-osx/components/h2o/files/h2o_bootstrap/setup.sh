#!/usr/bin/env bash
# Run this script once to setup a working sparkling water instance
mkdir ~/h2o
cp h2o/* ~/h2o/

cd ~/h2o
echo "========="
echo ""
echo "Setup up of h2o on spark (sparkling water) in $PWD"
echo ""
echo "========="
./download.sh
echo ""
echo "You can now run spark using ./sparkling-shell.sh from $PWD"
echo "Note that you can load files from the sparkling shell using :load abolute/path/to/file.scala"
