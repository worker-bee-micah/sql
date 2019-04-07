CREATE TABLE treasure_map_yorders
(
    yorder_id          NUMBER(13)      NOT NULL,
    yorder_date        DATE            NOT NULL,
    pirate_id          NUMBER(7)       NOT NULL,
    subtotal           NUMBER(10,2), 
    tax                NUMBER(10,2),
    shipping           NUMBER(10,2),
    invoice_total      NUMBER(10,2)
                AS (subtotal + tax + shipping)   VIRTUAL         
);