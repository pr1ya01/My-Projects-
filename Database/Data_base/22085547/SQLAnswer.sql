--*****************************(a)************************
--Taking three columns from the STORE table: storeid, street address, and postcode and then orders the results by postcode in ascending order.
SELECT storeid, streetaddress, Postcode FROM STORE ORDER BY Postcode asc;

--*****************************(b)************************
--Selecting the FillingID, Name of the Filling as Filling_Name, and Name of the Category as Category_Name and then using the CategoryID column to join the Filling table with the Category table. Then results are shown in ascending order according to the filling's name.
SELECT Filling.FillingID, Filling.Name AS Filling_Name, Category.Name AS Category_Name FROM Filling JOIN Category USING (CategoryID) ORDER BY Filling.Name ASC;

--****************************(c)*************************
--Selecting orderid from Ordertab
SELECT Ordertab.Orderid,
--concatenating fname and lname from Manager table as Full name, then name of the sandwich as Sandwich_name and bread name as Bread_name.
Manager.FName || ' ' || Manager.LName AS Full_Name, Sandwich.name AS Sandwich_name, Bread.name AS Bread_name FROM Ordertab
-- These tables are joined using their respective ID columns
JOIN Store USING(StoreID)
JOIN Manager USING(ManagerID)
JOIN Sandwich USING(sandwichid)
JOIN Bread USING(BreadID)
--this will returns result where the Completiondate of the order is not null.
WHERE Ordertab.Completiondate IS NOT NULL 
--Orders the results bu Orderdate in descending order and Sandwich name is ascending order.
ORDER BY Ordertab.Orderdate DESC, Sandwich.name ASC;

