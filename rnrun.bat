@echo off

IF NOT EXIST "index.android.js" (
set /p pathString= "Please Enter React Native Project Path:"
%pathString:~0%:
cd "%pathString%"
)

IF "%1" == "clean" (
cd android && gradlew clean && cd .. && react-native run-android
) ELSE (
react-native run-android
)