CREATE TABLE transactions (
    product_id INT,
    user_id INT,
    spend DECIMAL(10, 2),
    transaction_date TIMESTAMP
);

INSERT INTO transactions (product_id, user_id, spend, transaction_date)
VALUES
(3673, 123, 68.90, '2022-07-08 10:00:00'),
(9623, 123, 274.10, '2022-07-08 10:00:00'),
(1467, 115, 19.90, '2022-07-08 10:00:00'),
(2513, 159, 25.00, '2022-07-08 10:00:00'),
(1452, 159, 74.50, '2022-07-10 10:00:00'),
(1452, 123, 74.50, '2022-07-10 10:00:00'),
(9765, 123, 100.15, '2022-07-11 10:00:00'),
(6536, 115, 57.00, '2022-07-12 10:00:00'),
(7384, 159, 15.50, '2022-07-12 10:00:00'),
(1247, 159, 23.40, '2022-07-12 10:00:00');  

SELECT * FROM TRANSACTIONS

-- a SQL query to retrieve Walmart users' most recent transaction date, user ID, and the total number of products they purchased.

WITH CTE AS
(
SELECT TRANSACTION_DATE,
       USER_ID,
       PRODUCT_ID,
	   RANK()OVER(PARTITION BY USER_ID ORDER BY TRANSACTION_DATE DESC) AS RNK
FROM TRANSACTIONS
)
SELECT TRANSACTION_DATE,
       USER_ID,
       COUNT(PRODUCT_ID) AS TOTAL_COUNT
FROM CTE
WHERE RNK=1
GROUP BY 1,2
