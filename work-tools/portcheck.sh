#!/bin/bash
clear
echo "==========================================="
echo "Compute SRE Port Check Tool"
echo "==========================================="
echo "What is the IP address of the server you are working with?"
read ipaddr
ssh root@$ipaddr < ~/.port