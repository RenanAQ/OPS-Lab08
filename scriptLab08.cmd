@echo off
set F=0
for %%N in (*) do 
    if exist %%N set /a F+=1 
echo Result: %F% 

::for %%N in (*) do (
::  if exist %%N set /a F+=1 )