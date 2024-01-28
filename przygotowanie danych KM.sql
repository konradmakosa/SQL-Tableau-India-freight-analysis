--Tabela Airline

-- Usuwanie niepotrzebnych kolumn
ALTER TABLE airline DROP COLUMN "YEAR";
ALTER TABLE airline DROP COLUMN "MONTH";
ALTER TABLE airline DROP COLUMN "quarter";
ALTER TABLE airline DROP COLUMN "CARRIER TYPE";

-- Aktualizacja i konwersja wartości w kolumnach FREIGHT TO INDIA i FREIGHT FROM INDIA
UPDATE nazwa_tabeli
SET "FREIGHT TO INDIA" = CAST("FREIGHT TO INDIA" * 1000 AS INT),
    "FREIGHT FROM INDIA" = CAST("FREIGHT FROM INDIA" * 1000 AS INT);

-- Dodanie nowych kolumn "TOTAL PASSENGERS" i "TOTAL FREIGHT"
ALTER TABLE airline ADD COLUMN "TOTAL PASSENGERS" INT;
ALTER TABLE airline ADD COLUMN "TOTAL FREIGHT" INT;

-- Aktualizacja nowych kolumn przez zsumowanie odpowiednich kolumn
UPDATE airline
SET "TOTAL PASSENGERS" = "PASSENGERS TO INDIA" + "PASSENGERS FROM INDIA",
    "TOTAL FREIGHT" = "FREIGHT TO INDIA" + "FREIGHT FROM INDIA";

-- Usunięcie starych kolumn
ALTER TABLE airline DROP COLUMN "PASSENGERS TO INDIA";
ALTER TABLE airline DROP COLUMN "PASSENGERS FROM INDIA";
ALTER TABLE airline DROP COLUMN "FREIGHT TO INDIA";
ALTER TABLE airline DROP COLUMN "FREIGHT FROM INDIA";


--Tabela Country

-- Usuwanie niepotrzebnych kolumn
ALTER TABLE country DROP COLUMN "YEAR";
ALTER TABLE country DROP COLUMN "quarter";

-- Aktualizacja i konwersja wartości w kolumnach FREIGHT TO INDIA i FREIGHT FROM INDIA
UPDATE country
SET "FREIGHT TO INDIA" = CAST("FREIGHT TO INDIA" * 1000 AS INT),
    "FREIGHT FROM INDIA" = CAST("FREIGHT FROM INDIA" * 1000 AS INT);

-- Dodanie nowych kolumn "TOTAL PASSENGERS" i "TOTAL FREIGHT"
ALTER TABLE country ADD COLUMN "TOTAL PASSENGERS" INT;
ALTER TABLE country ADD COLUMN "TOTAL FREIGHT" INT;

-- Aktualizacja nowych kolumn przez zsumowanie odpowiednich kolumn
UPDATE country
SET "TOTAL PASSENGERS" = "PASSENGERS TO INDIA" + "PASSENGERS FROM INDIA",
    "TOTAL FREIGHT" = "FREIGHT TO INDIA" + "FREIGHT FROM INDIA";

-- Usunięcie starych kolumn
ALTER TABLE country DROP COLUMN "PASSENGERS TO INDIA";
ALTER TABLE country DROP COLUMN "PASSENGERS FROM INDIA";
ALTER TABLE country DROP COLUMN "FREIGHT TO INDIA";
ALTER TABLE country DROP COLUMN "FREIGHT FROM INDIA";


--Tabela CityPair

-- Usuwanie niepotrzebnych kolumn
ALTER TABLE citypair DROP COLUMN "YEAR";
ALTER TABLE citypair DROP COLUMN "QUARTER";

-- Aktualizacja i konwersja wartości w kolumnach FREIGHT TO INDIA i FREIGHT FROM INDIA
UPDATE citypair
SET "FREIGHT FROM CITY1 TO CITY2" = CAST("FREIGHT FROM CITY1 TO CITY2" * 1000 AS INT),
    "FREIGHT FROM CITY2 TO CITY1" = CAST("FREIGHT FROM CITY2 TO CITY1" * 1000 AS INT);

-- Dodanie nowych kolumn "TOTAL PASSENGERS" i "TOTAL FREIGHT"
ALTER TABLE citypair ADD COLUMN "TOTAL PASSENGERS" INT;
ALTER TABLE citypair ADD COLUMN "TOTAL FREIGHT" INT;

-- Aktualizacja nowych kolumn przez zsumowanie odpowiednich kolumn
UPDATE citypair
SET "TOTAL PASSENGERS" = "PASSENGERS FROM CITY1 TO CITY2" + "PASSENGERS FROM CITY2 TO CITY1",
    "TOTAL FREIGHT" = "FREIGHT FROM CITY1 TO CITY2" + "FREIGHT FROM CITY2 TO CITY1";

-- Usunięcie starych kolumn
ALTER TABLE citypair DROP COLUMN "PASSENGERS FROM CITY1 TO CITY2";
ALTER TABLE citypair DROP COLUMN "PASSENGERS FROM CITY2 TO CITY1";
ALTER TABLE citypair DROP COLUMN "FREIGHT FROM CITY1 TO CITY2";
ALTER TABLE citypair DROP COLUMN "FREIGHT FROM CITY2 TO CITY1";


