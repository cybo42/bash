function countPMD(){
  find . -name "pmd.xml" -exec grep -csE "<violation\s" {} \;  |paste -s -d'+' - |bc
}

function countCheckstyle(){
  find . -name "checkstyle.xml" -exec grep -cs '<error' {} \; |paste -s -d'+' - |bc
}

function countLint(){
  find . -name "lint*.xml" -exec grep -cs '<issue' {} \; |paste -s -d'+' - |bc
}

function countKTLint(){
  find . -name "ktlint.xml" -exec grep -cs '<error' {} \; |paste -s -d'+' - |bc
}

function countDetekt(){
  find . -name "detekt.xml" -exec grep -cs '<error' {} \; |paste -s -d'+' - |bc
}

function debugFirebaseAnalytics(){
  adb shell setprop debug.firebase.analytics.app com.nytimes.android.debug
}

function logFirebaseAnalytics(){
  adb shell setprop log.tag.FA VERBOSE
  adb shell setprop log.tag.FA-SVC VERBOSE
  adb logcat -v time -s FA FA-SVC
}

function androidOpenUrl(){
  local URL=$1
  if [ -n "$URL" ];then
    adb shell am start -a android.intent.action.VIEW -d "$URL"
  else
    echo "Need to pass a URL"
    return
  fi
}

function androidDevices(){
  adb devices |grep device$ |awk '{print $1}'
}

function startAllAndroid(){
  androidDevices | while read D ; do eval "ANDROID_SERIAL=$D startNYTReader &"; done
}

function showCurrentActivity(){
  adb shell dumpsys activity top | grep ACTIVITY
}

function showCurrentFragments() {
  adb shell dumpsys activity top | grep -E 'Fragment|Activity' | head -60
}

function monitorCurrentActivity(){
  watch -n 3 "adb shell dumpsys activity top | grep ACTIVITY"
}

function printSystemImages() {
  grep image  $HOME/.android/avd/*/config.ini |perl -ne 's/.*?(system-images.*)\//$1/ ; s%/%;%g ;print'
}

function logAdbPackage() {
  local package=${1:-com.nytimes.android.debug}
  shift;
  echo "logcat for package: $package"
  adb logcat -v color --pid=$(adb shell pidof $package) $@
}

function setAndroidSerial() {
  export ANDROID_SERIAL=$(adb devices |grep device$ | cut -f 1  |fzf)
}

function verify-apk-cert() {
  local apksigner=$(find $ANDROID_SDK_ROOT/build-tools -name "apksigner.jar" |sort -r |head -1)
  [ -n "$DEBUG_CMD" ] && echo "DEBUG: using $apksigner to verify cert" 
  java -jar $apksigner verify --print-certs $@
}

function package-name-from-apk() {
  local aapt=$(find $ANDROID_SDK_ROOT/build-tools -name "aapt" |sort -r |head -1)
  [ -n "$DEBUG_CMD" ] && echo "DEBUG: using $appt to dump badging for packageName" 
  $aapt dump badging $@ | awk '/package/{gsub("name=|'"'"'","");  print $2}'
}

function shutdownAllEmulators() {
  androidDevices | grep emulator |while read eid
  do
    echo "Stopping $eid"
    adb -s $eid emu kill
  done
}
