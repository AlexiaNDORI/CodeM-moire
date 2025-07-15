@echo off
set MATLAB=C:\Program Files\MATLAB\R2022b
"%MATLAB%\bin\win64\gmake" -f BESS_PCS_Ref.mk  OPTS="-DTID01EQ=0"
