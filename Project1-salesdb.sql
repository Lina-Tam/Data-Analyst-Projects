Drop database sales;
CREATE DATABASE sales;
USE sales;

CREATE Table users(
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at DATE
);

INSERT INTO users VALUES
(1001, 'Alice Johnson', 'alice.johnson@example.com', 'password_hash_1', '123-456-7890', '123 Maple Street, Springfield, IL','2023-02-01'),
(1002, 'Bob Smith', 'bob.smith@example.com', 'password_hash_2', '234-567-8901', '456 Oak Avenue, Greenfield, CA','2022-04-10'),
(1003, 'Cathy Brown', 'cathy.brown@example.com', 'password_hash_3', '345-678-9012', '789 Pine Road, Rivertown, TX','2018-01-28'),
(1004, 'David Wilson', 'david.wilson@example.com', 'password_hash_4', '456-789-0123', '321 Cedar Blvd, Lakeview, NY','2018-02-09'),
(1005, 'Eva Adams', 'eva.adams@example.com', 'password_hash_5', '567-890-1234', '654 Birch Lane, Mountville, AZ','2017-02-03'),
(1006, 'Frank Taylor', 'frank.taylor@example.com', 'password_hash_6', '678-901-2345', '987 Walnut Drive, Bayside, FL','2021-01-01'),
(1007, 'Grace Lee', 'grace.lee@example.com', 'password_hash_7', '789-012-3456', '258 Elm Street, Sunfield, OH','2015-10-01'),
(1008, 'Henry Martinez', 'henry.martinez@example.com', 'password_hash_8', '890-123-4567', '369 Cherry Court, Westtown, GA','2015-04-20'),
(1009, 'Ivy Garcia', 'ivy.garcia@example.com', 'password_hash_9', '901-234-5678', '147 Aspen Ave, Northwood, MA','2021-09-10'),
(1010, 'Jack White', 'jack.white@example.com', 'password_hash_10', '012-345-6789', '963 Maple Circle, Eastvale, CA','2021-09-04'),
(1011, 'Karen Hall', 'karen.hall@example.com', 'password_hash_11', '123-456-7890', '789 Willow Way, Brookfield, OR','2017-02-01'),
(1012, 'Leo Clark', 'leo.clark@example.com', 'password_hash_12', '234-567-8901', '456 Juniper Blvd, Riverdale, NJ','2016-06-08'),
(1013, 'Mia Lewis', 'mia.lewis@example.com', 'password_hash_13', '345-678-9012', '123 Redwood Street, Fairview, CA','2016-07-12'),
(1014, 'Nina Robinson', 'nina.robinson@example.com', 'password_hash_14', '456-789-0123', '654 Poplar Ave, Hillside, UT','2016-04-01'),
(1015, 'Oscar Wright', 'oscar.wright@example.com', 'password_hash_15', '567-890-1234', '321 Magnolia Lane, Seaview, NV','2018-12-10'),
(1016, 'Paul Walker', 'paul.walker@example.com', 'password_hash_16', '678-901-2345', '987 Beech Rd, Midvale, MT','2018-10-02'),
(1017, 'Quinn Young', 'quinn.young@example.com', 'password_hash_17', '789-012-3456', '258 Palm Blvd, Clearfield, NE','2020-05-04'),
(1018, 'Rachel King', 'rachel.king@example.com', 'password_hash_18', '890-123-4567', '369 Fir Lane, Pleasantville, KY','2020-07-01'),
(1019, 'Sam Scott', 'sam.scott@example.com', 'password_hash_19', '901-234-5678', '147 Dogwood Drive, Brightville, SD','2014-02-02'),
(1020, 'Tina Green', 'tina.green@example.com', 'password_hash_20', '012-345-6789', '963 Hickory Circle, Sunnydale, ID','2013-08-10');


CREATE Table products(
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock INT DEFAULT 0 CHECK (stock >= 0),
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (product_id, name, description, price, stock, category_id) VALUES
(101, 'Wireless Earbuds', 'Bluetooth 5.0 wireless earbuds with noise cancellation.', 29.99, 150, 1),
(102, 'Smartphone', 'Latest model with 6.5" screen and 128GB storage.', 699.99, 45, 1),
(103, 'Laptop', 'Lightweight laptop with 15.6" display and 8GB RAM.', 899.99, 25, 1),
(104, '4K TV', '55" 4K Ultra HD Smart TV with HDR.', 499.99, 0, 1),
(105, 'Smartwatch', 'Waterproof smartwatch with heart rate monitor.', 199.99, 75, 1),
(201, 'Denim Jacket', 'Classic blue denim jacket, unisex style.', 59.99, 200, 2),
(202, 'Graphic T-Shirt', 'Cotton t-shirt with printed design.', 19.99, 300, 2),
(203, 'Running Shoes', 'Breathable and lightweight running shoes.', 89.99, 120, 2),
(204, 'Leather Belt', 'Genuine leather belt in black and brown.', 24.99, 100, 2),
(205, 'Sweater', 'Warm wool sweater in assorted colors.', 39.99, 180, 2),
(301, 'Cookbook', 'Easy recipes for every day cooking.', 14.99, 200, 3),
(302, 'Science Fiction Novel', 'An epic space adventure novel.', 9.99, 100, 3),
(303, 'Children''s Story Book', 'Illustrated story book for children.', 12.99, 250, 3),
(304, 'Business Guide', 'A guide on starting and managing a small business.', 29.99, 70, 3),
(305, 'Self-Help Book', 'Tips for personal growth and improvement.', 17.99, 150, 3),
(401, 'Blender', 'High-speed blender for smoothies and more.', 79.99, 60, 4),
(402, 'Microwave Oven', '900W microwave with digital controls.', 149.99, 40, 4),
(403, 'Vacuum Cleaner', 'Cordless vacuum cleaner with powerful suction.', 199.99, 30, 4),
(404, 'Air Purifier', 'HEPA air purifier for cleaner indoor air.', 129.99, 80, 4),
(405, 'Coffee Maker', '12-cup coffee maker with programmable timer.', 49.99, 0, 4),
(501, 'Moisturizer', 'Hydrating face moisturizer for all skin types.', 19.99, 150, 5),
(502, 'Shampoo', 'Natural shampoo for all hair types.', 8.99, 200, 5),
(503, 'Lipstick', 'Long-lasting matte lipstick in multiple shades.', 12.99, 80, 5),
(504, 'Sunscreen', 'SPF 50 sunscreen for daily protection.', 15.99, 120, 5),
(505, 'Face Wash', 'Gentle foaming face wash.', 9.99, 140, 5),
(601, 'Yoga Mat', 'Eco-friendly yoga mat with non-slip surface.', 24.99, 150, 6),
(602, 'Dumbbell Set', 'Adjustable dumbbell set for strength training.', 79.99, 100, 6),
(603, 'Resistance Bands', 'Set of resistance bands for workouts.', 14.99, 200, 6),
(604, 'Treadmill', 'Electric treadmill with multiple speed options.', 599.99, 20, 6),
(605, 'Water Bottle', 'Stainless steel insulated water bottle.', 15.99, 250, 6);

CREATE Table categories(
    category_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO categories VALUES
(1, 'Electronics', 'Gadgets and electronic devices including smartphones, TVs, and laptops.'),
(2, 'Clothing', 'Apparel for men, women, and children including shirts, jackets, and shoes.'),
(3, 'Books', 'Printed and digital books across various genres and topics.'),
(4, 'Home Appliances', 'Appliances and gadgets for household use, like blenders and microwaves.'),
(5, 'Beauty', 'Personal care and beauty products including skincare and cosmetics.'),
(6, 'Fitness', 'Fitness and exercise equipment like yoga mats, dumbbells, and resistance bands.');

CREATE Table orders(
    order_id INT AUTO_INCREMENT KEY,
    user_id INT NOT NULL,
    order_date DATETIME,
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    total DECIMAL(10,2) NOT NULL,
    delivery_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Sample data for `orders`
INSERT INTO orders (user_id, order_date, status, total, delivery_date) VALUES
(1001, '2024-01-25','delivered', 229.96, '2024-02-06'),
(1007, '2024-03-01','shipped', 824.95, '2024-03-04'),
(1010, '2024-08-12', 'pending', 149.99, '2024-08-12'),
(1002, '2024-10-02', 'cancelled', 225.97, '2024-10-03'),
(1015, '2024-11-14', 'delivered', 65.95,'2024-11-22'),
(1010, '2024-06-30', 'delivered', 35.98,'2024-07-15'),
(1008, '2024-09-20', 'shipped', 599.99, '2024-09-23'),
(1013, '2024-05-11', 'delivered', 44.97,'2024-05-22'),
(1001, '2024-02-22', 'pending', 17.98, '2024-02-24'),
(1001, '2024-04-10', 'shipped', 129.99, '2024-04-15');

CREATE Table order_items(
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample data for `order_items`
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 101, 1, 29.99),
(1, 203, 2, 179.98),
(1, 501, 1, 19.99),
(2, 102, 1, 699.99),
(2, 401, 1, 79.99),
(2, 301, 3, 44.97),
(3, 402, 1, 149.99),
(4, 303, 2, 25.98),
(4, 403, 1, 199.99),
(5, 502, 2, 17.98),
(5, 504, 3, 47.97),
(6, 305, 2, 35.98),
(7, 604, 1, 599.99),
(8, 603, 3, 44.97),
(9, 502, 2, 17.98),
(10, 404, 1, 129.99);


CREATE Table product_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date datetime,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO product_reviews (user_id, product_id, rating, comment, review_date) VALUES
(1001, 102, 5, 'Fantastic smartphone with great features and battery life.', '2024-01-30 10:01:58'),
(1003, 101, 4, 'Good quality earbuds, but battery life could be better.', '2024-10-20 08:45:50'),
(1005, 103, 5, 'Perfect laptop for work and personal use. Highly recommend it!','2024-02-15 11:04:30'),
(1002, 104, 3, 'Decent TV but had issues with the remote control.','2024-06-02 09:05:17'),
(1004, 201, 4, 'Stylish denim jacket, fits well and feels durable.', '2024-05-14 08:02:34'),
(1007, 202, 5, 'Great t-shirt with a nice design. Comfortable and affordable.', '2024-08-20 21:12:20'),
(1006, 205, 4, 'Warm and cozy sweater, perfect for the winter season.', '2024-09-15 01:04:40'),
(1008, 302, 5, 'Amazing science fiction novel. Couldn\'t put it down!','2024-12-12 09:01:50'),
(1009, 403, 3, 'Vacuum cleaner works well, but battery doesn\'t last long.','2024-05-06 06:11:40'),
(1010, 504, 5, 'Effective sunscreen, no greasy feeling and lasts all day.','2024-01-25 05:01:58'),
(1011, 102, 4, 'Solid phone, but the camera quality could be improved.','2024-07-24 08:10:50'),
(1012, 105, 5, 'Smartwatch is amazing! Easy to use and has a lot of features.','2024-01-28 10:01:58'),
(1013, 203, 3, 'Good running shoes, but a bit tight around the toes.','2024-02-02 14:05:12'),
(1014, 204, 5, 'High-quality leather belt. Goes well with most outfits.','2024-10-11 10:10:58'),
(1015, 304, 2, 'The book was not as interesting as expected, found it repetitive.','2024-01-01 16:15:35'),
(1016, 401, 4, 'Blender is powerful, great for smoothies, but a bit noisy.','2024-07-07 18:01:58'),
(1017, 402, 5, 'Microwave works perfectly and heats up quickly.','2024-12-19 14:10:50'),
(1018, 405, 4, 'Nice coffee maker, easy to clean but takes a while to brew.','2024-08-10 20:01:58'),
(1019, 503, 5, 'Great lipstick, long-lasting and smooth application.','2024-04-14 09:01:58'),
(1020, 605, 3, 'Water bottle keeps drinks cool, but it’s a bit bulky.','2024-03-02 18:01:58');

ALTER TABLE products
ADD CONSTRAINT chk_price_non_negative CHECK (price >= 0),
ADD CONSTRAINT chk_stock_non_negative CHECK (stock >= 0);

-- 1. Retrieve the names and emails of all users who registered in 2020.
select name, email
from users
where created_at between '2020-01-01' and '2020-12-31';


-- 2. Retrieve the total quantity of each product sold along with its name and description.
select p.product_id, p.name, p.description, sum(oi.quantity) as total_quantity
from products p join order_items oi
on p.product_id = oi.product_id
group by p.product_id, p.name, p.description;


-- 3. Retrieve the customer details who have placed an order with a quantity greater than the average quantity.
select distinct u.user_id, u.name, u.email, u.phone, u.address
from users u join orders o
on u.user_id = o.user_id
join order_items oi 
on o.order_id = oi.order_id
where oi.quantity > (
select avg(quantity)
from order_items);




-- 4. Retrieve the quantity of each unique product purchased by each customer in his/her order.
select u.user_id, u.name as customer_name, p.product_id, p.name as product_name, sum(oi.quantity) as total_quantity_purchase
from users u join orders o
on u.user_id = o.user_id
join order_items oi on
o.order_id = oi.order_id
join products p
on oi.product_id = p.product_id
group by u.user_id, u.name, p.product_id, p.name
order by u.user_id, p.product_id;


-- 5. Retrieve the number of unique products purchased by each customer in their order.
select u.user_id, u.name as customer_name, count(distinct oi.product_id) as unique_products
from users u join orders o
on u.user_id = o.user_id 
join order_items oi 
on o.order_id = oi.order_id
group by u.user_id, u.name
order by u.user_id;


-- 6. Retrieve the comments and ratings posted by the users for the product 'Smartphone'.
select u.name as user_name, pr.comment, pr.rating
from users u join product_reviews pr
on u.user_id = pr.user_id
join products p 
on pr.product_id = p.product_id
where p.name = 'smartphone';

-- 7. Retrieve the details of the product which has received the word 'amazing' in its comments from the users.
select distinct p.product_id, p.name, p.description, p.price, p.stock, p.category_id, pr.comment
from products p join product_reviews pr
on p.product_id = pr.product_id
where pr.comment like '%amazing%';

-- 8. Retrieve the product details purchased by the user whose account was created at most recent time.
select distinct p.product_id, p.name, p.description, p.price, p.stock, p.category_id
from users u join orders o
on u.user_id = o.user_id 
join order_items oi 
on o.order_id = oi.order_id
join products p 
on oi.product_id = p.product_id
where u.created_at = (
select max(created_at)
from users);

-- 9. Retrieve the total sales amount received by selling each product.
select p.product_id, p.name, sum(oi.price * oi.quantity) as total_sales
from products p join order_items oi
on p.product_id = oi.product_id
group by p.product_id, p.name
order by p.product_id asc;



-- 10. Retrieve the total sales amount received by selling each product category.
select c.category_id, c.name as category_name, sum(oi.price * oi.quantity) as total_sales
from categories c join products p 
on c.category_id = p.category_id
join order_items oi
on p.product_id = oi.product_id 
group by c.category_id, c.name
order by c.category_id;


-- 11. Retrieve the reviews posted in the month of October.
select review_id, product_id, user_id, rating, comment, review_date
from product_reviews
where month(review_date) = 10;


-- 12. Find the count of customers who have placed no order.
select count(*) as count_of_customers
from users u left join orders o
on u.user_id = o.user_id
where o.order_id is null;


-- 13. Find the total number of orders placed by each customer.
select u.user_id, u.name as customer_name, count(o.order_id) as total_orders
from users u join orders o
on u.user_id = o.user_id
group by u.user_id, u.name
order by u.user_id;


-- 14. Find the customer who has placed the maximum number of orders without using 𝑚𝑎𝑥() function.
select u.user_id, u.name as customer_name, count(o.order_id) as total_orders
from users u join orders o
on u.user_id = o.user_id
group by u.user_id, u.name
order by total_orders desc
limit 1;


-- 15. Find the address of the users whose package was delivered 10 days after the date on which the order was placed (greater than 10 days).
select distinct u.user_id, u.address
from users u join orders o 
on u.user_id = o.user_id
where datediff(o.delivery_date, o.order_date) > 10;


-- 16. List out the customers who live in California.
select user_id, name, address
from users 
where address like '%, CA%';


-- 17. Show all products that are out of stock.
select product_id, name, description, price, stock, category_id
from products 
where stock = 0;


--  18. Retrieve the details of all products that have never been ordered.
select p.product_id, p.name, p.description, p.price, p.stock, p.category_id
from products p left join order_items oi
on p.product_id = oi.product_id
where oi.product_id is null;


-- 19. For all orders that were successfully delivered, what is the average number of days between the order date and the delivery date?
select avg(datediff(delivery_date, order_date)) as avg_delivery_days
from orders 
where status = 'delivered';


-- 20. Show the most recent review for each product.
select product_id, comment,rating, review_date
from product_reviews pr
where review_date = (
select max(pr2.review_date)
from product_reviews pr2
where pr2.product_id = pr.product_id);

