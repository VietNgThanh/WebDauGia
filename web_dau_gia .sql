-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2021 at 04:31 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_ltw`
--

-- --------------------------------------------------------

--
-- Table structure for table `childcategory`
--

CREATE TABLE `childcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `childcategory`
--

INSERT INTO `childcategory` (`id`, `name`, `parent_id`) VALUES
(1, 'Smartphone', 1),
(2, 'Máy tính bảng', 1),
(3, 'Máy đọc sách', 1),
(4, 'Điện thoại bàn', 1),
(5, 'Túi thời trang nữ', 2),
(6, 'Ví nam', 2),
(7, 'Laptop', 3),
(8, 'Thiết bị ngoại vi', 3),
(9, 'Máy tính bộ', 3),
(10, 'Linh kiện máy tính', 3),
(11, 'Loa nghe nhạc', 4),
(12, 'Đồng hồ thông minh', 4),
(13, 'Thiết bị chơi game', 4),
(14, 'Ô tô', 5),
(15, 'Xe máy', 5),
(16, 'Xe đạp', 5);

-- --------------------------------------------------------

--
-- Table structure for table `danh_gia_nguoidung`
--

CREATE TABLE `danh_gia_nguoidung` (
  `id` int(11) NOT NULL,
  `id_nguoidanhgia` int(11) DEFAULT NULL,
  `id_nguoi_duoc_danhgia` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `trangthai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `danh_gia_nguoidung`
--

INSERT INTO `danh_gia_nguoidung` (`id`, `id_nguoidanhgia`, `id_nguoi_duoc_danhgia`, `comment`, `trangthai`) VALUES
(1, 1, 2, NULL, 1),
(2, 1, 2, NULL, 1),
(3, 1, 2, NULL, 0),
(4, 2, 3, NULL, 1),
(5, 2, 3, NULL, 1),
(6, 1, 2, NULL, 0),
(7, 1, 2, NULL, 0),
(8, 1, 2, NULL, 0),
(9, 1, 2, NULL, 0),
(10, 1, 2, NULL, 0),
(11, 1, 2, NULL, 1),
(12, 1, 2, NULL, 1),
(13, 1, 2, NULL, 1),
(14, 1, 2, NULL, 0),
(15, 1, 2, NULL, 1),
(16, 1, 2, NULL, 0),
(17, 1, 2, NULL, 0),
(18, 1, 2, NULL, 0);

--
-- Triggers `danh_gia_nguoidung`
--
DELIMITER $$
CREATE TRIGGER `danh_gia_nguoidung_BEFORE_INSERT` BEFORE INSERT ON `danh_gia_nguoidung` FOR EACH ROW BEGIN
	set @a=0;
    set @b=0;
    SELECT count(trangthai) into @a FROM danh_gia_nguoidung
    where trangthai=1 and id_nguoi_duoc_danhgia=new.id_nguoi_duoc_danhgia;
    
    
    
    SELECT count(trangthai) into @b FROM danh_gia_nguoidung 
    where  id_nguoi_duoc_danhgia=new.id_nguoi_duoc_danhgia;
    
     if(new.trangthai=1)
     then set @a=@a+1;
     end if;
    update users set mark=(@a*100)/(@b+1) where iduser=new.id_nguoi_duoc_danhgia;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_product`
--

CREATE TABLE `orders_product` (
  `idOrder` int(11) NOT NULL,
  `id_Product` int(11) DEFAULT NULL,
  `id_User` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Time_make_price` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `orders_product`
--

INSERT INTO `orders_product` (`idOrder`, `id_Product`, `id_User`, `Price`, `Time_make_price`) VALUES
(1, 1, 2, 12000000, '2021-12-12 00:00:00'),
(2, 1, 5, 12222222, '2021-12-18 22:21:26'),
(3, 1, 6, 12200000, '2021-12-18 23:22:52'),
(4, 1, 7, 12055000, '2021-12-18 23:23:29'),
(5, 2, 8, 120, '2021-12-18 22:25:03'),
(6, 2, 6, 125, '2021-12-18 22:25:33'),
(7, 2, 7, 126, '2021-12-18 22:25:54'),
(8, 3, 2, 111, '2021-12-18 22:26:10'),
(9, 4, 2, 1581919, '2021-12-21 17:05:10'),
(10, 5, 2, 6119929, '2021-12-21 17:05:35'),
(11, 4, 5, 1681919, '2021-12-21 17:06:12'),
(12, 5, 5, 6219929, '2021-12-21 17:06:40'),
(13, 5, 5, 6319929, '2021-12-22 12:21:58'),
(14, 1, 6, 14000000, '2021-12-22 12:59:59'),
(15, 1, 5, 15000000, '2021-12-22 13:02:52'),
(16, 1, 6, 16000000, '2021-12-22 13:04:31'),
(17, 1, 5, 17000000, '2021-12-22 14:06:00'),
(18, 1, 6, 20000000, '2021-12-22 14:07:14'),
(20, 1, 5, 22000000, '2021-12-22 16:40:40'),
(22, 1, 6, 21000000, '2021-12-22 16:44:01'),
(23, 1, 5, 23000000, '2021-12-22 16:52:03'),
(24, 1, 5, 23000000, '2021-12-22 16:53:10'),
(25, 1, 6, 24000000, '2021-12-22 16:58:09'),
(26, 1, 5, 24000000, '2021-12-22 17:01:42'),
(27, 1, 6, 24000000, '2021-12-22 17:03:29'),
(28, 2, 5, 13000000, '2021-12-22 17:05:16'),
(30, 3, 5, 19000000, '2021-12-22 17:13:23'),
(31, 3, 6, 20000000, '2021-12-22 17:17:56'),
(32, 3, 5, 19500000, '2021-12-22 17:18:41'),
(33, 3, 6, 19500000, '2021-12-22 17:19:14'),
(34, 3, 5, 19500000, '2021-12-22 17:22:04'),
(35, 3, 5, 22000000, '2021-12-22 17:23:57'),
(36, 3, 6, 23000000, '2021-12-22 17:24:54'),
(37, 3, 5, 22000000, '2021-12-22 17:25:22'),
(38, 3, 5, 23000000, '2021-12-22 17:26:04'),
(39, 3, 6, 24000000, NULL),
(40, 4, 5, 13000000, '2021-12-22 13:14:48'),
(41, 4, 5, 13000000, '2021-12-22 13:14:48'),
(42, 3, 5, 25000000, NULL),
(43, 3, 6, 24500000, NULL),
(44, 3, 6, 25000000, NULL),
(46, 7, 2, 13000000, '2021-12-23 06:22:57'),
(47, 7, 2, 13000000, '2021-12-23 06:22:57'),
(48, 9, 2, 13000000, '2021-12-23 06:55:56'),
(49, 9, 2, 13000000, '2021-12-23 06:55:56'),
(50, 9, 2, 13000000, '2021-12-22 17:26:04'),
(51, 7, 5, 16000000, NULL),
(52, 7, 6, 15000000, NULL),
(53, 7, 6, 15800000, NULL),
(54, 7, 7, 16500000, NULL),
(55, 7, 5, 16500000, NULL),
(56, 7, 6, 19000000, NULL),
(57, 7, 7, 19000000, NULL);

--
-- Triggers `orders_product`
--
DELIMITER $$
CREATE TRIGGER `orders_product_BEFORE_INSERT` BEFORE INSERT ON `orders_product` FOR EACH ROW BEGIN
	
    set @counter_time=0;
   set new.Time_make_price=now();
    set @buocnhay=0;
    select buoc_nhay into @buocnhay from product where idProduct=new.id_Product;
 
    set @highest_price=0;
    set @curent_price=0;
    select highest_price into @highest_price  from product where idProduct=new.id_Product;
    select Current_Price into @curent_price  from product where idProduct=new.id_Product;
    
    if(new.Price>@curent_price and new.Price<@highest_price)
    then update product set Current_Price=new.Price where idProduct=new.id_Product;
    elseif(new.Price>@highest_price)
    then update product set Current_Price=@highest_price+@buocnhay,id_Bidder_current=new.id_User,
    highest_price=new.Price where idProduct=new.id_Product;
    elseif(new.Price=@highest_price)
    then update product set Current_Price=@highest_price where idProduct=new.id_Product;
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `parentcategory`
--

CREATE TABLE `parentcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `parentcategory`
--

INSERT INTO `parentcategory` (`id`, `name`) VALUES
(1, 'Điện thoại - Máy tính bảng'),
(2, 'Phụ kiện thời trang'),
(3, 'Laptop - Máy vi tính - Linh kiện'),
(4, 'Thiết bị số - Phụ kiện số'),
(5, 'Xe cộ');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `id_Cat` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Detail_tiny` varchar(45) DEFAULT NULL,
  `Detail_full` text DEFAULT NULL,
  `Start_price` int(11) DEFAULT NULL,
  `Imme_Price` double DEFAULT NULL,
  `Availability` int(11) DEFAULT NULL,
  `Current_Price` int(11) DEFAULT NULL,
  `id_ParentCat` int(11) DEFAULT NULL,
  `id_Bidder_current` int(11) DEFAULT NULL,
  `highest_price` int(11) NOT NULL,
  `buoc_nhay` int(11) DEFAULT NULL,
  `dathongbao` int(11) DEFAULT NULL,
  `time_to_close` datetime DEFAULT NULL,
  `check_delay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `Name`, `id_Cat`, `User_id`, `Detail_tiny`, `Detail_full`, `Start_price`, `Imme_Price`, `Availability`, `Current_Price`, `id_ParentCat`, `id_Bidder_current`, `highest_price`, `buoc_nhay`, `dathongbao`, `time_to_close`, `check_delay`) VALUES
(0, 'Túi Dior 2', 5, 3, 'abc', 'fbuwbfibisbisbisbvisb', 12000000, 100000000, 1, 12000000, 2, NULL, 0, 100000, NULL, '2021-12-31 17:37:50', 1),
(1, 'iphone7', 2, 3, 'abc', 'abcvf', 10000000, 100000000, 1, 24000000, 1, 6, 24000000, 100000, NULL, NULL, 1),
(2, 'iphone X', 2, 3, 'abc', 'abcvferr', 12000000, 100000000, 1, 100126, 1, 5, 0, 100000, NULL, NULL, 1),
(3, 'iphone 13', 2, 3, 'abc', 'abcvferr', 18000000, 100000000, 1, 25000000, 1, 5, 25000000, 100000, NULL, NULL, 1),
(4, 'iPad', 3, 8, 'abc', 'abcvferr', 12000000, 100000000, 1, 13000000, 1, 5, 13000000, 100000, NULL, NULL, 1),
(5, 'iPad Pro', 3, 8, 'abc', 'abcvferr', 15000000, 100000000, 1, 15000000, 1, NULL, 0, 100000, NULL, NULL, 1),
(6, 'Túi Gucci', 5, 3, 'abc', 'abcvferr', 15000000, 100000000, 1, 15000000, 2, NULL, 0, 100000, NULL, NULL, 1),
(7, 'Túi Dior', 5, 3, 'abc', 'abcvferr', 15000000, 100000000, 1, 19000000, 2, 6, 19000000, 100000, NULL, NULL, 1),
(8, 'iphone8', 2, 3, 'abc', 'abcvjhwbjhwbviweb', 12000000, 100000000, 1, 12000000, 1, NULL, 0, 100000, NULL, NULL, 1),
(9, 'Play Station', 13, 3, 'abc', 'ebubebhbchjbjwbieb', 10000000, 100000000, 1, 13000000, 4, 2, 13000000, 100000, NULL, NULL, 1);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `product_BEFORE_INSERT` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
	set @pacat=0;
	select parent_id into @pacat from childcategory where id=new.id_Cat;
    set new.id_ParentCat=@pacat;
    set @time_to_close=0;
    select addtime(now(),'7 00:00:00') into @time_to_close;
    set new.time_to_close=@time_to_close;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`iduser`, `username`, `password`, `name`, `email`, `address`, `permission`, `mark`) VALUES
(1, 'Khoa', '123', NULL, 'ntdkhoa123456789@gmail.com', '105 Nguyen Trong Ky,Cam Ranh, Khanh Hoa', 3, NULL),
(2, 'Phuc', '1234', NULL, 'phuc1234@gmail.com', 'Duc Trong,Lam Dong', 2, 38),
(3, 'Minh', '123', NULL, 'minh123@gmail.com', 'Di An, Binh  Duong', 1, NULL),
(4, 'Viet', '123', NULL, 'viet123@gmail.com', 'Bien Hoa, Dong Nai', 2, NULL),
(5, 'Tu', '123', NULL, 'tu123@gmail.com', 'Quang Ngai', 4, NULL),
(6, 'Ngan', '123', NULL, 'ngan123@gmail.com', 'Cam Ranh, Khanh Hoa', 4, NULL),
(7, 'Thu', '123', NULL, 'thu123@gmail.com', 'Cam Ranh, Khanh Hoa', 4, NULL),
(8, 'Trang', '123', NULL, 'trang123@gmail.com', 'Cam Ranh, Khanh Hoa', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `childcategory`
--
ALTER TABLE `childcategory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_parent_id` (`parent_id`) USING BTREE;
ALTER TABLE `childcategory` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `danh_gia_nguoidung`
--
ALTER TABLE `danh_gia_nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`idOrder`) USING BTREE,
  ADD KEY `fk_Order_User` (`id_User`) USING BTREE,
  ADD KEY `fk_Order_Pro` (`id_Product`) USING BTREE;

--
-- Indexes for table `parentcategory`
--
ALTER TABLE `parentcategory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`) USING BTREE,
  ADD KEY `fk_Cata_Pro` (`id_Cat`) USING BTREE,
  ADD KEY `fk_User_Product` (`User_id`) USING BTREE;
ALTER TABLE `product` ADD FULLTEXT KEY `Name` (`Name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`) USING BTREE;

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `childcategory`
--
ALTER TABLE `childcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `danh_gia_nguoidung`
--
ALTER TABLE `danh_gia_nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders_product`
--
ALTER TABLE `orders_product`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `parentcategory`
--
ALTER TABLE `parentcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wish_list`
--
ALTER TABLE `wish_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `childcategory`
--
ALTER TABLE `childcategory`
  ADD CONSTRAINT `FK_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parentcategory` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD CONSTRAINT `fk_Order_Pro` FOREIGN KEY (`id_Product`) REFERENCES `product` (`idProduct`),
  ADD CONSTRAINT `fk_Order_User` FOREIGN KEY (`id_User`) REFERENCES `users` (`iduser`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_User_Product` FOREIGN KEY (`User_id`) REFERENCES `users` (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
