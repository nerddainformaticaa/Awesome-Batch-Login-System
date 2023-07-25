@echo off
:startup

title LOADING...

echo LOADING LOGIN SYSTEM

echo PLEASE WAIT...

cd %userprofile%/documents

if exist "Login system" goto skip

md "Login System"

:skip

cd "Login System"

ping localhost -n 5 >nul

:home

color 7

title HOME

cls

echo --------------

echo HOME

echo --------------

echo.

echo 1. SIGNUP

echo --------------

echo 2. LOGIN

echo --------------

echo 3. DELETE ACCOUNT

echo --------------

echo 4. EXIT

echo --------------

echo.

set /p "a=Choice: "

if ["%a%"] == ["1"] goto signup

if ["%a%"] == ["2"] goto login

if ["%a%"] == ["4"] goto exit

if ["%a%"] == ["3"] goto delaccount

if ["%a%"] == [""] goto home

:signup

color 7

title SIGNUP

cls

set /p "nuser=New Username: "

if ["%nuser%"] == [""] goto signuperror

if EXIST "%nuser%.bat" goto usertaken

goto npass

:usertaken

cls

color c

echo USERNAME taken, please try another one.

pause >nul

goto signup

:npass

set /p "npass=New Password: "

if ["%npass%"] == [""] goto signuperror

set /p "npassr=Repeat Password: "

if ["%npassr%"] == ["%npass%"] goto signupc

goto signuperror

:signupc

echo set "auser=%nuser%"> %nuser%.bat

echo set "apass=%npass%">> %nuser%.bat

cls

color a

echo Signup successful!

echo press any button to continue!

pause >nul

goto home

:login

color 7

title LOGIN

cls

set /p "user=Username: "

if ["%user%"] == [""] goto LOGIN

if EXIST "%user%.bat" goto pass

goto usernotexist

:usernotexist

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto login

:pass

call %user%.bat

set /p "pass=Password: "

if ["%pass%"] == ["%apass%"] goto logingood

goto passinvalid

:passinvalid

color c

cls

echo The PASSWORD you entered is INVALID

pause >nul

goto login

:logingood

color a

cls

echo You have Successfully logged in %user%

echo Redirect to home page echo Thank you for using the login system

echo coded by Blookz!

ping localhost -n 7 >nul

goto home

:delaccount

color 7

title DELETE ACCOUNT

cls

set /p "duser=Username: "

if ["%duser%"] == [""] goto delaccount

if exist "%duser%.bat" goto contin

goto usernotexistdel

:contin

call %duser%.bat

set /p "dpass=Password: "

if ["%dpass%"] == ["%apass%"] goto contin2

goto passerror

:contin2

cls

echo Are you sure you want to echo delete you account?

set /p "delacc=y/n: "

if ["%delacc%"] == ["n"] goto home

echo Deleting you account...

del "%duser%.bat"

ping localhost -n 2 >nul

cls

color a

echo Account deleted.

echo Redirecting to home

ping localhost -n 3 >nul

goto home

:exit

title EXIT

cls

echo Are you sure you want to exit?

set /p exit="y/n: "

if ["%exit%"] == ["y"] exit

if ["%exit%"] == ["n"] goto home

if ["%exit%"] == [""] goto exit

:signuperror

color c

cls

echo ERROR

echo proceeding back to SIGNUP...

ping localhost -n 2 >nul

goto signup

:passerror

color c

cls

echo PASSWORD INVALID

pause >nul

goto delaccount

:usernotexistdel

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto delaccount