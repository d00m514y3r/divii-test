@ECHO off
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS

set /p m=Maximum of each number: 
set /p l=Minimum of each answer: 

set /a t=0

for /l %%x in (1, 0, 1) DO (
	set /a a=1
	set /a b=3
	:loop
	set /a a=!RANDOM! * !m!
	set /a a=!a! / 32768 + 10 * !l!
	set /a b=!a! / !l!
	set /a b=!RANDOM! * !b! / 32768 + !l!
	set /a r=!a!%%!b!
	if not !r!==0 (goto loop)
	set /p s= !a! // !b! : 
	set /a r=!a!/!b!

	if !r!==!s! (ECHO Correct! && set /a t=t+1
	) ELSE (ECHO Wrong. The Answer is !r!))
