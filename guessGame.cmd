@echo off
setlocal enabledelayedexpansion

rem Maximum value of secret
set MAX=100
rem Maximum number of tries (guesses)
set MAX_TRIES=7
rem How many games have been played
set GAMES=0
rem How many games the user has won
set WINS=0

cls
echo === Number-Guessing Game ===
echo.
echo I have a secret number between 1 and %MAX%
echo Your mission is to guess it in as few tries as possible.
echo You have a maximum of %MAX_TRIES% guesses to succeed.
echo.

set PLAY=Y

rem This next loop continues until the user says
rem they don't want to play again
:play_loop
if /i "%PLAY%"=="Y" (
    rem Generate a random number from 1-MAX
    set /a "SECRET=!random! %% MAX + 1"

    rem Un-commend this line when debugging!
    rem echo NOTE: the secret number is %SECRET%

    set GUESS=0
    set TRIES=0
    set /a GAMES+=1

    rem This next loop continues until the user guess correctly
    rem or the maximum number of guesses is exhausted
    :guess_loop
    set /a TRIES+=1
    set /p "GUESS=Enter your guess (#%TRIES%): "
    if %GUESS% gtr %SECRET% (
        echo Too high!
    ) else if %GUESS% lss %SECRET% (
        echo Too low!
    ) else (
        echo You got it in %TRIES% tries!
        set /a WINS+=1
        goto :after_guess_loop
    )
    if %TRIES% lss %MAX_TRIES% goto :guess_loop
    echo You lose after %TRIES% attempts. The number was %SECRET%.
    :after_guess_loop
    echo.
    set /p "PLAY=Do you want to play again (Y/N)? "
    echo.
    if /i "%PLAY%"=="Y" goto :play_loop
)

echo You executed %GAMES% missions and succeeded %WINS% times (%WINS%00/%GAMES%%% success).

endlocal
