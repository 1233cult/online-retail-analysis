--核心kpi
Select 
	round(sum(totalamount),2) as total_revenue,
	count(distinct invoiceno) as total_orders,
	count(distinct customerid) as total_customers
from cleaned_data;
--客单价
SELECT
	round(sum(totalamount)/count(distinct invoiceno),2) as avg_order_value
from cleaned_data;
--月度销售趋势
Select 
	YearMonth,
	round(sum(totalamount),2) as monthly_revenue,
	count(distinct invoiceno) as monthly_orders,
	count(distinct customerid) as monthly_customers
from cleaned_data
group by YearMonth
order by YearMonth;
--商品ABC分类
SELECT
	StockCode,
	Description,
	sum(quantity) as total_quantity_sold,
	round(sum(totalamount),2) as total_revenue,
	count(distinct invoiceno) as order_frequency
from cleaned_data
group by StockCode,Description
order by total_revenue desc
