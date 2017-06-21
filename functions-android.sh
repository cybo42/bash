function countPMD(){
  find . -name "pmd.xml" -exec grep -csE "<violation\s" {} \;  |paste -s -d'+' - |bc
}

function countCheckstyle(){
  find . -name "checkstyle.xml" -exec grep -cs '<error' {} \; |paste -s -d'+' - |bc
}

function countLint(){
  find . -name "lint*.xml" -exec grep -cs '<issue' {} \; |paste -s -d'+' - |bc
}

function firebaseAnalyticsDebug(){
  adb shell setprop debug.firebase.analytics.app com.nytimes.android.debug
}
