log_file = open("um-server-01.txt")  # opening the file (um-server-01.txt)


def sales_reports(log_file):  # defining function
    for line in log_file:  # finding each line in the file
        line = line.rstrip()  # splitting each line into arrays
        day = line[0:3]  # finding all days values
        if day == "Tue":  # setting a condition
            print(line)  # print those lines


# sales_reports(log_file)  # running that function on the file


def big_melon_orders(log_file):
    for line in log_file:
        line = line.rstrip('\n').split(',')
        if "Melon" > 10:
            print(line)


big_melon_orders(log_file)
