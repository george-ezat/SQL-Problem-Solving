-- Show all the even numbered Order_id from the orders table

SELECT order_id
FROM orders
WHERE order_id % 2 = 0;