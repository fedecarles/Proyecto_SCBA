import string
import glob

files = glob.glob('./*.txt')

with open("urls_raw/urls_raw.txt", "w") as f:
    for file in files:
        data_list = open( file,"r").readline()
        data_list2 = data_list.replace("u'","").replace("[",",").replace("]",",").replace("'","").replace("\"","").replace("\n","").replace("\r","").replace(" ","")
        data_list3 = data_list2.split(",")
        data_list5 = list(set(data_list3))
        f.write(str([data_list3]))
        f.writelines(str([data_list3]))
