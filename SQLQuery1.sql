--6) sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. 
--The resultant table should include the Sales Agent's full name.

select 
	EmployeeName = e.FirstName + ' ' + e.LastName,
	i.*
from Employee as e
inner join Customer as c ON c.SupportRepId = e.EmployeeId
inner join Invoice as i ON i.CustomerId = c.CustomerId
order by CustomerId

--5) unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing 
--countries from the Invoice table.

/*select distinct BillingCountry
from Invoice */

--4) sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

/*select 
	Title,
	FirstName,
	LastName
from Employee
where Title like '%Sales%'*/

--3) brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. 
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
/*Select 
	i.CustomerId, 
	FullName = c.FirstName + '' + c.LastName,
	InvoiceId,
	InvoiceDate = convert(varchar, InvoiceDate, 107),
	BillingCountry
from Invoice as i
inner join Customer as c ON i.CustomerId = c.CustomerId
where BillingCountry = 'Brazil'*/ 


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