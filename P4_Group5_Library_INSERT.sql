/* Location */

select * from Location
--truncate table Location
INSERT INTO Location VALUES ('MA', 'Boston','02120');
INSERT INTO Location VALUES ('MA', 'Boston','02115');
INSERT INTO Location VALUES ('MA', 'Malden','02162');
INSERT INTO Location VALUES ('MA', 'Malden','02160');
INSERT INTO Location VALUES ('NY', 'New York','10001');
INSERT INTO Location VALUES ('NY', 'Syracuse','03020');
INSERT INTO Location VALUES ('NY', 'Albany','03030');
INSERT INTO Location VALUES ('NJ', 'New Jersey','03220');
INSERT INTO Location VALUES ('NY', 'Syracuse','03022');
INSERT INTO Location VALUES ('NH', 'Boston','02118');
INSERT INTO Location VALUES ('MA', 'Boston','02125');

/* Library */
select * from Library
INSERT INTO Library VALUES ('Snell Library', '7am-11pm','2010','1');

/* People */
select * from Person
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('xyz@gmail.com', 'xyz', 'Male' , '1997-01-01', 'U', '1');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('ram@gmail.com', 'Ram', 'Male' , '1997-01-09', 'U', '1');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('Bhavana@gmail.com', 'Bhavana', 'Female' , '1998-04-14', 'L', '2');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('srikar@gmail.com', 'Srikar', 'Male' , '1999-04-30', 'L', '3');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('priya@gmail.com', 'Priya', 'Female' , '1996-07-09', 'U', '4');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('roopa@gmail.com', 'Roopa', 'Female' , '1995-01-01', 'U', '5');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('amar@gmail.com', 'Amar', 'Male' , '1994-01-01', 'L', '6');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('shreya@gmail.com', 'shreya', 'Female' , '1993-01-01', 'L', '7');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('john@gmail.com', 'John', 'Male' , '1992-01-01', 'L', '8');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('stephen@gmail.com', 'Stephen', 'Male' , '1991-01-01', 'U', '9');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('ramya@gmail.com', 'Ramya', 'Female' , '2000-01-01', 'U', '10');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('hyr@gmail.com', 'hyr', 'Male' , '1997-01-01', 'U', '1');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('MM@gmail.com', 'MM', 'Male' , '1997-01-09', 'U', '1');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('Swz@gmail.com', 'Swz', 'Female' , '1998-04-14', 'L', '2');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('peter@gmail.com', 'Peter', 'Male' , '1999-04-30', 'L', '3');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('yilia@gmail.com', 'Yilia', 'Female' , '1996-07-09', 'U', '4');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('George@gmail.com', 'George', 'Female' , '1995-01-01', 'U', '5');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('Jenny@gmail.com', 'Jenny', 'Male' , '1994-01-01', 'L', '6');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('Bilish@gmail.com', 'Bilish', 'Female' , '1993-01-01', 'L', '7');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('Taylor@gmail.com', 'Taylor', 'Male' , '1992-01-01', 'L', '8');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('Even@gmail.com', 'Even', 'Male' , '1991-01-01', 'U', '9');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('Twitch@gmail.com', 'Twitch', 'Female' , '2000-01-01', 'U', '10');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('allenbarry2680@gmail.com', 'allenbarry', 'Male' , '2000-01-01', 'U', '10');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('huangyanr98@gmail.com', 'Yanrong', 'Female' , '2000-01-01', 'U', '3');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('m.montrond@northeastern.edu', 'Manuel', 'Male' , '2000-01-01', 'U', '3');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID)VALUES ('sumaria.ak@northeastern.edu', 'Akash', 'Male' , '2000-01-01', 'U', '3');
INSERT INTO Person (Email, [Name], Gender, DOB,Person_Type,Location_ID) VALUES ('test@northeastern.edu', 'tset', 'Male' , '2000-01-01', 'U', '3');

/*Room*/
select * from Room
INSERT INTO Room VALUES
('A-102','3'),
( 'B-101','1'),
( 'A-123','3'),
( 'A-212','2'),
( 'A-111','1'),
( 'B-121','3'),
( 'B-131','3'),
( 'A-311','2'),
( 'A-201','2'),
( 'B-505','1')

/*Books*/


SELECT Book_Type,Book_ID,Book_Name,E_Book.URL
FROM (Book INNER JOIN E_Book ON Book_ID = E_Book_ID) 
Group by Book_Type,Book_ID,Book_Name,E_Book.URL
HAVING (Book_Type='E');

select* from Book where Book_Type = 'P'
select* from Book where Book_Type = 'E'
/*pbook in Book*/
INSERT INTO Book VALUES ('Series', 'Harry potter', 'Magical World' , '5', 'English', 'Harvard', 'J.K.Rowling', 'P', '1');
INSERT INTO Book VALUES ('Thriller', 'Fantastic Five', 'Imagination' , '2', 'English', 'NEU', 'Harry', 'P', '1');
INSERT INTO Book VALUES ('Crime', 'To Kill a Mockingbird', 'Sad Story' , '1', 'English', 'NEU', 'Harper Lee', 'P', '1');
INSERT INTO Book VALUES ('Thriller', 'Pride and Prejudice', 'Imagination' , '1', 'Chinese', 'Harvard', 'Jane Austen', 'P', '1');
INSERT INTO Book VALUES ('Series', 'The Hunger Game', 'Magical World' , '2', 'English', 'NEU', 'Suzanne Collins', 'P', '1');
INSERT INTO Book VALUES ('Thriller', 'The Chronicles of Narnia', 'Imagination' , '1', 'English', 'NEU', 'C.S Lewis', 'P', '1');
INSERT INTO Book VALUES ('Science', 'Gone with the Wind', 'Magical World' , '1', 'Indian', 'Harvard', 'Margaret Mitchell', 'P', '1');
INSERT INTO Book VALUES ('Romantic', 'Romeo and Juliet', 'Sad Story' , '4', 'Chinese', 'NEU', 'William Shakespeare', 'P', '1');
INSERT INTO Book VALUES ('Crime', 'Crime and Punishment', 'Law Story' , '2', 'Indian', 'Harvard', 'Fyodor', 'P', '1');
INSERT INTO Book VALUES ('Romantic', 'The Little Prince', 'Imagination' , '5', 'Chinese', 'NEU', 'Antonine de Saint', 'P', '1');
/*ebook in Book*/
INSERT INTO Book VALUES ('fiction', 'Harry potter', 'Magical World' , '2', 'English', 'NEU', 'Harry', 'E', '1');
INSERT INTO Book VALUES ('mathematics', 'God Created the Integers', 'MATH' , '1', 'English', 'Penguin', 'Stephen Hawking', 'E', '1');
INSERT INTO Book VALUES ('history', 'Orientalism', 'Magical World' , '2', 'English', 'NEU', 'Harry', 'E', '1');
INSERT INTO Book VALUES ('psychology', ' How to Think Like Sherlock Holmes  ', 'Detective' , '2', 'English', 'Penguin', 'Konnikova Maria', 'E', '1');
INSERT INTO Book VALUES ('data_science', 'Python for Data Analysis', 'python' , '2', 'English', 'O Reilly', 'McKinney Wes', 'E', '1');
INSERT INTO Book VALUES ('computer_science', 'Structure & Interpretation of Computer Programs', 'PROGRAMING' , '1', 'English', 'MIT Press', 'Sussman Gerald ', 'E', '1');
INSERT INTO Book VALUES ('fiction', 'THE Outsider', 'THRILLER' , '1', 'English', 'Penguin', 'Camus Albert', 'E', '1');
INSERT INTO Book VALUES ('computer_science', 'Introduction to Algorithms', 'ALGO' , '2', 'English', 'MIT Press', 'Cormen Thomas', 'E', '1');
INSERT INTO Book VALUES ('economics', 'Freakonomics', 'World ECONOMICS' , '2', 'English', 'Penguin', 'Dubner, Stephen   ', 'E', '1');
INSERT INTO Book VALUES ('data_science', 'Soft Computing & Intelligent Systems  ', 'COMP AND INTELLIGENT SYSTEM' , '4', 'English', 'Elsevier', 'Gupta Madan  ', 'E', '1');
INSERT INTO Book VALUES ('Science', 'Gone with the Wind', 'Magical World' , '1', 'Indian', 'Harvard', 'Margaret Mitchell', 'E', '1');
/*Paper Book*/
DELETE Paper_Book
SELECT * FROM Book
select * from Paper_Book
INSERT INTO Paper_Book VALUES (1,10,2,6);
INSERT INTO Paper_Book VALUES (2,10,1,2);
INSERT INTO Paper_Book VALUES (3,10,3,3);
INSERT INTO Paper_Book VALUES (4,10,3,4);
INSERT INTO Paper_Book VALUES (5,10,4,1);
INSERT INTO Paper_Book VALUES (6,10,5,5);
INSERT INTO Paper_Book VALUES (7,10,3,3);
INSERT INTO Paper_Book VALUES (8,10,2,2);
INSERT INTO Paper_Book VALUES (9,10,3,5);
INSERT INTO Paper_Book VALUES (10,10,1,2);
/*EBook*/
select * from E_Book
INSERT into E_book VALUES
(11,'https://rr.noordstar.me/47f96cb5',29,'pdf' ),
(12,'https://rr.noordstar.me/47f96cb5',12,'epub'),
(13,'https://rr.noordstar.me/47f96cb5',05,'pdf' ),
(14,'https://rr.noordstar.me/47f96cb5',40,'pdf' ),
(15,'https://rr.noordstar.me/47f96cb5',30,'pdf' ),
(16,'https://rr.noordstar.me/47f96cb5',23,'pdf' ),
(17,'https://rr.noordstar.me/47f96cb5',25,'epub' ),
(18,'https://rr.noordstar.me/47f96cb5',15,'txt' ),
(19,'https://rr.noordstar.me/47f96cb5',30,'txt' ),
(20,'https://rr.noordstar.me/47f96cb5',25,'txt' )
INSERT into E_book VALUES (21,'https://rr.noordstar.me/47f96cb5',29,'pdf')

select count(Book_Name) from Book where Book_Name ='Harry potter'
/*Library_Staff*/
select * from Person where Person_Type = 'U'
select * from Person where Person_Type = 'L'
select * from Library_Staff
INSERT INTO Library_Staff VALUES (3,15,8000,'Manager');
INSERT INTO Library_Staff VALUES (4,8,7500,'IT Support');
INSERT INTO Library_Staff VALUES (7,6,5000,'Librarian');
INSERT INTO Library_Staff VALUES (8,9,4000,'Librarian');
INSERT INTO Library_Staff VALUES (9,4,6000,'Librarian');
INSERT INTO Library_Staff VALUES (14,2,8200,'Manager');
INSERT INTO Library_Staff VALUES (15,3,6400,'IT Support');
INSERT INTO Library_Staff VALUES (18,1,3000,'Librarian');
INSERT INTO Library_Staff VALUES (19,2,5200,'IT Support');
INSERT INTO Library_Staff VALUES (20,3,4800,'Librarian');


/*User*/
select * from Users
INSERT INTO Users VALUES (1,3,0,1,0,null);
INSERT INTO Users VALUES (2,3,0,1,0,null);
INSERT INTO Users VALUES (5,3,0,1,0,null);
INSERT INTO Users VALUES (6,3,0,1,0,null);
INSERT INTO Users VALUES (10,3,0,1,0,null);
INSERT INTO Users VALUES (11,3,0,1,0,null);
INSERT INTO Users VALUES (12,3,0,1,0,null);
INSERT INTO Users VALUES (13,3,0,1,0,null);
INSERT INTO Users VALUES (23,3,0,1,0,null);
INSERT INTO Users VALUES (24,3,0,1,0,null);
INSERT INTO Users VALUES(16,3,0,1,0,null),
(17,3,0,1,0,null),
(21,3,0,1,0,null),
(22,3,0,1,0,null)

INSERT INTO Users VALUES(25,3,0,1,0,null)
INSERT INTO Users VALUES(26,3,0,1,0,null)

/*Assign*/
Select * from Assigned
select * from Person
delete from Assigned where Person_ID = 1
INSERT INTO Assigned VALUES(1,1,getDate(),(getdate()+100))
INSERT INTO Assigned VALUES(2,1,getDate(),(getdate()+100))
INSERT INTO Assigned VALUES(3,1,getDate(),(getdate()+100))
INSERT INTO Assigned VALUES(4,1,getDate(),(getdate()+100))
INSERT INTO Assigned VALUES(5,1,getDate(),(getdate()+100))
INSERT INTO Assigned VALUES(6,1,getDate(),(getdate()+100))
INSERT INTO Assigned VALUES(7,1,getDate(),(getdate()+1000))
INSERT INTO Assigned VALUES(8,1,getDate(),(getdate()+500))
INSERT INTO Assigned VALUES(9,1,getDate(),(getdate()+600))
INSERT INTO Assigned VALUES(10,1,getDate(),(getdate()+300))
INSERT INTO Assigned VALUES(11,1,getDate(),(getdate()+3000))
INSERT INTO Assigned VALUES(12,1,getDate(),(getdate()+200))
INSERT INTO Assigned VALUES(13,1,getDate(),(getdate()+600))
INSERT INTO Assigned VALUES(14,1,getDate(),(getdate()+200))
INSERT INTO Assigned VALUES
(15,1,getDate(),(getdate()+20)),
(16,1,getDate(),(getdate()+100)),
(17,1,getDate(),(getdate()+400)),
(18,1,getDate(),(getdate()+300)),
(19,1,getDate(),(getdate()+250)),
(20,1,getDate(),(getdate()+200)),
(21,1,getDate(),(getdate()+200)),
(22,1,getDate(),(getdate()+200)),
(23,1,getDate(),(getdate()+400)),
(24,1,getDate(),(getdate()+600))


/*Book Borrow*/

EXEC BookInsert @UserID = 1, @BookID =1;
EXEC BookInsert @UserID = 2, @BookID =2;
EXEC BookInsert @UserID = 10, @BookID =3;
EXEC BookInsert @UserID = 11, @BookID =05;
EXEC BookInsert @UserID = 12, @BookID =6;
EXEC BookInsert @UserID = 24, @BookID =7;
EXEC BookInsert @UserID = 23, @BookID =8;
EXEC BookInsert @UserID = 16, @BookID =4;
EXEC BookInsert @UserID = 21, @BookID =9;
EXEC BookInsert @UserID = 22, @BookID =10;
EXEC BookInsert @UserID = 26, @BookID =10;
--EXEC BookInsert @UserID = 25, @BookID =10;

/*Room Reservation*/

EXEC RoomReserve @Room=4, @BookDate = '2022-4-16',@Description = 'Book for group work',@UserID=10,@LibraryID =1 
EXEC RoomReserve @Room=5, @BookDate = '2022-5-16',@Description = 'Book for group work',@UserID=1,@LibraryID =1 
EXEC RoomReserve @Room=6, @BookDate = '2022-4-18',@Description = 'Book for group work',@UserID=2,@LibraryID =1 
EXEC RoomReserve @Room=7, @BookDate = '2022-6-16',@Description = 'Book for group work',@UserID=5,@LibraryID =1 
EXEC RoomReserve @Room=8, @BookDate = '2022-7-14',@Description = 'Book for group work',@UserID=6,@LibraryID =1 
EXEC RoomReserve @Room=9, @BookDate = '2022-4-18',@Description = 'Book for group work',@UserID=13,@LibraryID =1 
EXEC RoomReserve @Room=10, @BookDate = '2022-4-20',@Description = 'Book for group work',@UserID=23,@LibraryID =1
EXEC RoomReserve @Room=3, @BookDate = '2022-4-24',@Description = 'Book for group work',@UserID=16,@LibraryID =1 
EXEC RoomReserve @Room=2, @BookDate = '2022-5-26',@Description = 'Book for group work',@UserID=17,@LibraryID =1 
EXEC RoomReserve @Room=1, @BookDate = '2022-4-30',@Description = 'Book for group work',@UserID=21,@LibraryID =1  
EXEC RoomReserve @Room=1, @BookDate = '2022-5-30',@Description = 'Book for group work',@UserID=24,@LibraryID =1  

--EXEC CancelRoom @Room=1, @UserID=24,@LibraryID =1  

INSERT INTO Location VALUES ('CA', 'San Fran','20030');
INSERT INTO Library VALUES ('NYC Library', '7am-11pm','2010','5');
INSERT INTO Library VALUES ('SF Library', '7am-11pm','2010','12');