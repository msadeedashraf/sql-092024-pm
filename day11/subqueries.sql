select * from Sales.Customers as c 

select c.custid from Sales.Customers as c where c.city = 'London'

SELECT * FROM Sales.OrderDetails as od
where od.orderid in 
				(
				select o.orderid from Sales.orders as o where o.custid in 
					(
						select c.custid from Sales.Customers as c 
						where		c.country = 'UK' 
								--and c.city = 'London'
					)
				)




SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid = 11077

select * from Sales.orders as owhere o.custid = 75

---for customer 85
SELECT * FROM Sales.OrderDetails as od
where od.orderid in (select o.orderid from Sales.orders as o where o.custid = 75)

select * from 

---for customer 75
SELECT * FROM Sales.OrderDetails as od
where od.orderid in (10271,10329,10349,10369,10385,10432,10756,10821,10974)


SELECT * FROM Sales.OrderDetails as od
where od.orderid in (select o.orderid from Sales.orders as o where o.custid = 65)--71rows

select od.* from  sales.Orders as o inner join sales.OrderDetails as od 
on o.orderid = od.orderid
where o.custid = 65
