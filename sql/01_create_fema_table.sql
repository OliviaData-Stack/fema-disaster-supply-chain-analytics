CREATE TABLE fema_supply_chain (
    shipment_id VARCHAR(20),
    disaster_id VARCHAR(20),
    disaster_type VARCHAR(50),
    item_id INT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    quantity_requested INT,
    quantity_shipped INT,
    quantity_received INT,
    warehouse VARCHAR(50),
    region VARCHAR(50),
    ship_date DATE,
    arrival_date DATE,
    transport_mode VARCHAR(20),
    supplier VARCHAR(100),
    unit_cost DECIMAL(10,2),
    total_cost DECIMAL(10,2),
    delay_days INT,
    shortage_flag INT
);
1. Standardize warehouse names (uppercase)
UPDATE fema_supply_chain
SET warehouse = UPPER(warehouse);

2. Standardize disaster_type (Title Case)
UPDATE fema_supply_chain
SET disaster_type = CONCAT(
    UPPER(LEFT(disaster_type, 1)),
    LOWER(SUBSTRING(disaster_type, 2))
);
3. Fix missing arrival dates
UPDATE fema_supply_chain
SET arrival_date = DATE_ADD(ship_date, INTERVAL delay_days DAY)
WHERE arrival_date IS NULL AND delay_days IS NOT NULL;

4. Fix incorrect total_cost values
UPDATE fema_supply_chain
SET total_cost = unit_cost * quantity_shipped
WHERE total_cost <> (unit_cost * quantity_shipped);

5. Recalculate shortage_flag
UPDATE fema_supply_chain
SET shortage_flag = CASE
    WHEN quantity_requested > quantity_received THEN 1
    ELSE 0
END;

