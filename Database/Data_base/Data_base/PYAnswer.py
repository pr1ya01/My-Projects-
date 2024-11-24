#----------------------------(a)------------------------------
import cx_Oracle

# Connecting to the Oracle database and handling potential connection errors
try:
    constr = 'hr/hr@localhost:1521/xe'
    conn = cx_Oracle.connect(constr)
except cx_Oracle.DatabaseError as Exception:
    print("\nCouldn't connect to the data base , Check for possible errors\n")
    print("Exception\n") 

# Creating a cursor object 
cur = conn.cursor()
print(conn.version)

# Creating an empty list to store the category IDs from the CATEGORY table
CategoryID = []
all_ids = []

# Executing query to select all records from the CATEGORY table
cur.execute("select * from CATEGORY")

# Stores the results of the query in the all_ids variable
all_ids = cur.fetchall()

# Iterating over the results and appends the category ID to the CategoryID list
for i in all_ids:
    CategoryID.append(i[0])

# Max function to find the maximum category ID in the list
m = max(CategoryID)

# For incrementing the maximum category ID
m += 1

# Creating an empty list to store the results of the query
a = []

# Prompt the user to enter a category name
category = input("Enter category name: ")

# Execute a query to select the Category id and name 
cur.execute("select CATEGORYID,NAME from CATEGORY WHERE NAME = :category",{'category':category})

#stores the results of the query in a variable
a = cur.fetchall()

#Checking if the query returned any results
if not a:
    print("\nNo value found in category table\n")

    add_newValue = input("Enter 'Yes' to add new category, 'No' to exit: ")

    # Loop continues until the user chooses to exit
    while(True):
        b = []
        if (add_newValue == 'Yes' or add_newValue == 'yes'):
            new_c_name = input("\nEnter the new category Name: ")
    
            # Executing query to check if the new category name already exists in the CATEGORY table
            cur.execute("select NAME from CATEGORY where NAME =: new_c_name",{'new_c_name':new_c_name})
            b = cur.fetchall()

            # If the category name already exists, prints an error message and prompt the user to enter a new name
            if b:
                print("\n***Category Name already exist, Please enter new name***\n")
                continue

            # If the category name does not already exist,then insert the new category into the CATEGORY table
            if not b:
                cur.execute("insert into CATEGORY(CATEGORYID,NAME) VALUES(:m_categoryID,:new_c_name)",{'m_categoryID':m,'new_c_name':new_c_name})
                print("\n..Sucessfully Inserted")
                more = input("\nEnter 'Yes' to add another category name, 'No' to exit : ")
                if (more == 'Yes' or more == 'yes'):
                    continue
            #If the user chooses to exit, break out of the while loop
            else:
                    break
        else:
            print("\n***Thank you for joining with us***\n")
            break
# If the user chooses not to add a new category, it will print thank you message and break out of the while loop
else:
    print(a)
#If a category with the entered name was found,it will print the results and a message indicating that a value was found
    print("\n***Value found***\n")

#Commit the changes made to the database and close the cursor and connection
conn.commit()
cur.close()
conn.close()
#----------------------------------(b)------------------------------
import cx_Oracle

#connect to the Oracle database
constr = 'hr/hr@localhost:1521/xe'
conn = cx_Oracle.connect(constr)

# Creating a cursor object
cur = conn.cursor()
print(conn.version)

# Creating an empty list to store the filling IDs from the FILLING table
fillingid = []

fill = []

# Executing query to select all records from the FILLING table
cur.execute("select * from FILLING")

# Stores the results of the query in the fill variable
fill = cur.fetchall()

# Iterating over the results and append the filling ID to the fillingid list
for i in fill:
    fillingid.append(i[0])

# Max function to find the maximum filling ID in the list

m = max(fillingid)

# Continuously prompting the user to enter new filling information
while (True):

    # Creating empty lists to store fill price, fill calories and category id
    fill_price= []
    fill_cal= []
    categoryid = []
    fillname = []
    # For incrementing the maximum filling ID
    m += 1

    # Prompt the user to enter the new filling name
    new_filling=input("Enter the new Filling Name: ")
    cur.execute("Select NAME from filling where NAME =: new_filling",{'new_filling':new_filling})
    fillname = cur.fetchall()

    #Error handling to catch errors, when user enters invalid data for the filling name, catefory id, price and calories
    if not new_filling.strip():
        print("\n***Filling name can't be empty!***\n")
        continue
    if fillname:
        print("\n***Filling Name already exists***\n")
        continue
    if not fillname:
        try:
            categoryID =int(input ("Enter the Category ID: "))
            cur.execute("Select CATEGORYID from CATEGORY where CATEGORYID =: categoryid",{'categoryid':categoryID})
            categoryid = cur.fetchall()    
        except ValueError:
            print("\n***Please enter valid Category ID***\n")
            categoryid = cur.fetchall()
            continue
    if categoryid:
        try:
            fill_price=float(input("Enter the Price_per_gram: "))
        except ValueError:
            print("***Price should be a numeric***")
    if fill_price:
        try:
            fill_cal=float(input("Enter the Calories_per_gram: "))
        except ValueError:
            print("***Calories should be numerical***")
            continue

    # Inserting the new filling information into the FILLING table
    cur.execute("insert into FILLING(FILLINGID,NAME,GRAMPRICE,GRAMCALORIES,CATEGORYID) VALUES(:max_fillingid,:new_filling,:fill_price,:fill_cal,:categoryid)",{'max_fillingid':m,'new_filling':new_filling,'fill_price':fill_price,'fill_cal':fill_cal,'categoryid':categoryID})
   
    # Asking the user if they want to add another filling if yes the code will continue adn if no the code will exit 
    more = input("\nEnter 'Yes' to add another filling name, 'No' to exit : \n")
    if (more == 'yes' or more == 'Yes'):
        continue
    else:
        break
#commit the cahnges to the database and close the cursor and connection
conn.commit()
print("***New filling data added Successfully***")
cur.close()
conn.close()

#------------------------------(c)-------------------------------
import cx_Oracle 

# Connecting to the Oracle database and handling potential connection errors
try:
    constr = 'hr/hr@localhost:1521/xe'
    conn = cx_Oracle.connect(constr)
except cx_Oracle.DatabaseError as Exception:
    print("\nCouldn't connect to the data base , Check for possible errors\n")
    print("Exception\n") 

# Creating a cursor object 
cur = conn.cursor()
print(conn.version)


# Prompt the user for an Order ID
orderid = input("Enter an Order ID: ")

# Call the check_cashback_and_delivery function and store the result in a variable
result = cur.callfunc("check_cashback_and_delivery", str, [orderid])

# Print the result
print(result)

# Close the cursor and connection
cur.close()
conn.close()