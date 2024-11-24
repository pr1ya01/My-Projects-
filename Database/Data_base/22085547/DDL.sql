CREATE TABLE MANAGER(
ManagerID NUMBER(5) PRIMARY KEY,
FName VARCHAR(20) NOT NULL,
LName VARCHAR(20) NOT NULL
);

CREATE TABLE STORE(
StoreID NUMBER(5) PRIMARY KEY,
City_name VARCHAR (20) NOT NULL,
Street_add VARCHAR (20) NOT NULL,
Postcode NUMBER(8) NOT NULL,
ManagerID NUMBER(10) NOT NULL REFERENCES MANAGER(ManagerID),
StartDate DATE NOT NULL
);

CREATE TABLE CUSTOMER(
CustomerID NUMBER(5) PRIMARY KEY,
FName VARCHAR(20) NOT NULL,
LNAME VARCHAR(20) NOT NULL
);

CREATE TABLE ORDERS(
Order_no NUMBER(5) PRIMARY KEY,
Order_date_time TIMESTAMP NOT NULL,
Complition_date_time TIMESTAMP NULL,
StoreID NUMBER (10) NOT NULL REFERENCES STORE(StoreID),
BreadID NUMBER (10) NOT NULL REFERENCES BREAD(BreadID),
SandwichID NUMBER (10) NOT NULL REFERENCES SANDWICH_MENU(SandwichID),
CustomerID  NUMBER (10) NOT NULL REFERENCES CUSTOMER(CustomerID),
Cost NUMBER (8,2) NOT NULL 
);

CREATE TABLE BREAD(
BreadID NUMBER(5) PRIMARY KEY,
Name VARCHAR (10)UNIQUE,
Calories_per_g NUMBER (4,2) NOT NULL,
Cost NUMBER (8,2) NOT NULL
);

CREATE TABLE SANDWICH_MENU(
SandwichID NUMBER (5) PRIMARY KEY,
Name VARCHAR (20) UNIQUE
);


CREATE TABLE FILLING (
FillingID NUMBER(5) PRIMARY KEY,
Name VARCHAR2(50) NOT NULL,
Calorie_per_g NUMBER (4,2) NOT NULL,
CategoryID NUMBER (10) NOT NULL REFERENCES CATEGORY(CategoryID),
Cost NUMBER (8,2) NOT NULL
);
DROP TABLE FILLING;

CREATE TABLE CATEGORY(
CategoryID NUMBER (5) PRIMARY KEY,
Name VARCHAR (10)
);

CREATE TABLE SANDWICH_FILLING (
    SandwichID NUMBER(5) NOT NULL REFERENCES SANDWICH_MENU(SandwichID),
    FillingID NUMBER(5) NOT NULL REFERENCES FILLING(FillingID),
    Quantity NUMBER (10) NOT NULL
);

INSERT INTO MANAGER (ManagerID ,FName, LName) VALUES (1141,'Priya','Lama');
INSERT INTO MANAGER (ManagerID ,FName, LName) VALUES (1652,'Sahara','Sharma');
INSERT INTO MANAGER (ManagerID ,FName, LName) VALUES (1843,'John','White');



INSERT INTO STORE (StoreID, City_name, Street_add,Postcode,ManagerID, StartDate) VALUES (2933,'Chyasal',' Ward No. 9',4470,1141,(to_Date('2022-04-02','yyyy-mm-dd')));
INSERT INTO STORE (StoreID, City_name, Street_add,Postcode,ManagerID, StartDate) VALUES (2459,'Chalkhu','Ward No. 12',6437,1652,(to_Date('2021-10-10','yyyy-mm-dd')));
INSERT INTO STORE (StoreID, City_name, Street_add,Postcode,ManagerID, StartDate) VALUES (2664,'Putalisadak','GPO: 3978',8551,1843,(to_Date('2022-01-15','yyyy-mm-dd')));
INSERT INTO STORE (StoreID, City_name, Street_add,Postcode,ManagerID, StartDate) VALUES (2771,'Ktm','Teenkune, P.O. Box',5703,1141,(to_Date('2021-12-28','yyyy-mm-dd')));



INSERT INTO CUSTOMER(CustomerID , FName ,LNAME) VALUES (3490, 'Ratna' ,'Singh');
INSERT INTO CUSTOMER(CustomerID , FName ,LNAME) VALUES (3212, 'Nisha' ,'Joshi');
INSERT INTO CUSTOMER(CustomerID , FName ,LNAME) VALUES (3894, 'Sanjay', 'Sharama');


INSERT INTO ORDERS(Order_no,Order_date_time,Complition_date_time,StoreID,BreadID,SandwichID,CustomerID,Cost) VALUES (4559,(TO_DATE('2022-01-12  10:55:10','yyyy-mm-dd hh24:mi:ss')),(TO_DATE('2022-01-12  11:00:00','yyyy-mm-dd HH24:mi:SS')),2933,5660,6084,3490,35.88);
INSERT INTO ORDERS(Order_no,Order_date_time,Complition_date_time,StoreID,BreadID,SandwichID,CustomerID,Cost) VALUES (4725,(to_date('2023/1/4  11:33:45','yyyy/mm/dd hh24:mi:ss')),(to_date('2023/1/3  11:40:33 ','yyyy/mm/dd hh24:mi:ss')),2459,5790,6046,3212,45.99);
INSERT INTO ORDERS(Order_no,Order_date_time,Complition_date_time,StoreID,BreadID,SandwichID,CustomerID,Cost) VALUES (4970,(to_date('2023/1/5  11:36:17','yyyy/mm/dd hh24:mi:ss')),(to_date('2023/1/3  11:42:21','yyyy/mm/dd hh24:mi:ss')),2459,5002,6084,3212,39.55);
INSERT INTO ORDERS(Order_no,Order_date_time,Complition_date_time,StoreID,BreadID,SandwichID,CustomerID,Cost) VALUES (4174,(to_date('2023/1/6  12:31:3','yyyy/mm/dd hh24:mi:ss')),(to_date('2023/1/3  12:36:33','yyyy/mm/dd hh24:mi:ss')),2664,5037,6578,3894,22.90);


INSERT INTO BREAD (BreadID,Name,Calories_per_g,Cost) VALUES (5660,'White',69,44);
INSERT INTO BREAD (BreadID,Name,Calories_per_g,Cost) VALUES (5790,'Brown',53,55);
INSERT INTO BREAD (BreadID,Name,Calories_per_g,Cost) VALUES (5037,'Garlic',73,69);
INSERT INTO BREAD (BreadID,Name,Calories_per_g,Cost) VALUES (5002,'Cheese',79,82);


INSERT INTO SANDWICH_MENU (SandwichID ,Name) VALUES (6084,'Bologna');
INSERT INTO SANDWICH_MENU (SandwichID ,Name) VALUES (6046,'British Rail');
INSERT INTO SANDWICH_MENU (SandwichID ,Name) VALUES (6578,'Cheese dream');
INSERT INTO SANDWICH_MENU (SandwichID ,Name) VALUES (6579,'BUTTER dream');


INSERT INTO FILLING (FillingID ,Name, Calorie_per_g ,CategoryID,Cost) VALUES (7892,'Tomato',8,8002,375);
INSERT INTO FILLING (FillingID ,Name, Calorie_per_g ,CategoryID,Cost) VALUES (7122,'Olive',9,8820,56);
INSERT INTO FILLING (FillingID ,Name, Calorie_per_g ,CategoryID,Cost) VALUES (7810,'Tuna',91,8377,93);
INSERT INTO FILLING (FillingID ,Name, Calorie_per_g ,CategoryID,Cost) VALUES (7668,'Egg',78,8001,86);
INSERT INTO FILLING (FillingID ,Name, Calorie_per_g ,CategoryID,Cost) VALUES (7889,'Chicken',98,8001,18);
INSERT INTO FILLING (FillingID ,Name, Calorie_per_g ,CategoryID,Cost) VALUES (7483,'Hem',81,8001,18);


INSERT INTO CATEGORY (CategoryID, Name) VALUES (8001,'Poultry'); 
INSERT INTO CATEGORY (CategoryID, Name) VALUES (8377,'Marine');
INSERT INTO CATEGORY (CategoryID, Name) VALUES (8002,'Vegetable');
INSERT INTO CATEGORY (CategoryID, Name) VALUES (8820,'Pickle');


INSERT INTO Sandwich_filling(SandwichID, FillingID, Quantity) VALUES (6084,7892,4);
INSERT INTO Sandwich_filling(SandwichID, FillingID, Quantity) VALUES (6046,7889,2);
INSERT INTO Sandwich_filling(SandwichID, FillingID, Quantity) VALUES (6579,7122,3);
INSERT INTO Sandwich_filling(SandwichID, FillingID, Quantity) VALUES (6579,7482,5);