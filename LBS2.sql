--CREATING THE DATABASE
CREATE  DATABASE LIBRARY_SYSTEMs;
GO

--USING THE DATABASE
USE LIBRARY_SYSTEMs
Go


-- CREATING THE TABLES/ INSERTING DATA  INTO IT


--CREATING ‘DEPARTMENT’ TABLE
CREATE TABLE DEPARTMENT
	(DEPTID	NCHAR(10) PRIMARY KEY,
	 POSITION VARCHAR(50) NOT NULL);

GO

--INSERTING VALUES INTO DEPARTMENT TABLE
INSERT INTO DEPARTMENT VALUES('D001','Students');
INSERT INTO DEPARTMENT VALUES('D002','Lecturer');
INSERT INTO DEPARTMENT VALUES('D003','Admin');
INSERT INTO DEPARTMENT VALUES('D004','Librarian');
GO

--CREATING MEMBER TABLE
CREATE TABLE MEMBER
	(MEMBID NCHAR(10) PRIMARY KEY,
	 MEMBNAME VARCHAR(100) NOT NULL,
	 DEPTID NCHAR(10) NOT NULL
		REFERENCES DEPARTMENT(DEPTID) ,
	 MEMBEMAIL VARCHAR(100) NOT NULL,
	 BORROWED INTEGER NOT NULL);

GO

--INSERTING VALUES INTO MEMBER TABLE
INSERT INTO MEMBER VALUES('M001','Mariyam Zuhair','D001','TP052315@gmail.com',2);
INSERT INTO MEMBER VALUES('M002','Jamal','D001','TP052250@gmail.com',0);
INSERT INTO MEMBER VALUES('M003','Gulnar Fatima','D001','TP049962@outlook.com',1);
INSERT INTO MEMBER VALUES('M004','Jackson Steward','D001','TP048432@gmail.com',2);
INSERT INTO MEMBER VALUES('M005','James Bond','D003','TP040070@gmail.com',0);
INSERT INTO MEMBER VALUES('M006','Alex jones','D002','TP098765@gmail.com',0);
INSERT INTO MEMBER VALUES('M007','Thomas Ederson','D002','TP049987@yahoo.com',0);
INSERT INTO MEMBER VALUES('M008','Bruce mickel','D002','TP048834@gmail.com',0);
INSERT INTO MEMBER VALUES('M009','Anne Holder','D002','TP047783@gmail.com',0);
INSERT INTO MEMBER VALUES('M010','Jessica Parker','D004','TP047786@hotmail.com',0);	
GO

--CREATIGN AUTHOR TABLE
CREATE TABLE AUTHOR
	(AuthorID NCHAR(50) PRIMARY KEY,
	AUTHORNAME CHAR(50) NOT NULL,
	AUTHOREMAIL VARCHAR(100) NOT NULL);
GO

--INSERTING VALUES INTO AUTHOR TABLE
INSERT INTO AUTHOR VALUES ('A001','Thomas Connolly','thomas.connolly@gmail.com');
INSERT INTO AUTHOR VALUES ('A002','Ramez Elmasri','ramez.elmasri@gmail.com');
INSERT INTO AUTHOR VALUES ('A003','C.J. Date','CJ.Gate@gmail.com');
INSERT INTO AUTHOR VALUES ('A004','J.k.Rowling','JK.Rowling@hotmail.com');
INSERT INTO AUTHOR VALUES ('A005','Stephan King','Stephen_King@gmail.com');
INSERT INTO AUTHOR VALUES ('A006','Mark Manson','Mark.Wanson@gmai.com');
INSERT INTO AUTHOR VALUES ('A007','Philip Wadler','philip.wadler@gmail.com');
INSERT INTO AUTHOR VALUES ('A008','Richard S. Bird','richard.bird@gmail.com');
INSERT INTO AUTHOR VALUES ('A009','M. Joseph','m.joseph@gmail.com');
INSERT INTO AUTHOR VALUES ('A010','Mark Ryan','marrk.ryan@gmail.com');
INSERT INTO AUTHOR VALUES ('A011','Joseph Gallian','joseph.gallison@gmail.com');
INSERT INTO AUTHOR VALUES ('A012','Michael Spivak','micheal.spivak@gmail.com');
INSERT INTO AUTHOR VALUES ('A013','Fukagawa Hidetoshi','fukagwa.hidetoshi@gmail.com');
INSERT INTO AUTHOR VALUES ('A014','Martin Braun','martin.braun@gmail.com');
INSERT INTO AUTHOR VALUES ('A015','Timothy Gowers','timothy_gowers@gmail.com');
INSERT INTO AUTHOR VALUES ('A016','James Stuart Tanton','james_stuart_tanton@gmail.com');
INSERT INTO AUTHOR VALUES ('A017','Herbert Enderton','herbert.enderson@gmail.com');
INSERT INTO AUTHOR VALUES ('A018','John Stillwell','john.stillwell@gmail.com');
INSERT INTO AUTHOR VALUES ('A019','Sheldon Axler','sheldon.axler@gmail.com');
INSERT INTO AUTHOR VALUES ('A020','Bill W Tillery','bill.wtillery@gmail.com');
INSERT INTO AUTHOR VALUES ('A021','Andrew Biel','andrew.beil@gmail.com');
INSERT INTO AUTHOR VALUES ('A022','Judith E. Tintinalli','judith.etintinalli@gmail.com');
GO

--CREATING PUBLISHER TABLE
CREATE TABLE PUBLISHER
	(PUBLISHERID NCHAR(50) PRIMARY KEY,
	PUBLISHERNAME CHAR(50) NOT NULL,
	PUBLISHERADRESS CHAR(50) NOT NULL);

GO

--INSERTING VALUES INTO PUBLISHER TABLE
INSERT INTO PUBLISHER VALUES('P001','Prentice Hall','England');
INSERT INTO PUBLISHER VALUES('P002','HarperOne','Kenya');
INSERT INTO PUBLISHER VALUES('P003','Cambridge','UK');
INSERT INTO PUBLISHER VALUES('P004','Oxford','England');
INSERT INTO PUBLISHER VALUES('P005','Pearson Eductaion','United States of America');
INSERT INTO PUBLISHER VALUES('P006','Google Books','United States of America');
INSERT INTO PUBLISHER VALUES('P007','Brooks Cole','United States of America');
INSERT INTO PUBLISHER VALUES('P008',' Princeton University Press','United States of America');
INSERT INTO PUBLISHER VALUES('P009',' McGraw-Hill', 'London');
INSERT INTO PUBLISHER VALUES('P010','Information Science Reference','Austalia');
INSERT INTO PUBLISHER VALUES('P011','Cram101 Incorporated','Canada');
INSERT INTO PUBLISHER VALUES('P012','Books of Discovery','Maldives');
INSERT INTO PUBLISHER VALUES('P013','Addison-Wesley','Russia');
INSERT INTO PUBLISHER VALUES('P014','O"Reilly Media','Japan');

GO


--CREATING CATAGORY TABLE
CREATE TABLE CATAGORY
	(STACK CHAR(15) PRIMARY KEY,
	LOANPERIOD INTEGER NOT NULL,
	LOANFEES INTEGER NOT NULL);

GO

--INSERTING VALUES INTO CATAGORY TABLE
INSERT INTO CATAGORY VALUES ('Open',15, 1);
INSERT INTO CATAGORY VALUES ('Red ',0,0);
INSERT INTO CATAGORY VALUES ('Yellow',10,2);
INSERT INTO CATAGORY VALUES ('Green',30,2);
GO 



--CREATING BOOK TABLE
CREATE TABLE CATALOUGE
	(
		BOOKID NCHAR (50) Primary KEY,
		ISBN INTEGER NOT NULL,
		TITLE CHAR(100) NOT NULL,
		AUTHORID NCHAR(50) NOT NUll
			REFERENCES AUTHOR(AuthorID),		
		SUBJECTAREA CHAR(50) NOT NULL,
		BOOKLANGUAGE CHAR(25) NOT NULL,
		BOOK_STATUS CHAR(25) NOT NULL,
			--REFERENCES BOOKSTATUS(BOOK_STATUS),
		BOOKVOLUME INTEGER NOT NULL,
		STACK CHAR(15) NOT NULL
			REFERENCES CATAGORY(STACK),
		PUBLISHERID NCHAR(50) NOT NULL
			REFERENCES PUBLISHER(PUBLISHERID),
		PUBLISHEDYEAR DATE NOT NULL,
		BOOKDESCRIPTION VARCHAR(2000) NOT NULL);

GO


--INSERTING VALUES INTO BOOK TABLE
-- BOOKID, ISBN, TITLE, AUTHORID, SUBJECTAREA, BOOKLANGUAGE, BOOKSTATUS, BOOKVOLUME, STACK, PUBLISHERID, PUBLISHEDYEAR, BOOKDESCRIPTION
INSERT INTO CATALOUGE VALUES('B0001',999999999,'The subdtle art of not giving a f**k','A006','LIFE','ENGLISH','Loaned-Out',1,'Open','P002','2016','The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life is the second book by blogger and author Mark Manso'); 
INSERT INTO CATALOUGE VALUES('B0002',999999999,'The subdtle art of not giving a f**k','A006','LIFE','ENGLISH','Reserved',1,'Open','P002','2016','The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life is the second book by blogger and author Mark Manso'); 
INSERT INTO CATALOUGE VALUES('B0003',999999997,'Introduction to Functional Programming','A007','Computer','English','Available',1,'Open','P001','2017','Introduction to Functional Programming using Haskell has been thoroughly updated and revised to provide a complete grounding in the principles and techniques of programming with functions. The second edition uses the popular language Haskell to express functional programs.');
INSERT INTO CATALOUGE VALUES('B0004',999999996,'Introduction to Functional Programming','A007','Computer','English','Available',2,'Open','P001','2017','Introduction to Functional Programming using Haskell has been thoroughly updated and revised to provide a complete grounding in the principles and techniques of programming with functions. The second edition uses the popular language Haskell to express functional programs.');
INSERT INTO CATALOUGE VALUES('B0005',999999995,'Algebra of Programming','A008','Computer','English','Loaned-Out',2,'Yellow','P002','2017','Its main purpose is to show how to calculate programs');
INSERT INTO CATALOUGE VALUES('B0006',999999994,'Algebra of Programming','A008','Computer','English','Available',1,'Yellow','P002','2017','Its main purpose is to show how to calculate programs');
INSERT INTO CATALOUGE VALUES('B0007',999999993,'Real-time Systems: Specification','A009','Computer','English','Available',1,'Open','P006','2017','his text provides an account of real-time systems. The presentation makes use of recent research demonstrating the effectiveness and applicability of mathematically-based methods for real-time system design. Each chapter focuses on a particular technique, and examples help reinforce the theory');
INSERT INTO CATALOUGE VALUES('B0008',999999993,'Real-time Systems: Specification','A009','Computer','English','Available',1,'Open','P006','2017','his text provides an account of real-time systems. The presentation makes use of recent research demonstrating the effectiveness and applicability of mathematically-based methods for real-time system design. Each chapter focuses on a particular technique, and examples help reinforce the theory');
INSERT INTO CATALOUGE VALUES('B0009',999999991,'Calculus for dummies','A010','Mathematics','English','Available',1,'Open','P003','2015',' makes calculus manageable—even if you are one of the many students who sweat at the thought of it. By breaking down differentiation and integration into digestible concepts, this guide helps you build a stronger foundation with a solid understanding of the big ideas at work.');
INSERT INTO CATALOUGE VALUES('B0010',999999990,'Calculus for dummies','A010','Mathematics','English','Available',2,'Open','P003','2015',' makes calculus manageable—even if you are one of the many students who sweat at the thought of it. By breaking down differentiation and integration into digestible concepts, this guide helps you build a stronger foundation with a solid understanding of the big ideas at work.');
INSERT INTO CATALOUGE VALUES('B0011',999999989,'Contemporary Abstract Algebra','A011','Mathematics','English','Available',1,'Yellow','P007','2017','Contemporary Abstract Algebra 7/e provides a solid introduction to the traditional topics in abstract algebra while conveying to students that it is a contemporary subject used daily by working mathematicians, computer scientists, physicists, and chemists.');
INSERT INTO CATALOUGE VALUES('B0012',999999988,'Contemporary Abstract Algebra','A011','Mathematics','English','Available',2,'Yellow','P007','2017','Contemporary Abstract Algebra 7/e provides a solid introduction to the traditional topics in abstract algebra while conveying to students that it is a contemporary subject used daily by working mathematicians, computer scientists, physicists, and chemists.');
INSERT INTO CATALOUGE VALUES('B0013',999999987,'Calculus','A012','Mathematics','English','Available',1,'Green','P001','2016','Tenacious students in favor of stimulating study will love this book. Spivak’s prose is almost charming in the way that it thrusts readers into a challenge that advanced learners will be happy to take on.');
INSERT INTO CATALOUGE VALUES('B0014',999999986,'Calculus','A012','Mathematics','English','Available',2,'Green','P001','2016','Tenacious students in favor of stimulating study will love this book. Spivak’s prose is almost charming in the way that it thrusts readers into a challenge that advanced learners will be happy to take on.');
INSERT INTO CATALOUGE VALUES('B0015',999999985,'Sacred Mathematics:Japanese Temple Geometry','A013','Mathematics','English','Available',1,'Red','P008','2017',' In Sacred Mathematics, Hidetoshi and Rothman present a tantalizing and detailed history of Sangaku puzzles that will keep the reader engaged for many hours. For those who are unfamiliar with the subject, sangakus are Japanese geometrical puzzles that were created on wooden tablets and hung in sacred temples and shrines. Readers will discover how the Japanese cleverly intertwined the mathematical, the spiritual, and the artistic to create their own cultural brand of geometry.');
INSERT INTO CATALOUGE VALUES('B0016',999999984,'Sacred Mathematics:Japanese Temple Geometry','A013','Mathematics','English','Available',2,'Red','P008','2017',' In Sacred Mathematics, Hidetoshi and Rothman present a tantalizing and detailed history of Sangaku puzzles that will keep the reader engaged for many hours. For those who are unfamiliar with the subject, sangakus are Japanese geometrical puzzles that were created on wooden tablets and hung in sacred temples and shrines. Readers will discover how the Japanese cleverly intertwined the mathematical, the spiritual, and the artistic to create their own cultural brand of geometry.');
INSERT INTO CATALOUGE VALUES('B0017',999999983,'Differential Equations and Their Applications','A014','Mathematics','English','Available',1,'Open','P002','2016','This high-level text is clearly understandable and widely engaging. Braun runs through the pages of his book in a light, expertly written manner that will keep readers hooked for hours.');
INSERT INTO CATALOUGE VALUES('B0018',999999982,'Differential Equations and Their Applications','A014','Mathematics','English','Available',2,'Open','P002','2016','This high-level text is clearly understandable and widely engaging. Braun runs through the pages of his book in a light, expertly written manner that will keep readers hooked for hours.');
INSERT INTO CATALOUGE VALUES('B0019',999999981,'The Princeton Companion of Mathematics','A015','Mathematics','English','Available',1,'Red','P008','2015','This is an extraordinary book that every student and mathematician should absolutely have. The PCM carries the true signature of a math encyclopedia in that it is versatile and capable of being all things to all learners in every field of mathematics, and on all levels also. In light of its broad spectrum of topics, the editors have managed to keep this book cohesive and well knit together.');
INSERT INTO CATALOUGE VALUES('B0020',999999980,'The Princeton Companion of Mathematics','A015','Mathematics','English','Available',2,'Red','P008','2015','This is an extraordinary book that every student and mathematician should absolutely have. The PCM carries the true signature of a math encyclopedia in that it is versatile and capable of being all things to all learners in every field of mathematics, and on all levels also. In light of its broad spectrum of topics, the editors have managed to keep this book cohesive and well knit together.');
INSERT INTO CATALOUGE VALUES('B0021',999999979,'Encyclopedia of Mathematics','A016','Mathematics','English','Available',1,'Yellow','P005','2017','This awesome reference gives math lovers exactly what they want from a math encyclopedia. Those who want to quickly search and learn about a particular topic without unneeded rambling from the author or unsatisfactory terseness, will find a trustworthy companion in Tanton’s aptly named work.');
INSERT INTO CATALOUGE VALUES('B0022',999999978,'Encyclopedia of Mathematics','A016','Mathematics','English','Reserved',2,'Yellow','P005','2017','This awesome reference gives math lovers exactly what they want from a math encyclopedia. Those who want to quickly search and learn about a particular topic without unneeded rambling from the author or unsatisfactory terseness, will find a trustworthy companion in Tanton’s aptly named work.');
INSERT INTO CATALOUGE VALUES('B0023',999999977,'A Mathematical Introduction to Logic','A017','Mathematics','English','Available',1,'Green','P002','2018','This is one of the finest introductory texts on logic that any student can read. Enderton is cohesive in his explanations and skillfully covers all the essential bases, from number theory to first and second order logic as well as several theorems, including Godel’s. While not a mandatory requirement, it is highly recommended that the reader has a slight understanding of math logic.');
INSERT INTO CATALOUGE VALUES('B0024',999999976,'A Mathematical Introduction to Logic','A017','Mathematics','English','Available',2,'Green','P002','2018','This is one of the finest introductory texts on logic that any student can read. Enderton is cohesive in his explanations and skillfully covers all the essential bases, from number theory to first and second order logic as well as several theorems, including Godel’s. While not a mandatory requirement, it is highly recommended that the reader has a slight understanding of math logic.');
INSERT INTO CATALOUGE VALUES('B0025',999999975,'The Four Pillars of Geometry','A018','Matehmatics','English','Available',1,'Open','P003','2016','This is a beautifully written book that will help students connect the dots between four differing viewpoints in geometry. These four “pillars”, as Stillwell refers to them, are: straightedge and compass constructions, linear algebra, projective geometry and transformation groups. This book will help the reader develop a stronger appreciation for geometry and its unique ability to be approached at different angles – an exciting trait which ultimately enables students to strengthen their overall knowledge of the subject.');
INSERT INTO CATALOUGE VALUES('B0026',999999974,'The Four Pillars of Geometry','A018','Matehmatics','English','Reserved',2,'Open','P003','2016','This is a beautifully written book that will help students connect the dots between four differing viewpoints in geometry. These four “pillars”, as Stillwell refers to them, are: straightedge and compass constructions, linear algebra, projective geometry and transformation groups. This book will help the reader develop a stronger appreciation for geometry and its unique ability to be approached at different angles – an exciting trait which ultimately enables students to strengthen their overall knowledge of the subject.');
INSERT INTO CATALOUGE VALUES('B0027',999999973,'Linear Algebra Done Right','A019','Mathematics','English','Available',1,'Yellow','P007','2012','This is an exemplary book requiring a small level of mathematical maturity. Axler takes a thoughtful and theoretical approach to the work. He skillfully takes the focus off from matrices and shifts the reader’s attention more towards linear mappings.'); 
INSERT INTO CATALOUGE VALUES('B0028',999999972,'Linear Algebra Done Right','A019','Mathematics','English','Available',2,'Yellow','P007','2012','This is an exemplary book requiring a small level of mathematical maturity. Axler takes a thoughtful and theoretical approach to the work. He skillfully takes the focus off from matrices and shifts the reader’s attention more towards linear mappings.'); 
INSERT INTO CATALOUGE VALUES('B0029',999999971,'Physical Science','A020','Science','English','Loaned-Out',1,'Open','P009','2015','One or two-semester introductory science course for non-scientists AND for nonscience majors, covering physics, chemistry, astronomy, and earth sciences.'); 
INSERT INTO CATALOUGE VALUES('B0030',999999970,'Physical Science','A020','Science','English','Available',2,'Open','P009','2015','One or two-semester introductory science course for non-scientists AND for nonscience majors, covering physics, chemistry, astronomy, and earth sciences.'); 
INSERT INTO CATALOUGE VALUES('B0031',999999969,'Trail Guide to the Body: How to Locate Muscles, Bones and More','A021','Science','English','Available',1,'Yellow','P012','2014','Before you can assess or treat a muscle, you first must be able to locate it. This acclaimed book delivers beautifully illustrated information for learning palpation and the musculoskeletal system. It makes mastering the essential manual therapy skills interesting, memorable and easy.');
INSERT INTO CATALOUGE VALUES('B0032',999999968,'Trail Guide to the Body: How to Locate Muscles, Bones and More','A021','Science','English','Available',2,'Yellow','P012','2014','Before you can assess or treat a muscle, you first must be able to locate it. This acclaimed book delivers beautifully illustrated information for learning palpation and the musculoskeletal system. It makes mastering the essential manual therapy skills interesting, memorable and easy.');
INSERT INTO CATALOUGE VALUES('B0033',999999967,'Tintinallis Emergency Medicine: A Comprehensive Study Guide','A022','Science','English','Available',1,'Green','P009','2015','It provides the depth and breadth of coverage that reflects the complexity and expertise needed to practice emergency medicine successfully in today’s fast–paced environments. It is an important contemporary clinical emergency care resource for physicians, NPs, and PAs who practice emergency medicine and for emergency medicine and pediatric emergency medicine fellows. It remains the preferred study guide for in-training and board examinations and recertification.');
INSERT INTO CATALOUGE VALUES('B0034',999999966,'Tintinallis Emergency Medicine: A Comprehensive Study Guide','A022','Science','English','Available',2,'Green','P009','2015','It provides the depth and breadth of coverage that reflects the complexity and expertise needed to practice emergency medicine successfully in today’s fast–paced environments. It is an important contemporary clinical emergency care resource for physicians, NPs, and PAs who practice emergency medicine and for emergency medicine and pediatric emergency medicine fellows. It remains the preferred study guide for in-training and board examinations and recertification.');
INSERT INTO CATALOUGE VALUES('B0035',999999965,'Business Database Systems','A001','Databases','English','Available',1,'Open','P013','2008','Business Database Systems arms you with the knowledge to analyse, design and implement effective, robust and successful databases. This book is ideal for students of Business/Management Information Systems, or Computer Science, who will be expected to take a course in database systems for their degree programme. It is also excellently suited to any practitioner who needs to learn, or refresh their knowledge of, the essentials of database management systems.');
INSERT INTO CATALOUGE VALUES('B0036',999999964,'Business Database Systems','A001','Databases','English','Available',2,'Open','P013','2008','Business Database Systems arms you with the knowledge to analyse, design and implement effective, robust and successful databases. This book is ideal for students of Business/Management Information Systems, or Computer Science, who will be expected to take a course in database systems for their degree programme. It is also excellently suited to any practitioner who needs to learn, or refresh their knowledge of, the essentials of database management systems.');
INSERT INTO CATALOUGE VALUES('B0037',999999963,'A Step-by-step Approach to Design and Implementation','A001','Databases/Engineering','English','Available',1,'Yellow','P013','2000','Offers a framework for the analysis, design and implementation of a database, describing the development process in a non-technical manner. The relational database management system (RDMS) methodology consists of two phases -- the logical database design phase (modeling) and the physical database design phase.');
INSERT INTO CATALOUGE VALUES('B0038',999999962,'A Step-by-step Approach to Design and Implementation','A001','Databases/Engineering','English','Available',2,'Yellow','P013','2000','Offers a framework for the analysis, design and implementation of a database, describing the development process in a non-technical manner. The relational database management system (RDMS) methodology consists of two phases -- the logical database design phase (modeling) and the physical database design phase.');
INSERT INTO CATALOUGE VALUES('B0039',999999961,'Database Systems: A Practical Approach to Design, Implementation, and Management','A001','Databases','English','Available',1,'Red','P013','1996','Adopting a pragmatic approach to database systems, with an emphasis on design, this work integrates a central case study throughout. It details a step-by-step methodology and teaches readers how to apply this to design and build applications using leading commercial PC and mainframe database systems.');
INSERT INTO CATALOUGE VALUES('B0040',999999960,'Database Systems: A Practical Approach to Design, Implementation, and Management','A001','Databases','English','Available',2,'Red','P013','1996','Adopting a pragmatic approach to database systems, with an emphasis on design, this work integrates a central case study throughout. It details a step-by-step methodology and teaches readers how to apply this to design and build applications using leading commercial PC and mainframe database systems.');
INSERT INTO CATALOUGE VALUES('B0041',999999959,'Outlines and Highlights for Database Systems','A001','Databases','English','Reserved',1,'Green','P011','2009','Never HIGHLIGHT a Book Again! Virtually all of the testable terms, concepts, persons, places, and events from the textbook are included. ');
INSERT INTO CATALOUGE VALUES('B0042',999999958,'Outlines and Highlights for Database Systems','A001','Databases','English','Available',2,'Green','P011','2009','Never HIGHLIGHT a Book Again! Virtually all of the testable terms, concepts, persons, places, and events from the textbook are included. ');
INSERT INTO CATALOUGE VALUES('B0043',999999957,'Psychology, Pedagogy and Assesment in Serious Games','A001','Games','English','Available',1,'Red','P010','2014','As the widespread use of digital entertainment has changed not only the ways in which we spend our leisure time but also how we learn and communicate, Serious Games have emerged as an effective tool for the purpose of learning, skill acquisition, and training.');
INSERT INTO CATALOUGE VALUES('B0044',999999956,'Psychology, Pedagogy and Assesment in Serious Games','A001','Games','English','Available',2,'Red','P010','2014','As the widespread use of digital entertainment has changed not only the ways in which we spend our leisure time but also how we learn and communicate, Serious Games have emerged as an effective tool for the purpose of learning, skill acquisition, and training.');
INSERT INTO CATALOUGE VALUES('B0045',999999955,'Fundamentals of Database Systems: Pearson New International Edition','A002','Databases','English','Available',1,'Yellow','P005','2013','Clear explanations of theory and design, broad coverage of models and real systems, and an up-to-date introduction to modern database technologies result in a leading introduction to database systems. Intended for computer science majors, this text emphasizes math models, design issues, relational algebra, and relational calculus.');
INSERT INTO CATALOUGE VALUES('B0046',999999954,'Fundamentals of Database Systems: Pearson New International Edition','A002','Databases','English','Available',2,'Yellow','P005','2013','Clear explanations of theory and design, broad coverage of models and real systems, and an up-to-date introduction to modern database technologies result in a leading introduction to database systems. Intended for computer science majors, this text emphasizes math models, design issues, relational algebra, and relational calculus.');
INSERT INTO CATALOUGE VALUES('B0047',999999953,'Operating Systems: A Spiral Approach','A002','Computers','English','Available',1,'Open','P009','2010','It helps students approach the more difficult aspects of operating systems with confidence. While operating systems have changed dramatically over the years, most OS books use a linear approach that covers each individual OS component in depth, which is difficult for students to follow and requires instructors to constantly put materials in context.');
INSERT INTO CATALOUGE VALUES('B0048',999999952,'Operating Systems: A Spiral Approach','A002','Computers','English','Loaned-Out',2,'Open','P009','2010','It helps students approach the more difficult aspects of operating systems with confidence. While operating systems have changed dramatically over the years, most OS books use a linear approach that covers each individual OS component in depth, which is difficult for students to follow and requires instructors to constantly put materials in context.');
INSERT INTO CATALOUGE VALUES('B0049',999999951,'Relational Theory for Computer Professionals: What Relational Databases Are Really All About','A003','Databases','English','Available',1,'Red','P014','2013','All of today{u2019}s mainstream database products support the SQL language, and relational theory is what SQL is supposed to be based on. But are those products truly relational? Sadly, the answer is no. This book shows you what a real relational product would be like, and how and why it would be so much better than what{u2019}s currently available.');
INSERT INTO CATALOUGE VALUES('B0050',999999950,'Relational Theory for Computer Professionals: What Relational Databases Are Really All About','A003','Databases','English','Available',2,'Red','P014','2013','All of today{u2019}s mainstream database products support the SQL language, and relational theory is what SQL is supposed to be based on. But are those products truly relational? Sadly, the answer is no. This book shows you what a real relational product would be like, and how and why it would be so much better than what{u2019}s currently available.');
INSERT INTO CATALOUGE VALUES('B0051',999999949,'Database in Depth: Relational Theory for Practitioners','A003','Databases','English','Available',1,'Green','P014','2005','This book sheds light on the principles behind the relational model, which is fundamental to all database-backed applications--and, consequently, most of the work that goes on in the computing world today. Database in Depth.');
INSERT INTO CATALOUGE VALUES('B0052',999999948,'Database in Depth: Relational Theory for Practitioners','A003','Databases','English','Loaned-Out',2,'Green','P014','2005','This book sheds light on the principles behind the relational model, which is fundamental to all database-backed applications--and, consequently, most of the work that goes on in the computing world today. Database in Depth.');
GO


--CREATING BORROW TABLE
CREATE TABLE BORROW
	( 
	
	MEMBID NCHAR(10) NOT NULL
		REFERENCES MEMBER(MEMBID),	
	BOOKID NCHAR(50) NOT NULL
		REFERENCES CATALOUGE(BOOKID),
	PRIMARY KEY (MEMBID, BOOKID),
	ReturnDate DATE NOT NULL,
	ActualReturnDate DATE NULL);

GO


--INSERTING VALUES INTO BORROW TABLE
INSERT INTO BORROW VALUES('M001','B0001','2015-11-13','2015-11-15');
INSERT INTO BORROW VALUES('M001','B0005','2016-11-13','2016-11-15');
INSERT INTO BORROW VALUES('M003','B0029','2017-09-28','2017-10-03');
INSERT INTO BORROW VALUES('M004','B0048','2018-01-25','2018-3-23');
INSERT INTO BORROW VALUES('M004','B0052','2018-01-25','2018-9-30');
GO


--CREATING RESERVE TABLE
CREATE TABLE RESERVE
	(
	MEMBID NCHAR(10) NOT NULL
		REFERENCES MEMBER(MEMBID),
	BOOKID NCHAR(50) NOT NULL
		REFERENCES CATALOUGE(BOOKID),
	PRIMARY KEY (MEMBID, BOOKID));

GO


--INSERTING VALUES INTO RESERVE TABLE
INSERT INTO RESERVE VALUES ('M001','B0002');
INSERT INTO RESERVE VALUES ('M003','B0022');
INSERt INTO RESERVE VALUES ('M004','B0041');
INSERT INTO RESERVE VALUES ('M010','B0026');
--
GO



--CREATE TABLE BOOKSTATUS
	(BOOK_STATUS CHAR(25) PRIMARY KEY,
	BOOKID CHAR(50) NOT NULL
		REFERENCES BOOK(BOOKID)
	);

INSERT INTO BOOKS VALUES('Loaned-out','B0001');
INSERT INTO BOOKS VALUES('Reserved','B0002');
INSERT INTO BOOKS VALUES('Available','B0003');
INSERT INTO BOOKS VALUES('B004',999999998,'Available');
INSERT INTO BOOKS VALUES('B005',999999997,'Loan-out');
INSERT INTO BOOKS VALUES('B006',999999997,'Available');
INSERT INTO BOOKS VALUES('B007',999999996,'Available');
INSERT INTO BOOKS VALUES('B008',999999996,'Available');
INSERT INTO BOOKS VALUES('B009',999999995,'Available');
INSERT INTO BOOKS VALUES('B010',999999995,'Available');
INSERT INTO BOOKS VALUES('B011',999999994,'Available');
INSERT INTO BOOKS VALUES('B012',999999994,'Available');
INSERT INTO BOOKS VALUES('B013',999999993,'Available');
INSERT INTO BOOKS VALUES('B014',999999993,'Available');
INSERT INTO BOOKS VALUES('B015',999999992,'Available');
INSERT INTO BOOKS VALUES('B016',999999992,'Available');
INSERT INTO BOOKS VALUES('B017',999999991,'Available');
INSERT INTO BOOKS VALUES('B018',999999991,'Available');
INSERT INTO BOOKS VALUES('B019',999999990,'Available');
INSERT INTO BOOKS VALUES('B020',999999990,'Available');
INSERT INTO BOOKS VALUES('B021',999999989,'Reserved');
INSERT INTO BOOKS VALUES('B022',999999989,'Available');
INSERT INTO BOOKS VALUES('B023',999999988,'Available');
INSERT INTO BOOKS VALUES('B024',999999988,'Available');
INSERT INTO BOOKS VALUES('B025',999999987,'Available');
INSERT INTO BOOKS VALUES('B026',999999987,'Available');
INSERT INTO BOOKS VALUES('B027',999999986,'Available');
INSERT INTO BOOKS VALUES('B028',999999986,'Available');
INSERT INTO BOOKS VALUES('B029',999999985,'Available');
INSERT INTO BOOKS VALUES('B030',999999985,'Available');
INSERT INTO BOOKS VALUES('B031',999999984,'Available');
INSERT INTO BOOKS VALUES('B032',999999984,'AVAILABLE');
INSERT INTO BOOKS VALUES('B033',999999983,'Available');
INSERT INTO BOOKS VALUES('B034',999999983,'Available');
INSERT INTO BOOKS VALUES('B035',999999982,'Available');
INSERT INTO BOOKS VALUES('B036',999999982,'Available');
INSERT INTO BOOKS VALUES('B037',999999981,'Available');
INSERT INTO BOOKS VALUES('B038',999999981,'Available');
INSERT INTO BOOKS VALUES('B039',999999980,'Available');
INSERT INTO BOOKS VALUES('B040',999999980,'Available');
INSERT INTO BOOKS VALUES('B041',999999979,'Available');
INSERT INTO BOOKS VALUES('B042',999999979,'Available');
INSERT INTO BOOKS VALUES('B043',999999978,'Available');
INSERT INTO BOOKS VALUES('B044',999999978,'Available');
INSERT INTO BOOKS VALUES('B045',999999977,'Available');
INSERT INTO BOOKS VALUES('B046',999999977,'Available');
INSERT INTO BOOKS VALUES('B047',999999976,'Available');
INSERT INTO BOOKS VALUES('B048',999999976,'Available');
INSERT INTO BOOKS VALUES('B049',999999975,'Available');
INSERT INTO BOOKS VALUES('B050',999999975,'Available');
INSERT INTO BOOKS VALUES('B051',999999974,'Available');
INSERT INTO BOOKS VALUES('B052',999999974,'Available');
INSERT INTO BOOKS VALUES('B053',999999973,'Available');
INSERT INTO BOOKS VALUES('B054',999999973,'Available');
INSERT INTO BOOKS VALUES('B055',999999972,'Available');
INSERT INTO BOOKS VALUES('B056',999999972,'Available');
INSERT INTO BOOKS VALUES('B057',999999971,'Available');
INSERT INTO BOOKS VALUES('B058',999999971,'Available');
INSERT INTO BOOKS VALUES('B059',999999970,'Available');
INSERT INTO BOOKS VALUES('B060',999999970,'Available');
INSERT INTO BOOKS VALUES('B061',999999969,'Available');
INSERT INTO BOOKS VALUES('B062',999999969,'Available');
INSERT INTO BOOKS VALUES('B063',999999968,'Available');
INSERT INTO BOOKS VALUES('B064',999999968,'Available');
INSERT INTO BOOKS VALUES('B065',999999967,'Available');
INSERT INTO BOOKS VALUES('B066',999999967,'Available');
INSERT INTO BOOKS VALUES('B067',999999966,'Available');
INSERT INTO BOOKS VALUES('B068',999999966,'Available');
INSERT INTO BOOKS VALUES('B069',999999965,'Available');
INSERT INTO BOOKS VALUES('B070',999999965,'Available');
INSERT INTO BOOKS VALUES('B071',999999964,'Available');
INSERT INTO BOOKS VALUES('B072',999999964,'Available');
INSERT INTO BOOKS VALUES('B073',999999963,'Available');
INSERT INTO BOOKS VALUES('B074',999999963,'Available');
INSERT INTO BOOKS VALUES('B075',999999962,'Available');
INSERT INTO BOOKS VALUES('B076',999999962,'Available');
INSERT INTO BOOKS VALUES('B077',999999961,'Available');
INSERT INTO BOOKS VALUES('B078',999999961,'Available');
INSERT INTO BOOKS VALUES('B079',999999960,'Reserved');
INSERT INTO BOOKS VALUES('B080',999999960,'Available');
INSERT INTO BOOKS VALUES('B081',999999959,'Available');
INSERT INTO BOOKS VALUES('B082',999999959,'Available');
INSERT INTO BOOKS VALUES('B083',999999958,'Available');
INSERT INTO BOOKS VALUES('B084',999999958,'Available');
INSERT INTO BOOKS VALUES('B085',999999957,'Loan-out');
INSERT INTO BOOKS VALuES('B086',999999957,'AVailable');
INSERT INTO BOOKS VALUES('B087',999999956,'Loan-out');
INSERT INTO BOOKS VALUES('B088',999999956,'Available');
INSERT INTO BOOKS VALUES('B089',999999955,'Available');
INSERT INTO BOOKS VALUES('B090',999999955,'Available');
INSERT INTO BOOKS VALUES('B091',999999954,'Loan-out');
INSERT INTO BOOKS VALUES('B092',999999954,'Available');
INSERT INTO BOOKS VALUES('B093',999999953,'Available');
INSERT INTO BOOKS VALUES('B094',999999953,'Reserved');
INSERT INTO BOOKS VALUES('B095',999999952,'Available');
INSERT INTO BOOKS VALUES('B096',999999952,'Available');
INSERT INTO BOOKS VALUES('B097',999999951,'Available');
INSERT INTO BOOKS VALUES('B098',999999951,'Reserved');
INSERT INTO BOOKS VALUES('B099',999999950,'Available');
INSERT INTO BOOKS VALUES('B100',999999950,'Available');
INSERT INTO BOOKS VALUES('B101',999999949,'Available');
INSERT INTO BOOKS VALUES('B102',999999949,'Available');
INSERT INTO BOOKS VALUES('B103',999999948,'Available');
INSERT INTO BOOKS VALUES('B104',999999948,'Loan-out');
GO