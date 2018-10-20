--12) line_item_track.sql: Provide a query that includes 
--the purchased track name with each invoice line item.
select 
	i.InvoiceLineId,
	--i.TrackId,
	TrackName = t.Name
from InvoiceLine as i 
join Track as t on t.TrackId = i.TrackId
order by i.InvoiceLineId

--11) line_items_per_invoice.sql: Looking at the InvoiceLine table, 
--provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY

select 
	InvoiceId,
	count(InvoiceId) AS NumberOfLines
 from InvoiceLine group by InvoiceId 

--10) invoice_37_line_item_count.sql: Looking at the InvoiceLine table, 
--provide a query that COUNTs the number of line items for Invoice ID 37.

select count(Quantity)
from InvoiceLine
where InvoiceId = 37

--9) total_sales_{year}.sql: What are the respective total sales for each of those years?

select SUM(Total) as InvoiceTotal2009
from Invoice
where Year(InvoiceDate) = 2009 

select SUM(Total) as InvoiceTotal2011
from Invoice
where Year(InvoiceDate) = 2011

--8) total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

select count(*)
	InvoiceDate
from Invoice
where YEAR(InvoiceDate) = 2009 or YEAR(InvoiceDate) = 2011

--7) invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, 
--Country and Sale Agent name for all invoices and customers.

select 	
	CustomerName = c.FirstName + ' ' + c.LastName,
	c.Country,
	InvoiceTotal = i.Total, 
	SalesAgent = e.FirstName + ' ' + e.LastName
from Invoice as i 
join Customer as c on c.CustomerId = i.CustomerId 
join Employee as e on e.EmployeeId = c.SupportRepId
order by i.Total DESC

--6) sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. 
--The resultant table should include the Sales Agent's full name.

--select 
	--EmployeeName = e.FirstName + ' ' + e.LastName,
	--i.*
--from Employee as e
--inner join Customer as c ON c.SupportRepId = e.EmployeeId
--inner join Invoice as i ON i.CustomerId = c.CustomerId
--order by CustomerId

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