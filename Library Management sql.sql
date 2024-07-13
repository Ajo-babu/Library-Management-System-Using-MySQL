create database Library;
use Library;
Create table Branch (
Branch_No INT PRIMARY KEY,
Manager_id INT,
Branch_address VARCHAR(55),
Contact_no BIGINT
);
Insert into Branch 
values
(1,101,'Haripad Alapuzha',9898656532),
(2,102,'kayamkulam Alapuzha',9898656523),
(3,103,'Ambalapuzha Alapuzha',9898656512),
(4,104,'Karunagapally Kollam',9898656521),
(5,105,'Kottiyam Kollam',9898656513),
(6,106,'Manapally Kollam',9898656531),
(7,107,'Kochi Eranakulam',9898565623),
(8,108,'Angamaly Eranakulam',9898565632),
(9,109,'Pandalam Pathanamthitta',9898565612),
(10,110,'Kovalam Trivandrum',9898565621);
select* from Branch;

create table Employee (
Emp_id INT PRIMARY KEY,
Emp_Name VARCHAR(55),
Position VARCHAR(55),
Salary BIGINT,
Branch_No INT,
FOREIGN KEY (Branch_No) REFERENCES Branch(Branch_No)
);
describe Employee;
select* from Employee;

Insert into Employee
Values
(1001,'Arun','Librarian',55000,1),
(1002,'Athira','Library Assistant',40000,1),
(1003,'Nithin','Librarian',45000,2),
(1004,'Aswin','Library Assistant',30000,2),
(1005,'Nandu','Manager',60000,3),
(1006,'Sheeba','Librarian',45000,3),
(1007,'Adhil','Supervisor',30000,4),
(1008,'Aparna','Clerk',20000,4),
(1009,'Greeshma','Librarian',35000,5),
(1010,'Amal','Security',25000,5),
(1011,'Mridul','Library Assistant',30000,6),
(1012,'Amrutha','Clerk',20000,6),
(1013,'Manu','Manager',50000,7),
(1014,'Appu','Security',25000,7),
(1015,'Nithya','Library Assistsnt',35000,8),
(1016,'Lekshmi','Clerk',25000,8),
(1017,'Sooraj','Supervisor',55000,9),
(1018,'Abhin','Librarian',35000,9),
(1019,'Hareesh','Library Assistant',30000,10),
(1020,'Jidhun','Security',15000,10);

insert into Employee values
 (1021,'Varun','Librarian',25000,1),
 (1022,'shamnad','Manager',40000,1),
 (1023,'Meenu','Clerk',20000,1),
 (1024,'Rohan','Security',25000,1); 
select* from Employee;

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

INSERT INTO Books 
VALUES
('9780141439600', 'Pride and Prejudice', 'Fiction', 12.99, 'yes', 'Jane Austen', 'Penguin Classics'),
('9780061122415', 'To Kill a Mockingbird', 'Fiction', 10.50, 'yes', 'Harper Lee', 'Harper Perennial Modern Classics'),
('9780140187398', '1984', 'Fiction', 9.99, 'yes', 'George Orwell', 'Penguin Books'),
('9780060850524', 'The Catcher in the Rye', 'Fiction', 11.95, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('9780743273565', 'The Great Gatsby', 'Fiction', 8.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9780547928227', 'The Hobbit', 'Fantasy', 14.99, 'yes', 'J.R.R. Tolkien', 'Mariner Books'),
('9780544003415', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 16.99, 'yes', 'J.K. Rowling', 'Scholastic'),
('9780062315007', 'The Hunger Games', 'Young Adult', 9.75, 'yes', 'Suzanne Collins', 'Scholastic Press'),
('9780141439471', 'Jane Eyre', 'Fiction', 13.50, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('9780062695233', 'Where the Crawdads Sing', 'Fiction', 18.95, 'yes', 'Delia Owens', 'G.P. Putnam\'s Sons');

insert into Books VALUES ('1234567890', 'A History of the World', 'History', 10.99, 'yes', 'John Smith', 'Random House');
select* from Books;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer 
VALUES
(1, 'Anakha', 'Attingal, trivandrum', '2023-05-15'),
(2, 'Baby', 'Kuttanad, Alapuzha', '2022-11-20'),
(3, 'Ayana', 'Haripad, Alapuzha', '2023-01-05'),
(4, 'Ansana', 'Ankamaly, Eranakulam', '2021-08-10'),
(5, 'Amal', 'Kochi, Eranakulam', '2022-03-25'),
(6, 'Shyam', 'Kottiyam, Kollam', '2023-07-02'),
(7, 'Anu', 'Kayamkulam, Alapuzha', '2023-04-18'),
(8, 'Ananya', 'Paryaram, kannur', '2021-12-30'),
(9, 'Adhila', 'Kollamkode, Palakkad', '2022-06-08'),
(10, 'Jack', 'Aruvipuram, Trivandrum', '2023-02-14');
select * from Customer;
update Customer set Reg_date = '2020-10-10' where Customer_Id = 10;
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(55),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus
VALUES
(1, 1, 'Pride and Prejudice', '2023-06-10', '9780141439600'),
(2, 3, 'To Kill a Mockingbird', '2023-05-20', '9780061122415'),
(3, 5, '1984', '2023-04-15', '9780140187398'),
(4, 2, 'The Catcher in the Rye', '2023-06-01', '9780060850524'),
(5, 4, 'The Great Gatsby', '2023-05-05', '9780743273565'),
(6, 6, 'The Hobbit', '2023-07-12', '9780547928227'),
(7, 8, 'Harry Potter and the Sorcerer\'s Stone', '2023-06-28', '9780544003415'),
(8, 7, 'The Hunger Games', '2023-06-05', '9780062315007'),
(9, 9, 'Jane Eyre', '2023-05-18', '9780141439471'),
(10, 10, 'Where the Crawdads Sing', '2023-07-01', '9780062695233');
select* from IssueStatus;

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus
VALUES
(1, 1, 'Pride and Prejudice', '2023-06-20', '9780141439600'),
(2, 3, 'To Kill a Mockingbird', '2023-05-28', '9780061122415'),
(3, 5, '1984', '2023-04-25', '9780140187398'),
(4, 2, 'The Catcher in the Rye', '2023-06-15', '9780060850524'),
(5, 4, 'The Great Gatsby', '2023-05-20', '9780743273565'),
(6, 6, 'The Hobbit', '2023-07-20', '9780547928227'),
(7, 8, 'Harry Potter and the Sorcerer\'s Stone', '2023-07-05', '9780544003415'),
(8, 7, 'The Hunger Games', '2023-06-15', '9780062315007'),
(9, 9, 'Jane Eyre', '2023-06-05', '9780141439471'),
(10, 10, 'Where the Crawdads Sing', '2023-07-10', '9780062695233');
select* from ReturnStatus;

-- retrieving the datas of available book's details and its rental price 

select Book_title, Category, Rental_Price from Books where Status = 'yes';

-- listing the datas of all employee and their Salary in descending order

Select Emp_Name, Salary from Employee order by Salary desc;

-- retrieving the details of book and the corresponding customer who took the book

select Books.Book_title, Customer.Customer_name from Books
inner join
IssueStatus on Books.ISBN = IssueStatus.Isbn_book
inner join
Customer on IssueStatus.Issued_cust = Customer.Customer_Id;

-- listing the total number of books in each category

select Category, count(*) as Total_books
from Books
group by Category;

-- retrieving datas of employee (name and position) who having salary above 50,000

select Emp_Name, Position from Employee where Salary > 50000;

-- retreiving details of customers who registered before 2022/01/01 and not issues any books

Insert into Customer values (11, 'Naveen', 'Mavelikara, Alapuzha', '2020-02-14'); -- adding a data for the result

select Customer_name from Customer
where Reg_date < '2022-01-01' 
and Customer_Id not in (
select Issued_cust from IssueStatus
);

-- listing total no of employs in each branch 

select Branch_No, count(*) as Total_Employee
from Employee group by Branch_No;

-- listing customers who took book on the month of june 2023

select distinct Customer.Customer_name
from Customer 
inner join IssueStatus ON Customer.Customer_Id = issuestatus.Issued_cust
WHERE YEAR(IssueStatus.Issue_date) = 2023 AND MONTH(IssueStatus.Issue_date) = 6;

-- listing books having category as history

select Book_title from Books where Category like '%history%';

-- retreiving branch number with employee of branch having 5+ employees

select Branch_No, count(*) as Total_Employee from Employee group by Branch_No having count(*) > 5;

-- listing the details of employees who manage branches and its branch address

select Employee.Emp_Name, Branch.Branch_address from Employee
inner join
Branch on Employee.Branch_No = Branch.Branch_No
where Employee.Position = 'Manager';

-- reteiving the names of customers who have been issued with book having rental price >25

Update Books set Rental_Price = 30 where ISBN = 9780141439600; -- updating rental price to 30

select distinct Customer.Customer_name from Customer
inner join
IssueStatus on Customer.Customer_Id = IssueStatus.Issued_cust 
inner join
Books on IssueStatus.Isbn_book = Books.ISBN
where Books.Rental_Price > 25;







