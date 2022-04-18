/* 
 * IF DATABASE EXISTS, DROP
 */


IF EXISTS (SELECT name FROM sys.databases WHERE name = N'library_Sample')
    DROP DATABASE library_Sample
go
CREATE DATABASE [library_Sample]
go
USE [library_Sample]
go

/* 
 * TABLE: Assigned 
 */

CREATE TABLE Assigned(
    Person_ID               int     NOT NULL,
    Library_ID              int     NOT NULL,
    Access_Creation_Date    date    NOT NULL,
    Access_Due_Date         date    NOT NULL,

    CONSTRAINT Assigned_PK PRIMARY KEY NONCLUSTERED (Person_ID, Library_ID)
)
go

/* 
 * TABLE: Book 
 */

CREATE TABLE Book(
    Book_ID           int             IDENTITY(1,1),
    Category          varchar(25)     NOT NULL,
    Book_Name         varchar(50)     NOT NULL,
    Description       varchar(100)    NOT NULL,
    Edition           smallint        NOT NULL,
    Language          varchar(50)     NOT NULL,
    Publisher_Name    varchar(50)     NOT NULL,
    Author_Name       varchar(50)     NOT NULL,
    Book_Type         char(10)        NOT NULL,
    Library_ID        int             NOT NULL,

    CONSTRAINT Book_ID_PK PRIMARY KEY NONCLUSTERED (Book_ID),
	CONSTRAINT Book_Type_CHK CHECK (Book_Type IN('E','P'))
)
go

/* 
 * TABLE: Book_Reserve 
 */

CREATE TABLE Book_Reserve(
    U_Person_ID      int     NOT NULL,
    P_Book_ID        int     NOT NULL,
    Date_Of_Issue    date    NOT NULL,
    Due_Date         date    NOT NULL,

    CONSTRAINT Book_Reserve_PK PRIMARY KEY NONCLUSTERED (U_Person_ID, P_Book_ID)
)
go

/* 
 * TABLE: E_Book 
 */

CREATE TABLE E_Book(

    E_Book_ID    int             NOT NULL,
    URL          varchar(250)    NOT NULL,
    File_Size    int             NOT NULL,
    Fomat        varchar(50)     NOT NULL,

    CONSTRAINT E_Book_ID_PK PRIMARY KEY NONCLUSTERED (E_Book_ID)
)
go

/* 
 * TABLE: Library 
 */

CREATE TABLE Library(

    Library_ID      int            IDENTITY(1,1),
    Library_Name    varchar(50)    NOT NULL,
    Open_Hours      varchar(25)    NULL,
    Build_Time      int            NULL,
    Location_ID     int            NOT NULL,

    CONSTRAINT Library_ID_PK PRIMARY KEY NONCLUSTERED (Library_ID)
)
go
/* 
 * TABLE: Library_Staff 
 */

CREATE TABLE Library_Staff(

    S_Person_ID      int            NOT NULL,
    Service_Years    int            NULL,
    Salary           int            NOT NULL,
    Postion          varchar(50)    NOT NULL,

    CONSTRAINT S_Person_ID_PK PRIMARY KEY NONCLUSTERED (S_Person_ID),
	CONSTRAINT Postion_CHK CHECK (Postion IN('Librarian','Manager','IT Support'))
)
go

/* 
 * TABLE: Location 
 */

CREATE TABLE Location(

    Location_ID    int            IDENTITY(1,1),
    State          varchar(25)    NOT NULL,
    City           varchar(25)    NOT NULL,
    Zipcode        smallint       NOT NULL UNIQUE,

    CONSTRAINT Location_ID_PK PRIMARY KEY NONCLUSTERED (Location_ID)
)
go

/* 
 * TABLE: Paper_Book 
 */

CREATE TABLE Paper_Book(

    P_Book_ID          int         NOT NULL,
    Available_Count    smallint    NOT NULL,
    Floor_Location     smallint    NULL,
    Shelf_Number       smallint    NULL,

    CONSTRAINT P_Book_ID_PK PRIMARY KEY NONCLUSTERED (P_Book_ID)
)
go

/* 
 * TABLE: Person 
 */

CREATE TABLE Person(

    Person_ID      int            IDENTITY(1,1),
    Email          varchar(50)    NOT NULL,
    Name           varchar(50)    NOT NULL,
    Gender         varchar(15)    NULL,
    DOB            date           NOT NULL,
    Person_Type    char(10)       NOT NULL,
    Location_ID    int            NOT NULL,

    CONSTRAINT Person_ID_PK PRIMARY KEY NONCLUSTERED (Person_ID),
	CONSTRAINT Person_Type_CHK CHECK (Person_Type IN('U','L'))
)
go

/* 
 * TABLE: Room 
 */

CREATE TABLE Room(

    Room_ID              int            IDENTITY(1,1),
--    Is_Room_Available    bit            NOT NULL,
    Room_Location        varchar(25)    NOT NULL UNIQUE,
    Room_Size            smallint       CHECK (Room_size > 0)NOT NULL,

    CONSTRAINT Room_ID_PK PRIMARY KEY NONCLUSTERED (Room_ID)
)
go

/* 
 * TABLE: Room_Reserve 
 */

CREATE TABLE Room_Reserve(

    Room_ID            int            NOT NULL,
    Date_Of_Booking    date           NULL,
    Description        varchar(50)    NOT NULL,
    U_Person_ID        int            NOT NULL,

    CONSTRAINT Room_Reserve_PK PRIMARY KEY NONCLUSTERED (Room_ID)
)
go

/* 
 * TABLE: Users 
 */

CREATE TABLE Users(

    U_Person_ID          int     NOT NULL,
    Max_Book_Count       int     CHECK (Max_Book_Count > 0 AND Max_Book_Count < 4)NOT NULL,
    Book_Borrow_Count    int     CHECK (Book_Borrow_Count>=0 )NOT NULL,
    Max_Room_Count       int     CHECK (Max_Room_Count >0 AND Max_Room_Count < 4)NOT NULL,
    Room_Booked_Count    int     CHECK (Room_Booked_Count >=0)NOT NULL,
    Last_Access_Date     date    NULL,

    CONSTRAINT U_Person_ID_PK PRIMARY KEY NONCLUSTERED (U_Person_ID),
	CONSTRAINT Book_Count_CHK CHECK (Max_Book_Count>=Book_Borrow_Count),
	CONSTRAINT Room_Count_CHK CHECK (Max_Room_Count>=Room_Booked_Count)

)
go

/* 
 * TABLE: Assigned 
 */

ALTER TABLE Assigned ADD CONSTRAINT Person_ID_FK1 

    FOREIGN KEY (Person_ID)
    REFERENCES Person(Person_ID)
go

ALTER TABLE Assigned ADD CONSTRAINT Library_ID_FK1 

    FOREIGN KEY (Library_ID)
    REFERENCES Library(Library_ID)
go

/* 
 * TABLE: Book 
 */

ALTER TABLE Book ADD CONSTRAINT Library_ID_FK2 

    FOREIGN KEY (Library_ID)
    REFERENCES Library(Library_ID)
go

/* 
 * TABLE: Book_Reserve 
 */

ALTER TABLE Book_Reserve ADD CONSTRAINT U_Person_ID_FK1 

    FOREIGN KEY (U_Person_ID)
    REFERENCES Users(U_Person_ID)
go

ALTER TABLE Book_Reserve ADD CONSTRAINT P_Book_ID_FK1 

    FOREIGN KEY (P_Book_ID)
    REFERENCES Paper_Book(P_Book_ID)
go

/* 
 * TABLE: E_Book 
 */

ALTER TABLE E_Book ADD CONSTRAINT E_Book_ID_FK1 

    FOREIGN KEY (E_Book_ID)
    REFERENCES Book(Book_ID)
go

/* 
 * TABLE: Library 
 */

ALTER TABLE Library ADD CONSTRAINT Location_ID_FK1 

    FOREIGN KEY (Location_ID)
    REFERENCES Location(Location_ID)
go

/* 
 * TABLE: Library_Staff 
 */

ALTER TABLE Library_Staff ADD CONSTRAINT S_Person_ID_FK1 

    FOREIGN KEY (S_Person_ID)
    REFERENCES Person(Person_ID)
go


/* 
 * TABLE: Paper_Book 
 */

ALTER TABLE Paper_Book ADD CONSTRAINT P_Book_ID_FK2 

    FOREIGN KEY (P_Book_ID)
    REFERENCES Book(Book_ID)
go

/* 
 * TABLE: Person 
 */

ALTER TABLE Person ADD CONSTRAINT Location_ID_FK2 

    FOREIGN KEY (Location_ID)
    REFERENCES Location(Location_ID)
go

/* 
 * TABLE: Room_Reserve 
 */

ALTER TABLE Room_Reserve ADD CONSTRAINT U_Person_ID_FK2

    FOREIGN KEY (U_Person_ID)
    REFERENCES Users(U_Person_ID)
go

ALTER TABLE Room_Reserve ADD CONSTRAINT Room_ID_FK 

    FOREIGN KEY (Room_ID)
    REFERENCES Room(Room_ID)
go

/* 
 * TABLE: Users 
 */

ALTER TABLE Users ADD CONSTRAINT U_Person_ID_FK3

    FOREIGN KEY (U_Person_ID)
    REFERENCES Person(Person_ID)
go



ALTER TABLE Paper_Book
Add CONSTRAINT Available_Count_CHK CHECK (Available_Count>=0)


/*Procedure Part*/
/*BOOK INSERT Procedure*/
Go
CREATE PROCEDURE BookInsert @UserID INT, @BookID INT
AS
INSERT into Book_Reserve values(@UserID, @BookID, getdate(), GETDATE()+5)
UPDATE Users
	SET Book_Borrow_Count = Book_Borrow_Count + 1,
	[Users].Last_Access_Date = getDate()
	WHERE Users.U_Person_ID = @UserID
Update Paper_Book
	SET Available_Count = Available_Count - 1
	WHERE Paper_Book.P_Book_ID = @BookID
--EXEC BookInsert @UserID = 24, @BookID =21;
GO

/*BookReturn Procedure*/
CREATE PROCEDURE BookReturn @UserID INT, @BookID INT
AS
Delete from Book_Reserve
WHERE Book_Reserve.U_Person_ID= @UserID and Book_Reserve.P_Book_ID = @BookID
UPDATE Users
    SET Book_Borrow_Count = Book_Borrow_Count - 1,
    [Users].Last_Access_Date = getDate()
    WHERE Users.U_Person_ID = @UserID
Update Paper_Book
    SET Available_Count = Available_Count + 1
    WHERE Paper_Book.P_Book_ID = @BookID
GO
--EXEC BookReturn @UserID = 5, @BookID=22;
Go

/*ROOM reserve*/
CREATE PROCEDURE RoomReserve @UserID INT, @Room INT,@LibraryID INT,@BookDate Date,@Description varchar(50)
AS
INSERT into Room_Reserve values(@Room, @BookDate,@Description,@UserID)
UPDATE Users
	SET Room_Booked_Count = Room_Booked_Count + 1,
	[Users].Last_Access_Date = getDate()
	WHERE Users.U_Person_ID = @UserID
Go

--EXEC RoomReserve @Room=4, @BookDate = '2022-4-16',@Description = 'Book for group work',@UserID=24,@LibraryID =1 
Go
/*ROOM Cancel*/
CREATE PROCEDURE CancelRoom @UserID INT, @Room INT,@LibraryID INT
AS
Delete from Room_Reserve
where Room_Reserve.U_Person_ID = @UserID and Room_Reserve.Room_ID = @Room
UPDATE Users
    SET Room_Booked_Count = Room_Booked_Count - 1,
    [Users].Last_Access_Date = getDate()
    WHERE Users.U_Person_ID = @UserID
Go
--EXEC CancelRoom @UserID = 12, @Room=1,@LibraryID =1;


Go

/*Views*/
/*view for avaliable book*/
CREATE VIEW [Ava_BookList] AS
SELECT P_Book_ID, Book_Name, Available_Count, Floor_Location, Shelf_Number
FROM  Paper_Book join Book on P_Book_ID = Book_ID
WHERE Available_Count>0;

--select * from [Ava_BookList]
Go
/*View for RoomBooked List*/
CREATE VIEW [RoomBookedList] AS
SELECT r.Room_ID,r.Room_Location, r.Room_Size, rr.Date_Of_Booking
FROM Room r JOIN Room_Reserve rr on rr.Room_ID= r.Room_ID
Go

/*View for UserHistory*/
CREATE VIEW UserHistory
 AS
SELECT u.U_Person_ID ,u.Room_Booked_Count,r.[Description],r.Room_ID,r.Date_Of_Booking,u.Book_Borrow_Count, br.Due_Date,br.P_Book_ID,br.Date_Of_Issue
FROM Users u full join
Room_Reserve R on R.U_Person_ID=u.U_Person_ID
full join Book_Reserve br on br.U_Person_ID=u.U_Person_ID
Go

/*Email Trigger*/
/*book_reserved sending trigger*/
CREATE TRIGGER book_reserved
ON Book_Reserve
AFTER insert
AS
Begin
Declare @EmailID varchar(50)
Declare @bookname varchar(50)
Declare @duedate varchar(50)
select @EmailID = Person.Email, @bookname =Book_Name, @duedate =Due_Date from Person
join Book_Reserve on Person.Person_ID =Book_Reserve.U_Person_ID join Book on book.Book_ID=Book_Reserve.P_Book_ID
declare @body varchar(500) = 'you borrowed book '+ @bookname  + 'please return it by ' + @duedate
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'LibraryAdmin',
    @recipients = @EmailID,
    @body = @body,
    @subject = 'Thanks for borrowing';
End
Go
/*Room_reserved sending trigger*/
CREATE TRIGGER room_booked
ON Room_Reserve
AFTER insert
AS
Begin
Declare @EmailID varchar(50)
Declare @room_id varchar(50)
Declare @dateofbooking Varchar(50)
DECLARE @description VARCHAR(50)
select @EmailID = Person.Email, @room_id = Room_ID, @dateofbooking =Date_Of_Booking, @description = [Description]
from Person
join Room_Reserve on Person.Person_ID =Room_Reserve.U_Person_ID
declare @body varchar(500) = 'Room '+ @room_id + ' is booked for ' + @dateofbooking + ' for ' + @description
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'LibraryAdmin',
    @recipients = @EmailID,
    @body = @body,
    @subject = 'Thanks for booking';
End


/*UDF for Age*/
/*UDF to caculate the age*/
CREATE FUNCTION AGE(@DateOfBirth AS DATETIME)
RETURNS INT
AS
BEGIN
	DECLARE @Years AS INT
	DECLARE @BirthdayDate AS DATETIME
	DECLARE @Age AS INT
--Calculate difference in years
	SET @Years = DATEDIFF(YY,@DateOfBirth,GETDATE())
--Add years to DateOfBirth
	SET @BirthdayDate = DATEADD(YY,@Years,@DateOfBirth)
--Subtract a year if birthday is after today
	SET @Age = @Years -
		CASE
			WHEN @BirthdayDate>GETDATE() THEN 1
			ELSE 0
		END
--Return the result
	RETURN @Age
END
Go
/*Caculate the age of Person use UDF View*/
select Person_ID
	,Name
	,GETDATE() as today
	,DOB
	,[dbo].[AGE](DOB) as Age
from Person

/*Column Data Encryption*/

/**/
