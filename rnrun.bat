@ECHO OFF

IF NOT EXIST "index.android.js" (
	IF "%pathString%"=="" (
		SET /p pathString= "Please Enter React Native Project Path:"
		rnrun %1
		)
	SET newPath=%pathString%
	SET pathString=
	cd  /D "%newPath%"
)

IF "%1" == "clean" (
cd android && gradlew clean && cd ..
) 

IF "%1" == "build-release" (
cd android && gradlew clean && gradlew assembleRelease
	IF EXIST "index.android.js"  (
	%SystemRoot%\explorer.exe "%cd%\android\app\build\outputs\apk"
	) ELSE (
	%SystemRoot%\explorer.exe "%newPath%\android\app\build\outputs\apk"
	)
cd ..
)

IF "%1" == "show-apks" (
	IF EXIST "index.android.js" (
	%SystemRoot%\explorer.exe "%cd%\android\app\build\outputs\apk"
	) ELSE (
	%SystemRoot%\explorer.exe "%newPath%\android\app\build\outputs\apk"
	)
)

IF NOT "%2" == "not-run" (
react-native run-android
)
