#!/bin/bash
sleep 5
sudo apt update && sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundler -v
#apt update
#sudo apt install -y ruby-full ruby-bundler build-essential
