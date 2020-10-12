# Barcode Creator
import os


# used to open the file (str)
def open_file(filename: str):

    filedata = ""

    # does this file exist?
    if os.path.isfile(filename):

        # open the file
        with open(filename, 'r') as f:
            # read that file data into a variable.
            filedata = f.read()

    # return the file data
    return filedata

# for each row / entry in that file, we will grab some data

# use that data to download a picture from the internet, via an API

# generate an HTML file

# open the users browser and display that HTML file


# Open us a csv file

student_data = open_file("student_data.csv")
print(student_data)

