function countPMD(){
  find . -name "pmd.xml" -exec grep -csE "<violation\s" {} \;  |paste -s -d'+' - |bc
}

function countCheckstyle(){
  find . -name "checkstyle.xml" -exec grep -cs '<error' {} \; |paste -s -d'+' - |bc
}

function countLint(){
  find . -name "lint*.xml" -exec grep -cs '<issue' {} \; |paste -s -d'+' - |bc
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


function monitorCurrentActivity(){
  watch -n 3 "adb shell dumpsys activity top | grep ACTIVITY"
}
