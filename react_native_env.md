# Setting up React Native Developemt Environment without Android Studio
## Install Packages
	sudo dnf -y update
	sudo dnf install -y git gcc-c++ make nodejs
	

## Install React Native CLI
	npm install -g react-native-cli

## Install JDK
	sudo dnf install -y java-1.8.0-openjdk
	java --version

## Install Android SDK
Go to (Android Studio)[https://developer.android.com/studio/index.html] and scroll down to the bottom and download cmdline-tools
	mkdir -p ~/android/cmdline-tools
	unzip ~/Download/sdk-tools-linux-*.zip -d ~/android/cmdline-tools
	mv ~/android/cmdline-tools/cmdline-tools ~/android/cmdline-tools/tools

## Set PATH in .zshrc or .bashrc
	export ANDROID_SDK_ROOT=$HOME/android
	export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin

& source rc file
	source ~/.zshrc

## Install SDK packages
Android 9 -> Api Level 28
	sdkmanager "platform-tools" "platforms;android-28" "build-tools;28.0.3" "add-ons;addon-google_apis-google-24"

## Init React Native Project
latest react-native-cli has an error: "TypeError: cli.init is not a function for react native " when initing new project, a fix is found at (Stack Overflow)[https://stackoverflow.com/questions/72768245/typeerror-cli-init-is-not-a-function-for-react-native]

	npx react-native init ProjectName --version 0.68.2

## Run project in device

	cd ProjectName
	react-native start

Start a new terminal

	cd ProjectName
	react-native run-android

