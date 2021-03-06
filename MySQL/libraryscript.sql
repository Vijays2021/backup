CREATE TABLE AUTHOR(AUTHOR_ID CHAR(5) PRIMARY KEY,
                    AUTHOR_NAME VARCHAR(45));
CREATE TABLE MEMBER(MEMBER_ID CHAR(5) PRIMARY KEY,
                    MEMBER_NAME VARCHAR(45),
                    MEMBER_DEPT VARCHAR(30),
                    MEMBER_DOJ DATE,
                    STATUS VARCHAR(8) CHECK(STATUS IN('ACTIVE','INACTIVE')));
CREATE TABLE PUBLISHER(PUBLISHER_ID CHAR(5) PRIMARY KEY,
                       PUBLISHER_NAME VARCHAR(45));
CREATE TABLE BOOK(BOOK_ID CHAR(5) PRIMARY KEY,
                  TITLE VARCHAR(40),
                  CATEGORY VARCHAR(20),
                  COPYNO numeric(3),
                  CONSTRAINT COM_UN UNIQUE(TITLE,COPYNO),
                  AUTHOR_ID CHAR(5) REFERENCES AUTHOR(AUTHOR_ID),
                  PUBLISHER_ID CHAR(5) REFERENCES PUBLISHER(PUBLISHER_ID),
                  EDITION numeric(3),
                  YEAR_OF_PUBLISHING numeric(6),
                  PRICE numeric(9,2),
                  RACKNO numeric(6));
CREATE TABLE BOOK_TRANSACTION(BOOK_ID CHAR(5) REFERENCES BOOK(BOOK_ID),
                              MEMBER_ID CHAR(5) REFERENCES MEMBER(MEMBER_ID),
                              ISSUE_DATE DATE,
                              DUE_DATE DATE,
                              RETURN_DATE DATE,
                              CONSTRAINT C_P PRIMARY KEY(BOOK_ID,MEMBER_ID,ISSUE_DATE));

INSERT INTO AUTHOR VALUES('A001','BALAGURUSAMY');

INSERT INTO AUTHOR VALUES('A002','CHAND');

INSERT INTO AUTHOR VALUES('A003','SINGARAVELU');

INSERT INTO AUTHOR VALUES('A004','CHARULATHA');

INSERT INTO AUTHOR VALUES('A005','MANIKANDAN');

INSERT INTO AUTHOR VALUES('A006','BALAJI');


INSERT INTO PUBLISHER VALUES('P001','EXCELLENT');

INSERT INTO PUBLISHER VALUES('P002','CREATIONS');

INSERT INTO PUBLISHER VALUES('P003','BOOKWORLD');


INSERT INTO MEMBER VALUES('M001','PRIYA','TRG','2005-03-22','ACTIVE');

INSERT INTO MEMBER VALUES('M002','MADHAN','TRG','2003-07-13','ACTIVE');

INSERT INTO MEMBER VALUES('M003','BHUVANA','DEVPMT','2009-12-08','INACTIVE');

INSERT INTO MEMBER VALUES('M004','SNEHA','TESTING','2005-08-17','ACTIVE');

INSERT INTO MEMBER VALUES('M005','YOGA','DEVPMT','2002-09-25','ACTIVE');

INSERT INTO MEMBER VALUES('M006','AMBIGA','TRG','2010-01-10','ACTIVE');

INSERT INTO MEMBER VALUES('M007','HEMA','TESTING','2006-10-15','ACTIVE');


INSERT INTO BOOK VALUES('B001','ORACLE COMPLETE REFERENCE','RDBMS',1,'A001','P001',1,1995,350,101);

INSERT INTO BOOK VALUES('B002','ORACLE COMPLETE REFERENCE','RDBMS',2,'A003','P002',2,1998,400,101);

INSERT INTO BOOK VALUES('B003','ORACLE COMPLETE REFERENCE','RDBMS',3,'A001','P001',3,2000,600,101);

INSERT INTO BOOK VALUES('B004','LET US C','PROGRAMMING',1,'A002','P003',1,1992,250,102);

INSERT INTO BOOK VALUES('B005','LET US C','PROGRAMMING',2,'A002','P001',2,1993,400,102);

INSERT INTO BOOK VALUES('B006','LET UC C++','PROGRAMMING',1,'A004','P003',1,1994,300,102);

INSERT INTO BOOK VALUES('B007','LET UC C++','PROGRAMMING',2,'A003','P003',2,2000,500,102);

INSERT INTO BOOK VALUES('B008','LET UC C++','PROGRAMMING',3,'A004','P003',3,2001,550,102);

INSERT INTO BOOK VALUES('B009','JAVA COMPLETE REFERENCE','PROGRAMMING',1,'A001','P001',1,1993,450,102);

INSERT INTO BOOK VALUES('B010','JAVA COMPLETE REFERENCE','PROGRAMMING',2,'A001','P002',2,2000,500,102);

INSERT INTO BOOK VALUES('B011','JAVA COMPLETE REFERENCE','PROGRAMMING',3,'A002','P002',3,2004,550,102);

INSERT INTO BOOK VALUES('B012','JAVA COMPLETE REFERENCE','PROGRAMMING',4,'A005','P003',4,2005,700,102);

INSERT INTO BOOK VALUES('B013','DOTNET FOR BEGINNERS','PROGRAMMING',1,'A001','P003',1,2009,500,102);

INSERT INTO BOOK VALUES('B014','UNIX','OS',1,'A005','P001',1,2001,300,103);

INSERT INTO BOOK VALUES('B015','UNIX','OS',2,'A002','P001',2,2004,400,103);


INSERT INTO BOOK_TRANSACTION VALUES('B001','M001','2010-12-08','2010-12-04','2010-12-12');

INSERT INTO BOOK_TRANSACTION VALUES('B003','M006','2010-01-18','2010-01-23','2009-01-24');

INSERT INTO BOOK_TRANSACTION VALUES('B004','M002','2007-09-23','2007-09-28','2007-09-29');

INSERT INTO BOOK_TRANSACTION VALUES('B007','M001','2010-03-02','2010-03-07','2010-03-03');

INSERT INTO BOOK_TRANSACTION VALUES('B008','M002','2006-10-20','2006-10-25','2006-10-30');

INSERT INTO BOOK_TRANSACTION VALUES('B010','M004','2008-04-12','2008-04-17','2008-04-15');

INSERT INTO BOOK_TRANSACTION VALUES('B015','M001','2010-05-19','2010-05-24','2010-05-28');

INSERT INTO BOOK_TRANSACTION VALUES('B016','M001','2003-10-19','2003-10-24','2003-10-28');

INSERT INTO BOOK_TRANSACTION VALUES('B017','M001','2003-11-19','2003-11-24','2003-11-28');

delete from book_transaction where book_id = 'B015'

COMMIT;
