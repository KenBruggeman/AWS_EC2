#! /bin/bash

set -o errexit  # abort on nonzero exitstatus
set -o nounset  # abort on unbound variable
set -o pipefail # don’t hide errors within pipes

# Follow link: https://guides.codepath.com/android/installing-android-sdk-tools
# Issues during execution of sdkmanager: https://stackoverflow.com/questions/65262340/cmdline-tools-could-not-determine-sdk-root  
# Create the necessary directories inside /opt directory
cd /opt
mkdir /android-sdk
cd /android-sdk
mkdir /cmdline-tools
# Download the Android SDK Command line tools
wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip
# unpack the zip file (zip/unzip is installed in bertvv.rh-base role)
unzip commandlinetools-linux-7583922_latest.zip
# renaming the directory cmdline-tools to latest
mv cmdline-tools latest
# change directory to use the sdkmanager tool
cd latest/bin/
# use sdkmanager tool to install necessary build tools and platforms
./sdkmanager --update 
./sdkmanager "build-tools;30.0.2" "platforms;android-31" # build tools and platforms for HIER Android app
# Automatically accept all licenses
./sdkmanager --licenses

export ANDROID_SDK_ROOT="/opt/android-sdk/"
export PATH=$PATH:$ANDROID_SDK_ROOT/tools


