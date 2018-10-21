--24) top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

select top 1
	[Song Name] = t.Name,
	Purchases = sum(l.Quantity)
from InvoiceLine as l
	join Track as t on t.TrackId = l.TrackId
	join Invoice as i on i.InvoiceId = l.InvoiceId
	where year(InvoiceDate) = 2013
group by t.Name
order by Purchases desc 

--23) top_country.sql: Which country's customers spent the most?

select top 1
	Country = BillingCountry,
	[Total Spend] = sum(Total)
from Invoice
group by BillingCountry
order by [Total Spend] desc

--22) sales_per_country.sql: Provide a query that shows the total sales per country.

select 
	Country = BillingCountry,
	[Total Sales] = sum(Total)
from Invoice
group by BillingCountry
order by [Total Sales] desc

--21) sales_agent_customer_count.sql: Provide a query that shows the count of customers 
--assigned to each sales agent.

select
	[Sales Rep] = e.FirstName + ' ' + e.LastName,
	[Customer Count] = count(c.CustomerId)
from Employee as e
	join Customer as c on c.SupportRepId = e.EmployeeId
group by e.FirstName, e.LastName
order by [Customer Count] desc

--20) top_agent.sql: Which sales agent made the most in sales over all? 

select top 1 
	[Sales Rep] = e.FirstName + ' ' + e.LastName,
	sum(i.Total) as [Total Sales]
from Invoice as i
	join Customer as c on c.CustomerId = i.CustomerId
	join Employee as e on e.EmployeeId = c.SupportRepId
group by e.FirstName, e.LastName
order by [Total Sales] desc

--19) top_2009_agent.sql: Which sales agent made the most in sales in 2009?
--Hint: Use the MAX function on a subquery.

select top 1 
	SalesRep,
	Max(Results2009.Sales) Total 
from (
	select
		SalesRep = e.FirstName + ' ' + e.LastName,
		sum(i.Total) as Sales
	from Invoice as i
	join Customer as c on c.CustomerId = i.CustomerId
	join Employee as e on e.EmployeeId = c.SupportRepId
	where Year(i.InvoiceDate) = 2009
	group by e.FirstName, e.LastName
	) Results2009
group by SalesRep
order by Total desc

--18) sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

select 
	SalesRep = e.FirstName + ' ' + e.LastName,
	TotalSales = sum(i.Total)
from Invoice as i 
join Customer as c on c.CustomerId = i.CustomerId 
join Employee as e on e.EmployeeId = c.SupportRepId
group by e.FirstName, e.LastName

--17) invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

select
	i.InvoiceId,
	LineItems = count(l.InvoiceLineId)
from Invoice as i 
join InvoiceLine as l on l.InvoiceId = i.InvoiceId
group by i.InvoiceId

--16) tracks_no_id.sql: Provide a query that shows all the Tracks, but displays 
--no IDs. The result should include the Album name, Media type and Genre.

select 
	MediaType = m.Name,
	Genre = g.Name, 
	SongName = t.Name	 
from Track as t 
join Genre as g on g.GenreId = t.TrackId 
join MediaType as m on m.MediaTypeId = t.MediaTypeId

--15) playlists_track_count.sql: Provide a query that shows the 
--total number of tracks in each playlist. The Playlist name 
--should be include on the resulant table.

select 
	ListName = Playlist.Name,
	COUNT(TrackId) as NumOfTracks
from PlaylistTrack 
join Playlist on Playlist.PlaylistId = PlaylistTrack.PlaylistId
group by Playlist.Name

--14) country_invoices.sql: Provide a query that shows the 
--# of invoices per country. HINT: GROUP BY

select 
	Country = i.BillingCountry,
	NumOfInvoices = COUNT(i.InvoiceId) 
from Invoice as i 
group by i.BillingCountry

--13) line_item_track_artist.sql: Provide a query that includes 
--the purchased track name AND artist name with each invoice line item.
select 
	InvoiceLine = i.InvoiceLineId, 
	Artist = x.Name,
	TrackTitle = t.Name
from Track as t
join InvoiceLine as i on i.TrackId = t.TrackId
join Album as a on a.AlbumId = t.AlbumId
join Artist as x on x.ArtistId = a.ArtistId
order by i.InvoiceLineId

--12) line_item_track.sql: Provide a query that includes 
--the purchased track name with each invoice line item.
select 
	i.InvoiceLineId,
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