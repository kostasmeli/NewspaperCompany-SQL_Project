CREATE DATABASE NewspaperDB;
USE NewspaperDB;

 CREATE TABLE Newspaper(
  newspaper_name VARCHAR(20),
  publication_freq ENUM('Weekly','Daily','Monthly'),
  owner VARCHAR(20),
  PRIMARY KEY (newspaper_name)
)ENGINE=InnoDB;

CREATE TABLE Employee(
 email VARCHAR(30),
 employment_date DATE,
 name VARCHAR(20),
 surname VARCHAR(30),
 salary FLOAT,
 PRIMARY KEY(email)
)ENGINE=InnoDB;

CREATE TABLE Journalist(
 email VARCHAR(30),
 working_experience_on_registration INT,
 CV TEXT,
 PRIMARY KEY (email),
 CONSTRAINT journemployee
 FOREIGN KEY (email) REFERENCES Employee (email)
 ON DELETE CASCADE
 ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Administrator(
 email VARCHAR(30),
 duties ENUM ('Secretary','Logistics'),
 street VARCHAR(20),
 street_number INT,
 city VARCHAR(20),
 PRIMARY KEY (email),
 CONSTRAINT emailcon
 FOREIGN KEY (email) REFERENCES Employee (email)
 ON DELETE CASCADE
 ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Telephones(
  telephone_number BIGINT,
  admin_email VARCHAR(30),
  PRIMARY KEY(telephone_number,admin_email),
  CONSTRAINT telecon
  FOREIGN KEY (admin_email) REFERENCES Administrator (email)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE ChiefEditor(
 email VARCHAR(30),
 PRIMARY KEY (email),
 CONSTRAINT chieftojournalist
 FOREIGN KEY (email) REFERENCES Journalist (email)
 ON DELETE CASCADE
 ON UPDATE CASCADE
)ENGINE=InnoDB;


CREATE TABLE Categories(
 Category_code INT,
 name  VARCHAR(20),
 Description TEXT,
 parental_code INT,
 PRIMARY KEY(Category_code),
 CONSTRAINT articleparent
 FOREIGN KEY (parental_code) REFERENCES Categories (Category_code)
 ON DELETE CASCADE
 ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Leaflet(
  leaflet_number INT,
  newspaper_name VARCHAR(20),
  numberofpages INT Default 30,
  number_copy INT,
  copies_notsold INT,
  publish_date DATE,
  leaflet_publisher VARCHAR(30),
  PRIMARY KEY (leaflet_number,newspaper_name),
  CONSTRAINT publisherofnp
  FOREIGN KEY (leaflet_publisher) REFERENCES employee (email),
  CONSTRAINT npleafetconnection
  FOREIGN KEY (newspaper_name) REFERENCES Newspaper (newspaper_name)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Article(
 path VARCHAR(100),
 Title VARCHAR(30),
 Summary TEXT,
 Paper_number INT,
 Paper_order INT,
 Category_code INT,
 Accepted_Date DATE DEFAULT NULL,
 Number_of_Leaflet INT,
 PRIMARY KEY (path),
 CONSTRAINT theleafletnumber
 FOREIGN KEY (Number_of_Leaflet) REFERENCES Leaflet (leaflet_number),
 CONSTRAINT articlecategory
 FOREIGN KEY (Category_code) REFERENCES Categories (Category_code)
 ON DELETE CASCADE
 ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Photographies(
 path VARCHAR(100),
 path_photo VARCHAR(100),
 PRIMARY KEY(path,path_photo),
 CONSTRAINT articlesphoto
 FOREIGN KEY (path) REFERENCES Article (path)
 ON DELETE CASCADE
 ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Keywords(
keyword VARCHAR(30),
article_path VARCHAR(100),
PRIMARY KEY(keyword,article_path),
CONSTRAINT keywordsofarticle
FOREIGN KEY (article_path) REFERENCES Article (path)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Submit(
  submiter VARCHAR(30),
  article VARCHAR(100),
  dateofsubmit DATE,
  PRIMARY KEY(submiter,article),
  CONSTRAINT submitbyjournalist
  FOREIGN KEY (submiter) REFERENCES Journalist (email),
  CONSTRAINT article_path2
  FOREIGN KEY (article) REFERENCES Article (path)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Works(
  employee VARCHAR(30),
  newspaper VARCHAR(20),
  PRIMARY KEY (employee,newspaper),
  CONSTRAINT employeeworks
  FOREIGN KEY (employee) REFERENCES Employee (email),
  CONSTRAINT newspapertowork
  FOREIGN KEY (newspaper) REFERENCES Newspaper (newspaper_name)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Checks(
  chiefeditor VARCHAR(30),
  article VARCHAR(100),
  comments TEXT,
  status ENUM('accepted','rejected','to be revised'),
  Dateofcheck DATE,
  PRIMARY KEY (chiefeditor,article),
  CONSTRAINT chiefchecks
  FOREIGN KEY (chiefeditor) REFERENCES ChiefEditor (email),
  CONSTRAINT articletobechecked
  FOREIGN KEY (article) REFERENCES Article (path)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)ENGINE=InnoDB;
