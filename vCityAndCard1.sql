create view [Person].[vCityAndCard1]
as
select cc.CardType, a.City , count(*) as count from
[Person].[Person] as p
inner join
[Person].[BusinessEntityAddress] as ba
on p.BusinessEntityID = ba.BusinessEntityID
inner join
[Person].[Address] as a
on ba.AddressID = a.AddressID
inner join
[Sales].[PersonCreditCard] as pcc
on p.BusinessEntityID = pcc.BusinessEntityID
inner join
[Sales].[CreditCard] as cc
on pcc.CreditCardID=cc.CreditCardID
Group by rollup (CardType, City)
go
