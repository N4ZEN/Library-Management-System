USE LIBRARY_SYSTEMs
Go

SELECT*
FROM DEPARTMENT;

SELECT*
FROM MEMBER;

SELECT*
FROM AUTHOR;

SELECT*
FROM PUBLISHER;

SELECT*
FROM CATALOUGE;

SELECT*
FROM CATAGORY;

SELECT*
FROM BORROW;

SELECT* 
FROM RESERVE;

UPDATE MEMBER
SET BORROWED = 9
WHERE MEMBNAME = 'Jamal';

UPDATE MEMBER
SET BORROWED = 4
WHERE MEMBNAME = 'Gulnar Fatima';

--i.	For each member who has borrowed more than 2 books, list the member names and the total number of books
-- currently on loan to them. List the results in alphabetical order of member names.
SELECT MEMBNAME, BORROWED
FROM MEMBER
WHERE BORROWED > 2
ORDER BY MEMBNAME ASC;


--ii.	List the total number of book titles available in each category (i.e. open-stack, yellow-stack, etc.). 
--List the results in descending order of total book titles.
SELECT CT.Stack AS 'CATAGORY', COUNT(CL.TITLE) AS 'TOTAL BOOK TITLES IN CATAGORY'
FROM CATAGORY CT INNER JOIN CATALOUGE CL ON CL.STACK = CT.Stack
GROUP BY CT.Stack
ORDER BY COUNT(CL.TITLE) DESC;


--iii.	List the book and publisher details of all books written by the authors named ‘Thomas Connolly’ or ‘Ramez Elmasri’.
SELECT C.BOOKID, C.ISBN, C.TITLE, C.PUBLISHERID, P.PUBLISHERNAME, C.PUBLISHEDYEAR, A.AUTHORNAME
FROM CATALOUGE C INNER JOIN PUBLISHER P ON C.PUBLISHERID = P.PUBLISHERID 
INNER JOIN AUTHOR A ON C.AUTHORID = A.AUTHORID
WHERE AUTHORNAME = ('Thomas Connolly') OR AUTHORNAME = ('Ramez Elmasri');


--iv.	List the details of all current book reservations. The list should include member details, 
--book details as well as the status of each book (i.e. it is ‘available’ or ‘loaned out’) reserved.
SELECT R.MEMBID, M.MEMBNAME, R.BOOKID, C.TITLE, C.AUTHORID, C.BOOK_STATUS
FROM CATALOUGE C INNER JOIN RESERVE R ON R.BOOKID = C.BOOKID
INNER JOIN MEMBER M ON M.MEMBID = R.MEMBID


--v.	For each department, list the average number of books borrowed by its students 
--and the average number of books borrowed by its staff. 
SELECT D.POSITION AS 'POSITION', AVG(M.BORROWED) AS 'AVERAGE NO. OF BOOKS BORROWED'
FROM DEPARTMENT D INNER JOIN MEMBER M ON M.DEPTID = D.DEPTID
WHERE D.POSITION IN ('Students', 'Lecturer')
GROUP BY D.POSITION;


--vi.	List the details of all members who have borrowed any books written by the author named ‘C.J. Date’.
SELECT M.MEMBID, M.MEMBNAME, M.MEMBEMAIL, C.BOOKID, C.TITLE, A.AUTHORNAME, C.AUTHORID
FROM CATALOUGE C INNER JOIN BORROW B ON C.BOOKID = B.BOOKID
INNER JOIN AUTHOR A ON C.AUTHORID = A.AUTHORID
INNER JOIN MEMBER M ON M.MEMBID = B.MEMBID
WHERE A.AUTHORNAME = 'C.J.Date' AND C.BOOK_STATUS = 'Loaned-Out';


--vii.	List the names of all ‘Computing’ books published by ‘Prentice Hall’ (i.e. publisher) in the year 2017.
SELECT P.PUBLISHERNAME, C.PUBLISHERID, C.PUBLISHEDYEAR, C.TITLE
FROM CATALOUGE C INNER JOIN PUBLISHER P ON P.PUBLISHERID = C.PUBLISHERID
WHERE C.SUBJECTAREA = 'Computer' AND P.PUBLISHERNAME = 'Prentice Hall';


--viii.	List in ascending order of department number, then in alphabetical order of member names, 
--the details of all ‘inactive’ members.  
SELECT DEPTID, MEMBNAME
FROM MEMBER
WHERE BORROWED = 0
ORDER BY DEPTID ASC, MEMBNAME ASC;

--ix.	For each member with overdue books, list their details, the details of the overdue books
--as well as the fines incurred for each of those books. 
SELECT M.MEMBID, M.MEMBNAME, C.ISBN, C.TITLE, C.BOOKLANGUAGE, C.SUBJECTAREA, C. BOOKDESCRIPTION,
DATEDIFF(day, B.ActualReturnDate,B.ReturnDate)*LoanFees AS 'Overdue Fees'
FROM MEMBER M INNER JOIN BORROW B ON M.MEMBID = B.MembID INNER JOIN CATALOUGE C ON C.BookID = B.BookID 
INNER JOIN CATAGORY Ct ON C.STACK = C.STACK
WHERE DATEDIFF(day, B.Returndate, B.actualreturndate) > Ct.Loanperiod
ORDER BY M.MEMBID ASC;
