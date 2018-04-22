#!/bin/sh

# Copyright (c) 2018 Benjamin Levy
#
# This file is part of FollowTheBeat.
#
# FollowTheBeat is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# FollowTheBeat is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with FollowTheBeat. If not, see <http://www.gnu.org/licenses/>.

# Install build dependencies

set -ev

case $TRAVIS_OS_NAME in
linux)
	./travis/install_haxeflixel.sh

	# Install JDK
	sudo apt-get install -y openjdk-8-jdk
	sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
	echo $(java -version)

	# Install Android SDK, platform-tools, and API level 19
	export ANDROID_HOME=$(pwd)/android-sdk
	mkdir $ANDROID_HOME
	# SDK version must be >= 25.2.3 for sdkmanager and < 25.3.0 for tools/ant
	# This is one of the few versions that actually works :)
	wget http://dl-ssl.google.com/android/repository/tools_r25.2.3-linux.zip
	unzip -q tools_r25.2.3-linux.zip
	mv tools $ANDROID_HOME
	export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin
	yes | sdkmanager platform-tools
	yes | sdkmanager "build-tools;24.0.1"
	sdkmanager "platforms;android-19"

	# Install Android NDK
	wget https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip
	unzip -q android-ndk-r13b-linux-x86_64.zip
	export ANDROID_NDK=$(pwd)/android-ndk-r13b
	export ANDROID_NDK_HOME=$ANDROID_NDK
	export PATH=$PATH:$ANDROID_NDK

	# Install Apache Ant
	sudo apt-get install -y ant

	printf "n\nn\nn\nn\n$ANDROID_HOME\n$ANDROID_NDK\n$ANT_HOME\n/usr/lib/jvm/java-1.8.0-openjdk-amd64\n" | haxelib run lime setup android
	;;
osx)
	./travis/install_haxeflixel.sh
	;;
*)
	echo "ERROR: Travis build running on unknown OS $TRAVIS_OS_NAME"
	exit 1
	;;
esac
