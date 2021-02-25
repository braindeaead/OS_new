net stop dns
timeout /t 10
sc query type=service > service1.txt
fc service.txt service1.txt > difference.txt
net start dns
