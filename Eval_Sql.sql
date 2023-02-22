#01

SELECT * FROM customers WHERE country = 'France';

#02

SELECT products.ProductName, products.UnitPrice FROM suppliers
JOIN products
ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids';

#03

SELECT suppliers.CompanyName, COUNT(products.ProductName) AS Nombre_Produit FROM suppliers
JOIN products
ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.Country = 'France'
GROUP BY suppliers.CompanyName ORDER BY Nombre_Produit DESC;

#04

SELECT customers.CompanyName, COUNT(orders.CustomerID) AS Nombre_Commande FROM orders
JOIN customers
ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = 'France' 
GROUP BY customers.CompanyName HAVING Nombre_Commande > 10;

#05
RENAME TABLE 'order details' TO order_details; 
SELECT customers.CompanyName, SUM(order_details.UnitPrice * order_details.Quantity) AS CA, customers.Country FROM orders
JOIN customers 
ON customers.CustomerID = orders.CustomerID
JOIN order_details 
ON order_details.OrderID = orders.OrderID
GROUP BY customers.CompanyName HAVING CA > 30000 ORDER BY CA DESC;

#06

SELECT orders.ShipCountry FROM orders
JOIN order_details 
ON order_details.OrderID = orders.OrderID
JOIN products 
ON products.ProductID = order_details.ProductID
JOIN suppliers 
ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP BY orders.ShipCountry;

#07

SELECT SUM(order_details.UnitPrice * order_details.Quantity) AS Vente_97 FROM orders
JOIN order_details 
ON order_details.OrderID = orders.OrderID
WHERE YEAR(orders.OrderDate) = '1997';

#08

SELECT MONTH(orders.OrderDate) AS Mois_97, SUM(order_details.UnitPrice * order_details.Quantity) AS Vente FROM orders
JOIN order_details 
ON order_details.OrderID = orders.OrderID
WHERE YEAR(orders.OrderDate) = '1997'
GROUP BY Mois_97;

#09

SELECT MAX(orders.OrderDate) AS Derniere_Commande FROM orders
JOIN customers
ON customers.CustomerID = orders.CustomerID
WHERE customers.CompanyName = 'Du monde entier';

#10

SELECT AVG(DATEDIFF(orders.ShippedDate, orders.OrderDate)) AS Temps_Moyen_de_Commande
FROM orders;