--Liệt kê các hóa đơn của khách hàng, thông tin hiển thị gồm: mã user, tên user, mã hóa đơn
SELECT users.user_id, users.user_name, orders.order_id
FROM users
JOIN orders ON users.user_id = orders.user_id;
--Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng
SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS so_don_hang
FROM users
JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name;
--Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm
SELECT order_id, COUNT(product_id) AS so_san_pham
FROM order_details
GROUP BY order_id;
--Liệt kê thông tin mua hàng của người dùng: mã user, 
--tên user, mã đơn hàng, tên sản phẩm. Lưu ý: gôm nhóm theo đơn hàng, tránh hiển thị xen kẻ các đơn hàng với nhau
SELECT users.user_id, users.user_name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
ORDER BY orders.order_id;
--Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất, thông tin hiển thị gồm: mã user, tên user, số lượng đơn hàng
SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS so_luong_don_hang
FROM users
JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name
ORDER BY COUNT(orders.order_id) DESC
LIMIT 7;
--Liệt kê 7 người dùng mua sản phẩm có tên: Samsung hoặc Apple trong tên sản phẩm, 
--thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tên sản phẩm
SELECT users.user_id, users.user_name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
WHERE products.product_name LIKE '%Samsung%' OR products.product_name LIKE '%Apple%'
LIMIT 7;
--Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền
SELECT users.user_id, users.user_name, orders.order_id, SUM(products.price) AS tong_tien
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
GROUP BY users.user_id, users.user_name, orders.order_id;
--Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user,
--tên user, mã đơn hàng, tổng tiền. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền lớn nhất.
SELECT temp.user_id, temp.user_name, temp.order_id, temp.tong_tien
FROM (
  SELECT users.user_id, users.user_name, orders.order_id, SUM(products.price) AS tong_tien,
         ROW_NUMBER() OVER (PARTITION BY users.user_id ORDER BY SUM(products.price) DESC) AS row_num
  FROM users
  JOIN orders ON users.user_id = orders.user_id
  JOIN order_details ON orders.order_id = order_details.order_id
  JOIN products ON order_details.product_id = products.product_id
  GROUP BY users.user_id, users.user_name, orders.order_id
) AS temp
WHERE temp.row_num = 1;
--Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user,
-- tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền nhỏ nhất.
SELECT u.user_id, u.user_name, o.order_id, o.total_price, o.total_items
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
INNER JOIN (
    SELECT user_id, MIN(total_price) AS min_price
    FROM orders
    GROUP BY user_id
) t ON o.user_id = t.user_id AND o.total_price = t.min_price;
--Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user,
-- mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có số sản phẩm là nhiều nhất.
SELECT u.user_id, u.user_name, o.order_id, o.total_price, o.total_items
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
INNER JOIN (
    SELECT user_id, MAX(total_items) AS max_items
    FROM orders
    GROUP BY user_id
) t ON o.user_id = t.user_id AND o.total_items = t.max_items;