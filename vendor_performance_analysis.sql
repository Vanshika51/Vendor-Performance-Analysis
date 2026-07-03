# create database vendor_performance_analysis;

use vendor_performance_analysis;

# 1: total number of vendors

select count(*) as total_vendors from vendors;

# 2: total number of purchases

select count(*) as total_purchases from purchases;

# 3: total purchase value

select sum(total_cost) as total_purchase_value from purchases;

# 4: average vendor rating

select round(avg(overall_rating), 2) as avg_vendor_rating from vendors;

# 5: vendor category distribution

select vendor_category, count(*) as total_vendors from vendors
group by vendor_category
order by total_vendors desc;

# 6: top 10 vendors by overall rating

select vendor_name, overall_rating from vendors
order by overall_rating desc
limit 10;

# 7: average rating by vendor category

select vendor_category, round(avg(overall_rating), 2) as avg_rating from vendors
group by vendor_category
order by avg_rating desc;

# 8: total purchase value by product category

select product_category, sum(total_cost) as total_sales from purchases
group by product_category
order by total_sales desc;

# 9: payment status distribution

select payment_status, count(*) as total_orders from purchases
group by payment_status;

# 10: delivery status distribution

select delivery_status, count(*) as total_orders from purchases
group by delivery_status;

# 11: top 10 vendors by purchase value

select vendor_id, sum(total_cost) as purchase_value from purchases
group by vendor_id
order by purchase_value desc
limit 10;

 # 12: vendor-wise total purchase value

select v.vendor_name, sum(p.total_cost) as total_purchase_value from vendors v
join purchases p
on v.vendor_id = p.vendor_id
group by v.vendor_name
order by total_purchase_value desc;

# 13: vendor-wise total orders

select v.vendor_name, count(p.purchase_id) as total_orders from vendors v
join purchases p
on v.vendor_id = p.vendor_id
group by v.vendor_name
order by total_orders desc;

# 14: average order value by vendor

select v.vendor_name, round(avg(p.total_cost), 2) as avg_order_value from vendors v
join purchases p
on v.vendor_id = p.vendor_id
group by v.vendor_name
order by avg_order_value desc;

# 15: delayed orders by vendor

select v.vendor_name, count(*) as delayed_orders from vendors v
join purchases p
on v.vendor_id = p.vendor_id
where p.delivery_status = 'Delayed'
group by v.vendor_name
order by delayed_orders desc;

# 16: best performing vendors

select vendor_name, quality_score, delivery_score, communication_score, overall_rating from vendors
order by overall_rating desc
limit 5;

# 17: product category performance

select product_category, count(*) as total_orders, sum(total_cost) as total_revenue from purchases
group by product_category
order by total_revenue desc;