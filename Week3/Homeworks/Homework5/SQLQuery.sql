﻿-- Select
Select ContactName Adi, CompanyName SirketAdi, City Sehir from Customers
-- Sütün isminin yanına yazdığımız kelimeler ile görüntülecenek tabloda isim değişikliği yapabiliriz.

-- Where , and , or
Select * from Customers where City = 'London'
SelECT * from Products where categoryId = 3 or CategoryID = 1
-- Sql, case insensitive bir dildir. Yani büyük küçük harf duyarsızdır.
Select * from Products where CategoryID = 2 and UnitPrice > 10

-- Order , asc , desc
Select * from Products order by ProductName
Select * from Products order by UnitPrice asc -- ascending (artan) 
Select * from Products order by UnitPrice desc -- descending (azalan)

-- Count(*)
Select count(*) Adet from Products where CategoryID = 2
-- Ürünler arasından katagori id'si 2 olanların sayısını verir. Adet isimli bir sütunda gösterir.

-- Group by
select CategoryId,count(*) Adet from products group by CategoryID
-- CategoryId'leri kendi içlerinde id'lerine göre grupla (tekrarsız şekilde tümünü yazdırmak)
-- Adet sütun ismiyle ürünleri categoryId'lerine göre sayarak grupla.

-- Having
select CategoryId,count(*) Adet from products where UnitPrice > 20 group by CategoryID having count(*) < 10
-- birim fiyatı 20'den büyük olanlar arasından count(*) olan kimülatif veri için
-- 10'dan küçük olma şartıyla gruplandırarak saydırma yaptık

-- Inner join , on
select Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName 
from products inner join Categories on Products.CategoryID = Categories.CategoryID
-- Ürünlerin id, isim ve birim fiyatı içerenlerini ve katagorilerin isiim içeren sütunlarını seç.
-- Bu seçime ürünlerdeki katagori numaraları ile
-- Katagorilerin katagori numaraları eşleşen katagorileri alma şartıyla ekle.

-- left join farkı
select * from Products p inner join [Order Details] od on p.ProductID = od.ProductID
-- boşluk kabul edilmediği için köşeli parantez ile belirttik.
select * from Products p left join [Order Details] od on p.ProductID = od.ProductID
-- left: kendisinin solunda oluğ sağında olmayanları da getir
select * from Customers c left join Orders o on c.CustomerID = o.CustomerID

-- is null
select * from Customers c left join Orders o on c.CustomerID = o.CustomerID
where o.CustomerID is null
-- left join ile solunda olup sağında olmayanları hedeflemiştik.
-- şimdi bunları birleştirirkenki koşulumuz sağda olmayanları belirtmek olacak
-- left join'in tersi right joindir.

-- ikiden fazla join kullanımı
select * from Products p inner join [Order Details] od on p.ProductID = od.ProductID
inner join Orders o on o.OrderId = od.OrderId

