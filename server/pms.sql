drop schema pms;
create database pms;
use pms;
CREATE TABLE studentdetails (
  stid int NOT NULL AUTO_INCREMENT,
  sname varchar(30) NOT NULL ,
  usn numeric(11) NOT NULL UNIQUE,
  mobile bigint NOT NULL UNIQUE,
  email varchar(30) NOT NULL UNIQUE ,
  dob date NOT NULL,
  branch varchar(10) NOT NULL,
  cgpa float NOT NULL,
  
  PRIMARY KEY (stid,usn)
);


CREATE TABLE slogin (
  id int NOT NULL AUTO_INCREMENT,
  usn numeric(11) NOT NULL UNIQUE,
  pass varchar(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usn) REFERENCES studentdetails(usn) ON DELETE CASCADE
);



CREATE TABLE admindetails (
  aid int NOT NULL AUTO_INCREMENT,
  aname varchar(30)  NOT NULL,
  email varchar(30) NOT NULL UNIQUE,
  phone bigint NOT NULL UNIQUE,
  depname varchar(10) NOT NULL,
  PRIMARY KEY (aid)
);


CREATE TABLE alogin (
  id int NOT NULL AUTO_INCREMENT,
  aname varchar(30)  NOT NULL,
  email varchar(30) NOT NULL,
  pass varchar(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (email) REFERENCES admindetails(email) ON DELETE CASCADE
);



CREATE TABLE companydetails (
  id int NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL UNIQUE,
  cdescription  varchar(300) NOT NULL,
  email varchar(30) NOT NULL UNIQUE,
  phone bigint NOT NULL UNIQUE,
  website varchar(30) NOT NULL,
  adrs varchar(300) NOT NULL,
  package varchar(30) NOT NULL,
  mincgpa float NOT NULL,
  position varchar(50) NOT NULL,
  PRIMARY KEY (id,cname)
);

CREATE TABLE refercompany (
  id int NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  cdescription  varchar(300) NOT NULL,
  email varchar(30) NOT NULL,
  phone bigint NOT NULL,
  hrname varchar(30) NOT NULL,
  usn numeric(11) NOT NULL,
  referdate DATETIME DEFAULT CURRENT_TIMESTAMP,
  status BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (id),
  FOREIGN KEY (usn) REFERENCES studentdetails(usn) ON DELETE CASCADE
);



CREATE TABLE updateddrive (
  id int NOT NULL AUTO_INCREMENT,
  usn numeric(11) NOT NULL,
  sname varchar(30) NOT NULL UNIQUE,
  batch varchar(10) NOT NULL,
  cname varchar(30) NOT NULL,
  pdate date NOT NULL,
  package varchar(30) NOT NULL,
  position varchar(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usn) REFERENCES studentdetails(usn) ON DELETE CASCADE,
  FOREIGN KEY (cname) REFERENCES companydetails(cname) ON DELETE CASCADE
);

CREATE TABLE regdrive (
  id int NOT NULL AUTO_INCREMENT,
  usn numeric(11) NOT NULL,
  cname varchar(30) NOT NULL,
  position varchar(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usn) REFERENCES studentdetails(usn) ON DELETE CASCADE,
  FOREIGN KEY (cname) REFERENCES companydetails(cname) ON DELETE CASCADE
);

ALTER TABLE regdrive
ADD CONSTRAINT no_duplicate UNIQUE(usn, cname, position);

INSERT INTO studentdetails (sname, usn, mobile, email, dob, branch, cgpa) VALUES
( 'Aarushi Rathore', 00111604421, 9149256646, 'aarushirathore5@gmai', '1998-11-18', 'MCA', 9.1),
( 'Aditi J', 00211604421, 9165487956, 'J.aditi@gmail.com', '1999-05-18', 'MCA', 8.6),
( 'Akanksha', 00311604421, 8756245891, 'anku637@gmail.com', '1998-09-06', 'MCA', 8.8),
( 'Aman Sharma', 00411604421, 5487952165, 'coolaman@gmail.com', '1999-11-02', 'MCA', 7.6),
( 'Kavan Patel', 00511604421, 9456852213, 'gujarati.choda@gmail.com', '1999-10-18', 'MCA', 6.9),
( 'Priyank Baliyan', 00611604421, 8542696969, 'dj.khalid@gmail.com', '2000-08-27', 'MCA', 7.1),
( 'Rahul Tilwani', 00711604421, 9511154696, 'tillu69@gmail.com', '2000-10-12', 'MCA', 7.8),
( 'Ishani', 00811604421, 7456249450, 'ishani123@gmail.com', '1999-11-06', 'MCA', 9.6),
( 'Disha Panjwani', 00911604421, 9456845213, 'dishubabes@gmail.com', '1999-03-14', 'MCA', 9.5),
( 'Shikumi', 01011604421, 8094125720, 'shikumi@gmail.com', '1999-09-28', 'MCA', 7.8),
( 'Pallavi Pandey', 01111604421, 7531596482, 'ispalpal@gmail.com', '1999-11-13', 'MCA', 8.1);


INSERT INTO admindetails (aname, email, phone, depname) VALUES
('Dr Vaishali', 'vaishali.joshi@bvicam.in', 9414175414, 'MCA'),
('Dr Sunil', 'sunil.pratap@bvicam.in', 9546675414, 'MCA');


INSERT INTO alogin ( aname, email, pass) VALUES
('Dr Vaishali', 'vaishali.joshi@bvicam.in', 'joshi'),
('Dr Sunil', 'sunil.pratap@bvicam.in', 'singh');

INSERT INTO companydetails (cname, cdescription, email, phone, website, adrs, package, mincgpa, position) VALUES
('Amazon', 'Amazon is an American multinational technology company based in Seattle, Washington, which focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence.', 'ecr-replies@amazon.com', 8882804331, 'www.amazon.com','Amazon Development Center India Pvt Ltd., 2nd Floor, Safina Towers, Bangalore – 560052', '15-30 lakhs', '7','WEB DEVELOPER'),
('Wipro', 'Wipro Limited is an Indian multinational corporation that provides information technology, consulting and business process services.', 'ecr-replies@wipro.com', 8046726000, 'www.wipro.com','Doddakannelli, Sarjapur Road Bengaluru - 560 035, India', '10-20 lakhs', '7','WEB DEVELOPER'),
('Infosys', 'Infosys Limited, is an Indian multinational corporation that provides business consulting, information technology and outsourcing services.', 'Askus@infosys.com', 8028520362, 'www.infosys.com','Electronics City, Hosur Road, Bengaluru 560 100, India', '10-50 lakhs', '7','WEB DEVELOPER'),
('Accenture', 'Accenture plc is an American-Irish multinational professional services company.', 'xxxx@accenture.com', 8049346001, 'www.accenture.com','4/1, IBC Knowledge Park, Bannerghatta Road Bangalore, Karnataka India - 560029', '8-12 lakhs', '6.5','WEB DEVELOPER');

INSERT INTO updateddrive (usn, sname, batch, cname, pdate, package, position) VALUES
(00111604421, 'Aarushi Rathore', '2023', 'Infosys', '2022-09-28', '11,00,000', 'WEB DEVELOPER'),
(00711604421, 'Rahul Tilwani', '2023', 'Amazon', '2022-11-28', '19,00,000', 'WEB DEVELOPER'),
(00311604421, 'Akanksha', '2023', 'Wipro', '2022-11-08', '15,00,000', 'WEB DEVELOPER'),
(00811604421, 'Ishani', '2023', 'Amazon', '2022-09-28', '16,00,000', 'WEB DEVELOPER'),
(00511604421, 'Kavan Patel', '2023', 'Infosys', '2022-09-28', '12,00,000', 'WEB DEVELOPER'),
(01011604421, 'Shikumi', '2023', 'Amazon', '2022-09-28', '14,00,000', 'WEB DEVELOPER');



SELECT sl.usn,sd.sname,sd.mobile,sd.email,sd.dob,sd.branch,sd.cgpa
FROM slogin AS sl
INNER JOIN studentdetails AS sd ON sl.usn = sd.usn;



DELETE FROM studentdetails
WHERE sname = 'RT';

DELETE FROM studentdetails
WHERE sname IN ('Lalu','fjlg');