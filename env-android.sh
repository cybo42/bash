
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

# Command line tools
pathprepend $ANDROID_HOME/cmdline-tools/latest/bin
# AOSP tools
pathprepend $ANDROID_HOME/platform-tools
# Emulator
pathprepend $ANDROID_HOME/emulator


