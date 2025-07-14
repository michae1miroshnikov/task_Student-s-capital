Laptop Summer Hustle
Task: Maximize your capital by buying/refurbishing/reselling up to N laptops, given:

Starting capital C
Array of laptop prices
Array of expected gains
How to Run

bash
swift run  
Input Format (exactly as specified in task):

First line: N C K
N = Max laptops to buy
C = Starting capital
K = Total laptops available
Second line: price1 price2 ... priceK
Third line: gain1 gain2 ... gainK
Output:

Final capital after optimal purchases
Example:

text
2 100 3  
50 60 80  
70 90 110  
Outputs final capital after buying best 2 laptops

Key Features

Implements greedy algorithm for maximum profit
Sorts laptops by (gain - price)
Handles partial purchases (if can't afford all N)
