-- oczywiscie nalezy zmienic takie rzeczy jak filename do tych plików z filegroup (np. linijka 29) czy wyszukiwaną datę (linijka 132), oraz pamietac zeby sprobowac stworzyc te partycje miedzy utworzeniem bazy danych a utworzeniem tabel
select * from sys.master_files where database_id=db_id('Sklep_Temp')


-- Adds four new filegroups to the Sklep_Temp database  
ALTER DATABASE Sklep_Temp  
ADD FILEGROUP archiwum;  
GO  

ALTER DATABASE Sklep_Temp  
ADD FILEGROUP kwartal01;  
GO  

ALTER DATABASE Sklep_Temp  
ADD FILEGROUP kwartal02;  
GO  

ALTER DATABASE Sklep_Temp  
ADD FILEGROUP kwartal03;

ALTER DATABASE Sklep_Temp  
ADD FILEGROUP kwartal04;


ALTER DATABASE Sklep_Temp   
ADD FILE   
(  
    NAME = archiwum,  
    FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\archiwum.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP archiwum;  
GO  


ALTER DATABASE Sklep_Temp   
ADD FILE   
(  
    NAME = kwartal01,  
    FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kwartal01.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP kwartal01;  
GO  

ALTER DATABASE Sklep_Temp   
ADD FILE   
(  
    NAME = kwartal02,  
    FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kwartal02.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP kwartal02;  
GO  

ALTER DATABASE Sklep_Temp   
ADD FILE   
(  
    NAME = kwartal03,  
    FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kwartal03.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP kwartal03;  
GO  

ALTER DATABASE Sklep_Temp   
ADD FILE   
(  
    NAME = kwartal04,  
    FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kwartal04.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP kwartal04;  
GO  

select * from sys.master_files where database_id=db_id('Sklep_Temp')

-- Creates a partition function called myRangePF1 that will partition a table 
--into four partitions  


use Sklep_Temp
go

CREATE PARTITION FUNCTION [myDateRangePF2] (datetime)  
AS RANGE RIGHT FOR VALUES ('2024-01-01', '2024-04-01', '2024-07-01',  
               '2024-10-01');  

    --create partition schema which maps  filegroups into partitions
CREATE PARTITION SCHEME myDateRangePF2
    AS PARTITION myDateRangePF2  --myRangePF1 is partition function
    TO (archiwum, kwartal01, kwartal02, kwartal03, kwartal04);
	

--create partitioned table
--	CREATE TABLE PartitionTable (col1 int PRIMARY KEY, col2 char(10))  
--    ON myDateRangePF2 (col1) ;  
--GO

CREATE TABLE Zamowienie2
    (
     id_zamowienie INTEGER NOT NULL , 
     data_zamowienie DATETIME NOT NULL
    )
ON myDateRangePF2 (data_zamowienie)

ALTER TABLE Zamowienie2
ADD PRIMARY KEY(id_zamowienie, data_zamowienie)

---
truncate table Zamowienie2

set nocount on
	declare @i int = 1
	while @i<=5000
	begin
	insert into Zamowienie2 values(@i,GETDATE()-@i)
	set @i=@i+1
end

--w ktorej partycji jest 500
SELECT $PARTITION.myDateRangePF2 ('2016-03-12 13:47:51.680') ;  
GO  

SELECT $PARTITION.myDateRangePF2(data_zamowienie) AS Partition,COUNT(*) AS [COUNT]
FROM Zamowienie2   
GROUP BY $PARTITION.myDateRangePF2(data_zamowienie)  
ORDER BY Partition ;  
