-- Multi-Table Query Practice
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
 SELECT Product.ProductName,
        Category.CategoryName
   FROM "Product" AS P
        JOIN "Category" AS C
        ON P.CategoryID = C.ID;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
 SELECT O.ID, S.CompanyName
   FROM "Order" AS O
        JOIN "Shipper" AS S 
        ON O.ShipVia = S.ID;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
 SELECT P.ProductName, O.Quantity
   FROM "OrderDetail" AS O
        JOIN "Product" AS P
        ON O.ProductID = P.ID
  WHERE O.OrderID = 10251
  ORDER BY P.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
 SELECT O.ID AS Order_ID, 
        C.CompanyName AS Customer_Company_Name,
        E.LastName AS Employee_Last_Name
   FROM "Order" AS O
        JOIN "Customer" AS C
        ON O.CustomerID = C.ID
        JOIN "Employee" AS E
        ON O.EmployeeID = E.ID;
