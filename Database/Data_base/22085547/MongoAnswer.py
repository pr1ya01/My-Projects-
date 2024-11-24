#-----------------------------(a)----------------
import cx_Oracle
import pymongo

constr = 'hr/hr@localhost:1521/xe'
client = pymongo.MongoClient("mongodb://localhost:27017")
conn = cx_Oracle.connect(constr)

db = client['TASK3_1']

collection = db['STORE']

cur = conn.cursor()

schema = []
list_of_json = []

cur.execute("select * from STORE")

# print(cur.description)

for i in cur.description:
    schema.append(i[0])

cur.execute("select * from STORE where MANAGEDATE > '31-DEC-2016'")

for i in cur:
    list_of_json.append(dict(zip(schema,i)))

collection.insert_many(list_of_json)


#-------------------------------(b)-------------------------
import cx_Oracle
import pymongo

connStr = cx_Oracle.connect("hr/hr@localhost:1521/xe")
cur = connStr.cursor()

client = pymongo.MongoClient("mongodb://localhost:27017")
db = client['MongoAnswer']
collection = db['Task_2']

schema = []
list_of_json = []

cur.execute("select * from STORE")

# print(cur.description)
for i in cur.description:
    schema.append(i[0])

cur.execute("select * from STORE where postcode like 'B%'")

for i in cur:
    list_of_json.append(dict(zip(schema,i)))


collection.insert_many(list_of_json)
for store in collection.find():
  print(store)