/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
Select P.Name AS ProductName, C.Name AS CategoryName
From products AS P
Inner Join categories AS C
On C. CategoryID = P. CategoryID
Where C.Name = "Computers";

Select products.Name, categories.Name
From products 
Inner Join categories on categories.CategoryID = products.CategoryID
Where categories.Name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 Select products.Name as "Product Name", products.Price as "products Price", reviews.Rating
 From products
 inner join reviews on reviews.ProductID = products.ProductID
 Where reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select e.FirstName, e.LastName, Sum(s.Quantity) AS Total
From sales AS s
INNER join employees as e ON e.EmployeeID = s.EmployeeID
Group by e.EmployeeID
order by Total desc
limit 10;

Select * from sales
Where EmployeeID = 33809;

--------------------------------------------------------------------
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name AS "Department Name", c.Name AS "Category Name" FROM departments AS D
Inner Join categories AS c On c.DepartmentID = d.DepartmentID
Where c.Name = "Appliances" or c.Name = "Game";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 select p.Name, Sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
 From products as P
 Inner Join sales as s on s.ProductID = p.ProductID
 Where p.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select p.Name, r.Reviewer, r.Rating, r.Comment 
From products as P
Inner Join reviews as r on r.ProductID = p.ProductID
Where p.ProductID = 857 AND r.Rating = 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
Select e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) AS TotalSold
From Sales as s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
Inner Join products as p on p.ProductID = s.ProductID
Group By e.EmployeeID, p.ProductID
Order by e.FirstName; 
/*Select product.Name, categories.Name From products  Inner Join categories on categories.CategoryID = products.CategoryID Where categories.Name = "Computers" LIMIT 0, 1000
