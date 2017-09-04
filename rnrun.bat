@ECHO off

IF NOT EXIST "index.android.js" (
IF "%pathString%"=="" (
  set /p pathString= "Please Enter React Native Project Path:"
  rnrun
)
cd  /D "%pathString%"
)

IF "%1" == "clean" (
cd android && gradlew clean && cd .. && react-native run-android
) ELSE (
react-native run-android
)