---------------------------------------------------------------------------------------------------------------
-- DROP AND CREATE
---------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS Manufacturers;
		
CREATE TABLE Manufacturers (
  id INTEGER NOT NULL,
  name VARCHAR(55) NOT NULL,
  country_id INTEGER NOT NULL,
  capitalization INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Countries;
		
CREATE TABLE Countries (
  id INTEGER NULL,
  name VARCHAR(55) NOT NULL,
  region_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Regions;
		
CREATE TABLE Regions (
  id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Models;
		
CREATE TABLE Models (
  id INTEGER NOT NULL,
  manufacturer_id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  price_id INTEGER NOT NULL,
  inStock BOOLEAN NOT NULL,
  seller_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Prices;
		
CREATE TABLE Prices (
  id INTEGER NOT NULL,
  value INTEGER NOT NULL,
  max_discount INTEGER NOT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS Sellers;
		
CREATE TABLE Sellers (
  id INTEGER NOT NULL DEFAULT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  office_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Quantity;
		
CREATE TABLE Quantity (
  model_id INTEGER NOT NULL,
  count INTEGER NOT NULL,
  PRIMARY KEY (model_id)
);


DROP TABLE IF EXISTS Offices;
		
CREATE TABLE Offices (
  id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);