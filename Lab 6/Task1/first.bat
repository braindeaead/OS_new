md C:\LAB6
cd C:\LAB6

ver > version.txt
wmic os get totalphysicalmemory > memory.txt
wmic os get freephysycalmemory >> memory.txt
wmic diskdrive get size > disks.txt
