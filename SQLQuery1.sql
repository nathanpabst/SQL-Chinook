--3) brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. 
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
Select 
	i.CustomerId, 
	FullName = c.FirstName + '' + c.LastName,
	InvoiceId,
	InvoiceDate = convert(varchar, InvoiceDate, 107),
	BillingCountry
from Invoice as i
inner join Customer as c ON i.CustomerId = c.CustomerId
where BillingCountry = 'Brazil' 


--2) brazil_customers.sql: Provide a query only showing the Customers from Brazil.
/*select *
from Customer
where Country = 'Brazil'*/

--1) non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
/*select
	FullName = FirstName + ' ' + LastName,
	CustomerId,
	Country
from Customer
where Country != 'USA'*/