#!/bin/bash
# Created by Analicia Abernathy - 2023
# Version 1.o

clear

folia_endpoint='https://api.papermc.io/v2/projects/folia/versions'
paper_endpoint='https://api.papermc.io/v2/projects/paper/versions'
travertine_endpoint='https://api.papermc.io/v2/projects/travertine/versions'
velocity_endpoint='https://api.papermc.io/v2/projects/velocity/versions'
waterfall_endpoint='https://api.papermc.io/v2/projects/wat/versions'


folia_1_19_4="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39"
folia_1_20_1="1,2,3,4,5,6,7"

paper_1_8_8=""
paper_1_9_4=""
paper_1_10_2=""
paper_1_11_2=""
paper_1_12=""
paper_1_12_1=""
paper_1_12_2=""
paper_1_13=""
paper_1_13_1=""
paper_1_13_2=""
paper_1_14=""
paper_1_14_1=""
paper_1_14_2=""
paper_1_14_3=""
paper_1_14_4=""
paper_1_15=""
paper_1_15_1=""
paper_1_15_2=""
paper_1_16_1=""
paper_1_16_2=""
paper_1_16_3=""
paper_1_16_4=""
paper_1_16_5=""
paper_1_17=""
paper_1_17_1=""
paper_1_18=""
paper_1_18_1=""
paper_1_18_2=""
paper_1_19=""
paper_1_19_1=""
paper_1_19_2=""
paper_1_19_3=""
paper_1_19_4="449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550"
paper_1_20="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17"
paper_1_20_1="18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62"

travertine_1_12=""
travertine_1_13=""
travertine_1_14=""
travertine_1_15=""
travertine_1_16=""

velocity_1_0_10=""
velocity_1_1_9=""
velocity_3_1_0=""
velocity_3_1_1=""

waterfall_1_11=""
waterfall_1_12=""
waterfall_1_13=""
waterfall_1_14=""
waterfall_1_15=""
waterfall_1_16=""
waterfall_1_17=""
waterfall_1_18=""
waterfall_1_19=""
waterfall_1_20=""


#Explination
read -t 10 -p "##########################################################
This script is designed to download the Folia, Paper, 
Travertine, Velocity and Waterfall jar files from 
https://papermc.io.  This script will take time, 
so run it and sit back. 

The script will start automatically in 10 seconds.
##########################################################"
clear

# Create directories
echo "##########################################################
Creating Folders"
mkdir folia paper travertine velocity waterfall
read -t 5 -p "Moving to download processes in 5 seconds.
##########################################################"
clear

#Create Folia File Structure
cd folia
mkdir 1.19.4 1.20.1

# Download Folia 1.19.4 files
read -t 5 -p "##########################################################
Creating Folia Version Folders
Downloading Folia 1.19.4 Versions
Starting downloads in 5 seconds.
##########################################################"
cd 1.19.4
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$folia_endpoint/1.19.4/builds/$number/downloads/folia-1.19.4-$number.jar" --output "folia-1.19.4-$number.jar"
	echo "##########################################################"
	curl -H 'accept: application/json' -X 'GET' "$folia_endpoint/1.19.4/builds/$number/downloads/folia-mojmap-1.19.4-$number.jar" --output "folia-mojmap-1.19.4-$number.jar"
	echo "##########################################################"
done
clear

# Download Folia 1.20.1 files
read -t 5 -p "##########################################################
Creating Folia Version Folders
Downloading Folia 1.20.1 Versions
Starting downloads in 5 seconds.
##########################################################"
cd ..
cd 1.20.1
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$folia_endpoint/1.20.1/builds/$number/downloads/folia-1.20.1-$number.jar" --output "folia-1.20.1-$number.jar"
	echo "##########################################################"
	curl -H 'accept: application/json' -X 'GET' "$folia_endpoint/1.20.1/builds/$number/downloads/folia-mojmap-1.20.1-$number.jar" --output "folia-mojmap-1.20.1-$number.jar"
	echo "##########################################################"
done
clear

# Folia Completed
read -t 10 -p "##########################################################
Folia downloads have completed.

Moving on to Paper.

The script will continue automatically in 10 seconds.
##########################################################"
clear

# Create Paper File Structure
cd ..
cd ..
cd paper
mkdir 1.8.8 1.9.4 1.10.2 1.11.2 1.12 1.12.1 1.12.2 1.13 1.13.1 1.13.2 1.14 1.14.1 1.14.2 1.14.3 1.14.4 1.15 1.15.1 1.15.2 1.16.1 1.16.2 1.16.3 1.16.4 1.16.5 1.17 1.17.1 1.18 1.18.1 1.18.2 1.19 1.19.1 1.19.2 1.19.3 1.19.4 1.20 1.20.1


# Download Paper 1.8.8 files
read -t 5 -p "##########################################################
Creating Paper Version Folders
Downloading Paper 1.8.8 Versions
Starting downloads in 5 seconds.
##########################################################"
cd 1.8.8
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$paper_endpoint/1.8.8/builds/$number/downloads/paper-1.8.8-$number.jar" --output "paper-1.8.8-$number.jar"
	echo "##########################################################"
done
clear

# Download Paper 1.9.4 files
read -t 5 -p "##########################################################
Creating Paper Version Folders
Downloading Paper 1.9.4 Versions
Starting downloads in 5 seconds.
##########################################################"
cd ..
cd 1.9.4
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$paper_endpoint/1.9.4/builds/$number/downloads/paper-1.9.4-$number.jar" --output "paper-1.9.4-$number.jar"
	echo "##########################################################"
done
clear

# Download Paper 1.10.2 files
read -t 5 -p "##########################################################
Creating Paper Version Folders
Downloading Paper 1.10.2 Versions
Starting downloads in 5 seconds.
##########################################################"
cd ..
cd 1.10.2
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$paper_endpoint/1.10.2/builds/$number/downloads/paper-1.10.2-$number.jar" --output "paper-1.10.2-$number.jar"
	echo "##########################################################"
done
clear

# Download Paper 1.11.2 files
read -t 5 -p "##########################################################
Creating Paper Version Folders
Downloading Paper 1.11.2 Versions
Starting downloads in 5 seconds.
##########################################################"
cd ..
cd 1.11.2
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$paper_endpoint/1.11.2/builds/$number/downloads/paper-1.11.2-$number.jar" --output "paper-1.11.2-$number.jar"
	echo "##########################################################"
done
clear

# Download Paper 1.12 files
read -t 5 -p "##########################################################
Creating Paper Version Folders
Downloading Paper 1.12 Versions
Starting downloads in 5 seconds.
##########################################################"
cd ..
cd 1.12
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$paper_endpoint/1.12/builds/$number/downloads/paper-1.12-$number.jar" --output "paper-1.12-$number.jar"
	echo "##########################################################"
done
clear

# Download Paper 1.12.1 files
read -t 5 -p "##########################################################
Creating Paper Version Folders
Downloading Paper 1.12.1 Versions
Starting downloads in 5 seconds.
##########################################################"
cd ..
cd 1.12.1
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$paper_endpoint/1.12.1/builds/$number/downloads/paper-1.12.1-$number.jar" --output "paper-1.12.1-$number.jar"
	echo "##########################################################"
done
clear

# Download Paper 1.12.2 files
read -t 5 -p "##########################################################
Creating Paper Version Folders
Downloading Paper 1.12.2 Versions
Starting downloads in 5 seconds.
##########################################################"
cd ..
cd 1.12.2
for number in 
do
	curl -H 'accept: application/json' -X 'GET' "$paper_endpoint/1.12.2/builds/$number/downloads/paper-1.12.2-$number.jar" --output "paper-1.12.2-$number.jar"
	echo "##########################################################"
done
clear




