@echo off

IF NOT EXIST "index.android.js" (
set /p pathString= "Please Enter React Native Project Path:"
set pathString = "%pathString%"
%pathString:~0,1%:
cd "%pathString%"
)

IF "%1" == "clean" (
cd android && gradlew clean && cd .. && react-native run-android
) ELSE (
react-native run-android
)