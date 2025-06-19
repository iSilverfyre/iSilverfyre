#!/bin/bash
# Created by Analicia Abernathy - 2023
# Version 1.0
# Renames JPEG and PNG files with a randomized UUID

for file in *.jpg; do mv "$file" "$(uuidgen).jpg"; done 

for file in *.png; do mv "$file" "$(uuidgen).png"; done
