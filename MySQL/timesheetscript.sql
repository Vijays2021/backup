CREATE 
TABLE
SKILL
(
SKILL_ID     VARCHAR(10) PRIMARY KEY,
SKILL_NAME   VARCHAR(25)
);
 


CREATE 
TABLE
DEPARTMENT
(
DEPT_ID     VARCHAR(10) PRIMARY KEY,
DEPT_NAME   VARCHAR(25),
DEPT_LOCATION    VARCHAR(25)
);




CREATE 
TABLE
EMPLOYEE
(
EMP_ID     VARCHAR(10) PRIMARY KEY,
EMP_NAME   VARCHAR(25),
HIRE_DATE  DATE,
SALARY     NUMERIC(5),
MGR_ID     VARCHAR(10),
DEPT_ID    VARCHAR(10),
MOBILE_NO  NUMERIC(10) UNIQUE,
CASUAL_LEAVE   NUMERIC(3),
SICK_LEAVE      NUMERIC(3),
PRIVILEGE_LEAVE  NUMERIC(3),
CONSTRAINT DEPT_DID_FK FOREIGN KEY(DEPT_ID)REFERENCES DEPARTMENT(DEPT_ID),
CONSTRAINT EMPLOYEE_MGR_FK FOREIGN KEY(MGR_ID)REFERENCES EMPLOYEE(EMP_ID)
);



CREATE 
TABLE
MOBILERECHARGE
(
TRANS_ID     VARCHAR(10)  PRIMARY KEY,
MOBILE_NO    NUMERIC(10)  REFERENCES EMPLOYEE(MOBILE_NO),
AMOUNT       NUMERIC(5),
DATE_OF_REC  DATE
);



CREATE 
TABLE
EMPLOYEESKILL
(
EMP_ID     VARCHAR(10),
SKILL_ID   VARCHAR(10),
CONSTRAINT EMPSKILL_EID_FK FOREIGN KEY(EMP_ID)REFERENCES EMPLOYEE(EMP_ID),
CONSTRAINT SKILL_SID_FK FOREIGN KEY(SKILL_ID)REFERENCES SKILL(SKILL_ID)
);



CREATE 
TABLE
ROLE
(
ROLE_ID     VARCHAR(10) PRIMARY KEY,
ROLE_TITLE   VARCHAR(25)
);



CREATE 
TABLE
T_PROJECT
(
PROJECT_ID     VARCHAR(10) PRIMARY KEY,
PROJECT_NAME   VARCHAR(25),
CLIENT_NAME    VARCHAR(25),
DEADLINE       DATE
);




CREATE 
TABLE
ALLOCATION
(
EMP_ID       VARCHAR(10),
PROJECT_ID   VARCHAR(10),
ROLE_ID      VARCHAR(10),
FROM_DATE    DATE,
TO_DATE      DATE,
AMOUNT_PER_DAY NUMERIC(6),
CONSTRAINT ALLOC_CPK PRIMARY KEY(EMP_ID,PROJECT_ID,ROLE_ID,FROM_DATE),
CONSTRAINT ALLOC_EID_FK FOREIGN KEY(EMP_ID)REFERENCES EMPLOYEE(EMP_ID),
CONSTRAINT ALLOC_PID_FK FOREIGN KEY(PROJECT_ID)REFERENCES T_PROJECT(PROJECT_ID),
CONSTRAINT ALLOC_RID_FK FOREIGN KEY(ROLE_ID)REFERENCES ROLE(ROLE_ID)
);





INSERT INTO SKILL VALUES('S01','C');
INSERT INTO SKILL VALUES('S02','C++');
INSERT INTO SKILL VALUES('S03','JAVA');
INSERT INTO SKILL VALUES('S04','SQL');
INSERT INTO SKILL VALUES('S05','PL/SQL');
INSERT INTO SKILL VALUES('S06','MAINFRAMES');
INSERT INTO SKILL VALUES('S07','.NET');
INSERT INTO SKILL VALUES('S08','PHP');
INSERT INTO SKILL VALUES('S09','TESTING');
INSERT INTO SKILL VALUES('S10','DB2');



INSERT INTO DEPARTMENT VALUES('D01','ADMINISTRATION','CHENNAI');
INSERT INTO DEPARTMENT VALUES('D02','TRAINING','CHENNAI');
INSERT INTO DEPARTMENT VALUES('D03','PROJECTS','CHENNAI');
INSERT INTO DEPARTMENT VALUES('D04','ACCOUNTS','CHENNAI');
INSERT INTO DEPARTMENT VALUES('D05','DESIGNING','CHENNAI');
INSERT INTO DEPARTMENT VALUES('D06','DEVELOPMENT','CHENNAI');
INSERT INTO DEPARTMENT VALUES('D07','RESEARCH','CHENNAI');


INSERT INTO EMPLOYEE VALUES('E01','mahesh','2006-01-06',25000,'E01','D01',8144538983,3,2,10);
INSERT INTO EMPLOYEE VALUES('E02','rajasekhar','2007-06-01',27000,'E01','D02',9944539983,2,4,10);
INSERT INTO EMPLOYEE VALUES('E03','raja','2009-06-15',27000,'E01','D02',9966539983,2,3,10);
INSERT INTO EMPLOYEE VALUES('E04','ambhani','2009-08-15',27000,'E02','D04',9254539983,2,3,10);
INSERT INTO EMPLOYEE VALUES('E05','mukesh','2010-10-16',21000,'E02','D05',9290539983,2,3,10);
INSERT INTO EMPLOYEE VALUES('E06','anil','2011-09-16',2000,'E03','D06',8854530983,4,5,10);
INSERT INTO EMPLOYEE VALUES('E07','abhi','2012-09-06',20000,'E04','D04',9247530983,4,5,10);
INSERT INTO EMPLOYEE VALUES('E08','guna','2013-01-06',20000,'E05','D06',9368530983,4,5,10);
INSERT INTO EMPLOYEE VALUES('E09','sowmya','2013-04-1',20000,'E05','D07',9414530983,4,3,10);
INSERT INTO EMPLOYEE VALUES('E10','anjali','2013-02-14',20000,'E06','D03',9314530983,4,3,10);


INSERT INTO MOBILERECHARGE VALUES('T01',8144538983,300,'2007-01-01');
INSERT INTO MOBILERECHARGE VALUES('T02',9944539983,30,'2008-06-13');
INSERT INTO MOBILERECHARGE VALUES('T03',9966539983,200,'2010-01-15');
INSERT INTO MOBILERECHARGE VALUES('T04',9254539983,50,'2011-07-15');
INSERT INTO MOBILERECHARGE VALUES('T05',9290539983,100,'2012-09-21');
INSERT INTO MOBILERECHARGE VALUES('T06',8854530983,150,'2013-01-01');
INSERT INTO MOBILERECHARGE VALUES('T07',9247530983,249,'2013-02-06');
INSERT INTO MOBILERECHARGE VALUES('T08',9368530983,250,'2013-05-01');
INSERT INTO MOBILERECHARGE VALUES('T09',9414530983,300,'2013-04-25');


INSERT INTO EMPLOYEESKILL VALUES('E01','S01');
INSERT INTO EMPLOYEESKILL VALUES('E02','S02');
INSERT INTO EMPLOYEESKILL VALUES('E01','S03');
INSERT INTO EMPLOYEESKILL VALUES('E01','S02');
INSERT INTO EMPLOYEESKILL VALUES('E02','S02');
INSERT INTO EMPLOYEESKILL VALUES('E01','S03');
INSERT INTO EMPLOYEESKILL VALUES('E01','S01');
INSERT INTO EMPLOYEESKILL VALUES('E01','S01');
INSERT INTO EMPLOYEESKILL VALUES('E01','S01');
INSERT INTO EMPLOYEESKILL VALUES('E01','S01');


INSERT INTO ROLE VALUES('R01','ADMIN');
INSERT INTO ROLE VALUES('R02','TRAINER');
INSERT INTO ROLE VALUES('R03','PROJECT LEAD');
INSERT INTO ROLE VALUES('R04','PROGRAMMER');
INSERT INTO ROLE VALUES('R05','ONSITE CO-ORDINATOR');
INSERT INTO ROLE VALUES('R06','HR');
INSERT INTO ROLE VALUES('R07','ACCOUNTANT');
INSERT INTO ROLE VALUES('R08','TESTER');
INSERT INTO ROLE VALUES('R09','DESIGNER');
INSERT INTO ROLE VALUES('R10','ANALYST');


INSERT INTO T_PROJECT VALUES('P01','SBI ONLINE BANKING','SBI','2011-01-12');
INSERT INTO T_PROJECT VALUES('P02','MEIJYAR','ITC','2009-07-09');
INSERT INTO T_PROJECT VALUES('P03','STATE FORM','AIR INDIA','2010-12-11');
INSERT INTO T_PROJECT VALUES('P04','AXIS','AXIS BANK','2004-12-15');
INSERT INTO T_PROJECT VALUES('P05','IBPS','IBPS','2007-12-12');
INSERT INTO T_PROJECT VALUES('P06','ONLINE RESERVATION','INDIAN RAILWAYS','2007-12-01');
INSERT INTO T_PROJECT VALUES('P07','HOSPITAL MAINTENANCE','VASAN','2010-08-07');
INSERT INTO T_PROJECT VALUES('P08','HOSTAL MAINTENANCE','JNTU','2010-09-01');


INSERT INTO ALLOCATION VALUES('E01','P01','R01','2010-06-20','2010-07-30',500);
INSERT INTO ALLOCATION VALUES('E01','P01','R02','2010-07-31','2010-09-01',1000);
INSERT INTO ALLOCATION VALUES('E01','P01','R03','2010-09-08','2011-09-02',2000);
INSERT INTO ALLOCATION VALUES('E02','P01','R03','2008-09-02','2009-01-30',2000);
INSERT INTO ALLOCATION VALUES('E03','P01','R03','2011-11-07','2012-12-12',2000);
INSERT INTO ALLOCATION VALUES('E04','P01','R01','2010-07-31','2010-12-22',500);
INSERT INTO ALLOCATION VALUES('E05','P02','R04','2012-01-10','2011-07-20',1500);
INSERT INTO ALLOCATION VALUES('E05','P02','R03','2011-07-21','2012-01-20',2000);
INSERT INTO ALLOCATION VALUES('E04','P02','R02','2010-12-23','2012-06-24',1000);
INSERT INTO ALLOCATION VALUES('E05','P03','R05','2012-01-12','2012-06-24',3000);
INSERT INTO ALLOCATION VALUES('E02','P04','R01','2009-01-31','2011-05-30',750);
INSERT INTO ALLOCATION VALUES('E02','P05','R02','2011-06-01','2011-12-12',1200);
INSERT INTO ALLOCATION VALUES('E02','P06','R02','2011-12-13','2012-11-30',1250);
INSERT INTO ALLOCATION VALUES('E01','P04','R05','2011-09-03','2012-04-30',2500);
INSERT INTO ALLOCATION VALUES('E02','P04','R06','2012-04-11','2012-12-10',3500);



COMMIT;


