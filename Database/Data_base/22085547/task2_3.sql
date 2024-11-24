CREATE OR REPLACE FUNCTION check_cashback_and_delivery (c_orderid IN INTEGER)
RETURN VARCHAR2
AS
  -- variable to store the order cost
  order_cost NUMBER(10,2);
  
  -- variable to store the threshold for cashback
  cashback_threshold NUMBER(10,2) := 5; 
  
  -- variable to store the threshold for delivery charges
  delivery_threshold NUMBER(10,2) := 1; 
BEGIN
  -- retrieve the total cost of the order by summing the prices of all the fillings, bread and delivery cost
  SELECT SUM(f.gramprice * sf.quantity + b.loafprice) INTO order_cost
  FROM Ordertab o
  JOIN Sandwichfilling sf ON o.sandwichid = sf.sandwichid
  JOIN Filling f ON sf.fillingid = f.fillingid
  JOIN Bread b ON o.breadid = b.breadid
  WHERE o.orderid = c_orderid;

  -- check if the order cost is greater than the cashback threshold
  IF order_cost > cashback_threshold THEN
    -- if true, return 'Order qualifies for cashback and delivery charges'
    RETURN 'Order qualifies for cashback and delivery charges';
  -- check if the order cost is greater than the delivery threshold
  ELSIF order_cost > delivery_threshold THEN
    -- if true, return 'Order qualifies for delivery charges'
    RETURN 'Order qualifies for delivery charge';
     ELSE
    -- return 'Order does not qualify for cashback or delivery charges'
    RETURN 'Order does not qualify for cashback nor for delivery';
    END IF;