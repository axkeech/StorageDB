----------
--tables--
----------

create table facility
(FID varchar(5) primary key,
 "name" varchar(50) not null,
 addr1 varchar(60) not null,
 addr2 varchar(60),
 city varchar(30) not null,
 "state" varchar(30) not null,
 zip integer not null check (zip > 0),
 phoneNum integer not null check (phoneNum > 0),
 numOfUnits integer not null check (numOfUnits > 0));

create table tenant
(tenantID varchar(5) primary key,
 "name" varchar(50) not null,
 addr1 varchar(60) not null,
 addr2 varchar(60),
 city varchar(30) not null,
 "state" varchar(30) not null,
 zip integer not null check (zip > 0),
 phoneNum integer not null check (phoneNum > 0));

create table storageUnit
(unitNum varchar(5) primary key,
 price decimal(5,2) not null check (price > 0),
 usize varchar(20) not null, 
 FID varchar(5), 
 tenantID varchar(5), 
 foreign key (FID) references facility(FID),
 foreign key (tenantID) references tenant(tenantID));

create table saccount
(accNum integer primary key,
 balance integer not null check (balance > 0),
 pymtDueDate varchar(60));

create table smanager
(mgrID varchar(5) primary key,
 empDOB varchar(50) not null,
 "name" varchar(50) not null,
 addr1 varchar(60) not null,
 addr2 varchar(60),
 city varchar(30) not null,
 "state" varchar(30) not null,
 zip integer not null check (zip > 0),
 FID varchar(5), 
 foreign key (FID) references facility(FID));


--relational tables
create table owns
(tenantID varchar(5) not null,
 accNum integer not null,
 primary key (tenantID,accNum),
 foreign key (tenantID) references tenant(tenantID),
 foreign key (accNum) references saccount(accNum));

create table rentedBy
(tenantID varchar(5),
 unitNum varchar(5) not null,
 primary key (tenantID,unitNum),
 foreign key (tenantID) references tenant(tenantID),
 foreign key (unitNum) references storageUnit(unitNum));

create table manages
(mgrID varchar(5) not null,
 accNum integer not null check (accNum>=0),
 primary key (mgrID,accNum),
 foreign key (mgrID) references smanager(mgrID),
 foreign key (accNum) references saccount(accNum));
 
 -------------
 --test data--
 -------------
 
 --facility
INSERT INTO facility(FID,"name",addr1,addr2,city,"state",zip,phoneNum,numOfUnits)
            VALUES('00001','Facility','123 Facility Dr',null,'Glendale','AZ','85000','1112223333','20');
INSERT INTO facility(FID,"name",addr1,addr2,city,"state",zip,phoneNum,numOfUnits)
            VALUES('00002','Facility','456 Facility Dr',null,'Phoenix','AZ','85020','6022223333','25');

 
 --tenant
 INSERT INTO tenant(tenantID, "name", addr1, addr2, city, "state", zip, phoneNum)
            VALUES ('10001','Name1','123 Tenant Ave',null,'Phoenix','AZ','85020','4801230456');
 INSERT INTO tenant(tenantID, "name", addr1, addr2, city, "state", zip, phoneNum)
            VALUES ('10002','Name2','124 Tenant Ave',null,'Phoenix','AZ','85012','4801230457');
 INSERT INTO tenant(tenantID, "name", addr1, addr2, city, "state", zip, phoneNum)
            VALUES ('10003','Name3','125 Tenant Ave',null,'Phoenix','AZ','85023','4801230458');
 INSERT INTO tenant(tenantID, "name", addr1, addr2, city, "state", zip, phoneNum)
            VALUES ('10004','Name4','126 Tenant Ave',null,'Scotsdale','AZ','85210','4801230459');
 INSERT INTO tenant(tenantID, "name", addr1, addr2, city, "state", zip, phoneNum)
            VALUES ('10005','Name5','127 Tenant Ave',null,'Scotsdale','AZ','85260','4801230460');
            
--storageUnit
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00001','200.00','10x5','00001',null);
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00002','200.00','10x10','00001',null);
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00003','200.00','10x15','00001',null);
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00004','200.00','10x20','00001',null);
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00005','200.00','10x20','00001',null); 
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00006','200.00','10x20','00001',null);              
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00007','200.00','10x20','00001',null);              
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00008','200.00','10x20','00001',null);   
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00009','200.00','10x20','00001',null);               
INSERT INTO storageUnit(unitNum,price,usize,FID,tenantID)
            VALUES('00010','200.00','10x20','00001',null);               
                 
--saccount
INSERT INTO saccount(accNum,balance,pymtDueDate)
            VALUES('001','100','11/03/2021');
INSERT INTO saccount(accNum,balance,pymtDueDate)
            VALUES('002','120','11/04/2021');
INSERT INTO saccount(accNum,balance,pymtDueDate)
            VALUES('003','90','11/02/2021');
INSERT INTO saccount(accNum,balance,pymtDueDate)
            VALUES('004','70','11/07/2021');
INSERT INTO saccount(accNum,balance,pymtDueDate)
            VALUES('005','200','11/04/2021');
INSERT INTO saccount(accNum,balance,pymtDueDate)
            VALUES('006','200','11/04/2021');
INSERT INTO saccount(accNum,balance,pymtDueDate)
            VALUES('007','300','11/05/2021');

--smanager
 
INSERT INTO smanager(mgrID,empDOB,"name",addr1,addr2,city,"state",zip,FID)
            VALUES('001','03/21/1999','name1','123 Manager Dr',null,'Goodyear','AZ','85000','00001');
INSERT INTO smanager(mgrID,empDOB,"name",addr1,addr2,city,"state",zip,FID)
            VALUES('002','03/24/1976','name2','124 Manager Dr',null,'Goodyear','AZ','85000','00001');
INSERT INTO smanager(mgrID,empDOB,"name",addr1,addr2,city,"state",zip,FID)
            VALUES('003','03/30/1985','name3','125 Manager Dr',null,'Goodyear','AZ','85000','00001');
            
--owns
INSERT INTO owns(tenantID, accNum)
            VALUES('10001','001');
INSERT INTO owns(tenantID, accNum)
            VALUES('10002','002');
INSERT INTO owns(tenantID, accNum)
            VALUES('10003','003');
INSERT INTO owns(tenantID, accNum)
            VALUES('10004','004');
INSERT INTO owns(tenantID, accNum)
            VALUES('10005','005');
INSERT INTO owns(tenantID, accNum)
            VALUES('10001','006');
INSERT INTO owns(tenantID, accNum)
            VALUES('10002','007');

--rentedBy
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10001','00001');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10002','00002');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10003','00003');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10004','00004');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10005','00005');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10001','00006');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10001','00007');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10002','00008');
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10004','00009');            
INSERT INTO rentedBy(tenantID,unitNum)
            VALUES('10005','00010');            
           
            
            
            