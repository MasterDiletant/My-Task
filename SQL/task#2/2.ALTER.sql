---------------------------------------------------------------------------------------------------------------
-- ALTER
---------------------------------------------------------------------------------------------------------------

ALTER TABLE Manufacturers ADD FOREIGN KEY (country_id) REFERENCES Countries (id);
ALTER TABLE Countries ADD FOREIGN KEY (region_id) REFERENCES Regions (id);
ALTER TABLE Models ADD FOREIGN KEY (id) REFERENCES Quantity (model_id);
ALTER TABLE Models ADD FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers (id);
ALTER TABLE Models ADD FOREIGN KEY (price_id) REFERENCES Prices (id);
ALTER TABLE Models ADD FOREIGN KEY (seller_id) REFERENCES Sellers (id);
ALTER TABLE Sellers ADD FOREIGN KEY (office_id) REFERENCES Offices (id);