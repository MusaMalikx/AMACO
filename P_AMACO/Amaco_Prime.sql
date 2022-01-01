
create database Amaco_Prime1
go
use Amaco_Prime1
go

-------------------------Tables ------------------------------------

CREATE TABLE [Customer]
(
	CustomerID INT IDENTITY(1,1),
	[Customer Email] varchar(100) unique, 
	Password VARCHAR(20) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Phone Number] [char](11) NULL,
	[Address] [varchar](100) NULL,

	CONSTRAINT PK_User_Authentication PRIMARY KEY (CustomerID),
	CONSTRAINT FK_User_Authentication FOREIGN KEY (CustomerID) REFERENCES [Customer](CustomerID)
)
GO

CREATE TABLE [Shop]
(
	ShopID INT IDENTITY(1,1),
	[ShopOwner Email] varchar(100) unique, 
	Password VARCHAR(20) NOT NULL,
	[Owner Name] [varchar](100) NOT NULL,
	[Phone Number] [char](11) NULL,
	[Address] [varchar](100) NULL,
	[shop name] [varchar](100) NULL,
	[cnic] [char](13) NOT NULL,
	CONSTRAINT PK_Shop_Authentication PRIMARY KEY (ShopID),
	CONSTRAINT FK_Shop_Authentication FOREIGN KEY (ShopID) REFERENCES [Shop](ShopID)	
)
go
create table tblProducts
(
	PID int identity(1,1) primary key ,
	shopid int,
	PName   nvarchar(MAX) not null,
	PPrice money,
	Pcategory nvarchar(max),
	Psize varchar(max),
	PDescription nvarchar(MAX),
	Pavailabilty int,
	Pquantity int,
	CONSTRAINT FK_Items FOREIGN KEY (shopid) REFERENCES [Shop](ShopID)
)
go
CREATE TABLE tblProductImages(
	[PIMGID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Extention] [nvarchar](500) NULL,
	Constraint [FK_tblProductImages_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID])
	)
	go
select* from tblProducts
go
select* from tblProductImages
go

CREATE TABLE tblCart(
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[PName] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[PSelPrice] [money] NULL,
	[SubPAmount]  AS ([PPrice]*[Qty]),
	[SubSAmount]  AS ([PSelPrice]*[Qty]),
	[Qty] [int] NULL,
)
go
CREATE TABLE tblOrders(
	[OrderID] [int] IDENTITY(1,1) NOT NULL primary key,
	[UserID] [int] NULL,
	[CartAmount] [money] NULL,
	[CartDiscount] [money] NULL,
	[TotalPaid] [money] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[DateOfPurchase] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[OrderStatus] [nvarchar](50) NULL,
	Constraint [FK_tblOrders_ToTable] FOREIGN KEY ([UserID]) REFERENCES [Customer] ([CustomerID])
)

go

CREATE TABLE tblOrderProducts(
	[OrderProID] [int] IDENTITY(1,1) NOT NULL primary key,
	[OrderID] [int] Not NULL,
	[UserID] [int] not NULL,
	[PID] [int] NULL,
	[Products] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
	Constraint [FK_tblOrderProducts_ToTable] FOREIGN KEY ([UserID]) REFERENCES [Customer] ([CustomerID]),
	Constraint [FK_tblOrderProducts_Toordertable] FOREIGN KEY ([OrderID]) REFERENCES [tblOrders] ([OrderID])
)
go
create table [dbo].[tblrating](
 [id] [int] IDENTITY(1,1) NOT NULL Primary key,
 CustomerID int NOT NULL,
 ProductID int NOT NULL,
 [rating] [int] NULL,
 Constraint [FK_Customer_ToRatingTable] FOREIGN KEY ([CustomerID]) REFERENCES [Customer] ([CustomerID]),
Constraint [FK_Products_ToRatingTable] FOREIGN KEY ([ProductID]) REFERENCES [tblProducts] ([PID])
)
GO
Select* from tblrating
----------------------------stored procedures -------------------------

--1
go
create procedure insertproducts(
	@shopid int,
	@PName   nvarchar(MAX) ,
	@PPrice money,
	@Pcategory nvarchar(max),
	@Psize varchar(max),
	@PDescription nvarchar(MAX),
	@Pavailabilty int,
	@Pquantity int
	)
	as
	begin
	insert into tblProducts values(@shopid , @PName , @PPrice , @Pcategory , @Psize , @PDescription ,@Pavailabilty , @Pquantity)
	select SCOPE_IDENTITY()
	Return 0
	end
--2
go
create procedure procBindAllProducts
AS
select A.*,B.*,C.[shop name] ,A.PPrice as DiscAmount,B.Name as ImageName, C.[shop name] as BrandName from tblProducts A
inner join Shop C on C.ShopID = A.shopid
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B
order by A.PID desc

Return 0
go
--3

CREATE PROCEDURE SP_IsProductExistInCart
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart where PID = @PID and UID = @UserID
go
--4
CREATE PROCEDURE SP_UpdateCart
(
@UserID int,
@CartPID int,
@Quantity int
)
AS
BEGIN
SET NOCOUNT ON;
UPDATE tblCart SET Qty = @Quantity WHERE PID = @CartPID AND UID = @UserID
END
go
--5
CREATE PROCEDURE SP_InsertCart
(
@UID int,
@PID int,
@PName nvarchar(MAX),
@PPrice money,
@PSelPrice money,
@Qty int
)
AS
INSERT INTO tblCart VALUES(@UID,@PID,@PName,@PPrice,@PSelPrice,@Qty)
SELECT SCOPE_IDENTITY()

go
--6
create PROCEDURE SP_BindCartNumberz
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID

--7
go
create PROCEDURE SP_BindUserCart
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UID = @UserID

go
---8
CREATE PROCEDURE SP_DeleteThisCartItem
@CartID int
AS
BEGIN
DELETE FROM tblCart WHERE CartID = @CartID
END
go
--9
CREATE PROCEDURE SP_BindPriceData
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID
go
--10
create PROCEDURE SP_BindCartProducts
(
@UID int
)
AS
SELECT PID FROM tblCart WHERE UID = @UID

go
---11
CREATE PROCEDURE SP_EmptyCart
@UserID int
AS
BEGIN
DELETE FROM tblCart WHERE UID = @UserID
END
go
--12
CREATE PROCEDURE SP_InsertOrderProducts
(
@OrderID int,
@UserID int,
@PID int,
@Products nvarchar(MAX),
@Quantity int,
@OrderDate datetime,
@Status nvarchar(100)
)
AS
INSERT INTO tblOrderProducts VALUES (@OrderID,@UserID,@PID,@Products,@Quantity,@OrderDate,@Status)
SELECT SCOPE_IDENTITY()

go
--13
CREATE PROCEDURE SP_InsertOrder
(
@UserID int,
@CartAmount money,
@CartDiscount money,
@TotalPaid money,
@PaymentType nvarchar(50),
@PaymentStatus nvarchar(50),
@DateOfPurchase datetime,
@Name nvarchar(200),
@Address nvarchar(MAX),
@MobileNumber nvarchar(50),
@OrderStatus nvarchar(50)
)
AS
INSERT INTO tblOrders VALUES(@UserID,@CartAmount,@CartDiscount,@TotalPaid,@PaymentType,@PaymentStatus,@DateOfPurchase,@Name,@Address,@MobileNumber,@OrderStatus)
SELECT SCOPE_IDENTITY()

--14
go
create procedure sp_updateproduct  --decreases the product overall quantity
(
@pid int,
@quantity int
)
as
begin
declare @orignalqty int;
declare @newqty int;
set @orignalqty = (select p.Pquantity from tblProducts as p  where p.PID = @pid);
set @newqty = @orignalqty - @quantity;
begin 
SET NOCOUNT ON;
update tblProducts set Pquantity = @newqty WHERE PID = @pid;
end
end
go
alter procedure AddingRating(@CID int,
@PID int,
@Rate int
)
as 
begin
if exists(Select* from tblrating as R where R.CustomerID=@CID and R.ProductID=@PID)
begin
update tblrating set CustomerID=@CID,ProductID=@PID,rating=@Rate
where CustomerID=@CID and ProductID=@PID
end
else
begin 
insert into tblrating(CustomerID,ProductID,rating) values(@CID,@PID,@Rate);
end
end

go
Create View RatingView
as 
Select * from tblrating
go

Create View ProductsView
as 
Select C.CartID,P.PID,p.PName from tblCart as C join tblProducts as P on C.PID=P.PID
where p.Pquantity>0 and P.PDescription!=NULL

---Triggers
go
Create Trigger ZeroExtraction
on tblProducts
for delete 
as 
if exists(Select* from tblProducts as P where P.Pquantity=0)
Print('Zero Quantity available')

Go
Create Trigger Discount
on tblOrderProducts
for Insert,Delete,Update
as 
If Exists(
Select D.OrderID,AVG(D.Quantity) as 'Average Quantity' 
from tblOrderProducts as D
group by D.OrderID
having AVG(D.Quantity)>50)
Begin
	IF exists(Select* from inserted) and not exists(Select* from deleted)   -- Insert Case
	begin
		declare @GID_Ins int
		Select @GID_Ins=OrderID from inserted
		Print 'Average Discount '+cast(@GID_Ins as varchar(10))+' Fallen below 2'
	end
	IF not exists(Select* from inserted) and exists(Select* from deleted)   -- Delete Case
	begin
		declare @GID_Del int
		Select @GID_Del=OrderID from deleted
		Print 'Average Discount '+cast(@GID_Del as varchar(10))+' Fallen below 2'
	end
	IF exists(Select* from inserted) and exists(Select* from deleted)   -- Update Case
	begin
		declare @GID_Up int
		Select @GID_Up=OrderID from inserted
		Print 'Average Discount '+cast(@GID_Up as varchar(10))+' Fallen below 2'
	end
End
go
select * from tblProducts
select * from tblOrders
select* from tblOrderProducts