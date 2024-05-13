-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 0.tcp.ap.ngrok.io:17536
-- Generation Time: May 13, 2024 at 04:09 AM
-- Server version: 8.4.0
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int NOT NULL,
  `image_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `image_url`, `open_url`) VALUES
(1, 'huawei-band-9-sliding.webp', 'https://cellphones.com.vn/vong-deo-tay-thong-minh-huawei-band-9.html'),
(2, 'samsung-galaxy-m34-5g-home-page.webp', ''),
(3, 'iphone-15-17390-sliding.webp', ''),
(4, 'sony-xperia-10-sliding.webp', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Laptop'),
(2, 'Iphone'),
(3, 'Android'),
(4, 'Phụ kiện');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `address`, `phone`, `personal_id`, `user_id`) VALUES
(2, 'Loc', NULL, NULL, NULL, 3),
(3, 'Loc', NULL, NULL, NULL, 4),
(4, 'Loc', NULL, NULL, NULL, 6),
(5, 'Loc', NULL, '013414', NULL, 7),
(6, 'Loc', NULL, '013414', NULL, 8),
(7, 'Loc', NULL, '013414', NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `function`
--

CREATE TABLE `function` (
  `function_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `employee_id`, `user_id`, `status_id`, `date_created`) VALUES
(12, NULL, 3, 1, NULL),
(14, NULL, 3, 1, NULL),
(15, NULL, 3, 1, NULL),
(16, NULL, 3, 1, NULL),
(17, NULL, 3, 1, NULL),
(18, NULL, 3, 1, NULL),
(19, NULL, 3, 1, NULL),
(20, NULL, 3, 1, NULL),
(21, NULL, 3, 1, NULL),
(22, NULL, 3, 1, NULL),
(23, NULL, 3, 1, NULL),
(24, NULL, 3, 1, NULL),
(25, NULL, 3, 1, NULL),
(26, NULL, 3, 1, '2024-05-12'),
(27, NULL, 3, 1, '2024-05-12'),
(28, NULL, 3, 1, '2024-05-12'),
(29, NULL, 3, 1, '2024-05-12'),
(30, NULL, 3, 1, '2024-05-12'),
(36, NULL, 3, 1, '2024-05-12'),
(38, NULL, 3, 1, '2024-05-12'),
(39, NULL, 3, 1, '2024-05-12'),
(40, NULL, 3, 1, '2024-05-12'),
(41, NULL, 3, 1, '2024-05-12'),
(42, NULL, 3, 1, '2024-05-12'),
(43, NULL, 3, 1, '2024-05-12'),
(44, NULL, 3, 1, '2024-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount` int NOT NULL,
  `total` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `invoice_id`, `product_id`, `amount`, `total`, `tax`, `user_id`) VALUES
(10, 14, 1, 1, NULL, NULL, 3),
(19, 22, 1, 4, NULL, NULL, 3),
(23, 23, 1, 1, NULL, NULL, 3),
(32, 25, 1, 2, NULL, NULL, 3),
(33, 26, 1, 1, NULL, NULL, 3),
(34, 27, 1, 1, NULL, NULL, 3),
(49, 36, 1, 6, NULL, NULL, 3),
(54, 41, 1, 1, NULL, NULL, 3),
(55, 42, 1, 1, NULL, NULL, 3),
(11, 14, 2, 1, NULL, NULL, 3),
(12, 15, 2, 1, NULL, NULL, 3),
(13, 16, 2, 1, NULL, NULL, 3),
(14, 17, 2, 1, NULL, NULL, 3),
(15, 18, 2, 1, NULL, NULL, 3),
(16, 19, 2, 1, NULL, NULL, 3),
(17, 20, 2, 1, NULL, NULL, 3),
(18, 21, 2, 1, NULL, NULL, 3),
(21, 22, 2, 2, NULL, NULL, 3),
(24, 23, 2, 1, NULL, NULL, 3),
(35, 28, 2, 1, NULL, NULL, 3),
(36, 29, 2, 4, NULL, NULL, 3),
(51, 38, 2, 3, NULL, NULL, 3),
(53, 40, 2, 1, NULL, NULL, 3),
(56, 43, 2, 1, NULL, NULL, 3),
(57, 44, 2, 1, NULL, NULL, 3),
(5, 12, 3, 4, NULL, NULL, 3),
(9, 14, 3, 3, NULL, NULL, 3),
(22, 22, 3, 2, NULL, NULL, 3),
(26, 24, 3, 2, NULL, NULL, 3),
(37, 29, 4, 1, NULL, NULL, 3),
(38, 30, 4, 1, NULL, NULL, 3),
(52, 39, 4, 1, NULL, NULL, 3),
(25, 23, 5, 1, NULL, NULL, 3),
(20, 22, 9, 1, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_status`
--

CREATE TABLE `invoice_status` (
  `status_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_status`
--

INSERT INTO `invoice_status` (`status_id`, `name`) VALUES
(1, 'Đợi xác nhận'),
(2, 'Đang giao hàng'),
(3, 'Đã nhận hàng'),
(4, 'Giỏ hàng');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `vendor_id` int DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `img_url` longtext COLLATE utf8mb4_unicode_ci,
  `amount` int NOT NULL DEFAULT '0',
  `category_id` int DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `vendor_id`, `name`, `price`, `img_url`, `amount`, `category_id`, `description`) VALUES
(1, 3, 'Laptop Gigabyte', 27490000, 'ava_6fddfe4aaac443eaa00dc1e995364d95_grande.png', 2, 1, 'Laptop Gigabyte G5 là một sản phẩm laptop gaming ấn tượng, kết hợp hiệu suất vượt trội và thiết kế tinh tế. Với vẻ ngoại hình mỏng nhẹ, đây là một tác phẩm đáng chú ý của Gigabyte. Được đánh giá cao về khả năng xử lý đồ họa và chơi game mạnh mẽ, laptop này hứa hẹn mang lại trải nghiệm tuyệt vời cho người dùng yêu thích công nghệ. Ngoài ra, Gigabyte G5 cũng được đánh giá tích cực về hiệu suất và độ ổn định, là lựa chọn phù hợp cho những người cần một chiếc laptop đa năng và mạnh mẽ.'),
(2, 1, 'Laptop Asus ROG', 35990000, 'ava_f7dc933379944436b399eb3ab202dfb3_grande.png', 5, 1, 'Laptop Asus ROG là một dòng sản phẩm laptop gaming cao cấp của Asus, nổi bật với thiết kế hiện đại và các công nghệ tiên tiến. Dòng sản phẩm này bao gồm các mẫu như ROG Strix G15, ROG Zephyrus M16, và ROG Strix G16, mỗi mẫu đều mang đến cho người dùng một trải nghiệm gaming mạnh mẽ và hiệu suất cao.  Laptop Asus ROG Strix G15, ví dụ, được thiết kế với ba màu sắc khác biệt, mang đến một diện mạo thể thao và hiện đại. Nó được trang bị các công nghệ cao cấp như màn hình 165Hz, card đồ họa NVIDIA, và bộ vi xử lý Intel Core i7, đảm bảo cho người dùng một trải nghiệm gaming mượt mà và nhanh chóng.  Laptop Asus ROG Zephyrus M16, một mẫu khác, được thiết kế với một phong cách hiện đại và mỏng, mang đến cho người dùng một trải nghiệm gaming di động và hiệu suất cao. Nó được trang bị các công nghệ tiên tiến như HDMI 2.1 FRL, cho phép người dùng kết nối laptop với các thiết bị khác nhau.  Laptop Asus ROG Strix G16, một mẫu khác, được trang bị các công nghệ cao cấp như màn hình 240Hz, card đồ họa NVIDIA RTX 4060, và bộ vi xử lý Intel Core i7, đảm bảo cho người dùng một trải nghiệm gaming mạnh mẽ và hiệu suất cao.  Tất cả các mẫu Laptop Asus ROG đều được trang bị các công nghệ làm mát thông minh, cho phép người dùng chơi game trong một thời gian dài mà không lo lắng về nhiệt độ. Ngoài ra, các mẫu này cũng được trang bị các công nghệ tùy chỉnh tự động hóa, cho phép người dùng tùy chỉnh các cài đặt để phù hợp với nhu cầu của mình.  Tóm lại, Laptop Asus ROG là một dòng sản phẩm laptop gaming cao cấp, mang đến cho người dùng một trải nghiệm gaming mạnh mẽ và hiệu suất cao. Với các công nghệ tiên tiến và thiết kế hiện đại, Laptop Asus ROG là một lựa chọn tuyệt vời cho những người yêu thích gaming và cần một thiết bị di động hiệu suất cao.'),
(3, 6, 'Laptop MSI GP68HX', 21990000, 'gearvn-laptop-gaming-msi-gp68hx-13vh-252vn-1_5a372168113b451f87fd2e1c97165444_grande.png', 6, 1, 'Laptop MSI GP68HX là một dòng sản phẩm cao cấp của MSI với nhiều phiên bản khác nhau như GP68 HX 12V, GP68 HX 12VH, và GP68 HX 13VH. Các phiên bản này đều được trang bị CPU mạnh mẽ từ Intel, bao gồm i9-12900HX và i9-13950HX, cùng với GPU NVIDIA RTX 4080 12GB. Đặc điểm chung của các phiên bản bao gồm RAM DDR5 dung lượng 16GB, ổ cứng SSD 1TB PCle, màn hình 16.0 FHD+ IPS với tần số làm mới 144Hz, và hệ điều hành Windows 11. Điểm đáng chú ý là khả năng hỗ trợ chế độ chỉ sử dụng card đồ họa rời (MUX), giúp tối ưu hiệu suất đồ họa của máy.'),
(4, 4, 'Samsung S24 Ultra', 38890000, 'ss-s24-ultra-xam-222.png', 7, 3, 'Samsung Galaxy S24 Ultra là flagship mới nhất của Samsung, sở hữu nhiều cải tiến đáng giá so với thế hệ trước:  - Thiết kế vuông vức, khung viền titan cứng cáp và mỏng nhẹ hơn, có 4 màu mới: Đen Titanium, Xám Titanium, Tím Titanium và Vàng Titanium[1][3]  - Màn hình Dynamic AMOLED 2X 6.8 inch, độ phân giải 3088 x 1440 (QHD+), hỗ trợ tần số quét 120Hz, độ sáng tối đa 2600 nit, giúp hiển thị rõ nét dưới ánh nắng mặt trời[2][3]  - Camera chính 200MP, hỗ trợ nhiều tính năng AI như chụp đêm, zoom, làm đẹp ảnh... mang lại chất lượng hình ảnh tuyệt vời[1][2][3]  - Chip Exynos 2400 mới, RAM 12/16GB, bộ nhớ trong 256/512GB/1TB, hiệu năng mạnh mẽ cho mọi tác vụ[1][4]  - Bút S Pen tích hợp, hỗ trợ nhiều tính năng ghi chú, vẽ, chuyển văn bản viết tay sang văn bản[3][4]  - Viên pin dung lượng lớn, hỗ trợ sạc nhanh, sạc không dây, đáp ứng tốt nhu cầu sử dụng cả ngày[1]  - Nhiều tính năng AI thông minh như trợ lý Note AI, chia sẻ nhanh Quick Share, bảo mật vân tay dưới màn hình...[1][3][4]  Với thiết kế cao cấp, hiệu năng mạnh mẽ, camera chất lượng và nhiều tính năng thông minh, Samsung Galaxy S24 Ultra xứng đáng là một trong những flagship Android tốt nhất hiện nay[4][5].  '),
(5, 2, 'Iphone 15 plus', 22259000, 'iphone-15-plus_1__1.png', 9, 2, '**iPhone 15 Plus** là một chiếc điện thoại thông minh của **Apple**, được ra mắt vào tháng 9 năm 2023. Dưới đây là một số thông số kỹ thuật quan trọng của iPhone 15 Plus:  - **Màn hình**: iPhone 15 Plus có màn hình **Super Retina XDR** kích thước 6,7 inch với độ phân giải 2796 x 1290 pixel và mật độ điểm ảnh 460 ppi. Màn hình này có góc cạnh cong đẹp và đáp ứng chuẩn IP68 về khả năng chống nước, bụi¹².  - **Chipset**: iPhone 15 Plus được trang bị chip **A16 Bionic** với CPU 6 nhân (2 nhân hiệu năng và 4 nhân tiết kiệm năng lượng), GPU 5 nhân và Neural Engine 16 nhân.  - **Camera**: Hệ thống camera kép của iPhone 15 Plus bao gồm:   - Camera chính 48MP với khẩu độ ƒ/1.6, ổn định hình ảnh quang học, hỗ trợ chụp ảnh siêu cao độ phân giải (24MP và 48MP).   - Camera Ultra Wide 12MP với khẩu độ ƒ/2.4 và góc nhìn 120°.   - Camera Telephoto 2x (kích hoạt bởi cảm biến quad-pixel) với khẩu độ ƒ/1.6 và ổn định hình ảnh quang học.   - Zoom quang học 2x vào, 2x ra; tổng khoảng zoom quang học 4x.   - Hỗ trợ quay video 4K, HDR và chế độ chụp ảnh chân dung tiên tiến¹.  - **Bộ nhớ và Pin**: iPhone 15 Plus có tùy chọn bộ nhớ 128GB, 256GB và 512GB. Pin dung lượng 4383 mAh.  - **Thiết kế**: iPhone 15 Plus có thiết kế vỏ nhôm và kính màu, với mặt trước được bảo vệ bằng Ceramic Shield.  Ngoài ra, iPhone 15 Plus còn có nhiều tính năng khác như sạc qua cổng USB-C, chế độ quay video Cinematic 4K, và nhiều cải tiến khác. Đây là một sản phẩm cao cấp của Apple, hứa hẹn mang lại trải nghiệm tốt cho người dùng¹².  Nguồn: Cuộc hội thoại với Bing, 5/13/2024 (1) iPhone 15 and iPhone 15 Plus - Technical Specifications - Apple. https://www.apple.com/iphone-15/specs/. (2) Apple iPhone 15 Plus - Full phone specifications - GSMArena.com. https://www.gsmarena.com/apple_iphone_15_plus-12558.php. (3) iPhone 15 and iPhone 15 Plus - Apple. https://www.apple.com/iphone-15/.'),
(6, 5, 'Xiaomi Note 13', 4590000, 'xiaomi-redmi-note-13_1__1_1.png', 10, 3, '**Xiaomi 13** là một dòng điện thoại thông minh chạy hệ điều hành Android được sản xuất bởi Xiaomi. Dòng sản phẩm này bao gồm **Xiaomi 13** và **Xiaomi 13 Pro**, được công bố vào ngày 11 tháng 12 năm 2022 và ra mắt tại Trung Quốc vào ngày 14 tháng 12 năm 2022. Sau đó, các điện thoại này được phát hành toàn cầu vào ngày 26 tháng 2 năm 2023 cùng với **Xiaomi 13 Lite**⁶.  Dưới đây là một số thông số kỹ thuật quan trọng của **Xiaomi 13**:  - **Màn hình**: Xiaomi 13 có màn hình **AMOLED** kích thước 6,36 inch với tốc độ làm mới 120Hz. Độ phân giải màn hình là 1440 x 3200 pixel, mang lại trải nghiệm hình ảnh sắc nét. Màn hình này được bảo vệ bởi kính **Corning Gorilla Glass 5**.  - **Chipset**: Sản phẩm sử dụng chip **Snapdragon 8 Gen 2** của Qualcomm, với CPU Octa-core và GPU Adreno 740.  - **Camera**: Hệ thống camera sau của Xiaomi 13 bao gồm:   - Camera chính 50MP với khẩu độ f/1.8, hỗ trợ OIS (ổn định hình ảnh quang học).   - Camera telephoto 10MP với khẩu độ f/2.0, hỗ trợ OIS và zoom quang học 3.2x.   - Camera siêu rộng 12MP với góc nhìn 120°.  - **Pin và sạc**: Xiaomi 13 được trang bị pin dung lượng 4500mAh, hỗ trợ sạc nhanh 67W.  - **Khả năng chống nước và bụi**: Xiaomi 13 có khả năng chống nước và bụi theo chuẩn **IP68**, cho phép bạn sử dụng thiết bị trong điều kiện môi trường khắc nghiệt².  Dòng sản phẩm Xiaomi 13 được thiết kế với sự hợp tác của Leica, đặc biệt là ống kính telephoto 75mm, mang lại trải nghiệm chụp ảnh chuyên nghiệp và chi tiết. Với thiết kế tinh tế và hiệu năng mạnh mẽ, Xiaomi 13 là một lựa chọn hấp dẫn cho người dùng yêu thích công nghệ⁵.  Nguồn: Cuộc hội thoại với Bing, 5/13/2024 (1) Xiaomi 13 - Wikipedia. https://en.wikipedia.org/wiki/Xiaomi_13. (2) Xiaomi 13 - Full phone specifications - GSMArena.com. https://www.gsmarena.com/xiaomi_13-12013.php. (3) Xiaomi 13 | Xiaomi Global. https://www.mi.com/global/product/xiaomi-13/. (4) Xiaomi 13 Pro - Full phone specifications - GSMArena.com. https://www.gsmarena.com/xiaomi_13_pro-11962.php. (5) Xiaomi 13 specs - PhoneArena. https://www.phonearena.com/phones/Xiaomi-13_id12072. (6) Xiaomi 13T - Full phone specifications - GSMArena.com. https://www.gsmarena.com/xiaomi_13t-12389.php.'),
(7, 7, 'Củ sạc Ugreen', 349000, 'cu-sac-ugreen-robogan-mini-cd359-usb-c-30w.png', 10, 4, '**Củ sạc Ugreen** là một thiết bị hữu ích giúp bạn sạc nhanh cho các thiết bị di động. Dưới đây là một số thông tin về các sản phẩm củ sạc Ugreen:  1. **Củ sạc nhanh 20W UGREEN CD137**:    - Đầu ra nguồn cổng **Type C**.    - Công suất sạc **20W** cho thời gian sạc nhanh chóng.    - Cổng sạc Type-C tương thích với nhiều loại cáp sạc.    - Kích thước nhỏ gọn, dễ dàng bỏ vào túi xách, balo.    - Đạt chứng chỉ **MFi**, đảm bảo an toàn cho các thiết bị².  2. **Củ sạc nhanh GaN Ugreen 40918 30W USB-C**:    - Thiết kế đơn giản và đẹp.    - Cắm có thể gập lại: Tính di động tốt hơn và lưu trữ dễ dàng hơn.    - Ổ cắm có thể gập lại an toàn khi đi du lịch để bảo vệ thiết bị của bạn.    - Vỏ chống cháy đầy đủ UL94-V0, sạc an toàn và bảo vệ gia đình bạn.    - Chip PWM cung cấp bảo vệ quá nhiệt, quá dòng, quá điện áp, quá nhiệt và ngắn mạch⁵.  3. **Củ sạc nhanh GaN Ugreen 100W – 2 cổng Type C**:    - Công suất **100W**, giúp bạn sạc nhanh hơn.    - Công nghệ chip sạc mới nhất, an toàn hơn.    - Tương thích với MacBook Pro, MacBook Air, Dell XPS, iPhone 14/13/12, Galaxy S22/S21, iPad, Steam Deck và nhiều thiết bị khác³.  Những sản phẩm củ sạc Ugreen này không chỉ đảm bảo hiệu suất sạc cao mà còn mang lại tính tiện lợi và an toàn cho người dùng. Nếu bạn đang tìm kiếm một củ sạc chất lượng, Ugreen là một lựa chọn đáng xem xét¹.  Nguồn: Cuộc hội thoại với Bing, 5/13/2024 (1) Củ sạc nhanh 20W UGREEN CD137 cổng ra USB-C, chống quá dòng quá nhiệt .... https://bing.com/search?q=c%e1%bb%a7+s%e1%ba%a1c+ugreen. (2) Củ sạc nhanh GaN Ugreen 40918 30W USB-C. https://ugreen.vn/cu-sac-nhanh-gan-ugreen-40918-30w-usb-c. (3) Củ sạc nhanh GaN Ugreen 100W – 2 cổng Type C. https://ugreen.vn/cu-sac-nhanh-gan-ugreen-100w-2-cong-type-c. (4) Củ sạc điện thoại, Sạc điện thoại trên ô tô chính hãng Ugreen. https://ugreenvietnam.com.vn/cu-sac-dien-thoai/. (5) Củ sạc nhanh 20W UGREEN CD137 cổng ra USB-C, chống quá dòng quá nhiệt .... https://ugreen.vn/cu-sac-nhanh-pd20w-ugreen-cd137.'),
(8, 2, 'Củ sạc Apple', 1954000, 'group_117_1.png', 10, 4, '**Củ sạc Apple** là một phụ kiện quan trọng để sạc và đồng bộ hóa các thiết bị của bạn. Dưới đây là một số thông tin về các sản phẩm củ sạc Apple:  1. **Bộ Sạc MagSafe**: Bộ sạc MagSafe có công suất 1.199.000 đồng. Đây là một cách tiện lợi để sạc iPhone 12 và các phiên bản mới hơn với tính năng gắn nam châm¹.  2. **Cáp Sạc USB-C 240W (2 m)**: Cáp sạc USB-C này có độ dài 2 mét và công suất 240W. Nó hỗ trợ sạc nhanh cho các thiết bị sử dụng cổng USB-C¹.  3. **Bộ Tiếp Hợp USB-C sang Lightning**: Bộ tiếp hợp này giúp bạn kết nối thiết bị sử dụng cổng USB-C với các thiết bị có cổng Lightning, như iPhone và iPad. Giá của bộ tiếp hợp này là 939.000 đồng¹.  4. **Cáp Sạc USB-C 60W (1m)**: Cáp sạc USB-C này có độ dài 1 mét và công suất 60W. Nó hỗ trợ sạc nhanh cho các thiết bị sử dụng cổng USB-C¹.  5. **Cáp USB-C sang Lightning (2m)**: Cáp này giúp bạn kết nối iPhone hoặc iPad với cổng USB-C. Độ dài của cáp là 2 mét và giá là 819.000 đồng¹.  6. **Cáp chuyển từ Lightning sang USB (2m)**: Cáp này cho phép bạn kết nối các thiết bị sử dụng cổng Lightning với cổng USB. Độ dài của cáp là 2 mét và giá là 819.000 đồng¹.  7. **Bộ sạc nhanh di động Belkin BOOST↑CHARGE™ PRO cho Apple Watch**: Bộ sạc này được thiết kế đặc biệt cho Apple Watch và có giá 1.759.000 đồng¹.  8. **Cáp Chuyển Đổi Lightning Digital AV**: Cáp này cho phép bạn kết nối iPhone hoặc iPad với cổng HDMI để trình chiếu hình ảnh và video lên màn hình lớn. Giá của cáp là 1.539.000 đồng¹.  Những sản phẩm củ sạc Apple này đảm bảo hiệu suất sạc cao và đáng tin cậy cho các thiết bị của bạn. Bạn có thể mua chúng trực tuyến và được vận chuyển miễn phí¹⁵.  Nguồn: Cuộc hội thoại với Bing, 5/13/2024 (1) Thiết Bị Sạc Thiết Yếu - Phụ Kiện iPhone - Apple (VN). https://www.apple.com/vn/shop/iphone/accessories/charging-essentials. (2) Thiết Bị Sạc Thiết Yếu - Tất Cả Phụ Kiện - Apple (VN). https://www.apple.com/vn/shop/accessories/all/charging-essentials. (3) Adapter Sạc Type C 20W dùng cho iPhone/iPad Apple MHJE3. https://www.thegioididong.com/adapter-sac/adapter-sac-type-c-20w-cho-iphone-ipad-apple-mhje3. (4) Củ sạc nhanh 20W cho iPhone/ iPad - Giá rẻ, chính hãng Apple. https://fptshop.com.vn/phu-kien/sac-20w-usb-c-power-adapter. (5) Adapter, củ sạc, chuyển đổi chính hãng, giá rẻ, bảo hành 12 tháng. https://www.topzone.vn/adapter-sac.'),
(9, 8, 'Lót chuột Logitech', 185000, 'tam-lot-chuot-logitech-studio-series-20-23-cm-1.png', 9, 4, '**Lót chuột Logitech** là một phụ kiện quan trọng để tối ưu hóa trải nghiệm sử dụng chuột của bạn. Logitech đã thiết kế và sản xuất nhiều loại lót chuột chơi game với độ ổn định và hiệu suất cao. Dưới đây là một số sản phẩm lót chuột Logitech:  1. **Bàn di chuột G640 Large Cloth Gaming Mouse Pad**:    - Kích thước lớn: 400 x 460 mm, mang lại nhiều không gian để di chuột hơn.    - Đế cao su giữ cố định vị trí trong những cuộc chơi game căng thẳng.    - Kết cấu bề mặt được tối ưu hóa cho chuột Logitech G và hiệu suất chơi game đỉnh cao³.  2. **Tấm lót chuột Logitech G740 Large Cloth Gaming Mouse Pad**:    - Kích thước: 40 x 46 cm.    - Độ dày: 5 mm.    - Bề mặt vải dày giúp di chuột mượt mà và chính xác.    - Đế cao su giữ vị trí ổn định trong quá trình sử dụng⁴.  Những sản phẩm lót chuột Logitech này không chỉ giúp bạn di chuột một cách dễ dàng mà còn tối ưu hóa hiệu suất chơi game của bạn. Hãy lựa chọn sản phẩm phù hợp với nhu cầu của bạn để có trải nghiệm tốt nhất¹.  Nguồn: Cuộc hội thoại với Bing, 5/13/2024 (1) G640 Large Cloth Gaming Mouse Pad - Logitech G. https://www.logitechg.com/vi-vn/products/gaming-mouse-pads/g640-cloth-gaming-mouse-pad.html. (2) Tấm lót Chuột Chơi game Bằng vải cỡ lớn G740 | Logitech G. https://www.logitechg.com/vi-vn/products/gaming-mouse-pads/g740-large-cloth-mouse-pad.html. (3) Bàn di chuột chơi game, miếng lót chuột chơi game | Logitech G. https://www.logitechg.com/vi-vn/products/gaming-mouse-pads.html. (4) Lót chuột Logitech - Lót chuột gaming chính hãng, giá rẻ – GEARVN.COM. https://gearvn.com/collections/lot-chuot-logitech. (5) Getty Images. https://www.gettyimages.com/detail/news-photo/logo-sits-illuminated-outside-the-logitech-booth-at-ise-news-photo/1973070080.');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'Admin'),
(2, 'Employee'),
(3, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `role+function`
--

CREATE TABLE `role+function` (
  `role_id` int NOT NULL,
  `function_id` int NOT NULL,
  `date_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` date DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `date_created`, `status`, `role_id`) VALUES
(3, 'abc', '$2b$10$dBfnQN3mvjtUJxVZ8VEscu6yCf1tdr0zyPm9rZN.8MO7O7YyAnf4e', NULL, b'1', 3),
(4, 'ad', '$2b$10$C0J9n0r3RueyQBVKmKmHdenItJS41PRQETNP6r7c1.JtfPbOg5ZfO', NULL, b'1', 3),
(5, 'admin', '$2b$10$C0J9n0r3RueyQBVKmKmHdenItJS41PRQETNP6r7c1.JtfPbOg5ZfO', NULL, b'1', 1),
(6, 'login1', '$2b$10$1s04HSj8wgk6h3nL5yluuOZSvmx98xvd.dNtv6V/pL/hTtBkbqjVS', NULL, b'1', 3),
(7, 'login2', '$2b$10$6zduEMfu.EghDsFKjJw8Dug.2bogRx9jC7ku70ujR5maPVffSd7LK', NULL, b'1', 3),
(8, 'login4', '$2b$10$GdziQYalAy40yF5n0MakvesCTpx4rirJrn0fDx9Gd7CHuUo3SAGkS', NULL, b'1', 3),
(9, 'login3', '$2b$10$TYfYOeGl9JIZiWA0Fv.zHezPyQRrcRMNfWqS0m.SmdQLEBCLWcRY.', NULL, b'1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`name`, `vendor_id`) VALUES
('Asus', 1),
('Apple', 2),
('Gigabyte', 3),
('Samsung', 4),
('Xiaomi', 5),
('MSI', 6),
('Ugreen', 7),
('Logitech', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_user` (`user_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_employee_user` (`user_id`);

--
-- Indexes for table `function`
--
ALTER TABLE `function`
  ADD PRIMARY KEY (`function_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_invoice_employee_1` (`employee_id`),
  ADD KEY `fk_invoice_invoice_status` (`status_id`),
  ADD KEY `fk_invoice_user` (`user_id`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`product_id`,`user_id`,`invoice_id`),
  ADD KEY `fk_invoice_detail_invoice` (`invoice_id`),
  ADD KEY `fk_invoice_detail_user` (`user_id`),
  ADD KEY `ix_autoincrement_INVOICE_DETAIL` (`id`);

--
-- Indexes for table `invoice_status`
--
ALTER TABLE `invoice_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_category` (`category_id`),
  ADD KEY `fk_product_vendor` (`vendor_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role+function`
--
ALTER TABLE `role+function`
  ADD PRIMARY KEY (`role_id`,`function_id`),
  ADD KEY `fk_role_function_function` (`function_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_user_role` (`role_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `function`
--
ALTER TABLE `function`
  MODIFY `function_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `invoice_status`
--
ALTER TABLE `invoice_status`
  MODIFY `status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_invoice_employee_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `fk_invoice_invoice_status` FOREIGN KEY (`status_id`) REFERENCES `invoice_status` (`status_id`),
  ADD CONSTRAINT `fk_invoice_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `fk_invoice_detail_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `fk_invoice_detail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `fk_invoice_detail_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_product_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

--
-- Constraints for table `role+function`
--
ALTER TABLE `role+function`
  ADD CONSTRAINT `fk_role_function_function` FOREIGN KEY (`function_id`) REFERENCES `function` (`function_id`),
  ADD CONSTRAINT `fk_role_function_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
