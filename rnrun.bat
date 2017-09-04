@ECHO off

IF NOT EXIST "index.android.js" (
IF "%pathString%"=="" (
  set /p pathString= "Please Enter React Native Project Path:"
  rnrun %1
)
cd  /D "%pathString%"
)

IF "%1" == "clean" (
cd android && gradlew clean && cd ..
) 

IF "%1" == "build-release" (
cd android && gradlew clean && gradlew assembleRelease
%SystemRoot%\explorer.exe "%pathString%\android\app\build\outputs\apk"
cd ..
)

IF "%1" == "show-apks" (
%SystemRoot%\explorer.exe "%pathString%\android\app\build\outputs\apk"
)

IF NOT "%2" == "not-run" (
react-native run-android
)