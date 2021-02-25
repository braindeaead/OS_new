for %I in "C:\Windows" do
if %~zI GEQ 2097152 
copy %I "C:\%ComputerName%\temp
