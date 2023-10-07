SELECT * FROM sales.transactions;

SELECT count(*) FROM sales.transactions;

-- Show unique values in a column
SELECT distinct currency FROM sales.transactions;
-- There are 2 INR value, one of it is 'INR\r'
-- rows with 'INR' value are duplicate so we need to delete it.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM sales.transactions WHERE sales.transactions.currency = 'INR';

-- Show transaction in chennai
SELECT * FROM sales.transactions where market_code="Mark001";
/*Show transaction amount in chennai*/
SELECT count(*) FROM sales.transactions where market_code="Mark001";

-- Show transaction in USD
SELECT * FROM sales.transactions where currency="USD";

-- Show transactions in 2020
SELECT sales.transactions.*, sales.date.year FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date WHERE year="2020";

-- SUM sales amount in 2020
SELECT SUM(sales.transactions.sales_amount) 
FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date 
WHERE year="2020" AND market_code="Mark001";


-- Show transactions in Chennai (Using market_name)customers
SELECT sales.transactions.*, sales.markets.markets_name
FROM sales.transactions INNER JOIN sales.markets ON sales.transactions.market_code=sales.markets.markets_code
WHERE markets_name="Chennai";

-- Show product code in Chennai
SELECT distinct product_code
FROM sales.transactions INNER JOIN sales.markets ON sales.transactions.market_code=sales.markets.markets_code
WHERE markets_name="Chennai";

