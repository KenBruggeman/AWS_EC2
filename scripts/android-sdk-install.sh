#! /usr/bin/env bash
cd /opt
wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar zxvf android-sdk_r24.4.1-linux.tgz
rm android-sdk_r24.4.1-linux.tgz
export ANDROID_HOME="/opt/android-sdk-linux"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
android update sdk --no-ui