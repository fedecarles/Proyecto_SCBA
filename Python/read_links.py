import csv

url_list = csv.reader(open("urls_fallos_list.csv","rb"))

for row in url_list:
    row[1]



#for line in enumerate(url_list):
#            if i == 2:
#                print line