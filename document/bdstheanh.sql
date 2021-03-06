-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2018 at 11:27 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdstheanh`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ilPOiDhmKqsxtUpi7ZgWe5vDYjt2ICJK', 1, '2017-11-12 06:15:56', '2017-11-12 06:15:55', '2017-11-12 06:15:56'),
(2, 1, 'rcp04qHne8oATtrTCwKl9FuckJEarSCb', 1, '2017-11-12 06:20:02', '2017-11-12 06:20:02', '2017-11-12 06:20:02'),
(3, 1, 'AHbwHv4BMq4Z5b7nkdvOlvcOvXnPqMk0', 1, '2017-11-12 06:24:14', '2017-11-12 06:24:14', '2017-11-12 06:24:14'),
(4, 1, 'JqmoT6nwuNXt0D5jape2qCQsEVQgWEqA', 1, '2017-11-12 06:26:26', '2017-11-12 06:26:26', '2017-11-12 06:26:26'),
(5, 1, '1TnyfEnFLs7gdNZXKP2r35tc1hBvcnPg', 1, '2017-11-12 07:22:52', '2017-11-12 07:22:52', '2017-11-12 07:22:52'),
(6, 1, 'QlzbRQWzVJgg01NkGUVewoQhT4qPKTMZ', 1, '2017-11-12 07:23:56', '2017-11-12 07:23:56', '2017-11-12 07:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `fullname`, `alias`, `meta_keyword`, `meta_description`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cơn mơ chiều', 'con-mo-chieu', 'metakeyword Cơn mơ chiều', 'metadescription Cơn mơ chiều', 'thuvienhinh-1.png', 1, 1, '2018-01-08 16:17:33', '2018-01-09 03:00:06'),
(8, 'Thiên chức', 'thien-chuc', 'metakeyword Thiên chức', 'metadescription Thiên chức', 'thuvienhinh-5.png', 5, 1, '2018-01-09 03:05:49', '2018-01-09 03:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `fullname`, `alias`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Nguyên liệu gỗ nhập khẩu giá sỉ', 'nguyen-lieu-go-nhap-khau-gia-si', 'conmochieu-8.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">CUNG CẤP NGUY&Ecirc;N LIỆU GỖ NHẬP KHẨU GI&Aacute; SỈ</p>\n\n<p style=\"text-align:justify\">GreenEcoLife Việt Nam, nh&agrave; cung cấp nguy&ecirc;n liệu gỗ nhập khẩu chất lượng gi&aacute; sỉ: gỗ sồi, gỗ &oacute;c ch&oacute;, gỗ tần b&igrave;, v&aacute;n s&agrave;n gỗ th&ocirc;ng đỏ, v&aacute;n ốp tường gỗ tuyết t&ugrave;ng, &hellip; Từ c&aacute;c nh&agrave; cung cấp gỗ nguy&ecirc;n liệu uy t&iacute;n h&agrave;ng đầu của nước Mỹ v&agrave; Ch&acirc;u &Acirc;u.</p>\n\n<p style=\"text-align:justify\">Sản phẩm nguy&ecirc;n liệu gỗ nhập khẩu của c&ocirc;ng ty tnhh GreenEcoLife nhập khẩu về Việt Nam, chủ yếu cung cấp lại cho c&aacute;c đối t&aacute;c: c&ocirc;ng ty thương mại, xưởng sản xuất nội thất, c&ocirc;ng ty thiết kế nội thất, &hellip;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/nguyen-lieu-go-nhap-khau-gia-si-1.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: kho sản phẩm gỗ nguy&ecirc;n liệu của GreenEcoLife Việt Nam.</em></p>\n\n<p style=\"text-align:justify\">C&aacute;c sản phẩm nguy&ecirc;n liệu gỗ nhập khẩu của GreenEcoLife cung cấp:</p>\n\n<p style=\"text-align:justify\">Nguy&ecirc;n liệu gỗ sồi: M&agrave;u sắc v&agrave; h&igrave;nh dạng của gỗ sồi trắng Mỹ tương tự như gỗ sồi trắng Ch&acirc;u &Acirc;u. D&aacute;t gỗ m&agrave;u nhạt, t&acirc;m gỗ từ n&acirc;u nhạt cho đến n&acirc;u sậm. Đa số gỗ sồi trắng c&oacute; v&acirc;n gỗ thẳng, mặt gỗ từ trung b&igrave;nh đến th&ocirc; với c&aacute;c tia gỗ d&agrave;i hơn sồi đỏ. V&igrave; vậy, sồi trắng c&oacute; nhiều đốm h&igrave;nh hơn.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/nguyen-lieu-go-nhap-khau-gia-si-7.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: sản phẩm nguy&ecirc;n liệu gỗ sồi trắng GreenEcoLife Việt Nam</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Nguy&ecirc;n liệu gỗ &oacute;c ch&oacute;: D&aacute;t gỗ m&agrave;u trắng kem, t&acirc;m gỗ m&agrave;u từ n&acirc;u nhạt đến n&acirc;u socola, thường &aacute;nh t&iacute;m đỏ v&agrave; c&oacute; sọc đỏ hơn. &Oacute;c ch&oacute; c&oacute; thể được sấy hơi nước để l&agrave;m sậm m&agrave;u d&aacute;t gỗ hoặc kh&ocirc;ng sấy hơi nước. Nh&igrave;n chung, v&acirc;n gỗ thẳng nhưng đ&ocirc;i khi uốn s&oacute;ng hoặc cuộn xo&aacute;y tạo th&agrave;nh những đốm h&igrave;nh hấp dẫn v&agrave; đẹp nhất.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/nguyen-lieu-go-nhap-khau-gia-si-2.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: sản phẩm nguy&ecirc;n liệu gỗ &oacute;c ch&oacute; GreenEcoLife Việt Nam.</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Nguy&ecirc;n liệu gỗ tần b&igrave;: Gỗ tần b&igrave; Mỹ c&oacute; h&igrave;nh dạng tương tự như gỗ tần b&igrave; Ch&acirc;u &Acirc;u. D&aacute;t gỗ m&agrave;u từ nhạt đến gần như trắng, t&acirc;m gỗ c&oacute; m&agrave;u sắc đa dạng, từ n&acirc;u x&aacute;m đến n&acirc;u nhạt, hoặc v&agrave;ng nhạc sọc n&acirc;u. Nh&igrave;n chung, v&acirc;n gỗ thẳng, mặt gỗ th&ocirc; đều. Thứ hạng v&agrave; trữ lượng tần b&igrave; c&oacute; d&aacute;t gỗ m&agrave;u nhạt v&agrave; c&oacute; th&ecirc;m một số đặc t&iacute;nh kh&aacute;c thay đổi t&ugrave;y v&ugrave;ng trồng gỗ.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/nguyen-lieu-go-nhap-khau-gia-si-3.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: sản phẩm nguy&ecirc;n liệu gỗ tần b&igrave; GreenEcoLife Việt Nam.</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Ng&agrave;y n&agrave;y, nhu cầu nguy&ecirc;n liệu gỗ: nguy&ecirc;n liệu gỗ sồi, nguy&ecirc;n liệu gỗ &oacute;c ch&oacute;, nguy&ecirc;n liệu gỗ tần b&igrave;. D&ugrave;ng cho sản xuất nội thất gỗ cao cấp rất được nhiều người ti&ecirc;u d&ugrave;ng ưu chuộng chọn lựa để l&agrave;m: nội thất tủ bếp cao cấp, nội thất ph&ograve;ng ngủ cao cấp, nội thất ph&ograve;ng kh&aacute;ch cao cấp, nội thất ph&ograve;ng họp cao cấp, b&agrave;n ghế, tủ quần &aacute;o, kệ tivi, gi&aacute; s&aacute;ch&hellip; V&igrave; c&aacute;c sản phẩm gỗ nguy&ecirc;n liệu của c&ocirc;ng ty tnhh GreenEcoLife thuộc nh&oacute;m gỗ cứng, chịu lực n&eacute;n cao, c&oacute; những v&acirc;n gỗ h&igrave;nh ảnh tự nhi&ecirc;n rất đẹp, chống mối mọt rất tốt.</p>\n\n<p style=\"text-align:justify\">H&igrave;nh ảnh một số sản phẩm nội thất d&ugrave;ng nguy&ecirc;n liệu gỗ nhập khẩu GreecEcoLife Việt Nam.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/nguyen-lieu-go-nhap-khau-gia-si-5.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: nội thất ph&ograve;ng ngủ d&ugrave;ng nguy&ecirc;n liệu gỗ sồi trắng.</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/nguyen-lieu-go-nhap-khau-gia-si-6.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: nội thất ph&ograve;ng kh&aacute;ch d&ugrave;ng nguy&ecirc;n liệu gỗ &oacute;c ch&oacute;.</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/nguyen-lieu-go-nhap-khau-gia-si-4.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: nội thất ph&ograve;ng bếp d&ugrave;ng nguy&ecirc;n liệu gỗ tần b&igrave;.</em></p>\n\n<p style=\"text-align:justify\">Gỗ l&agrave; một nguy&ecirc;n liệu tự nhi&ecirc;n v&agrave; do ch&iacute;nh bản chất của n&oacute; n&ecirc;n c&oacute; c&aacute;c đặc điểm v&agrave; khuyết điểm ta cần nắm r&otilde;. V&igrave; vậy, người ti&ecirc;u d&ugrave;ng cũng như c&aacute;c nh&agrave; chế biến gỗ chuy&ecirc;n nghiệp n&ecirc;n l&agrave;m việc chặc chẽ với c&aacute;c đầu mối cung cấp gỗ để đảm bảo rằng loại gỗ được đặt h&agrave;ng th&iacute;ch hợp cho những nhu cầu cụ thể của họ.</p>\n\n<p style=\"text-align:justify\">Hiện nay, với nguồn gỗ tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; nguy&ecirc;n liệu gỗ nhập khẩu ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; Greenecolife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất gỗ, qu&yacute; c&ocirc;ng ty thiết kế nội thất với chất lượng gỗ nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng tại khu vực miền Nam.</p>', 'chú thích Thái Lan tổn thất nghiêm trọng trước thềm vòng chung kết U23 châu Á', 'metakeyword Thái Lan tổn thất nghiêm trọng trước thềm vòng chung kết U23 châu Á', 'metadescription Thái Lan tổn thất nghiêm trọng trước thềm vòng chung kết U23 châu Á', 30, 8, 1, '2018-01-03 07:29:00', '2018-01-20 04:05:36'),
(11, 'Ưu nhược điểm của nội thất gỗ sồi', 'uu-nhuoc-diem-cua-noi-that-go-soi', 'conmochieu-9.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">Nội thất gỗ sồi nhập khẩu cao cấp</p>\n\n<p style=\"text-align:justify\">Gỗ sồi t&ecirc;n tiếng anh gọi l&agrave; Oak l&agrave; loại gỗ nhập khẩu từ Mỹ v&agrave; c&aacute;c nước ch&acirc;u &Acirc;u. Gỗ sồi nhập khẩu chiếm phần lớn diện t&iacute;ch ở c&aacute;c khu rừng phương T&acirc;y v&agrave; c&aacute;c sản phẩm nội thất được gia c&ocirc;ng từ gỗ sồi cũng được đ&aacute;nh gi&aacute; cao. Gỗ sồi l&agrave; một loại gỗ cứng, ch&uacute;ng ph&aacute;t triển ở nhiều nước tr&ecirc;n thế giới c&oacute; kh&iacute; hậu &ocirc;n đới, tập trung nhiều ở một số v&ugrave;ng đất ở Mỹ, n&ecirc;n thường được gọi l&agrave; gỗ sồi Mỹ. Về chủng loại th&igrave; gỗ sồi c&oacute; hai loại đ&oacute; l&agrave; gỗ sồi đỏ (Red Oak) v&agrave; gỗ sồi trắng (White Oak).</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/greenecolife/uu-nhuoc-diem-1.jpg\" /><img alt=\"\" src=\"/upload/uu-nhuoc-diem-1.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: nội thất gỗ sồi nhập khẩu</em></p>\n\n<p style=\"text-align:justify\">Gỗ sồi trắng (White Oak) d&aacute;t gỗ m&agrave;u nhạt, t&acirc;m gỗ từ n&acirc;u nhạt đến n&acirc;u sậm. T&acirc;m gỗ sồi trắng c&oacute; khả năng kh&aacute;ng s&acirc;u mọt tấn c&ocirc;ng do c&oacute; h&agrave;m lượng tannin cao. Đa số sồi trắng c&oacute; v&acirc;n gỗ thẳng, mặt gỗ từ trung b&igrave;nh đến th&ocirc; với c&aacute;c tia gỗ d&agrave;i hơn sồi đỏ.</p>\n\n<p style=\"text-align:justify\">Gỗ sồi đỏ (Red Oak) d&aacute;t gỗ m&agrave;u trắng đến n&acirc;u nhạt, t&acirc;m gỗ m&agrave;u n&acirc;u đỏ hồng. Về đặc t&iacute;nh vật l&yacute;, gỗ sồi đỏ cứng v&agrave; nặng, khả năng chịu lực xoắn v&agrave; độ chắc trung b&igrave;nh, độ chịu lực n&eacute;n cao, dễ uốn cong bằng hơi nước.. Sồi trắng miền nam lớn nhanh hơn với c&aacute;c v&ograve;ng tuổi gỗ rộng, c&oacute; khuynh hướng cứng v&agrave; nặng hơn.</p>\n\n<p style=\"text-align:justify\">Đa số c&aacute;c loại gỗ nhập khẩu: gỗ sồi nhập khẩu, gỗ &oacute;c ch&oacute; nhập khẩu, gỗ tần b&igrave; nhập khẩu, &hellip; &nbsp;Hầu hết điều được trồng ở Mỹ v&agrave; c&aacute;c nước phương T&acirc;y.</p>\n\n<p style=\"text-align:justify\">Ứng dụng nội thất gỗ sồi nhập khẩu:</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/uu-nhuoc-diem-2.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Bộ b&agrave;n ghế nội thất gỗ sồi nhập khẩu</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/uu-nhuoc-diem-3.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: tủ bếp nội thất gỗ sồi nhập khẩu</em></p>\n\n<p style=\"text-align:justify\">Gỗ sồi nhập khẩu thường được sử dụng để l&agrave;m: đồ nội thất gỗ cao cấp, v&aacute;n s&agrave;n, gỗ chạm kiến tr&uacute;c, gỗ chạm ngoại thất, gờ trang tr&iacute; nội thất gỗ sồi cao cấp, cửa c&aacute;i, tủ bếp nội thất gỗ sồi cao cấp, v&aacute;n l&oacute;t, t&agrave; vẹt đường sắt, cầu gỗ, v&aacute;n đ&oacute;ng th&ugrave;ng, v&agrave; hộp đựng nữ trang, &hellip;</p>\n\n<p style=\"text-align:justify\">Ưu nhược điểm của nội thất gỗ sồi nhập khẩu</p>\n\n<p style=\"text-align:justify\">Ưu điểm gỗ sồi nhập khẩu: chịu m&aacute;y tốt, độ b&aacute;m đinh v&agrave; ốc v&iacute;t tốt d&ugrave; phải khoan gỗ trước khi đ&oacute;ng đinh v&agrave; ốc. T&acirc;m gỗ c&oacute; khả năng kh&aacute;ng s&acirc;u, cực kỳ kh&ocirc;ng thấm chất bảo quản, d&aacute;t gỗ tương đối kh&ocirc;ng thấm chất n&agrave;y. D&aacute;t gỗ m&agrave;u nhạt, t&acirc;m gỗ từ n&acirc;u nhạt cho đến n&acirc;u sậm. Đa số gỗ sồi trắng c&oacute; v&acirc;n gỗ thẳng, mặt gỗ từ trung b&igrave;nh đến th&ocirc; với c&aacute;c tia gỗ d&agrave;i hơn sồi đỏ. V&igrave; vậy, sồi trắng c&oacute; nhiều đốm h&igrave;nh hơn.</p>\n\n<p style=\"text-align:justify\">Nhược điểm gỗ sồi nhập khẩu: chịu lực uốn xoắn v&agrave; lực n&eacute;n trung b&igrave;nh, độ chắc thấp nhưng rất dễ uốn c&ocirc;ng bằng hơi nước. V&igrave; gỗ phản ứng với sắt, người thao t&aacute;c n&ecirc;n d&ugrave;ng đinh mạ kẽm. Độ b&aacute;m d&iacute;nh của gỗ thay đổi nhưng gỗ c&oacute; thể được nhuộm m&agrave;u v&agrave; đ&aacute;nh b&oacute;ng để th&agrave;nh th&agrave;nh phẩm tốt. Gỗ kh&ocirc; chậm n&ecirc;n người thao t&aacute;c cẩn thận để tr&aacute;nh nguy cơ rạn gỗ. V&igrave; độ co r&uacute;t lớn n&ecirc;n dễ biến dạng khi gỗ kh&ocirc;.</p>\n\n<p style=\"text-align:justify\">Hiện nay, với nguồn gỗ sồi tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; gỗ sồi nhập khẩu nguy&ecirc;n liệu tự nhi&ecirc;n ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; GreenEcoLife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nhập khẩu nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất nội thất gỗ sồi cao cấp, qu&yacute; c&ocirc;ng ty thiết kế nội thất gỗ sồi với chất lượng gỗ nhập khẩu nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng.</p>', 'chú thích Wenger gặp vạ vì bình luận về trọng tài', 'metakeyword Wenger gặp vạ vì bình luận về trọng tài', 'metadescription Wenger gặp vạ vì bình luận về trọng tài', 1, 9, 1, '2018-01-03 07:45:23', '2018-01-20 04:05:43'),
(14, 'Gỗ nhập khẩu nguyên liệu giá tốt tại Hồ Chí Minh', 'go-nhap-khau-nguyen-lieu-gia-tot-tai-ho-chi-minh', 'conmochieu-13.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">Cung cấp gỗ nhập khẩu nguy&ecirc;n liệu gi&aacute; tốt nhất tại khu vực Quận Thủ Đức</p>\n\n<p style=\"text-align:justify\">Greenecolife Việt Nam &ndash; l&agrave; nh&agrave; nhập khẩu v&agrave; ph&acirc;n phối gỗ nhập khẩu nguy&ecirc;n liệu: gỗ sồi, gỗ &oacute;c ch&oacute;, gỗ tần bị, &hellip; Từ c&aacute;c nh&agrave; cung cấp nguy&ecirc;n liệu uy t&iacute;n h&agrave;ng đầu của Mỹ.</p>\n\n<p style=\"text-align:justify\">Gỗ nhập khẩu nguy&ecirc;n liệu Mỹ với quy c&aacute;ch 4/4&rdquo; (25.4 mm), 5/4&Prime; (31.8 mm), 6/4&Prime; (38.1 mm), 8/4&Prime; (50.8 mm), l&agrave; những quy c&aacute;ch phổ biến được c&ocirc;ng ty tnhh Greenecolife nhập khẩu v&agrave; ph&acirc;n phối nhiều nhất hiện nay tại thị trường Việt Nam.</p>\n\n<p style=\"text-align:justify\">&ndash; Chi&ecirc;̀u r&ocirc;̣ng thanh gỗ: từ 3&Prime;= 75 mm đ&ecirc;́n 12&Prime;= 300 mm.</p>\n\n<p style=\"text-align:justify\">&ndash; Chi&ecirc;̀u dài thanh gỗ: từ 4&prime; = 1,2 m đ&ecirc;́n 16&rsquo;= 4,8 m.</p>\n\n<p style=\"text-align:justify\">&ndash; Độ ẩm của gỗ đạt từ 8 đến 12%.</p>\n\n<p style=\"text-align:justify\">Gỗ nhập khẩu nguy&ecirc;n liệu từ Mỹ c&oacute; c&aacute;c ph&acirc;n loại:</p>\n\n<p style=\"text-align:justify\">+ Loại FAS</p>\n\n<p style=\"text-align:justify\">+ Loại 1C</p>\n\n<p style=\"text-align:justify\">+ Loại 2C</p>\n\n<p style=\"text-align:justify\">+ Loại 3C</p>\n\n<p style=\"text-align:justify\">&ndash; Quy c&aacute;ch đ&oacute;ng g&oacute;i gỗ nhập khẩu nguy&ecirc;n liệu từ Mỹ:</p>\n\n<p style=\"text-align:justify\">+ Ki&ecirc;̣n ngắn: 4 &rarr; 6 feet.</p>\n\n<p style=\"text-align:justify\">+ Ki&ecirc;̣n dài: 10 &rarr; 16 feet.</p>\n\n<p style=\"text-align:justify\">Gỗ Sồi: M&agrave;u sắc v&agrave; h&igrave;nh dạng của gỗ sồi Mỹ tương tự như gỗ sồi Ch&acirc;u &Acirc;u. D&aacute;t gỗ m&agrave;u nhạt, t&acirc;m gỗ từ n&acirc;u nhạt cho đến n&acirc;u sậm. Đa số gỗ sồi trắng c&oacute; v&acirc;n gỗ thẳng, mặt gỗ từ trung b&igrave;nh đến th&ocirc; với c&aacute;c tia gỗ d&agrave;i hơn sồi đỏ.</p>\n\n<p style=\"text-align:justify\">V&igrave; vậy, sồi trắng c&oacute; nhiều đốm h&igrave;nh hơn.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-nhap-khau-2.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Quy c&aacute;ch đ&oacute;ng g&oacute;i nguy&ecirc;n liệu gỗ sồi trắng 4/4&Prime;.</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Gỗ &Oacute;c Ch&oacute;: D&aacute;t gỗ m&agrave;u trắng kem, t&acirc;m gỗ m&agrave;u từ n&acirc;u nhạt đến n&acirc;u socola, thường &aacute;nh t&iacute;m đỏ v&agrave; c&oacute; sọc đỏ hơn. &Oacute;c ch&oacute; c&oacute; thể được sấy hơi nước để l&agrave;m sậm m&agrave;u d&aacute;t gỗ hoặc kh&ocirc;ng sấy hơi nước. Nh&igrave;n chung, v&acirc;n gỗ thẳng nhưng đ&ocirc;i khi uốn s&oacute;ng hoặc cuộn xo&aacute;y tạo th&agrave;nh những đốm h&igrave;nh hấp dẫn v&agrave; đẹp nhất.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-nhap-khau-3.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Quy c&aacute;ch đ&oacute;ng g&oacute;i nguy&ecirc;n liệu gỗ &oacute;c ch&oacute; 4/4&Prime;.</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Gỗ Tần B&igrave;: Tần b&igrave; Mỹ c&oacute; h&igrave;nh dạng tương tự như tần b&igrave; Ch&acirc;u &Acirc;u. D&aacute;t gỗ m&agrave;u từ nhạt đến gần như trắng, t&acirc;m gỗ c&oacute; m&agrave;u sắc đa dạng, từ n&acirc;u x&aacute;m đến n&acirc;u nhạt, hoặc v&agrave;ng nhạc sọc n&acirc;u. Nh&igrave;n chung, v&acirc;n gỗ thẳng, mặt gỗ th&ocirc; đều. Thứ hạng v&agrave; trữ lượng tần b&igrave; c&oacute; d&aacute;t gỗ m&agrave;u nhạt v&agrave; c&oacute; th&ecirc;m một số đặc t&iacute;nh kh&aacute;c thay đổi t&ugrave;y v&ugrave;ng trồng gỗ.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-nhap-khau-4.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Quy c&aacute;ch đ&oacute;ng g&oacute;i nguy&ecirc;n liệu gỗ tần b&igrave; 4/4&Prime;.</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Ứng dụng của gỗ nhập khẩu nguy&ecirc;n liệu Mỹ:</p>\n\n<p style=\"text-align:justify\">Gỗ nhập khẩu nguy&ecirc;n liệu: gỗ Sồi, gỗ &Oacute;c Ch&oacute;, gỗ Tần B&igrave;. Được nhập về Việt Nam, chủ yếu d&ugrave;ng l&agrave;m nội thất, đồ gỗ, v&aacute;n s&agrave;n, gỗ chạm kiến tr&uacute;c, gờ trang tr&iacute;, cửa c&aacute;i, tủ, &hellip;</p>\n\n<p style=\"text-align:justify\">Gỗ l&agrave; một nguy&ecirc;n liệu tự nhi&ecirc;n v&agrave; do ch&iacute;nh bản chất của n&oacute; n&ecirc;n c&oacute; c&aacute;c đặc điểm v&agrave; khuyết điểm ta cần nắm r&otilde;. V&igrave; vậy, người ti&ecirc;u d&ugrave;ng cũng như c&aacute;c nh&agrave; chế biến gỗ chuy&ecirc;n nghiệp n&ecirc;n l&agrave;m việc chặc chẽ với c&aacute;c đầu mối cung cấp gỗ để đảm bảo rằng loại gỗ được đặt h&agrave;ng th&iacute;ch hợp cho những nhu cầu cụ thể của họ.</p>\n\n<p style=\"text-align:justify\">Hiện nay, với nguồn gỗ tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; gỗ nguy&ecirc;n liệu tự nhi&ecirc;n ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; Greenecolife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất gỗ, qu&yacute; c&ocirc;ng ty thiết kế nội thất với chất lượng gỗ nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng.</p>', 'chú thích Man City dẫn đầu về số cầu thủ kiến tạo tại Ngoại hạng Anh', 'metakeyword Man City dẫn đầu về số cầu thủ kiến tạo tại Ngoại hạng Anh', 'metadescription Man City dẫn đầu về số cầu thủ kiến tạo tại Ngoại hạng Anh', 30, 12, 1, '2018-01-03 07:52:45', '2018-01-20 04:06:05'),
(15, 'Gỗ sồi trắng Greenecolife phân phối nhập khẩu', 'go-soi-trang-greenecolife-phan-phoi-nhap-khau', 'sai-gon-tuyet-lam-667.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">GỖ SỒI TRẮNG GREENECOLIFE NHẬP KHẨU PH&Acirc;N PHỐI</p>\r\n\r\n<p style=\"text-align:justify\">Gỗ sồi trắng Mỹ (American White oak)</p>\r\n\r\n<p style=\"text-align:justify\">C&aacute;c t&ecirc;n kh&aacute;c: Northern White Oak, Southern White Oak.</p>\r\n\r\n<p style=\"text-align:justify\">C&ocirc;ng ty tnhh Greenecolife l&agrave; một trong những nh&agrave; nhập khẩu v&agrave; ph&acirc;n phối gỗ nguy&ecirc;n liệu nhiều nhất hiện nay tại thị trường Việt Nam.</p>\r\n\r\n<p style=\"text-align:justify\">M&agrave;u sắc v&agrave; h&igrave;nh dạng của gỗ sồi trắng Mỹ tương tự như gỗ sồi trắng Ch&acirc;u &Acirc;u. D&aacute;t gỗ m&agrave;u nhạt, t&acirc;m gỗ từ n&acirc;u nhạt cho đến n&acirc;u sậm. Đa số gỗ sồi trắng c&oacute; v&acirc;n gỗ thẳng, mặt gỗ từ trung b&igrave;nh đến th&ocirc; với c&aacute;c tia gỗ d&agrave;i hơn sồi đỏ. V&igrave; vậy, sồi trắng c&oacute; nhiều đốm h&igrave;nh hơn.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-phan-phoi-2.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: V&acirc;n gỗ sồi trắng Mỹ.</em></p>\r\n\r\n<p style=\"text-align:justify\">Gỗ sồi trắng greenecolife, nguy&ecirc;n liệu gỗ nhập khẩu từ Mỹ c&oacute; c&aacute;c ph&acirc;n loại:</p>\r\n\r\n<p style=\"text-align:justify\">+ Loại 1C</p>\r\n\r\n<p style=\"text-align:justify\">+ Loại 2C</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Quy c&aacute;ch đ&oacute;ng g&oacute;i nguy&ecirc;n liệu gỗ nhập khẩu từ Mỹ:</p>\r\n\r\n<p style=\"text-align:justify\">+ Ki&ecirc;̣n ngắn: 4 &rarr; 6 feet.</p>\r\n\r\n<p style=\"text-align:justify\">+ Ki&ecirc;̣n dài: 10 &rarr; 16 feet.</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Chi&ecirc;̀u r&ocirc;̣ng thanh gỗ: từ 3&Prime;= 75 mm đ&ecirc;́n 12&Prime;= 300 mm.</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Chi&ecirc;̀u dài thanh gỗ: từ 4&prime; = 1,2 m đ&ecirc;́n 16&rsquo;= 4,8 m.</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Độ ẩm của gỗ đạt từ 8 đến 12%.</p>\r\n\r\n<p style=\"text-align:justify\">Hiện tr&ecirc;n thị trường Mỹ c&oacute; rất nhiều nh&agrave; cung cấp gỗ. V&igrave; vậy m&agrave; cũng sẽ c&oacute; nhiều quy c&aacute;ch đ&oacute;ng g&oacute;i kh&aacute;c nhau, đa dạng t&ugrave;y thuộc v&agrave;o mỗi nh&agrave; cung cấp.</p>\r\n\r\n<p style=\"text-align:justify\">Tham khảo th&ecirc;m c&aacute;c sản phẩm gỗ sồi trắng Greenecolife nhập khẩu</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-phan-phoi-3.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: &nbsp;Gỗ sồi trắng 4/4&Prime;.</em></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-phan-phoi-1.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Gỗ sồi trắng 5/4&Prime;.</em></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-phan-phoi-5.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Gỗ sồi trắng 6/4&Prime;.</em></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-phan-phoi-4.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Gỗ sồi trắng 8/4&Prime;.</em></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Đặc t&iacute;nh ứng dụng: Gỗ chịu m&aacute;y tốt, độ b&aacute;m đinh v&agrave; ốc v&iacute;t tốt d&ugrave; phải khoan gỗ trước khi đ&oacute;ng đinh v&agrave; ốc. V&igrave; gỗ phản ứng với sắt, người thao t&aacute;c n&ecirc;n d&ugrave;ng đinh mạ kẽm. Độ b&aacute;m d&iacute;nh của gỗ thay đổi nhưng gỗ c&oacute; thể được nhuộm m&agrave;u v&agrave; đ&aacute;nh b&oacute;ng để th&agrave;nh th&agrave;nh phẩm tốt. Gỗ kh&ocirc; chậm n&ecirc;n người thao t&aacute;c cẩn thận để tr&aacute;nh nguy cơ rạn gỗ. V&igrave; độ co r&uacute;t lớn n&ecirc;n dễ biến dạng khi gỗ kh&ocirc;.</p>\r\n\r\n<p style=\"text-align:justify\">Đặc t&iacute;nh vật l&yacute;: Gỗ cứng v&agrave; nặng, độ chịu lực uốn xoắn v&agrave; lực n&eacute;n trung b&igrave;nh, độ chắc thấp nhưng rất dễ uốn c&ocirc;ng bằng hơi nước. Gỗ miền Nam lớn hơn với c&aacute;c v&ograve;ng tuổi gỗ rộng, c&oacute; khuynh hướng cứng hơn v&agrave; nặng hơn.</p>\r\n\r\n<p style=\"text-align:justify\">T&acirc;m gỗ c&oacute; khả năng kh&aacute;ng s&acirc;u, cực kỳ kh&ocirc;ng thấm chất bảo quản, d&aacute;t gỗ tương đối kh&ocirc;ng thấm chất n&agrave;y.</p>\r\n\r\n<p style=\"text-align:justify\">C&ocirc;ng dụng ch&iacute;nh của nguy&ecirc;n liệu gỗ sồi Mỹ nhập khẩu thường được sử dụng để l&agrave;m: đồ gỗ, v&aacute;n s&agrave;n, gỗ chạm kiến tr&uacute;c, gỗ chạm ngoại thất, gờ trang tr&iacute;, cửa c&aacute;i, tủ bếp, v&aacute;n l&oacute;t, t&agrave; vẹt đường sắt, cầu gỗ, v&aacute;n đ&oacute;ng th&ugrave;ng, v&agrave; hộp đựng nữ trang, &hellip;</p>\r\n\r\n<p style=\"text-align:justify\">M&agrave;u sắc, mặt gỗ, đặc t&iacute;nh v&agrave; đặc điểm của gỗ sồi trắng c&oacute; thể thay đổi t&ugrave;y v&ugrave;ng trồng gỗ. V&igrave; vậy, người ti&ecirc;u d&ugrave;ng cũng như c&aacute;c nh&agrave; chế biến gỗ chuy&ecirc;n nghiệp n&ecirc;n l&agrave;m việc chặc chẽ với đầu mối cung cấp gỗ để đảm bảo rằng loại gỗ được đặt h&agrave;ng th&iacute;ch hợp cho những nhu cầu cụ thể của họ.</p>\r\n\r\n<p style=\"text-align:justify\">Hiện nay, với nguồn gỗ tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; gỗ nguy&ecirc;n liệu tự nhi&ecirc;n ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; Greenecolife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất gỗ, qu&yacute; c&ocirc;ng ty thiết kế nội thất với chất lượng gỗ nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng.</p>', 'chú thích Gỗ sồi trắng Greenecolife phân phối nhập khẩu', 'metakeyword Gỗ sồi trắng Greenecolife phân phối nhập khẩu', 'metadescription Gỗ sồi trắng Greenecolife phân phối nhập khẩu', 7, 1, 1, '2018-01-12 10:01:42', '2018-03-28 07:08:51'),
(17, 'Gỗ óc chó 8/4″ 2c (Walnut 8/4″ 2c)', 'go-oc-cho-84-2c-walnut-84-2c', 'xuan-da-den-roi-8810.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">GỖ &Oacute;C CH&Oacute; 8/4&rdquo; 2C (WALNUT 8/4&rdquo; 2C)</p>\r\n\r\n<p style=\"text-align:justify\">Gỗ &oacute;c ch&oacute; 8/4&Prime; 2c Mỹ (American Walnut)</p>\r\n\r\n<p style=\"text-align:justify\">C&aacute;c t&ecirc;n kh&aacute;c: Black Walnut, Americam Walnut.</p>\r\n\r\n<p style=\"text-align:justify\">Nguy&ecirc;n cont gỗ vừa về kho Greenecolife Việt Nam s&aacute;ng nay, nhưng chưa kịp v&ocirc; kho th&igrave; đ&atilde; được xuất đi hết</p>\r\n\r\n<p style=\"text-align:justify\">Gỗ nhập khẩu nguy&ecirc;n liệu Mỹ với quy c&aacute;ch 8/4&rdquo; (50.8 mm) loại 2, l&agrave; những quy c&aacute;ch phổ biến được c&ocirc;ng ty tnhh Greenecolife nhập khẩu v&agrave; ph&acirc;n phối nhiều nhất hiện nay tại thị trường Việt Nam.</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Chi&ecirc;̀u r&ocirc;̣ng thanh gỗ: từ 3&Prime;= 75 mm đ&ecirc;́n 12&Prime;= 300 mm.</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Chi&ecirc;̀u dài thanh gỗ: từ 4&prime; = 1,2 m đ&ecirc;́n 16&rsquo;= 4,8 m.</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Độ ẩm của gỗ đạt từ 8 đến 12%.</p>\r\n\r\n<p style=\"text-align:justify\">Gỗ &oacute;c ch&oacute; 8/4&Prime;, gỗ nhập khẩu nguy&ecirc;n liệu từ Mỹ c&oacute; c&aacute;c ph&acirc;n loại:</p>\r\n\r\n<p style=\"text-align:justify\">+ Loại FAS</p>\r\n\r\n<p style=\"text-align:justify\">+ Loại 1C</p>\r\n\r\n<p style=\"text-align:justify\">+ Loại 2C</p>\r\n\r\n<p style=\"text-align:justify\">+ Loại 3C</p>\r\n\r\n<p style=\"text-align:justify\">&ndash; Quy c&aacute;ch đ&oacute;ng g&oacute;i nguy&ecirc;n liệu gỗ nhập khẩu từ Mỹ:</p>\r\n\r\n<p style=\"text-align:justify\">+ Ki&ecirc;̣n ngắn: 4 &rarr; 6 feet.</p>\r\n\r\n<p style=\"text-align:justify\">+ Ki&ecirc;̣n dài: 10 &rarr; 16 feet.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-oc-cho-walnut-1.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Quy c&aacute;ch đ&oacute;ng g&oacute;i nguy&ecirc;n liệu gỗ &oacute;c ch&oacute; 8/4&Prime;.</em></p>\r\n\r\n<p style=\"text-align:justify\">Hiện tr&ecirc;n thị trường Mỹ c&oacute; rất nhiều nh&agrave; cung cấp gỗ nguy&ecirc;n liệu. V&igrave; vậy m&agrave; cũng sẽ c&oacute; nhiều quy c&aacute;ch đ&oacute;ng g&oacute;i kh&aacute;c nhau, đa dạng t&ugrave;y thuộc v&agrave;o mỗi nh&agrave; cung cấp gỗ.</p>\r\n\r\n<p style=\"text-align:justify\">Tham khảo th&ecirc;m c&aacute;c sản phẩm Greenecolife Việt Nam nhập khẩu: nguy&ecirc;n liệu gỗ &oacute;c ch&oacute; kh&aacute;c</p>\r\n\r\n<p style=\"text-align:justify\">Gỗ &oacute;c ch&oacute; 4/4&Prime;.</p>\r\n\r\n<p style=\"text-align:justify\">Gỗ &oacute;c ch&oacute; 5/4&Prime;.</p>\r\n\r\n<p style=\"text-align:justify\">Gỗ &oacute;c ch&oacute; 6/4&Prime;.</p>\r\n\r\n<p style=\"text-align:justify\">D&aacute;t gỗ m&agrave;u trắng kem, t&acirc;m gỗ m&agrave;u từ n&acirc;u nhạt đến n&acirc;u socola, thường &aacute;nh t&iacute;m đỏ v&agrave; c&oacute; sọc đỏ hơn. &Oacute;c ch&oacute; c&oacute; thể được sấy hơi nước để l&agrave;m sậm m&agrave;u d&aacute;t gỗ hoặc kh&ocirc;ng sấy hơi nước. Nh&igrave;n chung, v&acirc;n gỗ thẳng nhưng đ&ocirc;i khi uốn s&oacute;ng hoặc cuộn xo&aacute;y tạo th&agrave;nh những đốm h&igrave;nh hấp dẫn v&agrave; đẹp nhất.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-oc-cho-walnut-2.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: V&acirc;n &amp; m&agrave;u sắc gỗ &oacute;c ch&oacute; Mỹ.</em></p>\r\n\r\n<p style=\"text-align:justify\">Đặc t&iacute;nh ứng dụng: &Oacute;c ch&oacute; dễ xử l&yacute; cả bằng dụng cụ cầm tay lẫn m&aacute;y m&oacute;c. Gỗ b&aacute;m đinh, &oacute;c v&iacute;t v&agrave; d&iacute;nh keo tốt, giữ sơn, m&agrave;u nhuộm rất tốt v&agrave; c&oacute; thể được đ&aacute;nh b&oacute;ng để th&agrave;nh th&agrave;nh phẩm tuyệt vời. Gỗ kh&ocirc; chậm v&agrave; người thao t&aacute;c cẩn thận trọng trong qu&aacute; tr&igrave;nh sấy kh&ocirc; để tr&aacute;ch việc gỗ bị xuống cấp. Gỗ ổn định tốt về k&iacute;ch thước.<br />\r\nĐặc t&iacute;nh vật l&yacute;: &Oacute;c cho l&agrave; loại gỗ rất cứng, mật độ hạt gỗ trung b&igrave;nh, sức chịu lực uốn xoắn v&agrave; lực n&eacute;n trung b&igrave;nh, độ chắc thấp, khả năng uốn cong bằng hơi nước tốt.</p>\r\n\r\n<p style=\"text-align:justify\">Độ kh&aacute;ng s&acirc;u ở t&acirc;m gỗ rất tốt, l&agrave; một trong những loại gỗ c&oacute; độ bền cao nhất ngay cả l&uacute;c ở trong những điều kiện dễ hư mục. D&aacute;t gỗ dễ bị c&aacute;c loại mọt tấn c&ocirc;ng.<br />\r\nC&ocirc;ng dụng ch&iacute;nh của nguy&ecirc;n liệu gỗ &oacute;c ch&oacute; Mỹ nhập khẩu thường được sử dụng để l&agrave;m: đồ gỗ, tủ, vật kiến tr&uacute;c nội thất, gỗ chạm cao cấp,cửa c&aacute;i, v&aacute;n s&agrave;n v&agrave; v&aacute;n l&oacute;t. Th&iacute;ch hợp để tạo sự tương phản với những loại gỗ c&oacute; m&agrave;u nhạt hơn.</p>\r\n\r\n<p style=\"text-align:justify\">Một số h&igrave;nh ảnh Cont gỗ &oacute;c ch&oacute; 8/4&Prime; 2C vừa về :</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-oc-cho-walnut-3.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh 1: Gỗ &oacute;c ch&oacute; Mỹ 8/4&Prime; 2C.</em></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-oc-cho-walnut-5.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh 2: Gỗ &oacute;c ch&oacute; Mỹ 8/4&Prime; loại 2C.</em></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-oc-cho-walnut-4.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh 3: Gỗ &oacute;c ch&oacute; Mỹ 8/4&Prime; loại 2C tr&ecirc;n cont.</em></p>\r\n\r\n<p style=\"text-align:justify\">Gỗ l&agrave; một nguy&ecirc;n liệu tự nhi&ecirc;n v&agrave; do ch&iacute;nh bản chất của n&oacute; n&ecirc;n c&oacute; c&aacute;c đặc điểm v&agrave; khuyết điểm ta cần nắm r&otilde;. V&igrave; vậy, người ti&ecirc;u d&ugrave;ng cũng như c&aacute;c nh&agrave; chế biến gỗ chuy&ecirc;n nghiệp n&ecirc;n l&agrave;m việc chặc chẽ với đầu mối cung cấp gỗ để đảm bảo rằng loại gỗ được đặt h&agrave;ng th&iacute;ch hợp cho những nhu cầu cụ thể của họ.</p>\r\n\r\n<p style=\"text-align:justify\">Hiện nay, với nguồn gỗ tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; gỗ nguy&ecirc;n liệu tự nhi&ecirc;n ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; Greenecolife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất gỗ, qu&yacute; c&ocirc;ng ty thiết kế nội thất với chất lượng gỗ nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng.</p>', '', '', '', NULL, 3, 1, '2018-01-12 10:11:22', '2018-03-28 07:06:17'),
(18, 'Gỗ sồi trắng Mỹ', 'go-soi-trang-my', 'conmochieu-1.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">Gỗ Sồi Trắng Mỹ (American White Oak) Nguy&ecirc;n Liệu Nhập Khẩu Mỹ</p>\n\n<p style=\"text-align:justify\">Gỗ Sồi trắng Mỹ (American White Oak, Northern White Oak, Southern White Oak) c&oacute; mặt ở khắp miền Đ&ocirc;ng nước Mỹ. Sồi trắng gồm nhiều loại nhưng chỉ c&oacute; t&aacute;m loại đựơc thương mại h&oacute;a.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-my-1.jpeg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: C&acirc;y gỗ sồi trắng Mỹ.</em></p>\n\n<p style=\"text-align:justify\">M&agrave;u sắc v&agrave; h&igrave;nh d&aacute;ng của sồi Mỹ tương tự như sồi Ch&acirc;u &Acirc;u. D&aacute;t gỗ m&agrave;u nhạt, t&acirc;m gỗ từ n&acirc;u nhạt đến n&acirc;u sậm. Đa số sồi trắng c&oacute; v&acirc;n gỗ thẳng, mặt gỗ từ trung b&igrave;nh đến th&ocirc; với c&aacute;c tia gỗ d&agrave;i hơn sồi đỏ. V&igrave; vậy, sồi trắng c&oacute; nhiều đốm h&igrave;nh hơn.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-my-2.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: C&aacute;c kiện nguy&ecirc;n liệu gỗ sồi trắng 4/4&Prime;.&nbsp;</em></p>\n\n<p style=\"text-align:justify\">Tham khảo th&ecirc;m quy c&aacute;c gỗ sồi trắng Mỹ, Greenecolife Việt Nam nhập khẩu:</p>\n\n<p style=\"text-align:justify\">Gỗ sồi trắng 4/4&Prime;.</p>\n\n<p style=\"text-align:justify\">Gỗ sồi trắng 5/4&Prime;.</p>\n\n<p style=\"text-align:justify\">Gỗ sồi trắng 6/4&Prime;.</p>\n\n<p style=\"text-align:justify\">Gỗ sồi trắng 8/4&Prime;.</p>\n\n<p style=\"text-align:justify\">Đặc t&iacute;nh ứng dụng &amp; vật l&yacute;: Gỗ chịu m&aacute;y tốt, độ b&aacute;m đinh v&agrave; ốc v&iacute;t tốt, d&ugrave; phải khoan gỗ trước khi đ&oacute;ng đinh v&agrave; ốc. Gỗ phản ứng với sắt do đ&oacute; người thao t&aacute;c n&ecirc;n d&ugrave;ng đinh mạ kẽm. Độ b&aacute;m d&iacute;nh của gỗ thay đổi nhưng gỗ c&oacute; thể được nhuộm m&agrave;u v&agrave; đ&aacute;nh b&oacute;ng để trở th&agrave;nh th&agrave;nh phẩm tốt. Gỗ kh&ocirc; chậm n&ecirc;n người thao t&aacute;c cẩn thận để tr&aacute;nh nguy cơ rạn gỗ. V&igrave; độ co r&uacute;t lớn n&ecirc;n gỗ dễ biến dạng khi kh&ocirc;.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-my-3.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: C&aacute;c th&ocirc;ng số, chỉ số của gỗ sồi trắng Mỹ.</em></p>\n\n<p style=\"text-align:justify\">Gỗ cứng v&agrave; nặng, độ chịu lực uốn xoắn v&agrave; lực n&eacute;n trung b&igrave;nh, độ chắc thấp nhưng rất dễ uốn cong bằng hơi nước. Sồi trắng miền nam lớn nhanh hơn với c&aacute;c v&ograve;ng tuổi gỗ rộng, c&oacute; khuynh hướng cứng v&agrave; nặng hơn.</p>\n\n<p style=\"text-align:justify\">Độ bền: T&acirc;m gỗ c&oacute; khả năng kh&aacute;ng s&acirc;u, cực kỳ kh&ocirc;ng thấm chất bảo quản, d&aacute;t gỗ tương đối kh&ocirc;ng thấm chất n&agrave;y.</p>\n\n<p style=\"text-align:justify\">C&ocirc;ng dụng ch&iacute;nh: Đồ gỗ, v&aacute;n s&agrave;n, gỗ chạm kiến tr&uacute;c, gỗ chạm ngoại thất, gờ trang tr&iacute;, cửa c&aacute;i, tủ bếp, v&aacute;n l&oacute;t, t&agrave; vẹt đường sắt, cầu gỗ, v&aacute;n đ&oacute;ng th&ugrave;ng, quan t&agrave;i v&agrave; hộp đựng nữ trang.</p>\n\n<p style=\"text-align:justify\">M&agrave;u sắc, mặt gỗ, đặc t&iacute;nh v&agrave; đặc điểm của Sồi trắng c&oacute; thể thay đổi t&ugrave;y thuộc v&ugrave;ng trồng gỗ. V&igrave; vậy người ti&ecirc;u d&ugrave;ng cũng như c&aacute;c nh&agrave; chế biến gỗ chuy&ecirc;n nghiệp n&ecirc;n l&agrave;m việc chặt chẽ với đầu mối cung cấp gỗ để đảm bảo l&agrave; loại gỗ được đặt h&agrave;ng th&iacute;ch hợp cho những nhu cầu cụ thể của họ. Sồi trắng miền Bắc v&agrave; Sồi trắng miền Nam c&oacute; thể được b&agrave;y b&aacute;n ri&ecirc;ng biệt.</p>\n\n<p style=\"text-align:justify\">Một số h&igrave;nh ảnh sản phẩm nội thất bằng gỗ sồi trắng Mỹ:Những th&ocirc;ng tin kh&aacute;c</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-my-4.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: bộ b&agrave;n ghế gỗ sồi trắng Mỹ.</em></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-trang-my-5.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Nội thất ph&ograve;ng kh&aacute;ch gỗ sồi trắng Mỹ.</em></p>\n\n<p style=\"text-align:justify\">M&agrave;u sồi trắng thường rất đồng đều giữa c&aacute;c loại miền Bắc Mỹ đến miền Nam Mỹ. Một số khu vực v&ugrave;ng n&uacute;i Appalachian sản xuất c&aacute;c biến thể c&oacute; đốm s&acirc;u cao v&agrave; được b&aacute;n theo loại c&oacute; đốm s&acirc;u tố (Sound Wormy). C&aacute;c nguy&ecirc;n tắc của NHLA chấp nhận kh&ocirc;ng giới hạn d&aacute;t gỗ, nhưng thường được ph&acirc;n loại với tối thiểu một mặt t&acirc;m gỗ để xuất khẩu. N&ecirc;n tham khảo nh&agrave; cung cấp vể quy chuẩn xếp hạng của họ cho d&aacute;t gỗ.</p>\n\n<p style=\"text-align:justify\">Sồi trắng Mỹ được sử dụng rộng r&atilde;i tr&ecirc;n thế giới v&agrave; bổ sung cho gỗ sồi ch&acirc;u &Acirc;u, m&agrave;u sắc nhất qu&aacute;n v&agrave; khối lượng sản xuất ph&aacute;ch gỗ vạt g&oacute;c vu&ocirc;ng lớn gi&uacute;p sồi trắng Mỹ l&agrave; chọn lựa h&agrave;ng đầu cho nhiều nh&agrave; sản xuất đồ nội thất, v&aacute;n s&agrave;n v&agrave; đồ gỗ trang tr&iacute;.</p>\n\n<p style=\"text-align:justify\">Hiện nay, với nguồn gỗ tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; gỗ nguy&ecirc;n liệu tự nhi&ecirc;n ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; Greenecolife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất gỗ, qu&yacute; c&ocirc;ng ty thiết kế nội thất với chất lượng gỗ nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng.</p>', '', '', '', 2, 4, 1, '2018-01-12 10:15:38', '2018-01-20 04:04:56'),
(19, 'Gỗ sồi chất lượng cao được sử dụng', 'go-soi-chat-luong-cao-duoc-su-dung', 'conmochieu-2.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>Với xu hướng hiện nay th&igrave; nguy&ecirc;n liệu gỗ Sồi , gỗ &oacute;c ch&oacute; nhập khẩu để thiết kế đồ nội thất đang được thịnh h&agrave;nh, v&igrave; đơn giản gỗ Sồi đ&atilde; c&oacute; vẻ đẹp ri&ecirc;ng của n&oacute;, n&ecirc;n chỉ cần biết c&aacute;ch phối v&agrave; chọn lựa mẫu m&atilde; đảm bảo sẽ mang tới kh&ocirc;ng gian ho&agrave;n hảo. Gỗ sồi chất lượng cao c&oacute; xuất xứ từ Bắc Mỹ, mang m&agrave;u sắc v&agrave;ng lợt thuộc t&ocirc;ng m&agrave;u s&aacute;ng nhẹ rất dễ phối với mọi đồ nội thất trong nh&agrave;. C&aacute;c sản phẩm được sản xuất từ Gỗ sồi chất lượng cao lu&ocirc;n tạo cảm gi&aacute;c cho ng&ocirc;i nh&agrave; h&agrave;i h&ograve;a với &aacute;nh s&aacute;ng tự nhi&ecirc;n, trẻ trung, ấm c&uacute;ng v&agrave; hiện đại.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-chat-luong-cao-1.jpg\" /></p>\n\n<p>C&aacute;c sản phẩm nội thất được l&agrave;m bằng Gỗ sồi chất lượng cao lu&ocirc;n tạo cho căn ph&ograve;ng h&agrave;i h&ograve;a với &aacute;nh s&aacute;ng tự nhi&ecirc;n, trẻ trung, ấm c&uacute;ng v&agrave; hiện đại&hellip; Đặc biệt hơn nữa l&agrave; loại gỗ n&agrave;y c&oacute; thể tr&aacute;nh được muỗi v&agrave; c&ocirc;n tr&ugrave;ng, kh&ocirc;ng bị mối mọt ph&aacute; hoại. gỗ sồi c&oacute; độ chống thấm rất tốt, đường v&acirc;n gỗ đa dạng v&agrave; đẹp hơn, v&igrave; vậy gỗ sồi rất th&iacute;ch hợp cho việc sản xuất đồ gỗ với những v&acirc;n hoa đẹp. Gỗ sồi cứng v&agrave; nặng, chịu lực n&eacute;n tốt, t&acirc;m gỗ c&oacute; khả năng kh&aacute;ng s&acirc;u, cực kỳ kh&ocirc;ng thấm chất bảo quản.</p>\n\n<p>Gỗ sồi c&oacute; xu hướng phản ứng với sắt v&agrave; điều n&agrave;y c&oacute; thể nhanh ch&oacute;ng l&agrave;m hư hỏng một phần của đồ nội thất, mặc d&ugrave; điều n&agrave;y c&oacute; thể tr&aacute;nh được bằng c&aacute;ch sử dụng đinh v&iacute;t mạ kẽm. Hầu hết những đồ nội thất gỗ &oacute;c ch&oacute; b&aacute;n sẵn ng&agrave;y nay đều sử dụng đinh ghim, ốc v&iacute;t, một số nơi c&ograve;n sử dụng ch&uacute;ng ngay cả ở những phần quan trọng. Những h&atilde;ng nội thất uy t&iacute;n kh&ocirc;ng sử dụng đinh ghim hay ốc v&iacute;t ở tất cả mọi chỗ, họ sử dụng c&aacute;c mộng gỗ một c&aacute;ch ch&iacute;nh x&aacute;c để r&aacute;p c&aacute;c bộ phận của đồ nội thất lại với nhau, đinh ghim v&agrave; ốc v&iacute;t chỉ để gia cố th&ecirc;m.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-chat-luong-cao-2.jpg\" /></p>\n\n<p>Nội thất gỗ sồi chất lượng cao c&oacute; thể sử dụng từ 15 năm đến 20 năm t&ugrave;y theo qu&aacute; tr&igrave;nh sử dụng v&agrave; c&aacute;ch bảo quản của người d&ugrave;ng. &Ocirc;ng cha ta c&oacute; c&acirc;u &ldquo;của bền tại người&rdquo; n&ecirc;n nếu muốn sử dụng đồ nội thất gỗ sồi nhập khẩu cao cấp hay bất cứ loại gỗ n&agrave;o kh&aacute;c d&agrave;i l&acirc;u đ&ograve;i hỏi gia chủ cần phải sử dụng hợp l&yacute;, biết c&aacute;ch bảo quản v&agrave; vệ sinh thường xuy&ecirc;n.</p>\n\n<p>Thuộc v&agrave;o d&ograve;ng gỗ tự nhi&ecirc;n n&ecirc;n nội thất Gỗ sồi chất lượng cao, nội thất gỗ &oacute;c ch&oacute; chất lượng kh&ocirc;ng thể tr&aacute;nh khỏi được việc thấm nước, nấm mốc, hay mối tấn c&ocirc;ng&hellip; khi ở trong điều kiện m&ocirc;i trường kh&ocirc;ng l&yacute; tưởng l&acirc;u ng&agrave;y.</p>\n\n<p>Ch&iacute;nh v&igrave; thế, khi lựa chọn nội thất Gỗ sồi chất lượng cao th&igrave; bạn n&ecirc;n ch&uacute; &yacute; vệ sinh thường xuy&ecirc;n v&agrave; phun thuốc chống mối để c&oacute; thể sử dụng sản phẩm l&acirc;u d&agrave;i.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/go-soi-chat-luong-cao-3.jpg\" /></p>\n\n<p>L&agrave; một đơn vị c&oacute; bề d&agrave;y uy t&iacute;n, c&oacute; nhiều kinh nghiệm hoạt động trong lĩnh vực tư vấn thiết kế v&agrave; thi c&ocirc;ng kiến tr&uacute;c nội ngoại thất c&ocirc;ng tr&igrave;nh từ nhiều năm nay với thế mạnh chủ lực l&agrave; Tư vấn thiết kế v&agrave; Thi c&ocirc;ng c&aacute;c sản phẩm nội thất gỗ &oacute;c ch&oacute; cao cấp nhập khẩu, nội thất gỗ tần b&igrave; chất lượng. Ngo&agrave;i ra ch&uacute;ng t&ocirc;i c&ograve;n &ldquo;Cung cấp mua b&aacute;n gỗ Sồi nhập khẩu, gỗ nguy&ecirc;n liệu, bao gồm gỗ Tần B&igrave;, gỗ &Oacute;c Ch&oacute;, gỗ Sồi, c&aacute;c gỗ loại nh&oacute;m 4, gỗ được nhập từ Mỹ v&agrave; Ch&acirc;u &Acirc;u ( Li&ecirc;n hệ để c&oacute; gi&aacute; tốt nhất ) 0902 90 74 75&rdquo;.</p>', '', '', '', 6, 5, 1, '2018-01-12 10:17:58', '2018-01-20 04:05:07');
INSERT INTO `article` (`id`, `fullname`, `alias`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(20, 'Bộ sưu tập nội thất gỗ sồi của UMA', 'bo-suu-tap-noi-that-go-soi-cua-uma', 'conmochieu-3.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">Nh&agrave; thiết kế Joachim v&agrave; Erik theo đuổi dự &aacute;n thiết kế b&agrave;n ghế ph&ograve;ng ăn, kệ tủ gỗ sồi tại Việt Nam trong suốt nhiều năm.</p>\n\n<p style=\"text-align:justify\">Gỗ sồi vốn được ưa chuộng trong ng&agrave;nh c&ocirc;ng nghiệp nội thất nhờ độ bền vững, vẻ đẹp l&acirc;u d&agrave;i với thời gian. C&aacute;c bộ phận l&agrave;m bằng gỗ sồi l&agrave; phần cứng c&aacute;p nhất, c&oacute; thể chịu đựng mối mọt v&agrave; nấm mốc qua h&agrave;ng ngh&igrave;n năm. Nhờ lợi thế n&agrave;y m&agrave; sồi được ứng dụng rộng r&atilde;i trong nhiều phong c&aacute;ch nội thất kh&aacute;c nhau. Đ&acirc;y cũng l&agrave; l&yacute; do để nh&agrave; thiết kế người Ph&aacute;p Joachim Poirier chọn sồi l&agrave;m nguy&ecirc;n liệu bắt đầu dự &aacute;n s&aacute;ng tạo của m&igrave;nh tại si&ecirc;u thị nội thất v&agrave; trang tr&iacute; UMA (Việt Nam).</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/bo-suu-tap-1.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Erik (tr&aacute;i) v&agrave; Joachim (phải) l&agrave; 2 nh&agrave; thiết kế nội thất trẻ tuổi v&agrave; t&agrave;i năng.</em></p>\n\n<p style=\"text-align:justify\">Điểm nhấn của dự &aacute;n Cobra ch&iacute;nh l&agrave; bộ b&agrave;n ghế ph&ograve;ng ăn v&agrave; kệ tủ l&agrave;m từ gỗ sồi chắc chắn, thiết kế kh&aacute;c biệt.</p>\n\n<p style=\"text-align:justify\">Joachim tận dụng tối đa đường n&eacute;t tự nhi&ecirc;n của từng thớ gỗ khi thiết kế, nhằm tăng cường vẻ đẹp tự nhi&ecirc;n cho bộ sưu tập Cobra. Lấy cảm hứng từ phong c&aacute;ch v&ugrave;ng Scandinavian, Joachim thổi th&ecirc;m hơi thở thanh lịch, hiện đại v&agrave;o từng m&oacute;n đồ, t&iacute;nh to&aacute;n hợp l&yacute; mọi yếu tố nhỏ, tạo n&ecirc;n thế c&acirc;n bằng giữa c&aacute;c đường n&eacute;t.Th&aacute;ng 9/2013, dự &aacute;n mang t&ecirc;n Cobra ch&iacute;nh thức khởi động. Joachim mất nhiều đ&ecirc;m trăn trở c&aacute;ch l&agrave;m sao khiến cho phong c&aacute;ch nội thất v&ugrave;ng Scandinavian (Bắc &Acirc;u) trở n&ecirc;n ph&ugrave; hợp với văn h&oacute;a Việt Nam. D&ugrave; gặp kh&oacute; khăn, nhưng dự &aacute;n vẫn ho&agrave;n th&agrave;nh tốt đẹp sau một năm r&ograve;ng r&atilde; nhờ t&acirc;m huyết của cả đội ngũ.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/bo-suu-tap-2.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Nội thất &nbsp;bộ ghế Cobra qu&acirc;y quanh chiếc b&agrave;n elip bằng gỗ sồi.</em></p>\n\n<p style=\"text-align:justify\">Tuy nhi&ecirc;n chất liệu sồi chuy&ecirc;n d&ugrave;ng cho nội thất cao cấp, sẽ khiến gi&aacute; th&agrave;nh cuối c&ugrave;ng của sản phẩm sẽ đắt đỏ. &ldquo;Phải l&agrave;m sao để gi&aacute; th&agrave;nh nằm trong ngưỡng chấp nhận được, thật nhiều người c&oacute; thể trải nghiệm được vẻ đẹp v&agrave; độ bền của sồi&rdquo; l&agrave; c&acirc;u hỏi m&agrave; Jan-Erik Svensson &ndash; Gi&aacute;m đốc ph&aacute;t triển ng&agrave;nh h&agrave;ng đỗ nội thất gỗ UMA, cũng l&agrave; th&agrave;nh vi&ecirc;n trong nh&oacute;m dự &aacute;n Cobra trăn trở. Nh&agrave; thiết kế cắt giảm c&aacute;c yếu tố phụ th&ecirc;m, chỉ tập trung v&agrave;o chức năng. V&iacute; dụ như chiếc ghế ăn Cobra với phần lưng v&agrave; ch&acirc;n sau gắn liền th&agrave;nh một khối. Joachim muốn thiết kế một chiếc ghế mộc mạc v&agrave; đơn giản, l&agrave; nơi để gia đ&igrave;nh v&agrave; bạn b&egrave; d&agrave;nh thời gian cho nhau. S&aacute;nh đ&ocirc;i b&ecirc;n những chiếc ghế sồi chắc chắn l&agrave; b&agrave;n ăn h&igrave;nh elip, tạo th&ecirc;m kh&ocirc;ng kh&iacute; gần gũi khi mọi người qu&acirc;y quần trong bữa cơm.</p>\n\n<p style=\"text-align:justify\">Sau một năm thiết kế, t&igrave;m kiếm v&agrave; thỏa thuận th&agrave;nh c&ocirc;ng với nh&agrave; sản xuất, từng m&oacute;n đồ nội thất Cobra được ho&agrave;n thiện v&agrave; ph&acirc;n phối tr&ecirc;n to&agrave;n quốc với gi&aacute; th&agrave;nh ph&ugrave; hợp t&uacute;i tiền nhiều gia đ&igrave;nh Việt Nam. Erik chia sẻ: &ldquo;T&ocirc;i nhớ lại cảm x&uacute;c l&uacute;c ấy, vừa h&agrave;o hứng vừa hồi hộp, v&igrave; e rằng kết quả kh&ocirc;ng như mong đợi. Thực tế, Cobra l&agrave; bộ sưu tập sản phẩm chất lượng cao với gi&aacute; cả phải chăng&rdquo;.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/bo-suu-tap-3.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh: Bộ sưu tập nội thất ph&ograve;ng ăn Attila với khoảng 10 sản phẩm.</em></p>\n\n<p style=\"text-align:justify\">Trước đ&oacute;, cả hai cũng thử th&aacute;ch m&igrave;nh trong một dự &aacute;n kh&aacute;c về gỗ sồi, mang t&ecirc;n Attila với khoảng 10 sản phẩm.<br />\nBộ sưu tập n&agrave;y khởi động sớm hơn cả Cobra, song đến năm 2015 mới ra mắt do y&ecirc;u cầu x&acirc;y dựng bộ nội thất ph&ograve;ng ăn phức tạp. Cả 2 dự &aacute;n đều th&agrave;nh c&ocirc;ng ngo&agrave;i mong đợi, được mệnh danh l&agrave; những m&oacute;n đồ nội thất c&oacute; gi&aacute; trị ngh&igrave;n đời của UMA. Joachim v&agrave; Erik đ&atilde; bắt tay thực hiện c&aacute;c &yacute; tưởng thiết kế bộ sưu tập nội thất gỗ sồi Cobra. Họ kết hợp phong c&aacute;ch Bắc &Acirc;u với văn h&oacute;a Việt Nam, s&aacute;ng tạo v&agrave; đảm bảo chất lượng sản phẩm vượt tr&ecirc;n cả kỳ vọng.</p>', '', '', '', 21, 6, 1, '2018-01-12 10:20:06', '2018-03-19 07:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` bigint(20) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `article_id`, `category_id`, `created_at`, `updated_at`) VALUES
(19, 11, 5, '2018-01-03 07:45:23', '2018-01-03 07:45:23'),
(22, 14, 5, '2018-01-03 07:52:45', '2018-01-03 07:52:45'),
(25, 7, 5, '2018-01-12 09:24:57', '2018-01-12 09:24:57'),
(28, 17, 5, '2018-01-12 10:11:22', '2018-01-12 10:11:22'),
(29, 18, 5, '2018-01-12 10:15:38', '2018-01-12 10:15:38'),
(30, 19, 5, '2018-01-12 10:17:58', '2018-01-12 10:17:58'),
(31, 20, 5, '2018-01-12 10:20:06', '2018-01-12 10:20:06'),
(32, 15, 4, '2018-03-28 07:07:32', '2018-03-28 07:07:32'),
(33, 15, 7, '2018-03-28 07:07:32', '2018-03-28 07:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `caption` text COLLATE utf8_unicode_ci,
  `alt` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_url` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `category_id`, `caption`, `alt`, `image`, `page_url`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bé đón giáng sinh', 'bé đón giáng sinh 1', 's1.jpg', 'https://www.hdwallpapers.in', 1, 1, '2017-12-16 05:03:34', '2018-01-18 07:22:24'),
(2, 1, 'Khi trẻ cười', 'khi trẻ cười 2', 's2.jpg', 'cloudbeauty.vn', 2, 1, '2017-12-16 05:04:04', '2018-01-18 07:22:30'),
(3, 2, '', '', 'member-1.png', '', 1, 1, '2017-12-28 02:38:24', '2017-12-28 02:40:03'),
(4, 2, '', '', 'member-2.png', '', 2, 1, '2017-12-28 02:38:40', '2017-12-28 02:40:03'),
(5, 2, '', '', 'member-3.png', '', 3, 1, '2017-12-28 02:38:51', '2017-12-28 02:40:07'),
(6, 2, '', '', 'member-4.png', '', 4, 1, '2017-12-28 02:38:59', '2017-12-28 02:40:03'),
(7, 2, '', '', 'member-5.png', '', 5, 1, '2017-12-28 02:39:08', '2017-12-28 02:40:03'),
(8, 2, '', '', 'member-6.png', '', 6, 1, '2017-12-28 02:39:19', '2017-12-28 02:40:03'),
(9, 2, '', '', 'member-7.png', '', 7, 1, '2017-12-28 02:39:28', '2017-12-28 02:40:03'),
(10, 3, 'caption 1', 'alt 1', 'remote-dieu-khien-tu-xa-3549.png', 'http://greenecolife.vn/', 1, 1, '2018-01-15 04:22:46', '2018-03-28 07:09:42'),
(11, 3, 'caption 3', 'alt 3', 'chi-lien-vinhome-2-6509.png', 'http://tieplua.info', 3, 1, '2018-01-15 04:58:40', '2018-03-28 07:12:03'),
(13, 4, 'caption 5', 'alt 5', 'advertising-product-2.png', 'http://greenecolife.vn/', 1, 1, '2018-01-15 05:22:17', '2018-01-15 05:22:26'),
(14, 1, 'test 1', 'test 1', 's3.jpg', 'http://magiwan.vn/', 3, 1, '2018-01-18 07:23:11', '2018-01-18 07:23:11'),
(15, 2, '', '', 'partner-1.png', '', 8, 1, '2018-01-20 04:26:00', '2018-01-20 04:26:00'),
(16, 2, '', '', 'partner-2.png', '', 9, 1, '2018-01-20 04:26:06', '2018-01-20 04:26:06'),
(17, 2, '', '', 'partner-3.png', '', 10, 1, '2018-01-20 04:26:14', '2018-01-20 04:26:14'),
(18, 2, '', '', 'partner-4.png', '', 11, 1, '2018-01-20 04:26:23', '2018-01-20 04:26:23'),
(19, 2, '', '', 'partner-5.png', '', 12, 1, '2018-01-20 04:26:32', '2018-01-20 04:26:32'),
(20, 2, '', '', 'partner-6.png', '', 13, 1, '2018-01-20 04:26:43', '2018-01-20 04:26:43'),
(21, 2, '', '', 'partner-7.png', '', 14, 1, '2018-01-20 04:26:54', '2018-01-20 04:27:02'),
(22, 2, '', '', 'partner-8.png', '', 15, 1, '2018-01-20 04:27:12', '2018-01-20 04:27:12'),
(23, 2, '', '', 'partner-9.png', '', 16, 1, '2018-01-20 04:27:20', '2018-01-20 04:27:20'),
(24, 2, '', '', 'partner-10.png', '', 17, 1, '2018-01-20 04:27:28', '2018-01-20 04:27:28'),
(25, 2, '', '', 'partner-11.png', '', 19, 1, '2018-01-20 04:27:38', '2018-01-20 04:27:38'),
(26, 2, '', '', 'partner-12.png', '', 20, 1, '2018-01-20 04:27:50', '2018-01-20 04:27:50'),
(27, 2, '', '', 'partner-13.png', '', 21, 1, '2018-01-20 04:28:00', '2018-01-20 04:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `category_article`
--

DROP TABLE IF EXISTS `category_article`;
CREATE TABLE `category_article` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_article`
--

INSERT INTO `category_article` (`id`, `fullname`, `meta_keyword`, `meta_description`, `alias`, `parent_id`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Tin dự án', 'metakeyword Tin dự án', 'metadescription Tin dự án', 'tin-du-an', 0, 'xuan-da-den-roi-9039.jpg', 1, 1, '2017-12-18 02:17:10', '2018-03-28 07:09:26'),
(5, 'Tin bất động sản', 'metakeword Ngành gỗ', 'metadescription Ngành gỗ', 'tin-bat-dong-san', 0, 'chi-lien-vinhome-1-5990.png', 2, 1, '2017-12-18 02:17:19', '2018-03-28 07:05:40'),
(6, 'Thị trường', 'metakeyword Thị trường', 'metadescription Thị trường', 'thi-truong', 0, 'conmochieu-7.png', 3, 1, '2018-01-21 04:18:17', '2018-01-21 04:18:17'),
(7, 'Tư vấn', 'metakeyword Tư vấn', 'metadescription Tư vấn', 'tu-van', 0, 'conmochieu-8.png', 4, 1, '2018-01-21 04:18:43', '2018-01-21 04:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `category_banner`
--

DROP TABLE IF EXISTS `category_banner`;
CREATE TABLE `category_banner` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_banner`
--

INSERT INTO `category_banner` (`id`, `fullname`, `theme_location`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Slideshow', 'slideshow', 1, 1, '2017-12-16 05:02:58', '2017-12-28 08:45:44'),
(2, 'Đối tác', 'doi-tac', 1, 2, '2017-12-26 04:32:09', '2017-12-26 04:38:35'),
(3, 'Quảng cáo bài viết', 'advertising-article-widget', 1, 3, '2018-01-15 04:22:00', '2018-01-15 04:22:05'),
(4, 'Quảng cáo sản phẩm', 'advertising-product-widget', 1, 4, '2018-01-15 05:18:53', '2018-01-15 05:18:53');

-- --------------------------------------------------------

--
-- Table structure for table `category_param`
--

DROP TABLE IF EXISTS `category_param`;
CREATE TABLE `category_param` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `param_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_param`
--

INSERT INTO `category_param` (`id`, `fullname`, `alias`, `parent_id`, `param_value`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Triệu VNĐ', 'trieu-vnd', 0, '', 1, 1, '2018-03-20 08:52:03', '2018-03-20 08:52:03'),
(2, 'Tỷ VNĐ', 'ty-vnd', 0, '87', 2, 1, '2018-03-20 09:23:20', '2018-03-28 07:15:47'),
(3, 'Nghìn VNĐ', 'nghin-vnd', 0, '', 3, 1, '2018-03-20 09:30:04', '2018-03-20 09:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `category_video`
--

DROP TABLE IF EXISTS `category_video`;
CREATE TABLE `category_video` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_video`
--

INSERT INTO `category_video` (`id`, `fullname`, `meta_keyword`, `meta_description`, `alias`, `parent_id`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Video', 'metakeyword video', 'metadescription video', 'video', NULL, 'thuvienhinh-1.png', 1, 1, '2018-01-09 10:03:48', '2018-01-09 11:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_member`
--

INSERT INTO `group_member` (`id`, `fullname`, `alias`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '', 1, '2016-12-17 05:05:18', '2018-03-20 08:51:41'),
(2, 'Bài viết', NULL, 2, '2016-12-17 05:05:41', '2018-01-22 02:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `group_privilege`
--

DROP TABLE IF EXISTS `group_privilege`;
CREATE TABLE `group_privilege` (
  `id` int(11) NOT NULL,
  `group_member_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_privilege`
--

INSERT INTO `group_privilege` (`id`, `group_member_id`, `privilege_id`, `created_at`, `updated_at`) VALUES
(3040, 2, 1, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3041, 2, 2, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3042, 2, 3, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3043, 2, 4, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3044, 2, 5, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3045, 2, 16, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3046, 2, 17, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3047, 2, 33, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3048, 2, 49, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3049, 2, 50, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3050, 2, 55, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3051, 2, 56, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3052, 2, 57, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3053, 2, 58, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3054, 2, 59, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3055, 2, 60, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3056, 2, 61, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3057, 2, 62, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3058, 2, 63, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3059, 2, 67, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3060, 2, 68, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3061, 2, 79, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3062, 2, 80, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3063, 2, 85, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3064, 2, 86, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3065, 2, 103, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3066, 2, 104, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3067, 2, 105, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3068, 2, 106, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3069, 2, 107, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3070, 2, 108, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3071, 2, 109, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3072, 2, 110, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3073, 2, 111, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3074, 2, 112, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3075, 2, 113, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3076, 2, 114, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3077, 2, 115, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3078, 2, 116, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3079, 2, 117, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3080, 2, 118, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3081, 2, 119, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3082, 2, 120, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3083, 2, 121, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3084, 2, 122, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3085, 2, 123, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3086, 2, 124, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3087, 2, 125, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3088, 2, 126, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3089, 2, 127, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3090, 2, 128, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3091, 2, 129, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3092, 2, 130, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3093, 2, 131, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3094, 2, 132, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3095, 2, 133, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3096, 2, 134, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3097, 2, 135, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3098, 2, 136, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3099, 2, 137, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3100, 2, 138, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3101, 2, 139, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3102, 2, 140, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3103, 2, 141, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3104, 2, 142, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3105, 2, 143, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3106, 2, 144, '2018-01-22 02:03:55', '2018-01-22 02:03:55'),
(3107, 1, 1, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3108, 1, 2, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3109, 1, 3, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3110, 1, 4, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3111, 1, 5, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3112, 1, 16, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3113, 1, 17, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3114, 1, 18, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3115, 1, 19, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3116, 1, 24, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3117, 1, 25, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3118, 1, 33, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3119, 1, 43, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3120, 1, 44, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3121, 1, 49, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3122, 1, 50, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3123, 1, 55, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3124, 1, 56, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3125, 1, 57, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3126, 1, 58, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3127, 1, 59, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3128, 1, 60, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3129, 1, 61, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3130, 1, 62, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3131, 1, 63, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3132, 1, 67, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3133, 1, 68, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3134, 1, 79, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3135, 1, 80, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3136, 1, 85, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3137, 1, 86, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3138, 1, 103, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3139, 1, 104, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3140, 1, 105, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3141, 1, 106, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3142, 1, 107, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3143, 1, 108, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3144, 1, 109, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3145, 1, 110, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3146, 1, 111, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3147, 1, 112, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3148, 1, 113, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3149, 1, 114, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3150, 1, 115, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3151, 1, 116, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3152, 1, 117, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3153, 1, 118, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3154, 1, 119, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3155, 1, 120, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3156, 1, 121, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3157, 1, 122, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3158, 1, 123, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3159, 1, 124, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3160, 1, 125, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3161, 1, 126, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3162, 1, 127, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3163, 1, 128, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3164, 1, 129, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3165, 1, 130, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3166, 1, 131, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3167, 1, 132, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3168, 1, 133, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3169, 1, 134, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3170, 1, 135, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3171, 1, 136, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3172, 1, 137, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3173, 1, 138, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3174, 1, 139, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3175, 1, 140, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3176, 1, 141, '2018-03-20 08:51:41', '2018-03-20 08:51:41'),
(3177, 1, 142, '2018-03-20 08:51:42', '2018-03-20 08:51:42'),
(3178, 1, 143, '2018-03-20 08:51:42', '2018-03-20 08:51:42'),
(3179, 1, 144, '2018-03-20 08:51:42', '2018-03-20 08:51:42'),
(3180, 1, 145, '2018-03-20 08:51:42', '2018-03-20 08:51:42'),
(3181, 1, 146, '2018-03-20 08:51:42', '2018-03-20 08:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mobilephone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_method_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_total_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_type_id` int(11) DEFAULT NULL,
  `menu_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `fullname`, `alias`, `parent_id`, `menu_type_id`, `menu_class`, `level`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Trang chủ', 'trang-chu', 0, 1, NULL, 0, 1, 1, '2017-12-15 03:38:30', '2018-01-10 03:36:35'),
(4, 'Tin tức', '', 0, 1, '', 0, 5, 1, '2017-12-15 03:39:22', '2018-03-19 09:18:46'),
(6, 'Giới thiệu', '', 0, 1, '', 0, 2, 1, '2017-12-15 03:39:53', '2018-03-19 09:18:28'),
(9, 'Liên hệ', 'lien-he', 0, 1, NULL, 0, 6, 1, '2017-12-15 03:40:34', '2018-01-18 04:53:34'),
(20, 'Tin dự án', 'tin-du-an', 0, 3, NULL, 0, 1, 1, '2018-01-03 04:28:30', '2018-01-21 04:25:32'),
(21, 'Tin bất động sản', 'tin-bat-dong-san', 0, 3, NULL, 0, 2, 1, '2018-01-03 04:28:42', '2018-01-21 04:25:42'),
(57, 'Trang chủ', 'trang-chu', 0, 5, NULL, 0, 1, 1, '2018-01-10 07:14:21', '2018-01-10 07:14:21'),
(58, 'Giới thiệu', '', 0, 5, '', 0, 2, 1, '2018-01-10 07:14:39', '2018-03-19 09:19:27'),
(59, 'Tin tức', '', 0, 5, '', 0, 5, 1, '2018-01-10 07:14:57', '2018-03-19 09:19:43'),
(61, 'Liên hệ', 'lien-he', 0, 5, NULL, 0, 6, 1, '2018-01-10 07:15:34', '2018-01-23 02:11:11'),
(88, 'Tin dự án', 'tin-du-an', 59, 5, NULL, 1, 1, 1, '2018-01-10 17:26:01', '2018-01-21 04:24:20'),
(89, 'Tin bất động sản', 'tin-bat-dong-san', 59, 5, NULL, 1, 2, 1, '2018-01-10 17:26:18', '2018-01-21 04:24:38'),
(90, 'Gỗ óc chó', 'go-oc-cho', 0, 6, NULL, 0, 1, 1, '2018-01-11 07:19:41', '2018-01-11 07:19:41'),
(91, 'Gỗ sồi', 'go-soi', 0, 6, NULL, 0, 2, 1, '2018-01-11 07:19:49', '2018-01-11 07:19:49'),
(92, 'Gỗ tần bì', 'go-tan-bi', 0, 6, NULL, 0, 3, 1, '2018-01-11 07:19:57', '2018-01-11 07:19:57'),
(93, 'Sàn gỗ', 'san-go', 0, 6, NULL, 0, 4, 1, '2018-01-11 07:20:07', '2018-01-11 07:20:07'),
(94, 'Gỗ óc chó 4/4″', 'go-oc-cho-4-4', 90, 6, NULL, 1, 1, 1, '2018-01-11 07:20:31', '2018-01-11 07:20:31'),
(95, 'Gỗ óc chó 5/4″', 'go-oc-cho-5-4', 90, 6, NULL, 1, 2, 1, '2018-01-11 07:20:54', '2018-01-11 07:20:54'),
(96, 'Gỗ óc chó 6/4″', 'go-oc-cho-6-4', 90, 6, NULL, 1, 3, 1, '2018-01-11 07:21:09', '2018-01-11 07:21:09'),
(97, 'Gỗ óc chó 8/4″', 'go-oc-cho-8-4', 90, 6, NULL, 1, 4, 1, '2018-01-11 07:21:25', '2018-01-11 07:21:25'),
(98, 'Gỗ sồi trắng 4/4″', 'go-soi-trang-4-4', 91, 6, NULL, 1, 1, 1, '2018-01-11 07:21:44', '2018-01-11 07:21:44'),
(99, 'Gỗ sồi trắng 5/4″', 'go-soi-trang-5-4', 91, 6, NULL, 1, 2, 1, '2018-01-11 07:21:59', '2018-01-11 07:21:59'),
(100, 'Gỗ sồi trắng 6/4″', 'go-soi-trang-6-4', 91, 6, NULL, 1, 3, 1, '2018-01-11 07:22:26', '2018-01-11 07:22:26'),
(101, 'Gỗ sồi trắng 8/4″', 'go-soi-trang-8-4', 91, 6, NULL, 1, 4, 1, '2018-01-11 07:22:45', '2018-01-11 07:22:45'),
(102, 'Gỗ sồi đỏ 4/4″', 'go-soi-do-4-4', 91, 6, NULL, 1, 5, 1, '2018-01-11 07:23:35', '2018-01-11 07:23:35'),
(103, 'Gỗ sồi đỏ 5/4″', 'go-soi-do-5-4', 91, 6, NULL, 1, 6, 1, '2018-01-11 07:23:55', '2018-01-11 07:23:55'),
(104, 'Gỗ sồi đỏ 6/4″', 'go-soi-do-6-4', 91, 6, NULL, 1, 7, 1, '2018-01-11 07:24:18', '2018-01-11 07:24:18'),
(105, 'Gỗ sồi đỏ 8/4″', 'go-soi-do-8-4', 91, 6, NULL, 1, 8, 1, '2018-01-11 07:24:37', '2018-01-11 07:24:37'),
(106, 'Gỗ tần bì 4/4″', 'go-tan-bi-4-4', 92, 6, NULL, 1, 1, 1, '2018-01-11 07:24:59', '2018-01-11 07:24:59'),
(107, 'Gỗ tần bì 5/4″', 'go-tan-bi-5-4', 92, 6, NULL, 1, 2, 1, '2018-01-11 07:25:15', '2018-01-11 07:25:15'),
(108, 'Gỗ tần bì 6/4″', 'go-tan-bi-6-4', 92, 6, NULL, 1, 3, 1, '2018-01-11 07:25:31', '2018-01-11 07:25:40'),
(109, 'Gỗ tần bì 8/4″', 'go-tan-bi-8-4', 92, 6, NULL, 1, 4, 1, '2018-01-11 07:25:59', '2018-01-11 07:25:59'),
(110, 'Sàn gỗ chống nước', 'san-go-chong-nuoc', 93, 6, NULL, 1, 1, 1, '2018-01-11 07:26:40', '2018-01-11 07:26:40'),
(111, 'Sàn gỗ King Floor', 'san-go-king-floor', 93, 6, NULL, 1, 2, 1, '2018-01-11 07:26:57', '2018-01-11 07:26:57'),
(112, 'Sàn gỗ ngoài trời', 'san-go-ngoai-troi', 93, 6, NULL, 1, 3, 1, '2018-01-11 07:27:25', '2018-01-11 07:27:25'),
(113, 'Sàn gỗ nhập khẩu Sensa', 'san-go-nhap-khau-sensa', 93, 6, NULL, 1, 4, 1, '2018-01-11 07:27:40', '2018-01-11 07:27:40'),
(122, 'Dự án', 'du-an', 0, 1, NULL, 0, 3, 1, '2018-01-18 04:52:46', '2018-01-18 04:53:34'),
(123, 'Dịch vụ', '', 0, 1, '', 0, 4, 1, '2018-01-18 04:53:11', '2018-03-19 09:18:36'),
(124, 'Tầm nhìn', 'tam-nhin', 6, 1, NULL, 1, 1, 1, '2018-01-21 04:11:23', '2018-01-21 04:11:29'),
(125, 'Sứ mệnh', 'su-menh', 6, 1, NULL, 1, 2, 1, '2018-01-21 04:11:42', '2018-01-21 04:11:42'),
(126, 'Giá trị cốt lõi', 'gia-tri-cot-loi', 6, 1, NULL, 1, 3, 1, '2018-01-21 04:12:05', '2018-01-21 04:12:05'),
(127, 'Triết lý kinh doanh', 'triet-ly-kinh-doanh', 6, 1, NULL, 1, 4, 1, '2018-01-21 04:12:18', '2018-01-21 04:12:18'),
(128, 'Tin dự án', 'tin-du-an', 4, 1, NULL, 1, 1, 1, '2018-01-21 04:19:04', '2018-01-21 04:19:04'),
(129, 'Tin bất động sản', 'tin-bat-dong-san', 4, 1, NULL, 1, 2, 1, '2018-01-21 04:19:17', '2018-01-21 04:19:17'),
(130, 'Thị trường', 'thi-truong', 4, 1, NULL, 1, 3, 1, '2018-01-21 04:19:29', '2018-01-21 04:19:29'),
(131, 'Tư vấn', 'tu-van', 4, 1, NULL, 1, 4, 1, '2018-01-21 04:19:42', '2018-01-21 04:19:42'),
(132, 'Thị trường', 'thi-truong', 0, 3, NULL, 0, 3, 1, '2018-01-21 04:26:09', '2018-01-21 04:26:09'),
(133, 'Tư vấn', 'tu-van', 0, 3, NULL, 0, 4, 1, '2018-01-21 04:26:17', '2018-01-21 04:26:17'),
(134, 'Quản lý bất động sản', 'quan-ly-bat-dong-san', 123, 1, NULL, 1, 1, 1, '2018-01-21 04:27:38', '2018-01-21 04:27:38'),
(135, 'Cho thuê căn hộ', 'cho-thue-can-ho', 123, 1, NULL, 1, 2, 1, '2018-01-21 04:27:53', '2018-01-21 04:27:53'),
(136, 'Bán bất động sản', 'ban-bat-dong-san', 123, 1, NULL, 1, 3, 1, '2018-01-21 04:28:09', '2018-01-21 04:28:19'),
(137, 'Tầm nhìn', 'tam-nhin', 58, 5, NULL, 1, 1, 1, '2018-01-23 02:06:04', '2018-01-23 02:06:04'),
(138, 'Sứ mệnh', 'su-menh', 58, 5, NULL, 1, 2, 1, '2018-01-23 02:06:17', '2018-01-23 02:06:17'),
(139, 'Giá trị cốt lõi', 'gia-tri-cot-loi', 58, 5, NULL, 1, 3, 1, '2018-01-23 02:06:30', '2018-01-23 02:06:30'),
(140, 'Triết lý kinh doanh', 'triet-ly-kinh-doanh', 58, 5, NULL, 1, 4, 1, '2018-01-23 02:06:44', '2018-01-23 02:06:44'),
(141, 'Dự án', 'du-an', 0, 5, NULL, 0, 3, 1, '2018-01-23 02:07:24', '2018-01-23 02:07:24'),
(142, 'Dịch vụ', '', 0, 5, '', 0, 4, 1, '2018-01-23 02:07:51', '2018-03-19 09:19:34'),
(143, 'Quản lý bất động sản', 'quan-ly-bat-dong-san', 142, 5, NULL, 1, 1, 1, '2018-01-23 02:08:11', '2018-01-23 02:08:11'),
(144, 'Cho thuê căn hộ', 'cho-thue-can-ho', 142, 5, NULL, 1, 2, 1, '2018-01-23 02:08:26', '2018-01-23 02:08:26'),
(145, 'Bán bất động sản', 'ban-bat-dong-san', 142, 5, NULL, 1, 3, 1, '2018-01-23 02:08:40', '2018-01-23 02:08:40'),
(146, 'Thị trường', 'thi-truong', 59, 5, NULL, 1, 3, 1, '2018-01-23 02:09:43', '2018-01-23 02:09:43'),
(147, 'Tư vấn', 'tu-van', 59, 5, NULL, 1, 4, 1, '2018-01-23 02:09:56', '2018-01-23 02:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

DROP TABLE IF EXISTS `menu_type`;
CREATE TABLE `menu_type` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id`, `fullname`, `theme_location`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'MainMenu', 'main-menu', 1, 1, '2017-12-15 03:37:06', '2017-12-15 03:37:06'),
(3, 'Tin tức sự kiện', 'tin-tuc-su-kien-menu', 1, 3, '2018-01-03 04:22:54', '2018-01-11 07:18:51'),
(5, 'MobileMenu', 'mobile-menu', 1, 5, '2018-01-09 19:31:48', '2018-01-09 19:31:48'),
(6, 'Danh mục sản phẩm', 'danh-muc-san-pham-menu', 1, 2, '2018-01-11 07:18:35', '2018-01-15 08:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_item`
--

DROP TABLE IF EXISTS `module_item`;
CREATE TABLE `module_item` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` text COLLATE utf8_unicode_ci,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `setting` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_item`
--

INSERT INTO `module_item` (`id`, `fullname`, `item_id`, `position`, `component`, `setting`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(12, 'Tin tức', '[{\"id\":7,\"sort_order\":\"1\"},{\"id\":11,\"sort_order\":\"2\"},{\"id\":12,\"sort_order\":\"3\"},{\"id\":13,\"sort_order\":\"4\"},{\"id\":14,\"sort_order\":\"5\"},{\"id\":15,\"sort_order\":\"6\"},{\"id\":16,\"sort_order\":\"7\"},{\"id\":17,\"sort_order\":\"8\"},{\"id\":18,\"sort_order\":\"9\"},{\"id\":19,\"sort_order\":\"10\"},{\"id\":20,\"sort_order\":\"11\"},{\"id\":21,\"sort_order\":\"12\"}]', 'news-between', 'article', NULL, 1, 1, '2018-01-10 19:16:28', '2018-01-19 18:21:17');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `fullname`, `alias`, `theme_location`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Công Ty TNHH GreeneCoLife', 'cong-ty-tnhh-greenecolife', 'intro-footer', NULL, '', '<p>Vp Giao dịch : 27/13/8 Đường số 27, P.Hiệp B&igrave;nh Ch&aacute;nh, Q.Thủ Đức</p>\n\n<p>Điện thoại: 0902.90.74.75<br />\nEmail: gellumber@gmail.com<br />\nWebsite:http://greenecolife.vn</p>', '', '', '', NULL, 6, 1, '2017-12-28 04:10:41', '2018-01-17 01:33:54'),
(2, 'Về chúng tôi', 've-chung-toi', 'about-us-footer', NULL, '', '<p>&quot;GreenEcoLife cam kết tất cả quyền lợi d&agrave;nh cho kh&aacute;ch h&agrave;ng&quot;</p>', '', '', '', NULL, 2, 1, '2017-12-28 04:54:45', '2018-01-14 06:43:47'),
(4, 'Về Công Ty TNHH GreeneCoLife', 've-cong-ty-tnhh-greenecolife', 'introduce', 'conmochieu-10.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '<p style=\"text-align:justify\"><span style=\"font-size:24px\"><strong>GỖ NHẬP KHẨU: GỖ SỒI, GỖ &Oacute;C CH&Oacute;, GỖ TẦN B&Igrave;</strong></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><em>Giới thiệu chung:</em></span></p>\n\n<p style=\"text-align:justify\">C&ocirc;ng ty tnhh GreenEcoLife (GEL), l&agrave; nh&agrave; nhập khẩu v&agrave; ph&acirc;n phối gỗ nguy&ecirc;n liệu Mỹ: gỗ &oacute;c ch&oacute;, gỗ sồi, gỗ tần b&igrave;, v&aacute;n s&agrave;n, &hellip;</p>\n\n<p style=\"text-align:justify\">Năm 2012, với nhu cầu cần rất nhiều về nguồn gỗ nguy&ecirc;n liệu chất lượng cho lĩnh vực sản xuất nội thất gỗ cao cấp của Việt Nam. GreenEcoLife Việt Nam ra đời từ đ&oacute;.</p>\n\n<p style=\"text-align:justify\">Hiện n&agrave;y, C&ocirc;ng ty tnhh GreenEcoLife (GEL) l&agrave; một trong c&aacute;c nh&agrave; nhập khẩu v&agrave; cung cấp gỗ nguy&ecirc;n liệu h&agrave;ng đầu tại khu vực miền Nam về: gỗ sồi, gỗ &oacute;c ch&oacute;, gỗ tần b&igrave;, &hellip;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><em>C&aacute;c sản phẩm gỗ nhập khẩu GreenEcoLife Việt Nam:</em></span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/gioi-thieu-go-soi-trang-.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh : Gỗ sồi trắng</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/gioi-thieu-go-oc-cho.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh : Gỗ &oacute;c ch&oacute;</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/gioi-thieu-go-tan-bi.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh : Gỗ tần b&igrave;</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p>C&aacute;c đối t&aacute;c v&agrave; kh&aacute;ch h&agrave;ng của C&ocirc;ng ty tnhh GreenEcoLife (GEL) chủ yếu l&agrave;: c&ocirc;ng ty thương mại, xưởng sản xuất, nội thất, c&ocirc;ng ty thiết kế x&acirc;y dựng, &hellip;.</p>\n\n<p>Hiện nay, với nguồn gỗ tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; gỗ nguy&ecirc;n liệu tự nhi&ecirc;n ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; Greenecolife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất gỗ, qu&yacute; c&ocirc;ng ty thiết kế nội thất với chất lượng gỗ nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng.</p>', '', 'metakeyword giới thiệu', 'metadescription giới thiệu', 234, 5, 1, '2018-01-03 10:35:10', '2018-01-22 08:55:33'),
(5, 'Thông tin liên hệ', 'thong-tin-lien-he', 'thong-tin-lien-he-widget', NULL, '', '<h2><span style=\"color:#2980b9\"><strong>C&Ocirc;NG TY TNHH GREENECOLIFE</strong></span></h2>\n\n<p><em><strong>Vp Giao dịch:</strong></em> 27/13/8 Đường số 27, P.Hiệp B&igrave;nh Ch&aacute;nh, Q.Thủ Đức</p>\n\n<p><em><strong>Điện thoại:</strong></em> 0902.90.74.75</p>\n\n<p><em><strong>Email:</strong></em> gellumber@gmail.com</p>\n\n<p><em><strong>Website:</strong></em> http://greenecolife.vn</p>', '', '', '', NULL, 1, 1, '2018-01-14 16:13:12', '2018-01-16 20:00:40'),
(6, 'Fanpage', 'fanpage', 'fanpage-footer', NULL, '<div class=\"fb-page\" data-href=\"https://www.facebook.com/Test-127067831421037/\" data-tabs=\"timeline\" data-width=\"250\" data-height=\"200\" data-small-header=\"true\" data-adapt-container-width=\"true\" data-hide-cover=\"false\" data-show-facepile=\"true\"><blockquote cite=\"https://www.facebook.com/gonguyenlieumy/\" class=\"fb-xfbml-parse-ignore\"><a href=\"https://www.facebook.com/gonguyenlieumy/\">Công ty tnhh Greenecolife</a></blockquote></div>', '', '', '', '', NULL, 7, 1, '2018-01-19 02:31:15', '2018-02-26 07:59:35'),
(7, 'Tầm nhìn', 'tam-nhin', 'tam-nhin-home-content', 'songsong-4815.png', 'Trở thành công ty đứng đầu về hệ thống phân phối rộng khắp Việt Nam trong những năm đầu tiên.\r\nTầm nhìn đến 2030: \"Trở thành 1 trong 10 công ty phát triển Bất động sản tốt nhất Đông Nam Á”', '<p style=\"text-align:justify\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '', '', '', 57, 1, 1, '2018-01-19 09:04:27', '2018-03-28 02:46:50'),
(8, 'Sứ mệnh', 'su-menh', 'su-menh-hand-content', 'conmochieu-2.png', 'Cung cấp sản phẩm và dịch vụ ưu việt, nâng cao giá trị , chất lượng cuộc sống', '<p style=\"text-align:justify\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '', '', '', 13, 1, 1, '2018-01-19 09:04:52', '2018-03-08 03:49:25'),
(9, 'Giá trị cốt lõi', 'gia-tri-cot-loi', 'gia-tri-cot-loi-hand-content', 'chi-lien-vinhome-7-1807.png', 'Khát vọng - Chính trực - Chuyên nghiệp - Nhân văn\r\nVới nhiều năm kinh nghiệm hoạt động trong lĩnh vực bất động sản và đội ngũ nhân viên chuyên nghiệp, nhiệt tình, có trình độ cao, luôn lấy chữ tín làm trọng. 2', '<p style=\"text-align:justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32. 2</p>', 'chú thích Giá trị cốt lõi 2', 'metakeyword Giá trị cốt lõi 2', 'metadescription Giá trị cốt lõi 2', 8, 2, 1, '2018-01-19 09:05:26', '2018-03-29 02:18:36'),
(10, 'Triết lý kinh doanh', 'triet-ly-kinh-doanh', 'triet-ly-kinh-doanh-hand-content', 'conmochieu-4.png', 'Đối tác, khách hàng là giá trị cơ bản của bất kỳ doanh nghiệp nào, là lý do duy nhất để doanh nghiệp tồn tại và phát triển. Chính sách “khách hàng là trung tâm” chỉ lối cho mọi hoạt động của công ty.', '<p style=\"text-align:justify\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '', '', '', 8, 1, 1, '2018-01-19 09:05:56', '2018-03-08 03:49:31'),
(11, 'Quản lý bất động sản', 'quan-ly-bat-dong-san', 'service-left', 'conmochieu-6.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', '', '', '', 43, 1, 1, '2018-01-19 16:08:40', '2018-03-19 07:38:06'),
(12, 'Cho thuê căn hộ', 'cho-thue-can-ho', 'service-center', 'conmochieu-5.png', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '<p style=\"text-align:justify\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '', '', '', 13, 1, 1, '2018-01-19 16:09:30', '2018-03-08 03:49:38'),
(13, 'Bán bất động sản', 'ban-bat-dong-san', 'service-right', 'conmochieu-4.png', 'Cras et fringilla neque. Donec vulputate ornare placerat. Proin elit eros, egestas vitae mauris in, mattis tincidunt ipsum. Phasellus sodales, erat sit amet porta pretium, ligula dui convallis leo, semper varius est ipsum semper turpis. Sed id velit tellus. Sed eu metus interdum, fringilla lacus ac, finibus dolor. Maecenas tempus dolor vel tortor accumsan feugiat. Proin in tellus tristique, dignissim nunc vel, gravida mauris. In sed augue viverra, aliquet quam sit amet, fringilla risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla lobortis, ex nec pulvinar cursus, risus turpis ornare tellus, a facilisis augue enim sed tellus. Quisque lacinia vel dolor ac porta. Praesent hendrerit dictum velit, sodales sagittis leo interdum quis.', '<p style=\"text-align:justify\">Aliquam cursus elit ut commodo tristique. Curabitur at elit scelerisque, consequat dolor vel, egestas ipsum. Sed auctor venenatis quam a ultricies. Quisque vehicula gravida tristique. Maecenas interdum, mi vel pellentesque laoreet, nisl diam sollicitudin urna, ac dictum erat purus sit amet purus. In facilisis consectetur rutrum. Curabitur vitae est a libero volutpat tristique eget a erat. Vivamus in eros dignissim erat congue maximus. Etiam euismod nec metus nec volutpat. Morbi et scelerisque orci. Donec nisl justo, varius sit amet pharetra quis, lacinia in lacus. Nulla cursus vulputate urna vitae mattis. Proin ultrices dignissim felis, eu viverra massa viverra ut. Praesent eu euismod mauris. Pellentesque in lobortis felis, vel egestas erat. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>\n\n<p style=\"text-align:justify\">Integer elementum, tortor quis egestas rutrum, libero arcu egestas orci, dapibus ornare enim risus sed ex. Aliquam congue laoreet nunc eu varius. Duis ullamcorper urna ac nunc sagittis mattis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris in nibh non ligula rutrum ultrices at in velit. Nullam tempus dui et eros vestibulum, vitae rhoncus risus facilisis. In eu iaculis mi, id convallis enim. Etiam dignissim lacus elit, eget efficitur dolor auctor ac. Aenean condimentum congue iaculis. Curabitur eget ex tincidunt, scelerisque diam sed, fermentum ligula. Nullam imperdiet, risus elementum malesuada sagittis, massa odio congue eros, vitae interdum nisi dolor ut orci.</p>', '', '', '', 11, 1, 1, '2018-01-19 16:10:20', '2018-03-08 03:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `content` text,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `fullname`, `alias`, `content`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chuyển khoản', 'chuyen-khoan', '', 1, 1, '2018-01-07 17:25:13', '2018-01-07 17:25:13'),
(2, 'Trực tiếp', 'truc-tiep', '', 2, 1, '2018-01-07 17:25:25', '2018-01-07 17:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

DROP TABLE IF EXISTS `persistences`;
CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(6, 1, 'WphP2gHqBbRpGKp2WcZb6APTYCNo1onf', '2017-11-12 08:12:08', '2017-11-12 08:12:08'),
(12, 1, 'HMMWMPpBDgdUbv54tKOldPvWyvcaeDCp', '2017-11-12 08:20:55', '2017-11-12 08:20:55'),
(20, 1, 'F4bWDfEvllT0fTv4EzWDp3NWpLxGo4n5', '2017-11-12 08:44:06', '2017-11-12 08:44:06'),
(27, 1, 'f7VCzyYASPW5vTVgTfv3Ji50sxy2ckIt', '2017-11-12 10:14:09', '2017-11-12 10:14:09'),
(35, 1, 'Zlbi5ja6c9Z7no06i5MvPsa8kZI3oLEZ', '2017-11-12 10:41:59', '2017-11-12 10:41:59'),
(43, 3, 'ZsvbfzLh4A4k34VMpmZCqIO2KIDk9pzP', '2017-11-12 10:51:37', '2017-11-12 10:51:37'),
(45, 3, '61CQHzrI8v42ppzJ35HclGUgzulYNwKD', '2017-11-12 10:51:57', '2017-11-12 10:51:57'),
(48, 4, 'M1VbjAgWRrVuXhVCqqvWAQHP287e5fuk', '2017-11-12 11:00:38', '2017-11-12 11:00:38'),
(52, 4, 'zWj9obfujhk7L1DEKOcSOMTi49HvkeVo', '2017-11-12 11:04:17', '2017-11-12 11:04:17'),
(64, 4, 'sGcmm3lmMPLTUyFeagebRe9YiPjWxHn0', '2017-11-12 11:20:36', '2017-11-12 11:20:36'),
(68, 4, 'DsgzaC5yhMG3miJpNrQFeWCpBwqfsMuO', '2017-11-12 11:21:48', '2017-11-12 11:21:48'),
(71, 4, 'aFa63uj6gzLcV0mZtU0nYvVinHZnvyAi', '2017-11-12 11:22:33', '2017-11-12 11:22:33'),
(73, 4, 'P672dGDcBqxGazfRAzJtUxPwSjTq9N4K', '2017-11-12 11:22:59', '2017-11-12 11:22:59'),
(74, 4, 'm0D8Z9mVczUYgqkSJXAwGQi8S9EaqrSg', '2017-11-12 11:23:03', '2017-11-12 11:23:03'),
(94, 1, 'W1uglu6PzKaOfwxa766IOJ33NDdulIri', '2017-11-12 13:01:17', '2017-11-12 13:01:17'),
(105, 4, 'lpP9axx2fJB8SUi7t2NlNMHasH10fl9N', '2017-11-12 19:31:42', '2017-11-12 19:31:42'),
(106, 4, '1PNxpqM3E2RYNr5CT1NzPzCOlNu4xILB', '2017-11-12 19:31:45', '2017-11-12 19:31:45'),
(107, 4, 'IJleJPrQEduTCpRbolCVqNbD3vzzhqXH', '2017-11-12 19:31:51', '2017-11-12 19:31:51'),
(110, 4, 'RyU6rnrEVVwusqJpB1boWgpODKNKthib', '2017-11-12 19:32:50', '2017-11-12 19:32:50'),
(113, 4, '2iWGSejY4rkJdkY2iK65Na0UV05uJEZ3', '2017-11-12 19:34:34', '2017-11-12 19:34:34'),
(115, 1, 'WQkHX9pd7HnW6Fwd58b6FNwURcoRYyK6', '2017-11-12 19:36:57', '2017-11-12 19:36:57'),
(119, 4, 'FGLu6nkqZkVigimI5Chx4mNmXgdi22qe', '2017-11-12 19:44:50', '2017-11-12 19:44:50'),
(124, 1, '1kZXCQqSfCEwmILvBACrUaHl5MpzQWXX', '2017-11-12 20:47:34', '2017-11-12 20:47:34'),
(125, 1, 'XJfqJ7pZakt8xtLNkULZUElD7jHOCtKt', '2017-11-13 17:44:28', '2017-11-13 17:44:28'),
(129, 1, 'JtMzzU4e61U2GRbOedwzutyNWAHHRHKp', '2017-11-13 23:43:59', '2017-11-13 23:43:59'),
(134, 1, 'zTVEKL7zcc4kvYk80AuKHQkn17d1TX0d', '2017-11-14 07:10:53', '2017-11-14 07:10:53'),
(135, 1, 'ZxzpfDpxrMTx7dRhvd1IQs0KoAyp8beZ', '2017-11-14 10:00:40', '2017-11-14 10:00:40'),
(138, 1, 'M9zXqXyMOTprNqZQI4LEpKqNogmDZiCE', '2017-11-14 20:35:29', '2017-11-14 20:35:29'),
(139, 1, 'CDF73h1lqr864dh5T5BQdTRf0hcrS45y', '2017-11-15 01:20:36', '2017-11-15 01:20:36'),
(143, 1, '50Hrxr02Q6CqKUF4p0G0bpP6PhcrLaNG', '2017-11-15 10:34:05', '2017-11-15 10:34:05'),
(145, 1, 'LRlBDrPFH3sF0WLHAUBGdJuLn5beDkqb', '2017-11-15 10:45:25', '2017-11-15 10:45:25'),
(149, 1, 'zV2fdfnD6X5jTDrXbKtgm2BQ4I4CN0vP', '2017-11-15 21:20:42', '2017-11-15 21:20:42'),
(154, 1, 'VbajMvJtRtkXTmUREmO1x8SnojOzoNy4', '2017-11-16 12:09:09', '2017-11-16 12:09:09'),
(155, 1, 'EN255XIbrvzjbXm2TdeuHOJnjAHBKhm0', '2017-11-16 19:00:45', '2017-11-16 19:00:45'),
(156, 1, 'a2STqoxCKAdKjJBxt5RxyBo23j196SqS', '2017-11-17 01:55:13', '2017-11-17 01:55:13'),
(157, 1, 'bWYcBrGX0pTubrxZ2Gz8mOrpfZh4d3R5', '2017-11-17 03:54:15', '2017-11-17 03:54:15'),
(158, 1, 'rOqRgZyRXdpE2wPQxm60VZEi4MVsaHwd', '2017-11-17 09:26:45', '2017-11-17 09:26:45'),
(159, 1, 'MUi9tluQQy8AhsadOL4sMuRSRaMPY2Vi', '2017-11-17 21:05:41', '2017-11-17 21:05:41'),
(162, 1, '0fsBWGHy3uFkICDp4rgusPKisYenbUr5', '2017-11-18 08:03:50', '2017-11-18 08:03:50'),
(163, 1, 'z2MidVz3A5SfcQtc9CjF83lbB9Ncxw4c', '2017-11-19 05:53:59', '2017-11-19 05:53:59'),
(164, 1, 'C3NrRRgDRZQLTrZraBO9IGEl2wXobUup', '2017-11-20 05:47:41', '2017-11-20 05:47:41'),
(165, 1, 'wgjWLdlRLP6Cireh1mZswQnOOTXG8z8O', '2017-11-21 03:33:18', '2017-11-21 03:33:18'),
(166, 1, 'OHI8P6DtqZVW9K4VlZ1mw5gI0IuJYPH1', '2017-11-21 04:17:05', '2017-11-21 04:17:05'),
(167, 1, 'qNdOfppeTTO8yQemqSZtz0s9qjIu8bSY', '2017-11-21 17:39:32', '2017-11-21 17:39:32'),
(168, 1, 'UJbhn9QwAcZUUXnVDtSStqNCq5akR4Lw', '2017-11-21 23:49:19', '2017-11-21 23:49:19'),
(169, 1, 'eo5eQNRwtkvZlv0DmXfze6JymlS0wylC', '2017-11-22 18:21:12', '2017-11-22 18:21:12'),
(173, 1, 'IulV4jEfAVovdnn5YGOTprw3kkvFe8NP', '2017-11-23 05:15:58', '2017-11-23 05:15:58'),
(174, 1, 'Awg5gkMADLkjPbiVitjCzS9ad5sCN9eF', '2017-11-23 18:51:55', '2017-11-23 18:51:55'),
(175, 1, 'STmoiFXISPPMkYZ46mHVd1FgZleRFPma', '2017-11-24 01:23:33', '2017-11-24 01:23:33'),
(176, 1, 'DS9Yw83Zm2blL1F2azbyCcQ4v2ktYX5H', '2017-11-24 02:11:20', '2017-11-24 02:11:20'),
(177, 1, 'e1ZyuWKHR7HQaQSkQEv4J6YMwpFFLXeC', '2017-11-24 06:39:38', '2017-11-24 06:39:38'),
(178, 1, '6KeLIVlJyL7P6FMEGpgxpNljzsQxI20T', '2017-11-25 05:02:32', '2017-11-25 05:02:32'),
(179, 1, 'tKhufJfgecAKrGEAT2EBaEPLaf517QVS', '2017-11-25 09:08:54', '2017-11-25 09:08:54'),
(180, 1, 't3XDlldaLWhVaxrPuwM6dT02mMflr87j', '2017-11-25 19:53:59', '2017-11-25 19:53:59'),
(182, 1, 'fM0W9o41fDgCiycVxhvQeJ02Opj3tULU', '2017-11-25 21:10:55', '2017-11-25 21:10:55'),
(184, 1, 'EMmXbaWTDFtG4QX9UfVNcK7eUBsy7nmJ', '2017-11-25 21:32:34', '2017-11-25 21:32:34'),
(185, 1, 'r6cxynGaM90IU8uZA7aJFjox941jTivP', '2017-11-26 05:12:26', '2017-11-26 05:12:26'),
(198, 1, 'qNJI9OXlvBnQT9IZvLyhcvnjFBHI3dZz', '2017-11-26 10:37:48', '2017-11-26 10:37:48'),
(199, 1, 'C9FPmC5NtedAPoygDQN2oqpB4EZN8azX', '2017-11-26 11:20:11', '2017-11-26 11:20:11'),
(202, 1, 'qCWvTU0oJSjAyobzeHt21656Rl1eWuvq', '2017-11-26 20:07:36', '2017-11-26 20:07:36'),
(203, 1, 'I0m5QArlodAFsFQj0cfoSiIaJ2ZGgbyg', '2017-11-26 23:06:11', '2017-11-26 23:06:11'),
(204, 1, '6tDVgt6sfCGnbfPYISYbMzCQKpXm8QKc', '2017-11-27 00:00:05', '2017-11-27 00:00:05'),
(205, 1, 'R0MhkpKtLCI5fIe1wwCeicZa0ftDQPwx', '2017-11-27 02:16:57', '2017-11-27 02:16:57'),
(206, 1, 'E69AlB0p8xLhxxNVrs46xwrP0a5wm3KX', '2017-11-27 07:58:05', '2017-11-27 07:58:05'),
(207, 1, 'qFJkZtCoPK72qECK96tX226VuMubIMBv', '2017-11-27 19:23:06', '2017-11-27 19:23:06'),
(208, 1, 'yTiyEBo8xE3PfzxTL1GFRVnqqi4ChmIZ', '2017-11-27 20:15:53', '2017-11-27 20:15:53'),
(209, 1, 'YN8x4updqv0OrIsWStBz2c7ZxI7VO5ug', '2017-11-27 20:17:20', '2017-11-27 20:17:20'),
(210, 1, 'UpPwfQYjNbyRmztTDCfl16md4weLyjG3', '2017-11-30 08:03:21', '2017-11-30 08:03:21'),
(211, 1, 'ArOxlkVdyW3lu3SJqot209bFrPZUAPgD', '2017-12-01 10:48:28', '2017-12-01 10:48:28'),
(212, 1, 'xoOGCB3x8fVFoBznts5EU1k13GmZiO11', '2017-12-02 19:53:50', '2017-12-02 19:53:50'),
(214, 1, 'Jqk5DXGugxgRtsZy4pBEFn7brMvOjghm', '2017-12-03 11:57:16', '2017-12-03 11:57:16'),
(216, 1, 'nYe5QuFSOr8eu7GG8atx6EbvbM1XUMlY', '2017-12-03 17:58:34', '2017-12-03 17:58:34'),
(217, 1, 'P5Q1q3gYWSt4k7c0BLPth6QEpGmYVG5T', '2017-12-04 11:12:33', '2017-12-04 11:12:33'),
(218, 1, '0aNMDBXR8Xzt5DTF9HcK4OBSaZyohSzF', '2017-12-05 09:04:17', '2017-12-05 09:04:17'),
(219, 1, '8J8vasVhkLwqagOIRNKwiIU94QoexH4O', '2017-12-05 18:41:41', '2017-12-05 18:41:41'),
(220, 1, 'JChXlObze9eklsMJrTNLH6ekOw47H5mz', '2017-12-06 00:14:21', '2017-12-06 00:14:21'),
(221, 1, 'z18eXjqdkmbBbwJcvBAIt2o5DxA51xjw', '2017-12-06 08:20:51', '2017-12-06 08:20:51'),
(222, 1, 'F40EmMwa02fVssVHs66z0XASzB3S5sqM', '2017-12-08 11:51:41', '2017-12-08 11:51:41'),
(223, 1, 'Ee5i5S8MD2HQVPa7TKeEK3HekFbSCLcO', '2017-12-10 19:42:21', '2017-12-10 19:42:21'),
(224, 1, 'JebpNZTP11ct8IzcxmbYePuG978Jpumq', '2017-12-10 20:05:44', '2017-12-10 20:05:44'),
(226, 1, 'qPVObxjq9k29qoRVkiAV89K6Ds8MnpRz', '2017-12-10 21:48:03', '2017-12-10 21:48:03'),
(227, 1, 'Q0mGHYM1KOmlyLqq9Kw2lH5F1e2t8nIE', '2017-12-11 09:24:23', '2017-12-11 09:24:23'),
(228, 1, 'PKvAShIoy3rHzKX98qFrlcxx9q0weXbE', '2017-12-11 20:07:50', '2017-12-11 20:07:50'),
(229, 1, 'D3EIc9je8gVdFHzEluwGYSxLvcYWfISa', '2017-12-12 10:23:23', '2017-12-12 10:23:23'),
(230, 1, 'LlCfFTdhZIG7Fqb0249N2hlssIbwgswv', '2017-12-12 19:38:58', '2017-12-12 19:38:58'),
(231, 1, '5P3ys652WPCFCcMEtYp9K6YFz8KClLdt', '2017-12-12 20:37:12', '2017-12-12 20:37:12'),
(232, 1, 'AuLUtUUmPWZaLWJxm2RtyHkflWsMlIvb', '2017-12-12 20:48:06', '2017-12-12 20:48:06'),
(233, 1, 'OoMvRAracnoqhoXECrlxDTA8S4M7pGEC', '2017-12-12 21:39:03', '2017-12-12 21:39:03'),
(234, 1, 'LspxbedO8o6CbiofYR0uqLfOwunUpfCT', '2017-12-12 22:11:41', '2017-12-12 22:11:41'),
(235, 1, 'TaJdE7jjBDOwYE4eqf955JoMQh2MGnga', '2017-12-12 23:42:01', '2017-12-12 23:42:01'),
(236, 1, '9ldSOnqDOOdFI4SuMFTE5sOXeKeDaFMK', '2017-12-13 01:24:31', '2017-12-13 01:24:31'),
(237, 1, 'Omqc5SMLNnckeyPe5h70EHA0yUqZ1yAr', '2017-12-13 01:26:17', '2017-12-13 01:26:17'),
(238, 1, 'N57JQIUmXSgVZUN25mI9zA6QB3krnDJa', '2017-12-13 01:27:02', '2017-12-13 01:27:02'),
(239, 1, 'tKi6yXfXoogbGH6Ui12Pps4xBnKQQ1Y6', '2017-12-13 02:42:24', '2017-12-13 02:42:24'),
(241, 1, 'fdAX0oX5HE6HEOuPnpQOCPJPQHOTJazL', '2017-12-13 11:11:26', '2017-12-13 11:11:26'),
(243, 1, '5F15aKMYAKbpu8xARjjk4Z3b4ZLLaiHN', '2017-12-13 19:46:28', '2017-12-13 19:46:28'),
(244, 1, 'bmx6cC4QULNMW3CCh933DzA3kvhDM0ai', '2017-12-13 20:18:26', '2017-12-13 20:18:26'),
(245, 1, 'p89msT6X0idRVFgnJegC63D5VXzGzQZs', '2017-12-13 20:46:43', '2017-12-13 20:46:43'),
(247, 1, 'pS5xSImoYKACiZzQYCbCN9WYfAyE17BJ', '2017-12-13 23:44:24', '2017-12-13 23:44:24'),
(248, 1, 'Ei3UzlkB8E8L2EwvJ6uf7RqWbSiEXWqw', '2017-12-14 02:24:40', '2017-12-14 02:24:40'),
(249, 1, 'XDhhxpNpsyR8JqU9QF9ciEtMAUxzQb70', '2017-12-14 05:39:40', '2017-12-14 05:39:40'),
(251, 1, 'gYei12wI1Xx9L458waGZcXrpzfJSLrEw', '2017-12-14 05:40:20', '2017-12-14 05:40:20'),
(253, 1, 'o0i98RskGVcDO68h58WHtVILX3X7GyZZ', '2017-12-14 08:30:08', '2017-12-14 08:30:08'),
(254, 1, 'rYXzVG9bTG0q8AAikn8E1gKFDUln4zZT', '2017-12-14 17:36:03', '2017-12-14 17:36:03'),
(255, 1, 'yaZ3Gkr2fhEHy46HJzcTlIMgLZjtVE0P', '2017-12-14 18:39:23', '2017-12-14 18:39:23'),
(256, 1, 'YmZvD9xhUam8WQjZebIu5UA5fa79Vmpw', '2017-12-14 19:13:37', '2017-12-14 19:13:37'),
(257, 1, 'GHd02IbsGjboWps4UOuoRMKEHhdAeM4Q', '2017-12-14 19:20:29', '2017-12-14 19:20:29'),
(258, 1, 'bEwsrdAAVsEols37gzepZRofpjQ5CpkS', '2017-12-14 19:46:00', '2017-12-14 19:46:00'),
(259, 1, 'Op5b8y1v9a1Z1AasgU1buuI9PXTpXq14', '2017-12-14 20:36:43', '2017-12-14 20:36:43'),
(260, 1, 'H491pNtELCOBnhzmGJJG5pVQqCQqQ6y9', '2017-12-15 07:13:52', '2017-12-15 07:13:52'),
(265, 1, 'x7SZJyE8pqvN1UmSOiLMvTIDgPU8Op1v', '2017-12-15 23:56:34', '2017-12-15 23:56:34'),
(269, 1, 'bCLJ9ILMZeWaTyO9PK1h4WZ3yG712Q3h', '2017-12-16 00:27:26', '2017-12-16 00:27:26'),
(270, 1, 'VTVKHrHmyn9Ree3oENKNiqLQ8PEllFBP', '2017-12-16 00:40:12', '2017-12-16 00:40:12'),
(271, 1, 'tE71PsmEixwJk0QCDYeIEPpZ6XfzfmQL', '2017-12-16 02:57:23', '2017-12-16 02:57:23'),
(272, 1, '5aHeCSmiZ5bKLIYyaV3gGw8msN1aA63K', '2017-12-16 08:08:53', '2017-12-16 08:08:53'),
(282, 1, 'EUtWgeynbqabsviLDajTiXg6az4xEx4S', '2017-12-16 11:25:51', '2017-12-16 11:25:51'),
(283, 1, 'xKZoSmxNW0WGyljs2cdzeQI7OoHOEYbj', '2017-12-16 20:33:48', '2017-12-16 20:33:48'),
(284, 1, '958RICNQ5SWqdtnNopOEAQEGjy71OLrP', '2017-12-17 07:52:39', '2017-12-17 07:52:39'),
(286, 1, '5wQF5syYD14KXWyo2G0TdOpFgPvDwWML', '2017-12-17 19:52:04', '2017-12-17 19:52:04'),
(287, 1, '57cBU7Ds9QMsjwn0klqjotmHkWuIFlp7', '2017-12-25 19:27:36', '2017-12-25 19:27:36'),
(288, 1, 'pSNdXiePmuervyNG25HffYLqSY4CqCNV', '2017-12-25 21:29:41', '2017-12-25 21:29:41'),
(289, 1, 'HrHLtRQPfVz6XIzSP9YMkHOswmru4q9A', '2017-12-25 21:47:02', '2017-12-25 21:47:02'),
(290, 1, 'loABizfP1dl9zchCj2681qVIsF3OKrJ3', '2017-12-27 10:38:20', '2017-12-27 10:38:20'),
(291, 1, '6oNxIkIquNcQIOEPZnb9gd69OiMONpDD', '2017-12-27 10:45:14', '2017-12-27 10:45:14'),
(292, 1, '1tEcrFgJDbeU1aUB6H5mnmO7zua63PuQ', '2017-12-27 19:13:01', '2017-12-27 19:13:01'),
(293, 1, 'MUkVIspzdlXbtHyCGhcCsnvK7SeCkOVu', '2017-12-27 19:25:12', '2017-12-27 19:25:12'),
(294, 1, 'PSyuKpYZcZ9Ji2eZ5j5rfSh0u6yWDxDS', '2017-12-27 22:32:12', '2017-12-27 22:32:12'),
(295, 1, '5QXQdR5dMiMQF4MSYyuVsYzj5N51Tzux', '2017-12-28 01:38:51', '2017-12-28 01:38:51'),
(296, 1, '6oyeQrWmS58vLjNBe4iMxPX7mUl4gJ8g', '2017-12-29 02:09:33', '2017-12-29 02:09:33'),
(297, 1, 'myq1k4YmAJV6HmELv3CY4Fme7QllpMyV', '2017-12-29 05:40:48', '2017-12-29 05:40:48'),
(298, 1, 'KqG7rQKRTxtJ5owuAVvKCpgDd9ylxyuB', '2018-01-01 19:20:46', '2018-01-01 19:20:46'),
(299, 1, 'gGIbwURi3h2p30EwdzpVSN7s89oJbs1o', '2018-01-01 19:42:39', '2018-01-01 19:42:39'),
(300, 1, 'TMAKb6m8MTahrN1lFJTIoni9vymizoPX', '2018-01-01 22:34:23', '2018-01-01 22:34:23'),
(301, 1, 'fZ3RQ9jvj6UvF2UOcrWIC5tnFpmqrmJr', '2018-01-02 00:59:34', '2018-01-02 00:59:34'),
(302, 1, 'mP3Z9KVER7893IYjcGERZFXKDhm7biAm', '2018-01-02 18:30:12', '2018-01-02 18:30:12'),
(303, 1, 'tsyksujmywH7Hoz3hxqML9Th24Zcv3Dy', '2018-01-03 00:41:50', '2018-01-03 00:41:50'),
(304, 1, 'dMRpWGk7Uvdn3lza8LXBsbteeUnWMOSW', '2018-01-03 05:04:01', '2018-01-03 05:04:01'),
(305, 1, 'F8pNbJFdCdNEIwRCgulVQ1rb5oYmT267', '2018-01-03 09:50:30', '2018-01-03 09:50:30'),
(308, 1, 'mmgyGjX6FKaZrTA1Sy46Xk5afFSPTiLz', '2018-01-03 10:32:13', '2018-01-03 10:32:13'),
(309, 1, 'WkZAETYgs1qll9a5SzLJ5emRNEM2jQcC', '2018-01-03 19:35:54', '2018-01-03 19:35:54'),
(310, 1, 'i3u3Fev9GhSTSKw8zqKOtDxyBukTswNF', '2018-01-04 00:00:04', '2018-01-04 00:00:04'),
(311, 1, 'wIgyuIWSRPW3SoRC3SCDlIdvMSN1ntwp', '2018-01-04 07:50:26', '2018-01-04 07:50:26'),
(312, 1, 'lhTwGs8hINh78Dsjm9VZpOqyGh4ubnFD', '2018-01-04 18:27:00', '2018-01-04 18:27:00'),
(313, 1, 'XZqSKTU7fCn9dhY7pDGf6ny090eeqe8H', '2018-01-05 05:03:20', '2018-01-05 05:03:20'),
(314, 1, 'xPlA9MCUQ1DqNmZwgnVqmexRptuA4bju', '2018-01-05 07:13:15', '2018-01-05 07:13:15'),
(315, 1, 'tIKVZUBkeaj76cE4QGvO5rqFgawgYMNP', '2018-01-06 03:08:10', '2018-01-06 03:08:10'),
(316, 1, 'ntMLkIGaGhDneocoWJFOZTyl6MhuzZan', '2018-01-06 12:28:22', '2018-01-06 12:28:22'),
(317, 1, 'QU8qluCPQ7F4XdP5njtjcRWqzlXX9S8h', '2018-01-06 22:56:38', '2018-01-06 22:56:38'),
(318, 1, 'Us4ZHvY5DHcwpQVf9XysqakskdvsAzFV', '2018-01-07 04:20:27', '2018-01-07 04:20:27'),
(319, 1, 'AsTUE50pKXOtm27NbymiqbnpVrlhzWQ4', '2018-01-07 07:12:26', '2018-01-07 07:12:26'),
(320, 1, 'TSocJysjRMp42L96vEg02rwZBiEUKyyN', '2018-01-07 09:18:55', '2018-01-07 09:18:55'),
(321, 1, 'KQ0cszOBSWH87hnzA7wcYJLSbNcVQgpg', '2018-01-07 19:37:24', '2018-01-07 19:37:24'),
(322, 1, 'H8BxgWKyBTe4U5lwpdbYG43owssAnk1y', '2018-01-08 02:28:24', '2018-01-08 02:28:24'),
(323, 1, '8CEZcoGrealxWIzhXRxoDIGmPieyZkGP', '2018-01-08 04:07:45', '2018-01-08 04:07:45'),
(324, 1, '9wJ8Z8j1bqUBFAPGBkUytzbUmZqKV3HL', '2018-01-08 08:56:34', '2018-01-08 08:56:34'),
(325, 1, 'XKZh1syWLfcamMSbLhsL9SJVPf2Mfv67', '2018-01-08 10:14:35', '2018-01-08 10:14:35'),
(327, 1, 'loNG0asl3Sj6zCitYw1n692cZ5AWL72j', '2018-01-08 23:13:14', '2018-01-08 23:13:14'),
(328, 1, 'kFqFfFmhk2m2hy3Bj3Kuhn8YkI6WyGP1', '2018-01-08 23:20:42', '2018-01-08 23:20:42'),
(329, 1, 'U7t1BBwwPaAhglF8LUPBuWCzHANUDsKh', '2018-01-09 01:22:36', '2018-01-09 01:22:36'),
(330, 1, 'kryBmI5jqwrndEJvS7r4QFl5aKOUn4Rl', '2018-01-09 11:51:15', '2018-01-09 11:51:15'),
(331, 1, 'Yll3QjOrDTaxUkqpcbg62fOqmFlHLhgp', '2018-01-09 20:29:19', '2018-01-09 20:29:19'),
(332, 1, 'AYnzFsKBk3DG8o1HFCkbUaRcTs92YbM3', '2018-01-09 21:30:21', '2018-01-09 21:30:21'),
(333, 1, 'rNBV0y0Wan6Qpj65pQmiJOQ52qtkQ0sL', '2018-01-10 00:31:26', '2018-01-10 00:31:26'),
(334, 1, 'jKTPdBjo4Ev0seh3qIoU8CMVvIE0TTkE', '2018-01-10 02:52:39', '2018-01-10 02:52:39'),
(335, 1, 'E8NFXc9C2nsm8W6FWfgrrGsobWiPRnCT', '2018-01-10 08:34:20', '2018-01-10 08:34:20'),
(336, 1, 'vQMwlhh0SMMXZiQ7fQX1UweaJtNwM2Bv', '2018-01-10 19:06:53', '2018-01-10 19:06:53'),
(337, 1, 'ws5Lv88o5eWYYKzeiqwIHXmhwb5ItcOf', '2018-01-11 07:38:41', '2018-01-11 07:38:41'),
(338, 1, 'ouWCgfhI5q9H3k4h6w2tttsiJV8y3Qzp', '2018-01-11 10:31:12', '2018-01-11 10:31:12'),
(339, 1, 'elx9rwAfOXrPGOmTcsxZ9gsI5i9B9FAJ', '2018-01-11 10:32:25', '2018-01-11 10:32:25'),
(340, 1, 'utdXQIFty8RcOHFm8tpglAx8ANG7irml', '2018-01-11 18:57:38', '2018-01-11 18:57:38'),
(341, 1, 'XigZe34t3cWVnSlrmtPwHHvUHXNHmyPT', '2018-01-11 19:10:44', '2018-01-11 19:10:44'),
(342, 1, 'wwJoo2CBoB1bdZp6C56TPlo1lQ7mLSUa', '2018-01-11 23:57:32', '2018-01-11 23:57:32'),
(343, 1, 'D4OaTt5Z6zu1q6cPPJdne029l1QSAIJz', '2018-01-12 00:55:46', '2018-01-12 00:55:46'),
(344, 1, 'pvdA7qp7hS1G0FazeLwNIJkHXK7hQXzs', '2018-01-12 01:56:45', '2018-01-12 01:56:45'),
(345, 1, 'TcFmUyoJEeyOuCos5ePBdYugNanUjxVd', '2018-01-12 02:06:12', '2018-01-12 02:06:12'),
(346, 1, 'gKRIy92eSDkDLPtDEzZxHPvTO7vmNoaA', '2018-01-13 12:11:00', '2018-01-13 12:11:00'),
(347, 1, 'RHDxUSWbh2csZRCETQ3hXJuTLr4FyzzU', '2018-01-13 13:09:15', '2018-01-13 13:09:15'),
(348, 1, 'pTRVtKlFP6VnVnh61v9ZDhDBtutgZcta', '2018-01-13 13:12:05', '2018-01-13 13:12:05'),
(349, 1, '6k8RmyBaDmXZTwXKws2BaqjnebRDA46s', '2018-01-13 22:32:59', '2018-01-13 22:32:59'),
(350, 1, '29aWBcPaThOZhTUJ3TCMTr06inrXXpPc', '2018-01-14 05:18:27', '2018-01-14 05:18:27'),
(351, 1, 'l1FodYbVYnF5qllJXQn47jURkjbYQIah', '2018-01-14 09:12:20', '2018-01-14 09:12:20'),
(352, 1, 'C7CLHzromxCwETZPNWuFB5KQ1lLgJktO', '2018-01-14 09:39:44', '2018-01-14 09:39:44'),
(353, 1, 'Y7i1AwV61KINlely1225s2t3KYEoTeCl', '2018-01-14 09:54:05', '2018-01-14 09:54:05'),
(354, 1, 'yEepEQljz0lQ9veGResUYlNzZmZVSzYY', '2018-01-14 21:21:16', '2018-01-14 21:21:16'),
(355, 1, 'MoHMY2GAVZ06IfQ8lOrjvKHgSpRlt3sf', '2018-01-14 21:43:17', '2018-01-14 21:43:17'),
(356, 1, 'gJFjqXGL718vBEDWtiWFqrXd7wzQ3PJu', '2018-01-15 11:12:16', '2018-01-15 11:12:16'),
(357, 1, 'lAT4nQL5p2NV6Av36QLpsaS9oTck2miN', '2018-01-15 18:30:37', '2018-01-15 18:30:37'),
(358, 1, '7YzpEdozcjd8zxPMQBoLKz4wKQNvPvmk', '2018-01-15 18:55:34', '2018-01-15 18:55:34'),
(359, 1, 'CDE7azpfNeLEJOz3qA6iixYxURaNY7eL', '2018-01-16 02:56:25', '2018-01-16 02:56:25'),
(360, 1, 'MeVL2sSlFRzhrG0xaJ6ZqRoDCyyrfqpw', '2018-01-16 10:27:54', '2018-01-16 10:27:54'),
(362, 1, '7YWkgnr0fcthbBrZtZxI5VYfq9GkeIrH', '2018-01-16 20:15:12', '2018-01-16 20:15:12'),
(363, 1, 'C7HQZp1uoHWuUddbCURbC67F8WRFPbhz', '2018-01-16 20:57:30', '2018-01-16 20:57:30'),
(364, 1, 'An1hk9DM1kFNeHQDbXs26BUas2QhrMQM', '2018-01-17 00:28:12', '2018-01-17 00:28:12'),
(366, 1, '1wUTqWD2BFEEIS98lz1DmfP6K2QhdeMT', '2018-01-17 00:47:17', '2018-01-17 00:47:17'),
(368, 1, 'qsZQcTzpevnkZoiyIpQbaR4qu3r4g3GV', '2018-01-17 04:18:35', '2018-01-17 04:18:35'),
(372, 1, 'WjL3wP64VMbVgVUFVl99MdM5kcIdpQCy', '2018-01-17 08:29:47', '2018-01-17 08:29:47'),
(373, 1, 'ttUIgNCKBMBEkjLsKH9WuRDAEG4TPjzU', '2018-01-17 20:14:51', '2018-01-17 20:14:51'),
(374, 1, 'noRUog2Feq5ZNAGHfze9DBaubeDzabca', '2018-01-17 20:57:02', '2018-01-17 20:57:02'),
(375, 1, 'zkZ51ymxpywKCyuXmR3HqwHymINrQMfz', '2018-01-18 00:10:25', '2018-01-18 00:10:25'),
(376, 1, 'lzNZOymz8HgNudpRO5sMyTKipm0tpDGF', '2018-01-18 00:16:14', '2018-01-18 00:16:14'),
(377, 1, '2yCG7tSmilLxN8pzJjS2eMkCbplTTJ0h', '2018-01-18 03:52:31', '2018-01-18 03:52:31'),
(378, 1, 'RMWiH4kf71KduXOMGFtgTa3VDI7RA25R', '2018-01-18 09:25:22', '2018-01-18 09:25:22'),
(379, 1, 'jXAi4A9SVVlzEzUs51gWW6AFaJRNKgkG', '2018-01-18 11:20:09', '2018-01-18 11:20:09'),
(380, 1, 'WxxLLaypmZiGOfHWBQbzPUjt0bams3gx', '2018-01-18 11:57:31', '2018-01-18 11:57:31'),
(381, 1, 'KkJ6EvsSh1GkOXBYtfLzTeTE4H2mLzTT', '2018-01-18 19:23:30', '2018-01-18 19:23:30'),
(382, 1, 'xF88UwOSd9p1tmkrmBOEgAjIomkJB0Hx', '2018-01-19 00:25:51', '2018-01-19 00:25:51'),
(383, 1, 'A32q6kvPJplJ4WAIYSrx60zCSSnxpaDG', '2018-01-19 01:20:22', '2018-01-19 01:20:22'),
(384, 1, 'lPLxh0KbKNSsXA2BILeBXobgaGj68OKR', '2018-01-19 02:03:13', '2018-01-19 02:03:13'),
(385, 1, '5HCVqG0BkfTwNNXMnON1OkvmplY5VtPh', '2018-01-19 09:04:44', '2018-01-19 09:04:44'),
(386, 1, 'taFneiiXaSPaXyiEJwFR60oA690Cb2X8', '2018-01-19 20:43:49', '2018-01-19 20:43:49'),
(387, 1, 't23Yq0Wf57G9dDYIZ2lHzkBEnq6ICQAK', '2018-01-20 11:58:10', '2018-01-20 11:58:10'),
(388, 1, 'XmFShMJFqbARwYvuwfNLSOdWLrZmr32z', '2018-01-20 21:08:01', '2018-01-20 21:08:01'),
(389, 1, 'MBWjdSM0CwnQcdFbo5ea8EyDH1YC5ST0', '2018-01-21 05:40:50', '2018-01-21 05:40:50'),
(390, 1, 'evDd4G82kjgac50TOKv1DZrobHzWEZr8', '2018-01-21 08:05:52', '2018-01-21 08:05:52'),
(391, 1, '4dPKUN7BFQPOuGvA8Xt8Oh8azZQQ9pkx', '2018-01-21 10:51:12', '2018-01-21 10:51:12'),
(392, 1, 'iOi6rBobAw6B2Khg9CLDbPizVJYKGW94', '2018-01-21 18:51:39', '2018-01-21 18:51:39'),
(393, 1, 'CY5tmN8UCUMqmSVoRFOipfHKUpoT0j4f', '2018-01-22 00:07:03', '2018-01-22 00:07:03'),
(394, 1, 'aGzNsWOhDrVlT9HIVVFwCpsue1r7D5YA', '2018-01-22 00:44:48', '2018-01-22 00:44:48'),
(395, 1, 'VS5iiETNULvHItpuUmHQUH81sChbbY1l', '2018-01-22 19:02:07', '2018-01-22 19:02:07'),
(396, 1, 'McbzT8WlK9wFsoLdtsQVICZqEUnQzRER', '2018-02-01 02:50:30', '2018-02-01 02:50:30'),
(397, 1, 'ezvOIX2pe0Oz4H5SKEQD8e2lXWPx1sAP', '2018-02-01 02:54:02', '2018-02-01 02:54:02'),
(398, 1, 'y2bw3EKhxiWho2A4MjOKA4goeWfAcnGr', '2018-02-20 18:59:59', '2018-02-20 18:59:59'),
(399, 1, '0vzpmO1DNUL7MwWAaF7kg5rKo9Odz9DG', '2018-02-20 18:59:59', '2018-02-20 18:59:59'),
(400, 1, 'BUi8C0AV3AHpueiooxStwLVXznFFpdto', '2018-02-20 22:47:51', '2018-02-20 22:47:51'),
(401, 1, '6Av2lqwxCgu187njp2xD9V7vRPpLoZtM', '2018-02-21 18:45:25', '2018-02-21 18:45:25'),
(402, 1, 'iHgedLoBnytTjD8RPvhYyWfqksqrKUrd', '2018-02-21 18:45:25', '2018-02-21 18:45:25'),
(403, 1, 'uDpjeIaXZuVf895yRxOyC2e3coXRUjQ2', '2018-02-25 05:36:24', '2018-02-25 05:36:24'),
(404, 1, 'JZXc3vu25jMJ4QVGWyqZdRqlZsfeKlBl', '2018-02-25 05:36:24', '2018-02-25 05:36:24'),
(405, 1, 'YZSKkmFkarSHbzAl3JFp2KBLOU2xKagU', '2018-02-25 18:37:06', '2018-02-25 18:37:06'),
(406, 1, 'csvrk7irkCxmHFlsz8KSfdxbv23kbQCg', '2018-02-25 18:37:06', '2018-02-25 18:37:06'),
(407, 1, 'tbXe9LRZxaBqWVn7KXpibwagdrIRVje6', '2018-02-25 19:46:31', '2018-02-25 19:46:31'),
(408, 1, 'n2zo4wLChv4crjTlHEZe2DnB2UfhiVKM', '2018-02-25 19:46:31', '2018-02-25 19:46:31'),
(409, 1, 'sdZAiuw0dNCI1UfyPyFtkrsIZtSwPw87', '2018-02-26 00:59:23', '2018-02-26 00:59:23'),
(410, 1, 'XaNQD1OWuzAEKXsRK18H4i9MDd30hR5j', '2018-02-27 04:14:11', '2018-02-27 04:14:11'),
(411, 1, 'a0Yy2xgm1Zr0e9CCJb6XrNNvGCXqYAx1', '2018-02-27 04:14:11', '2018-02-27 04:14:11'),
(412, 1, 'SPfm678LcIVxI4rG5IIpW1osypC7tHea', '2018-02-27 10:24:22', '2018-02-27 10:24:22'),
(413, 1, 'AFHPjfqdRHTSGM81aU0KnrGRX6SgJMmN', '2018-02-27 10:24:22', '2018-02-27 10:24:22'),
(414, 1, 'XoiVnHvAjl6wUUYRM6KdAzyATiF6MAxa', '2018-03-03 06:04:14', '2018-03-03 06:04:14'),
(415, 1, '2YHmO790wqUdZfm51GIWewi2vn7IBW01', '2018-03-03 06:04:14', '2018-03-03 06:04:14'),
(416, 1, '8yafeA9t405VOhgjhZjRBsyoc0dUydZv', '2018-03-19 02:18:10', '2018-03-19 02:18:10'),
(417, 1, 'e92ZanJMEEjSaPtg4mqreqf25wXCreLQ', '2018-03-19 03:03:22', '2018-03-19 03:03:22'),
(418, 1, '2vzXNE8C6wvEmc9B2gdMiSqmuwYiYyzE', '2018-03-19 18:53:27', '2018-03-19 18:53:27'),
(419, 1, 'l2feOS3osyNYT9e8p8e80heoV1XmwFZk', '2018-03-20 00:21:31', '2018-03-20 00:21:31'),
(420, 1, 'Suw25YYS1mfUpYtWUtHVkhqduAR57sEw', '2018-03-20 11:35:49', '2018-03-20 11:35:49'),
(421, 1, 'lwPZyGTAPlsrCa6QazAwfQ8ctX0x6ikh', '2018-03-20 11:53:30', '2018-03-20 11:53:30'),
(422, 1, 'S3S7M1hDF0KwmC8BtxS2TY81xetV59ar', '2018-03-20 12:01:44', '2018-03-20 12:01:44'),
(423, 1, 'hcJ220nYaZMQUvUnYdNuH0LKljWK6p6n', '2018-03-27 18:33:48', '2018-03-27 18:33:48'),
(424, 1, 'BYyuAd8Qm3N4ftRLgSWagzEe8AjBJS8o', '2018-03-27 19:44:33', '2018-03-27 19:44:33'),
(425, 1, 'nAkwh2CxXcmlrvCNkxmuEXD4peEDmYFW', '2018-03-28 19:18:05', '2018-03-28 19:18:05'),
(426, 1, 'SKKB3PDT3Pyj9Pll9U70gkrq7tRjEH1c', '2018-04-10 00:53:50', '2018-04-10 00:53:50'),
(427, 1, '6T7gXHWZTvR8GTpbVl2d4Ym2imjf55Nv', '2018-04-10 01:39:04', '2018-04-10 01:39:04'),
(428, 1, 'Px2f4XaWTfoKQ7VWJoX44SGSprdg833G', '2018-05-11 01:54:49', '2018-05-11 01:54:49');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `album_id`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 'conmochieu-1.png', 6, 1, '2018-01-09 07:07:39', '2018-01-09 07:08:16'),
(5, 1, 'conmochieu-2.png', 8, 1, '2018-01-09 07:07:40', '2018-01-09 07:08:16'),
(6, 1, 'conmochieu-3.png', 10, 1, '2018-01-09 07:07:40', '2018-01-09 07:08:16'),
(7, 1, 'conmochieu-4.png', 12, 1, '2018-01-09 07:07:41', '2018-01-09 07:08:16'),
(8, 1, 'conmochieu-5.png', 14, 1, '2018-01-09 07:07:41', '2018-01-09 07:08:16'),
(9, 1, 'conmochieu-6.png', 16, 1, '2018-01-09 07:07:42', '2018-01-09 07:08:16'),
(10, 1, 'conmochieu-7.png', 2, 1, '2018-01-09 07:07:42', '2018-01-09 07:08:16'),
(11, 1, 'conmochieu-8.png', 3, 1, '2018-01-09 07:07:43', '2018-01-09 07:08:16'),
(12, 1, 'conmochieu-9.png', 4, 1, '2018-01-09 07:07:43', '2018-01-09 07:08:16'),
(13, 1, 'conmochieu-10.png', 5, 1, '2018-01-09 07:07:44', '2018-01-09 07:08:16'),
(14, 1, 'conmochieu-11.png', 7, 1, '2018-01-09 07:07:44', '2018-01-09 07:08:16'),
(15, 1, 'conmochieu-12.png', 9, 1, '2018-01-09 07:07:45', '2018-01-09 07:08:16'),
(16, 1, 'conmochieu-13.png', 11, 1, '2018-01-09 07:07:45', '2018-01-09 07:08:16'),
(17, 1, 'conmochieu-14.png', 13, 1, '2018-01-09 07:07:45', '2018-01-09 07:08:16'),
(18, 1, 'conmochieu-15.png', 15, 1, '2018-01-09 07:07:46', '2018-01-09 07:08:16'),
(19, 1, 'conmochieu-16.png', 1, 1, '2018-01-09 07:07:46', '2018-01-09 07:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `post_param`
--

DROP TABLE IF EXISTS `post_param`;
CREATE TABLE `post_param` (
  `id` bigint(20) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `param_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_param`
--

INSERT INTO `post_param` (`id`, `post_id`, `param_id`, `created_at`, `updated_at`) VALUES
(23, 11, 1, '2018-03-28 02:35:40', '2018-03-28 02:35:40'),
(24, 11, 3, '2018-03-28 02:35:40', '2018-03-28 02:35:40'),
(25, 10, 3, '2018-03-28 07:17:11', '2018-03-28 07:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `controller` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`id`, `fullname`, `controller`, `action`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'category-article-list', 'category-article', 'list', 1, '2017-05-18 06:49:30', '2017-05-19 17:26:33'),
(2, 'category-article-form', 'category-article', 'form', 2, '2017-05-18 06:50:32', '2017-11-26 16:43:37'),
(3, 'category-article-trash', 'category-article', 'trash', 3, '2017-05-18 06:51:27', '2017-11-26 16:43:37'),
(4, 'article-list', 'article', 'list', 1, '2017-05-18 08:34:41', '2017-05-19 18:11:35'),
(5, 'article-form', 'article', 'form', 2, '2017-05-18 08:35:17', '2017-05-19 17:24:54'),
(16, 'category-article-status', 'category-article', 'status', 4, '2017-05-19 08:23:46', '2017-11-26 16:43:37'),
(17, 'category-article-delete', 'category-article', 'delete', 5, '2017-05-19 08:25:14', '2017-11-26 16:43:37'),
(18, 'privilege-list', 'privilege', 'list', 1, NULL, '2017-11-26 16:43:37'),
(19, 'privilege-form', 'privilege', 'form', 2, NULL, '2017-11-26 16:43:37'),
(24, 'group-member-list', 'group-member', 'list', 1, '2017-05-19 11:59:40', '2017-11-26 16:43:37'),
(25, 'group-member-form', 'group-member', 'form', 2, '2017-05-19 12:00:09', '2017-11-26 16:43:37'),
(33, 'category-article-ordering', 'category-article', 'ordering', 6, '2017-05-19 17:29:14', '2017-11-26 16:43:37'),
(43, 'user-list', 'user', 'list', 1, '2017-05-19 17:45:27', '2017-11-26 16:43:37'),
(44, 'user-form', 'user', 'form', 2, '2017-05-19 17:45:57', '2017-11-26 16:43:37'),
(49, 'menu-type-list', 'menu-type', 'list', 1, '2017-05-19 17:49:35', '2017-11-26 16:43:37'),
(50, 'menu-type-form', 'menu-type', 'form', 2, '2017-05-19 17:49:53', '2017-11-26 16:43:37'),
(55, 'menu-list', 'menu', 'list', 1, '2017-05-19 18:01:20', '2017-11-26 16:43:37'),
(56, 'menu-form', 'menu', 'form', 2, '2017-05-19 18:01:38', '2017-11-26 16:43:37'),
(57, 'menu-trash', 'menu', 'trash', 3, '2017-05-19 18:01:52', '2017-11-26 16:43:37'),
(58, 'menu-delete', 'menu', 'delete', 4, '2017-05-19 18:02:17', '2017-11-26 16:43:37'),
(59, 'menu-status', 'menu', 'status', 5, '2017-05-19 18:02:31', '2017-11-26 16:43:37'),
(60, 'menu-ordering', 'menu', 'ordering', 6, '2017-05-19 18:02:50', '2017-11-26 16:43:37'),
(61, 'media-list', 'media', 'list', 1, '2017-05-19 18:05:47', '2017-11-26 16:43:37'),
(62, 'media-form', 'media', 'form', 2, '2017-05-19 18:06:05', '2017-11-26 16:43:37'),
(63, 'media-trash', 'media', 'trash', 3, '2017-05-19 18:06:22', '2017-11-26 16:43:37'),
(67, 'product-list', 'product', 'list', 1, '2017-05-19 18:09:08', '2017-11-26 16:43:37'),
(68, 'product-form', 'product', 'form', 2, '2017-05-19 18:09:20', '2017-11-26 16:43:37'),
(79, 'invoice-list', 'invoice', 'list', 1, '2017-05-19 18:14:02', '2017-11-26 16:43:37'),
(80, 'invoice-form', 'invoice', 'form', 2, '2017-05-19 18:14:30', '2017-11-26 16:43:37'),
(85, 'customer-list', 'customer', 'list', 1, '2017-05-19 18:16:10', '2017-11-26 16:43:37'),
(86, 'customer-form', 'customer', 'form', 2, '2017-05-19 18:16:33', '2017-11-26 16:43:37'),
(103, 'category-product-list', 'category-product', 'list', 1, '2017-11-26 14:50:53', '2017-11-26 14:50:53'),
(104, 'category-product-form', 'category-product', 'form', 2, '2017-11-26 14:51:11', '2017-11-26 14:51:11'),
(105, 'payment-method-list', 'payment-method', 'list', 1, '2017-11-26 14:52:56', '2017-11-26 14:52:56'),
(106, 'payment-method-form', 'payment-method', 'form', 2, '2017-11-26 14:53:10', '2017-11-26 14:53:10'),
(107, 'module-item-list', 'module-item', 'list', 1, '2017-11-26 14:54:56', '2017-11-26 14:54:56'),
(108, 'module-item-form', 'module-item', 'form', 2, '2017-11-26 14:55:07', '2017-11-26 14:55:07'),
(109, 'setting-system-list', 'setting-system', 'list', 1, '2017-11-26 14:56:14', '2017-11-26 14:56:31'),
(110, 'setting-system-form', 'setting-system', 'form', 2, '2017-11-26 14:56:46', '2017-11-26 14:56:46'),
(111, 'category-product-trash', 'category-product', 'trash', 3, '2017-11-26 16:31:27', '2017-11-26 16:31:45'),
(112, 'category-product-status', 'category-product', 'status', 4, '2017-11-26 16:32:17', '2017-11-26 16:32:17'),
(113, 'category-product-delete', 'category-product', 'delete', 5, '2017-11-26 16:32:50', '2017-11-26 16:32:50'),
(114, 'category-product-ordering', 'category-product', 'ordering', 6, '2017-11-26 16:33:08', '2017-11-26 16:33:08'),
(115, 'category-banner-list', 'category-banner', 'list', 1, '2017-12-12 04:05:17', '2017-12-12 04:05:17'),
(116, 'category-banner-form', 'category-banner', 'form', 2, '2017-12-12 04:05:47', '2017-12-12 04:05:47'),
(117, 'category-banner-trash', 'category-banner', 'trash', 3, '2017-12-12 04:06:15', '2017-12-12 04:06:15'),
(118, 'category-banner-status', 'category-banner', 'status', 4, '2017-12-12 04:06:43', '2017-12-12 04:06:43'),
(119, 'category-banner-delete', 'category-banner', 'delete', 5, '2017-12-12 04:07:11', '2017-12-12 04:08:01'),
(120, 'category-banner-ordering', 'category-banner', 'ordering', 6, '2017-12-12 04:07:32', '2017-12-12 04:08:01'),
(121, 'banner-list', 'banner', 'list', 1, '2017-12-12 07:41:46', '2017-12-12 07:41:46'),
(122, 'banner-form', 'banner', 'form', 2, '2017-12-12 07:41:56', '2017-12-12 07:41:56'),
(123, 'page-list', 'page', 'list', 1, '2017-12-13 18:10:13', '2017-12-13 18:10:13'),
(124, 'page-form', 'page', 'form', 2, '2017-12-13 18:10:24', '2017-12-13 18:10:24'),
(125, 'project-list', 'project', 'list', 1, '2018-01-04 09:45:36', '2018-01-04 09:45:36'),
(126, 'project-form', 'project', 'form', 2, '2018-01-04 09:45:49', '2018-01-04 09:45:49'),
(127, 'project-article-list', 'project-article', 'list', 1, '2018-01-04 15:21:53', '2018-01-04 15:21:53'),
(128, 'project-article-form', 'project-article', 'form', 2, '2018-01-04 15:22:08', '2018-01-04 15:22:08'),
(129, 'supporter-list', 'supporter', 'list', 1, '2018-01-07 17:18:23', '2018-01-07 17:18:23'),
(130, 'supporter-form', 'supporter', 'form', 2, '2018-01-07 17:18:39', '2018-01-07 17:18:39'),
(131, 'organization-list', 'organization', 'list', 1, '2018-01-08 04:32:03', '2018-01-08 04:32:03'),
(132, 'organization-form', 'organization', 'form', 2, '2018-01-08 04:32:17', '2018-01-08 04:32:17'),
(133, 'album-list', 'album', 'list', 1, '2018-01-08 15:57:00', '2018-01-08 15:57:00'),
(134, 'album-form', 'album', 'form', 2, '2018-01-08 15:57:10', '2018-01-08 15:57:10'),
(135, 'photo-list', 'photo', 'list', 1, '2018-01-08 18:07:30', '2018-01-08 18:07:30'),
(136, 'photo-form', 'photo', 'form', 2, '2018-01-08 18:07:39', '2018-01-08 18:07:39'),
(137, 'category-video-list', 'category-video', 'list', 1, '2018-01-09 09:54:53', '2018-01-09 09:54:53'),
(138, 'category-video-form', 'category-video', 'form', 2, '2018-01-09 09:55:06', '2018-01-09 09:55:06'),
(139, 'video-list', 'video', 'list', 1, '2018-01-09 09:55:16', '2018-01-09 09:55:16'),
(140, 'video-form', 'video', 'form', 2, '2018-01-09 09:55:24', '2018-01-09 09:55:24'),
(141, 'province-list', 'province', 'list', 1, '2018-01-21 17:53:20', '2018-01-21 17:53:20'),
(142, 'province-form', 'province', 'form', 2, '2018-01-21 17:53:29', '2018-01-21 17:53:29'),
(143, 'district-list', 'district', 'list', 1, '2018-01-22 02:03:24', '2018-01-22 02:03:24'),
(144, 'district-form', 'district', 'form', 2, '2018-01-22 02:03:34', '2018-01-22 02:03:34'),
(145, 'category-param-list', 'category-param', 'list', 1, '2018-03-20 08:50:49', '2018-03-20 08:50:49'),
(146, 'category-param-form', 'category-param', 'form', 1, '2018-03-20 08:51:06', '2018-03-20 08:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `child_image` text CHARACTER SET utf8,
  `price` decimal(11,2) DEFAULT NULL,
  `sale_price` decimal(11,2) DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `detail` text CHARACTER SET utf8,
  `count_view` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` bigint(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_view` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `overview` text COLLATE utf8_unicode_ci,
  `equipment` text COLLATE utf8_unicode_ci,
  `price_list` text COLLATE utf8_unicode_ci,
  `googlemap_url` text COLLATE utf8_unicode_ci,
  `province_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `street` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `fullname`, `alias`, `meta_keyword`, `meta_description`, `image`, `count_view`, `total_cost`, `intro`, `overview`, `equipment`, `price_list`, `googlemap_url`, `province_id`, `district_id`, `street`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(10, 'Opal Skyview 102', 'opal-skyview-102', 'metakeyword Opal Skyview 102', 'metadescription Opal Skyview 102', 'chi-lien-vinhome-8-5691.png', 441, 102, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. 102', '<p>tổng quan 102</p>', '<p>tiện &iacute;ch 102</p>', '<p>bảng gi&aacute; 102</p>', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567 102', 36, 8, 'Khu căn hộ cao cấp Q.7 Tp. HCM 102', 102, 1, '2018-01-04 18:34:30', '2018-03-28 07:18:24'),
(11, 'Opal Skyview 2', 'opal-skyview-2', 'metakeyword Opal Skyview 2', 'metadescription Opal Skyview 2', '12-6099.jpg', 3, 200, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source', '<p>tổng quan 2</p>', '<p>tiện &iacute;ch 2</p>', '<p>bảng gi&aacute; 2</p>', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 24, 2, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 2, 1, '2018-01-18 17:17:02', '2018-03-28 02:36:03'),
(12, 'Opal Skyview 3', 'opal-skyview-3', 'metakeyword Opal Skyview 3', 'metadescription Opal Skyview 3', 'conmochieu-3.png', 1, 300, 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham', '<p>tổng quan 3</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 24, 1, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 3, 1, '2018-01-18 17:17:56', '2018-03-29 03:17:17'),
(13, 'Opal Skyview 4', 'opal-skyview-4', 'metakeyword Opal Skyview 4', 'metadescription Opal Skyview 4', 'conmochieu-4.png', 1, 400, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy', '<p>tổng quan 4</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 24, 2, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 4, 1, '2018-01-18 17:22:56', '2018-03-29 03:22:06'),
(14, 'Opal Skyview 5', 'opal-skyview-5', 'metakeyword Opal Skyview 5', 'metadescription Opal Skyview 5', 'conmochieu-5.png', NULL, 500, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 5</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 24, 3, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 5, 1, '2018-01-18 17:23:56', '2018-03-20 07:46:37'),
(15, 'Opal Skyview 6', 'opal-skyview-6', 'metakeyword Opal Skyview 6', 'metadescription Opal Skyview 6', 'conmochieu-6.png', 1, 600, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 6</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 24, 3, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 6, 1, '2018-01-18 17:24:37', '2018-03-20 09:37:31'),
(16, 'Opal Skyview 7', 'opal-skyview-7', 'metakeyword Opal Skyview 7', 'metadescription Opal Skyview 7', 'conmochieu-7.png', 1, 700, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 7</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 24, 3, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 7, 1, '2018-01-18 17:25:24', '2018-03-20 07:46:54'),
(17, 'Opal Skyview 8', 'opal-skyview-8', 'metakeyword Opal Skyview 8', 'metadescription Opal Skyview 8', 'conmochieu-8.png', NULL, 800, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 8</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 5, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 8, 1, '2018-01-18 17:26:18', '2018-03-20 07:22:12'),
(18, 'Opal Skyview 9', 'opal-skyview-9', 'metakeyword Opal Skyview 9', 'metadescription Opal Skyview 9', 'conmochieu-9.png', NULL, 900, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 9</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 6, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 9, 1, '2018-01-18 17:26:59', '2018-03-20 07:22:27'),
(19, 'Opal Skyview 10', 'opal-skyview-10', 'metakeyword Opal Skyview 10', 'metadescription Opal Skyview 10', 'conmochieu-10.png', 1, 1000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 10</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 7, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 10, 1, '2018-01-18 17:27:47', '2018-03-20 07:22:39'),
(20, 'Opal Skyview 11', 'opal-skyview-11', 'metakeyword Opal Skyview 11', 'metadescription Opal Skyview 11', 'conmochieu-11.png', 1, 1100, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 11</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 8, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 11, 1, '2018-01-18 17:29:10', '2018-03-20 07:22:51'),
(21, 'Opal Skyview 12', 'opal-skyview-12', 'metakeyword Opal Skyview 12', 'metadescription Opal Skyview 12', 'conmochieu-12.png', NULL, 1200, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 12</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 5, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 12, 1, '2018-01-18 17:30:19', '2018-03-20 07:23:05'),
(22, 'Opal Skyview 13', 'opal-skyview-13', 'metakeyword Opal Skyview 13', 'metadescription Opal Skyview 13', 'conmochieu-13.png', NULL, 1300, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 13</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 7, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 13, 1, '2018-01-18 17:31:06', '2018-03-20 07:23:19'),
(23, 'Opal Skyview 14', 'opal-skyview-14', 'metakeyword Opal Skyview 14', 'metadescription Opal Skyview 14', 'conmochieu-14.png', NULL, 1400, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan&nbsp;Opal Skyview 14</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 8, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 14, 1, '2018-01-18 17:31:47', '2018-03-20 07:23:28'),
(24, 'Opal Skyview 15', 'opal-skyview-15', 'metakeyword Opal Skyview 15', 'metadescription Opal Skyview 15', 'conmochieu-15.png', NULL, 1500, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 15</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 7, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 15, 1, '2018-01-18 17:33:28', '2018-03-20 07:23:39'),
(25, 'Opal Skyview 16', 'opal-skyview-16', 'metakeyword Opal Skyview 16', 'metadescription Opal Skyview 16', 'conmochieu-16.png', 2, 1600, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p>tổng quan 16</p>', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.524046987366!2d106.64216631435112!3d10.84768899227317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDUwJzUxLjciTiAxMDbCsDM4JzM5LjciRQ!5e0!3m2!1svi!2s!4v1516617184567', 36, 10, 'Khu căn hộ cao cấp Q.7 Tp. HCM', 16, 1, '2018-01-18 17:34:08', '2018-03-29 02:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `project_article`
--

DROP TABLE IF EXISTS `project_article`;
CREATE TABLE `project_article` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_article`
--

INSERT INTO `project_article` (`id`, `fullname`, `alias`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `project_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sam Allardyce - gã HLV thực dụng nhất Ngoại hạng Anh', 'sam-allardyce---ga-hlv-thuc-dung-nhat-ngoai-hang-anh', 'conmochieu-16.png', 'Với những ai yêu bóng đá Anh, Big Sam  như một người bạn lâu năm. Có thì bình thường nhưng vắng mặt là cảm giác… thiếu thiếu.', '<p>Allardyce l&agrave; một trong những gương mặt dễ nhận ra nhất của b&oacute;ng đ&aacute; Anh. &Ocirc;ng đ&atilde; c&oacute; 21 năm thi đấu chuy&ecirc;n nghiệp, v&agrave; đang ở năm thứ 27 kể từ khi khởi nghiệp cầm qu&acirc;n. Trong số HLV c&ograve;n l&agrave;m việc tại Anh, &ocirc;ng gi&agrave; 63 tuổi n&agrave;y chịu k&eacute;m duy nhất một người về th&acirc;m ni&ecirc;n: Arsene Wenger của Arsenal.</p>\n\n<p>Khi Big Sam ra tự truyện, HLV huyền thoại Alex Ferguson thậm ch&iacute; xung phong viết lời tựa. Ferguson gọi Big Sam l&agrave; một phần kh&ocirc;ng thể t&aacute;ch rời của lịch sử b&oacute;ng đ&aacute; Anh. Thời c&ograve;n l&agrave;m cầu thủ, &ocirc;ng l&agrave; một hậu vệ rắn mặt c&oacute; tiếng. Đến mức Ferguson từng bảo Allardyce đ&atilde; k&egrave;m ai tối Chủ nhật th&igrave; s&aacute;ng thứ Hai người ấy ăn cũng kh&ocirc;ng nổi. Khi chuyển sang cầm qu&acirc;n, c&aacute;c đội b&oacute;ng của &ocirc;ng cũng chơi thứ b&oacute;ng đ&aacute; rất kh&oacute; chịu.</p>\n\n<p>Ngoại h&igrave;nh th&ocirc; kệch, sẵn s&agrave;ng thực dụng đến xấu x&iacute; l&agrave; m&ocirc; tả gần nhất về Big Sam.&nbsp;<br />\nL&agrave; người Anh, nhưng Big Sam kh&ocirc;ng mang một ch&uacute;t n&agrave;o tinh thần hiệp sĩ. C&aacute;c đội b&oacute;ng của &ocirc;ng lu&ocirc;n ng&atilde; vờ, c&acirc;u giờ, tiểu xảo, v&agrave; kh&ocirc;ng từ một thủ đoạn n&agrave;o để đạt kết quả - một phong c&aacute;ch &quot;rất&hellip; Allardyce&quot;. Big Sam cũng d&iacute;nh v&agrave;o nghi &aacute;n hay t&aacute;c động để CLB của &ocirc;ng mua cầu thủ c&oacute; c&ugrave;ng người đại diện, để được... chia phần trăm. Ngay cả trong trải nghiệm cầm qu&acirc;n lớn nhất cuộc đời &ndash; HLV trưởng của đội tuyển Anh, Big Sam cũng d&iacute;nh v&agrave;o một b&ecirc; bối t&agrave;y trời. Bị ph&oacute;ng vi&ecirc;n Telegraph giả dạng l&agrave;m người đại diện của một c&ocirc;ng ty ch&acirc;u &Aacute;, Big Sam h&agrave;o hứng b&agrave;y vẽ cho họ c&aacute;ch l&aacute;ch luật chuyển nhượng. Trong l&uacute;c cao hứng, &ocirc;ng c&ograve;n tiện mồm ch&ecirc; bai Gary Neville v&agrave; Roy Hodgson - người tiền nhiệm ở tuyển Anh.&nbsp;</p>\n\n<p>Vậy m&agrave; &ocirc;ng vẫn sống tốt, sống khỏe bất chấp những scandal của bản th&acirc;n. V&igrave; trong những l&uacute;c gian kh&oacute;, CLB n&agrave;o cũng cần một con người thực dụng như thế. Allardyce kh&ocirc;ng phải l&agrave; một cầu thủ xuất ch&uacute;ng khi c&ograve;n thi đấu, n&ecirc;n &ocirc;ng khởi nghiệp HLV từ những CLB rất nhỏ. Đầu ti&ecirc;n l&agrave; trải nghiệm HLV ki&ecirc;m cầu thủ tại CLB Ireland Limerick, sau đ&oacute; l&agrave; c&aacute;c đội hạng dưới ở Anh như Preston North End, Blackpool v&agrave; Notts County.</p>\n\n<p>Nhưng Big Sam chỉ ch&iacute;nh thức g&acirc;y tiếng vang khi cầm qu&acirc;n cho Bolton Wanderers. Khi &ocirc;ng tiếp quản v&agrave;o năm 1999, CLB c&ograve;n lặn ngụp ở nửa dưới của giải Division Two (tương đương hạng Tư trong hệ thống c&aacute;c giải b&oacute;ng đ&aacute; Anh). Khi &ocirc;ng rời đi v&agrave;o năm 2007, Bolton l&agrave; đội thường xuy&ecirc;n g&oacute;p mặt ở nửa tr&ecirc;n của Ngoại hạng Anh, đ&atilde; gi&agrave;nh v&eacute; dự Cup ch&acirc;u &Acirc;u lần đầu ti&ecirc;n v&agrave; duy nhất trong lịch sử.</p>\n\n<p>Bolton của Big Sam những năm ấy chơi thứ b&oacute;ng đ&aacute; gi&agrave;u sức mạnh, với những cầu thủ đ&atilde; qua thời đỉnh cao. &Ocirc;ng ch&agrave;o đ&oacute;n tất cả, từ dạng bất trị như Nicolas Anelka, sớm nắng chiều mưa như Jay-Jay Okocha, cần c&ugrave; b&ugrave; khả năng như Gary Speed hay những người ngỡ như qu&aacute; gi&agrave; v&agrave; qu&aacute; yếu để đ&aacute; ở Ngoại hạng Anh như Fernando Hierro, Ivan Campo, Youri Djorkaeff...</p>\n\n<p>Big Sam l&agrave; một trong những HLV đầu ti&ecirc;n &aacute;p dụng thống k&ecirc; v&agrave; ph&acirc;n t&iacute;ch v&agrave;o lối chơi. &Ocirc;ng c&oacute; một đội ngũ số liệu đ&ocirc;ng như bầu đo&agrave;n th&ecirc; tử của một ng&ocirc;i sao nhạc pop, cung cấp cho &ocirc;ng mọi th&ocirc;ng số từ thể lực đến dinh dưỡng. Khi luật việt vị thay đổi v&agrave;o năm 2003, Big Sam l&agrave; HLV hiếm hoi kh&ocirc;ng than v&atilde;n m&agrave; th&iacute;ch nghi cực nhanh, biến n&oacute; th&agrave;nh lợi thế cho đội của &ocirc;ng.</p>\n\n<p>Youri Djorkaeff (&aacute;o trắng) chỉ l&agrave; một trong nhiều ng&ocirc;i sao hết thời ở c&aacute;c CLB lớn, sang Bolton v&agrave; tỏa s&aacute;ng trở lại ở Ngoại hạng Anh dưới trướng Sam Allardyce.&nbsp;</p>\n\n<p>Big Sam l&agrave; mẫu HLV m&agrave; kh&ocirc;ng ai muốn, nhưng ai cũng cần. Sau khi rời Bolton, &ocirc;ng lang bạt qua s&aacute;u CLB kh&aacute;c nhau ở Ngoại hạng Anh v&agrave; lu&ocirc;n đảm bảo rằng: khi &ocirc;ng rời đi, CLB đều tốt hơn khi &ocirc;ng đến. L&uacute;c truyền th&ocirc;ng Anh ca tụng HLV Marco Silva của Watford, Big Sam n&oacute;i: &ldquo;Đừng s&iacute;nh ngoại thế, t&ocirc;i chưa rớt hạng bao giờ, Marco từng rớt hạng với Hull City đấy&rdquo;.</p>\n\n<p>Big Sam tự h&agrave;o kh&ocirc;ng hề qu&aacute;, bởi d&ugrave; kh&ocirc;ng c&oacute; danh hiệu n&agrave;o khi l&agrave;m HLV trưởng, &quot;chiếc Cup&quot; lớn nhất đời &ocirc;ng l&agrave; chưa bao giờ rớt hạng, kể cả CLB &ocirc;ng cầm c&oacute; đang khủng hoảng đến đ&acirc;u đi nữa. N&oacute;i theo ng&ocirc;n ngữ khoa học, luật vạn vật hấp dẫn kh&ocirc;ng t&aacute;c động l&ecirc;n Big Sam, v&igrave; đội b&oacute;ng của &ocirc;ng kh&ocirc;ng bao giờ rơi xuống hạng dưới.</p>\n\n<p>Th&aacute;ng 7/2017, sau khi vớt Crystal Palace từ c&otilde;i chết trở về, &ocirc;ng ra đi v&agrave; tuy&ecirc;n bố kh&ocirc;ng cầm qu&acirc;n cấp độ CLB nữa. Vậy m&agrave; khi đề nghị từ Everton đến bốn th&aacute;ng sau đ&oacute;, Big Sam nhận lời ngay. Mấy th&aacute;ng ngồi ngo&agrave;i, chơi với con ch&aacute;u khiến Big Sam nhớ việc. V&agrave; dường như Ngoại hạng Anh cũng nhớ &ocirc;ng. H&igrave;nh ảnh một &ocirc;ng gi&agrave; b&ecirc;n đường piste, d&aacute;ng mập mạp, miệng li&ecirc;n tục nhai kẹo cao su, hay cười cợt v&igrave; đủ thứ l&yacute; do thật quen thuộc, giống như một người bạn l&acirc;u năm. C&oacute; th&igrave; kh&ocirc;ng để &yacute;, nhưng vắng lại nhớ ngay.</p>\n\n<p>Allardyce nhận được sự qu&yacute; mến, nể trọng từ những bậc đồng nghiệp khả k&iacute;nh lừng danh như Alex Ferguson.&nbsp;<br />\nV&agrave; Big Sam trở lại, lợi hại như xưa. Everton của &ocirc;ng thua hai trận gần nhất, nhưng họ r&otilde; r&agrave;ng đ&atilde; l&agrave; một đội b&oacute;ng ho&agrave;n to&agrave;n kh&aacute;c so với khi &ocirc;ng nhậm chức. Hiện th&acirc;n r&otilde; nhất cho thay đổi m&agrave; Allardyce mang lại l&agrave; Wayne Rooney. Trước khi Big Sam đến, anh đ&aacute; 11 trận, ghi bốn b&agrave;n v&agrave; kh&ocirc;ng kiến tạo được g&igrave;. Sau khi c&oacute; Big Sam, anh ghi s&aacute;u b&agrave;n, kiến tạo hai lần chỉ sau ... năm trận. Từ chỗ đang ở dưới khu vực đ&egrave;n đỏ, b&acirc;y giờ Everton đang lơ lửng ở giữa bảng điểm.</p>\n\n<p>B&iacute; quyết cầm qu&acirc;n của Big Sam thực ra rất giản dị, đ&atilde; theo &ocirc;ng từ những ng&agrave;y đầu cầm qu&acirc;n. &quot;T&ocirc;i lu&ocirc;n khuy&ecirc;n mọi cầu thủ h&atilde;y chuyền quả b&oacute;ng l&ecirc;n tr&ecirc;n nếu c&oacute; thể. Ngay cả trước những đội b&oacute;ng ph&ograve;ng ngự hay nhất Ngoại hạng Anh, một đường chuyền nhanh l&ecirc;n tr&ecirc;n cũng c&oacute; thể tạo ra cơ hội ghi b&agrave;n. Chuyền ngang hoặc chuyền về chỉ c&agrave;ng l&agrave;m đối phương tổ chức ph&ograve;ng ngự tốt hơn m&agrave; th&ocirc;i&quot;, &ocirc;ng n&oacute;i tr&ecirc;n Sky Sports.&nbsp;</p>\n\n<p>Trang Wikipedia th&igrave; m&ocirc; tả như sau: &quot;Khi c&ograve;n l&agrave; hậu vệ, &ocirc;ng rất ngại xử l&yacute; b&oacute;ng. C&oacute; b&oacute;ng l&agrave; chuyền ngay cho người đứng gần nhất&quot;. Nghe cứ như&hellip; đ&ugrave;n đẩy tr&aacute;ch nhiệm. V&agrave; khi l&agrave;m HLV, Big Sam cũng khuy&ecirc;n c&aacute;c cầu thủ h&atilde;y đ&ugrave;n đẩy như thế. C&oacute; b&oacute;ng cứ chuyền l&ecirc;n tr&ecirc;n cho người thuận lợi nhất, nếu pha b&oacute;ng ấy kh&ocirc;ng th&agrave;nh c&ocirc;ng th&igrave; cầu thủ cũng kh&ocirc;ng c&oacute; lỗi.</p>\n\n<p>Big Sam giống như hiện th&acirc;n cho một tư duy thực dụng đến tận c&ugrave;ng, nhưng vẫn c&oacute; đất sống giữa một Ngoại hạng Anh trăm hoa đua nở. Người h&acirc;m mộ v&agrave; giới chuy&ecirc;n m&ocirc;n hay than thở về việc những HLV trẻ của Anh quốc kh&ocirc;ng được trao cơ hội. Nhưng vấn đề l&agrave; khi gặp kh&oacute; khăn, trong đầu c&aacute;c CLB Ngoại hạng Anh lu&ocirc;n bật ra c&aacute;i t&ecirc;n Sam Allardyce như một phản xạ. Học tr&ograve; cũ Jermain Defoe đ&atilde; n&oacute;i: &quot;&Ocirc;ng ấy lu&ocirc;n n&oacute;i với ch&uacute;ng t&ocirc;i như sau: &#39;T&ocirc;i kh&ocirc;ng bận t&acirc;m chuyện mấy cậu đ&aacute; đấm thế n&agrave;o, miễn thắng l&agrave; được&quot;.</p>\n\n<p>Big Sam chắc chắn sẽ kh&ocirc;ng bao giờ được chọn mặt gửi v&agrave;ng cho những c&ocirc;ng việc lớn như tại Man Utd, Man City, Arsenal, Chelsea&hellip; Nhưng nh&agrave; cầm qu&acirc;n n&agrave;y vẫn th&uacute; vị theo c&aacute;ch của ri&ecirc;ng &ocirc;ng: ng&ocirc;ng ngh&ecirc;nh, l&igrave; lợm, giang hồ với một phương ch&acirc;m sống duy nhất: c&aacute;i g&igrave; c&oacute; lợi th&igrave; l&agrave;m th&ocirc;i!</p>', '', 'metakeyword Sam Allardyce - gã HLV thực dụng nhất Ngoại hạng Anh', 'metadescription Sam Allardyce - gã HLV thực dụng nhất Ngoại hạng Anh', NULL, 10, 1, 1, '2018-01-04 18:37:46', '2018-01-18 19:01:31'),
(2, 'Andy Murray rút khỏi Australia Mở rộng 2018 2', 'andy-murray-rut-khoi-australia-mo-rong-2018-2', 'chi-lien-vinhome-10-6454.png', 'Tay vợt người Scotland vẫn chưa bình phục chấn thương hông kể từ Wimbledon 2017. 2', '<p>&ldquo;T&ocirc;i sẽ kh&ocirc;ng tham g&oacute;p mặt giải đấu ở Melbourne năm nay, do chưa sẵn s&agrave;ng&rdquo;, Murray th&ocirc;ng b&aacute;o. &ldquo;T&ocirc;i sẽ trở về London để xem x&eacute;t c&aacute;c khả năng tiếp theo. T&ocirc;i cũng cảm k&iacute;ch v&igrave; những lời ch&uacute;c của mọi người. Hy vọng t&ocirc;i sẽ sớm trở lại&rdquo;.<br />\r\nTrong tiết lộ tr&ecirc;n Instagram &iacute;t ng&agrave;y trước, Murray cho biết chấn thương h&ocirc;ng kh&ocirc;ng tiến triển tốt, d&ugrave; đ&atilde; nghỉ thi đấu s&aacute;u th&aacute;ng qua. Tay vợt sở hữu ba Grand Slam đứng trước hai lựa chọn: tiếp tục qu&aacute; tr&igrave;nh hồi phục hoặc l&ecirc;n b&agrave;n mổ. Nhưng phẫu thuật chỉ l&agrave; phương &aacute;n B với Murray do anh c&oacute; thể đối mặt những rủi ro kh&oacute; lường.</p>\r\n\r\n<p>Murray từng năm lần v&agrave;o chung kết Australia Mở rộng (2010, 2011, 2013, 2015, 2016), nhưng đều gục ng&atilde;. Trận đấu chuy&ecirc;n nghiệp gần nhất của tay vợt 30 tuổi l&agrave; thất bại trước Sam Querrey ở tứ kết Wimbledon 2017. Anh tham dự trận đấu biểu diễn với Roger Federer th&aacute;ng 11/2017, với thất bại 3-6, 6-3, 6-10. Tuần trước, Murray cũng đ&aacute;nh một trận biểu diễn c&ugrave;ng Roberto Bautista Agut tại Abu Dhabi. Nhưng chấn thương ph&aacute;t t&aacute;c khiến anh phải r&uacute;t khỏi giải ATP 250 ở Brisbane.</p>\r\n\r\n<p>B&ecirc;n cạnh Murray, nhiều tay vợt h&agrave;ng đầu cũng c&oacute; nguy cơ lỡ hẹn giải Grand Slam đầu ti&ecirc;n năm 2018, như Novak Djokovic, Rafael Nadal v&agrave; Stan Wawrinka. 2</p>', 'chú thích 2', 'metakeyword Andy Murray rút khỏi Australia Mở rộng 2018 2', 'metadescription Andy Murray rút khỏi Australia Mở rộng 2018 2', 1, 11, 2, 1, '2018-01-04 18:39:04', '2018-03-28 07:19:16'),
(3, 'Pochettino: \'Tottenham sẽ xem xét nếu Kane đề nghị ra đi\'', 'pochettino:-tottenham-se-xem-xet-neu-kane-de-nghi-ra-di', 'conmochieu-14.png', '\"Gà trống\" không muốn mất tiền đạo chủ lực nhưng sẽ cân nhắc nếu bản thân Harry Kane đề bạt nguyện vọng rời CLB - như Modric và Bale từng làm.', '<p>&quot;L&agrave; HLV của Tottenham, t&ocirc;i c&oacute; thể n&oacute;i rằng nếu Real Madrid đưa ra đề nghị, ch&uacute;ng t&ocirc;i sẽ từ chối. Bởi v&igrave; cậu ấy sẽ ở đ&acirc;y v&agrave; họ hiểu điều đ&oacute;&quot;, Pochettino trả lời phỏng vấn k&ecirc;nh truyền h&igrave;nh El Chiringuito.&nbsp;</p>\n\n<p>&quot;Tuy nhi&ecirc;n, nếu cầu thủ đề bạt nguyện vọng ra đi, giống như trường hợp của Modric v&agrave; Bale, ch&uacute;ng t&ocirc;i sẽ xem điều g&igrave; c&oacute; thể diễn ra. H&ocirc;m nay, chuyện đ&oacute; chưa xảy ra. T&ocirc;i hy vọng Harry Kane sẽ ở đ&acirc;y th&ecirc;m nhiều năm v&agrave; đ&oacute;ng g&oacute;p th&ecirc;m nhiều b&agrave;n, gi&agrave;nh những chiến thắng v&agrave; danh hiệu. Đ&oacute; l&agrave; mong muốn của ch&uacute;ng t&ocirc;i&quot;.<br />\nKane đang l&agrave; mục ti&ecirc;u theo đuổi của Real - đội b&oacute;ng từng chi&ecirc;u mộ những hảo thủ từ Tottenham như Gareth Bale hay Luka Modric.</p>\n\n<p>Kane trải qua một năm 2017 th&agrave;nh c&ocirc;ng khi ph&aacute; kỷ lục số b&agrave;n nhiều nhất tại Ngoại hạng Anh trong một năm của Alan Shearer (37). Anh nổi l&ecirc;n l&agrave; một trong những trung phong hay nhất ch&acirc;u &Acirc;u v&agrave; m&agrave;n tr&igrave;nh diễn xuất sắc trong hai trận đấu với Real ở v&ograve;ng bảng Champions League khiến &quot;Kền kền trắng&quot; đặt quyết t&acirc;m chi&ecirc;u mộ Kane.</p>\n\n<p>Kane đang dẫn đầu danh s&aacute;ch ghi b&agrave;n tại Ngoại hạng Anh với 18 b&agrave;n, gi&uacute;p Tottenham đứng thứ năm. H&ocirc;m nay, anh v&agrave; đồng đội sẽ l&agrave;m kh&aacute;ch tr&ecirc;n s&acirc;n của West Ham, trong trận đấu muộn ở v&ograve;ng 22.</p>\n\n<p>Kane l&agrave; vua ph&aacute; lưới Ngoại hạng Anh trong hai m&ugrave;a giải gần nhất, ghi 25 b&agrave;n ở m&ugrave;a 2015-2016 v&agrave; 29 b&agrave;n ở m&ugrave;a 2016-2017.</p>', 'chú thích Pochettino: \'Tottenham sẽ xem xét nếu Kane đề nghị ra đi\'', 'metakeyword Neymar Pochettino: \'Tottenham sẽ xem xét nếu Kane đề nghị ra đi\'', 'metadescription Neymar Pochettino: \'Tottenham sẽ xem xét nếu Kane đề nghị ra đi\'', NULL, 10, 3, 1, '2018-01-04 18:41:15', '2018-01-18 19:01:42'),
(4, 'Lịch thi đấu ở Anh khắc nghiệt như thế nào', 'lich-thi-dau-o-anh-khac-nghiet-nhu-the-nao', 'conmochieu-13.png', 'Tờ AS (Tây Ban Nha) dẫn thống kê về số trận tối đa mà một đội bóng hàng đầu tại Anh chơi mỗi mùa để ủng hộ quan điểm của Pep Guardiola.', '<p>Guardiola đ&atilde; khơi lại cuộc tranh luận về kỳ nghỉ đ&ocirc;ng tại Ngoại hạng Anh, khi cho rằng lịch thi đấu hiện tại &quot;đang hủy hoại cầu thủ&quot;. Ph&aacute;t biểu được HLV người T&acirc;y Ban Nha đưa ra sau trận thắng Watford với tỷ số 3-1 h&ocirc;m 2/1, hai ng&agrave;y sau khi họ bị Crystal Palace cầm h&ograve;a kh&ocirc;ng b&agrave;n thắng.</p>\n\n<p>Cựu HLV Barca ho&agrave;n to&agrave;n c&oacute; l&yacute; khi đưa ra nhận định như vậy. T&iacute;nh đến ng&agrave;y 4/1, Man City đ&atilde; chơi tổng cộng 25 trận tại giải quốc nội m&ugrave;a 2017-2018, bao gồm Ngoại hạng Anh v&agrave; Cup Li&ecirc;n đo&agrave;n. Con số n&agrave;y với Juventus tại Italy l&agrave; 22, t&iacute;nh cả trận đấu tối nay với Cagliari. Trong khi đ&oacute;, Bayern Munich, Barca v&agrave; PSG mới chơi 20 trận từ đầu m&ugrave;a.<br />\nNếu muốn ẵm trọn mọi danh hiệu tại nước Anh, bao gồm Ngoại hạng Anh, Cup FA v&agrave; Cup Li&ecirc;n đo&agrave;n, Man City phải ra s&acirc;n tổng cộng 50 trận. Nếu họ c&oacute; một kết quả h&ograve;a, ở bất kỳ v&ograve;ng n&agrave;o trước b&aacute;n kết, con số n&agrave;y sẽ tăng th&ecirc;m, với mức tối đa l&agrave; 53 trận. Tại Bundesliga, với 18 đội tham dự, một đội muốn th&acirc;u t&oacute;m mọi danh hiệu trong nước chỉ phải đ&aacute; 40 trận. Con số n&agrave;y ở T&acirc;y Ban Nha l&agrave; 47 trận v&agrave; Italy l&agrave; 43 trận.</p>\n\n<p>Ph&aacute;p v&agrave; Bồ Đ&agrave;o Nha, giống nước Anh, c&oacute; hai giải đấu Cup trong nước, nhưng họ đều c&oacute; biện ph&aacute;p cắt giảm số trận cho những đội thi đấu ở giải h&agrave;ng đầu l&agrave; Ligue 1 v&agrave; Primeira Liga. C&aacute;c đội dự Ligue 1 được đặc c&aacute;ch v&agrave;o đ&aacute; những v&ograve;ng s&acirc;u hơn so với Ngoại hạng Anh, v&agrave; họ chỉ phải thi đấu 47 trận nếu muốn đoạt cả ba danh hiệu. Tại Bồ Đ&agrave;o Nha, số đội dự Primeira Liga l&agrave; 18. Điều ấy gi&uacute;p số trận tối đa m&agrave; một CLB nước n&agrave;y phải đấu trong nước chỉ l&agrave; 45.</p>\n\n<p>Tr&ecirc;n to&agrave;n ch&acirc;u &Acirc;u, ngoại trừ Anh, kh&ocirc;ng CLB n&agrave;o c&oacute; thể chơi qu&aacute; 48 trận quốc nội. Ch&iacute;nh việc phải đấu đến 50 trận khiến b&oacute;ng đ&aacute; Anh kh&ocirc;ng thể sắp xếp kỳ nghỉ đ&ocirc;ng, điều m&agrave; tất cả c&aacute;c giải đấu h&agrave;ng đầu ch&acirc;u &Acirc;u đều l&agrave;m.</p>\n\n<p>Nếu x&eacute;t năm giải v&ocirc; địch quốc gia lớn, kỳ nghỉ đ&ocirc;ng ngắn nhất thuộc về T&acirc;y Ban Nha. C&aacute;c CLB nước n&agrave;y c&oacute; 10 ng&agrave;y nghỉ từ Gi&aacute;ng sinh đến đầu năm mới. Tiếp theo l&agrave; Italy (14 ng&agrave;y), Ph&aacute;p (16 ng&agrave;y) v&agrave; Đức (22 ng&agrave;y). Bồ Đ&agrave;o Nha, nước cũng c&oacute; hai giải đấu c&uacute;p trong nước như Anh, cũng c&oacute; kỳ nghỉ đ&ocirc;ng d&agrave;i bảy ng&agrave;y.<br />\nArsenal m&ugrave;a 2017-2018 l&agrave; v&iacute; dụ r&otilde; nhất cho lịch thi đấu khắc nghiệt tại Anh. Thầy tr&ograve; Arsene Wenger c&oacute; thể phải chơi tổng cộng 69 trận, nếu v&agrave;o chung kết Europa League, Cup FA v&agrave; Cup Li&ecirc;n đo&agrave;n (đ&atilde; đi đến b&aacute;n kết). So với Real Madrid, đội phải tham dự FIFA Club World Cup v&agrave; đ&aacute; Si&ecirc;u Cup ch&acirc;u &Acirc;u, &quot;Ph&aacute;o thủ&quot; chơi nhiều hơn tới năm trận.</p>', '', 'metakeyword Lịch thi đấu ở Anh khắc nghiệt như thế nào', 'metadescription Lịch thi đấu ở Anh khắc nghiệt như thế nào', 1, 10, 4, 1, '2018-01-04 18:43:11', '2018-01-22 08:45:39'),
(5, 'LeBron James bất lực nhìn đội nhà thảm bại trước Boston Celtics', 'lebron-james-bat-luc-nhin-doi-nha-tham-bai-truoc-boston-celtics', 'conmochieu-12.png', 'Ngôi sao sáng nhất của Cleveland Cavaliers không thể vực dậy phong độ kém cỏi của toàn đội trong trận thua đậm 88-102 trước Boston Celtics.', '<p>Quyết định để ng&ocirc;i sao Isaiah Thomas ngồi ngo&agrave;i của HLV Tyronn Lue gần như ngay lập tức ảnh hưởng l&ecirc;n lối chơi của Cleveland Cavaliers trong chuyến l&agrave;m kh&aacute;ch tại Boston. Đội đương kim &Aacute; qu&acirc;n NBA tấn c&ocirc;ng bế tắc trước h&agrave;ng thủ vững chắc nhất giải. Ngay cả LeBron James cũng chỉ c&oacute; 19 điểm trận n&agrave;y, nhiều nhất đội nhưng kh&ocirc;ng đủ để tạo kh&aacute;c biệt. Trong khi đ&oacute;, chấn thương khiến Kevin Love chỉ chơi 21 ph&uacute;t với đ&uacute;ng một pha n&eacute;m hai điểm th&agrave;nh c&ocirc;ng trong 11 lần n&eacute;m rổ.<br />\nCleveland Cavaliers bị Boston Celtics dẫn điểm trong cả bốn hiệp, trong đ&oacute; khoảng c&aacute;ch lớn nhất l&agrave; 11 điểm ngay sau hiệp đầu ti&ecirc;n. M&agrave;n phủ đầu g&acirc;y sốc của Kyrie Irving v&agrave; c&aacute;c đồng đội khiến đội kh&aacute;ch kh&ocirc;ng thể gượng dậy trong phần c&ograve;n lại của trận đấu. Khoảng năm ph&uacute;t cuối, HLV Tyronn Lue thậm ch&iacute; c&ograve;n bu&ocirc;ng xu&ocirc;i khi r&uacute;t LeBron James khỏi s&acirc;n.</p>\n\n<p>Chiến lược gia 40 tuổi cũng thực hiện đ&uacute;ng những g&igrave; tuy&ecirc;n bố trước trận khi kh&ocirc;ng cho Isaiah Thomas chơi một ph&uacute;t n&agrave;o. Cầu thủ đ&oacute;ng g&oacute;p 17 điểm ở chiến thắng trước Portland Trail Blazers h&ocirc;m qua lặng lẽ ngồi nh&igrave;n đội nh&agrave; bị đội b&oacute;ng cũ của anh v&ugrave;i dập với tỷ số c&aacute;ch biệt 102-88.<br />\nTrận thua thứ 13 từ đầu m&ugrave;a khiến Cleveland Cavaliers ch&ocirc;n ch&acirc;n ở vị tr&iacute; thứ ba miền Đ&ocirc;ng. Trong khi Boston Celtics củng cố vững chắc ng&ocirc;i đầu với th&agrave;nh t&iacute;ch 31 thắng &ndash; 10 thua. Phong độ xuống dốc của LeBron James v&agrave; đồng đội (thua 5 trong 6 trận gần nhất) khiến họ bị Washington Wizards phả hơi n&oacute;ng v&agrave;o g&aacute;y với c&aacute;ch biệt chỉ ba chiến thắng. Ở lượt đấu n&agrave;y, cặp b&agrave;i tr&ugrave;ng John Wall - Bradley Beal tiếp tục tỏa s&aacute;ng, đ&oacute;ng g&oacute;p 52 điểm mang về chiến thắng 121-103 cho đại diện thủ đ&ocirc; trước đối thủ New York Knicks.</p>\n\n<p>Tại miền T&acirc;y, Golden State Warriors c&oacute; chuyến l&agrave;m kh&aacute;ch tưởng như dễ d&agrave;ng tới s&acirc;n Dallas Mavericks. Nhưng sau khi dẫn đối thủ 9 điểm ở hiệp một, nh&agrave; đương kim v&ocirc; địch bất ngờ đ&aacute;nh mất nhịp độ tấn c&ocirc;ng. Họ để Dallas v&ugrave;ng l&ecirc;n trong hai hiệp tiếp theo, b&aacute;m s&aacute;t với c&aacute;ch biệt chỉ hai điểm.</p>\n\n<p>Trong hiệp bốn, đ&ocirc;i b&ecirc;n tạo ra thế trận ăn miếng trả miếng. Khi trận đấu c&ograve;n s&aacute;u gi&acirc;y, Harison Barnes l&ecirc;n rổ th&agrave;nh c&ocirc;ng gỡ h&ograve;a 122-122 cho chủ nh&agrave;. Tuy nhi&ecirc;n, Stephen Curry, bằng đẳng cấp si&ecirc;u sao, đ&atilde; kh&ocirc;ng để đối thủ k&eacute;o v&agrave;o hiệp phụ. C&uacute; n&eacute;m ba điểm lạnh l&ugrave;ng của cầu thủ vừa trở lại sau chấn thương ở thời điểm đồng hồ c&ograve;n 3 gi&acirc;y đ&atilde; dập tắt mọi hy vọng của Dallas Mavericks. Thắng nghẹt thở 125-122, Warriors củng cố vững chắc ng&ocirc;i đầu miền T&acirc;y với th&agrave;nh t&iacute;ch 30 thắng &ndash; 8 thua.<br />\nĐội đang xếp thứ hai sau họ l&agrave; Houston Rockets cũng c&oacute; chiến thắng trong loạt trận s&aacute;ng nay. Vắng Jame Harden v&igrave; chấn thương, khả năng tấn c&ocirc;ng của Rockets sụt giảm tr&ocirc;ng thấy. Nhưng trước đối thủ Orlando Magic, Chris Paul v&agrave; đồng đội đ&atilde; ph&ograve;ng ngự chắc chắn. Rockets chỉ để đối thủ ghi 98 điểm, trong khi sự tỏa s&aacute;ng của nh&acirc;n tố dự bị Gerald Green (27 điểm) v&agrave; trung phong Capela (21 điểm) mang về cho họ 116 điểm.</p>\n\n<p>Tương tự Houston Rockets, Oklahoma City Thunder cũng gi&agrave;nh chiến thắng c&aacute;ch biệt trước Los Angeles Lakers. Bộ ba Westbrook-Anthony-George ghi tổng cộng 65 điểm gi&uacute;p đội nh&agrave; c&oacute; trận thắng c&aacute;ch biệt nhất từ đầu m&ugrave;a với tỷ số 133-96. Việc thiếu vắng Lonzo Ball (chấn thương vai) đang khiến Lakers rơi v&agrave;o khủng hoảng trầm trọng với trận thua thứ 8 li&ecirc;n tiếp, tụt xuống vị tr&iacute; b&eacute;t bảng miền T&acirc;y với th&agrave;nh t&iacute;ch 11 thắng &ndash; 25 thua.</p>\n\n<p>Ng&agrave;y mai, hai đội đầu bảng l&agrave; Golden State Warriors v&agrave; Houston Rockets sẽ gặp nhau tại Toyota Center. Kh&aacute;n giả Việt Nam c&oacute; thể xem trực tiếp trận đấu n&agrave;y v&agrave;o l&uacute;c 8h (giờ H&agrave; Nội) tr&ecirc;n k&ecirc;nh Thể thao Tin tức HD.</p>', 'chú thích LeBron James bất lực nhìn đội nhà thảm bại trước Boston Celtics', 'metakeyword LeBron James bất lực nhìn đội nhà thảm bại trước Boston Celtics', 'metadescription LeBron James bất lực nhìn đội nhà thảm bại trước Boston Celtics', 1, 10, 5, 1, '2018-01-04 18:44:44', '2018-01-22 08:45:08'),
(6, 'Kỳ thủ tám tuổi gây bất ngờ ở Cup Chiến thắng', 'ky-thu-tam-tuoi-gay-bat-ngo-o-cup-chien-thang', 'conmochieu-11.png', 'Phạm Trần Gia Phúc vượt qua nhà vô địch châu Á Thu Thảo (nhảy xa) và Thanh Tùng (thể dục dụng cụ) để trở thành \"Vận động viên yêu thích của năm\".', '<p>Phần thưởng &ldquo;Vận động vi&ecirc;n y&ecirc;u th&iacute;ch của năm&rdquo; do người h&acirc;m mộ b&igrave;nh chọn qua tin nhắn điện thoại. Sau ba th&aacute;ng, chiến thắng thuộc về Phạm Trần Gia Ph&uacute;c. Kỳ thủ t&aacute;m tuổi năm vừa qua gi&agrave;nh năm HC v&agrave;ng ở s&acirc;n chơi Đ&ocirc;ng Nam &Aacute;, ch&acirc;u &Aacute; v&agrave; thế giới. Hai &ldquo;bại tướng&rdquo; của Gia Ph&uacute;c l&agrave; nh&agrave; v&ocirc; địch ch&acirc;u &Aacute; nhảy xa Thu Thảo v&agrave; nh&agrave; v&ocirc; địch ch&acirc;u &Aacute; thể dục dụng cụ Thanh T&ugrave;ng.</p>\n\n<p>H&ocirc;m nay 4/1, ban tổ chức cũng đ&atilde; tiến h&agrave;nh chốt ba ứng vi&ecirc;n cuối c&ugrave;ng cho c&aacute;c giải thưởng như &ldquo;Vận động vi&ecirc;n nam của năm&rdquo;, &ldquo;Vận động vi&ecirc;n nữ của năm&rdquo;, &ldquo;HLV của năm&rdquo;...Danh s&aacute;ch mỗi hạng mục gồm một nh&acirc;n vật do người h&acirc;m mộ b&igrave;nh chọn v&agrave; hai người do Hội đồng b&igrave;nh chọn gồm c&aacute;c chuy&ecirc;n gia v&agrave; nh&agrave; b&aacute;o chọn.</p>\n\n<p>Ở hạng mục &ldquo;Nữ vận động vi&ecirc;n của năm&rdquo;, bất ngờ xảy ra khi T&uacute; Chinh &ldquo;trượt&rdquo; top 3. Đ&acirc;y l&agrave; đ&aacute;ng tiếc lớn khi nữ VĐV của TP HCM ngay lần đầu tham dự đ&atilde; gi&agrave;nh ba HC V&agrave;ng SEA Games, đồng thời được gọi l&agrave; &ldquo;nữ ho&agrave;ng tốc độ&rdquo; khi thống trị cự ly ngắn 100m v&agrave; 200m. Ba nữ VĐV v&agrave;o chung kết l&agrave; k&igrave;nh ngư &Aacute;nh Vi&ecirc;n, Thu Thảo v&agrave; chủ nh&acirc;n ba tấm HC v&agrave;ng điền kinh Nguyễn Thị Huyền.</p>\n\n<p>Ở hạng mục &ldquo;Nam vận động vi&ecirc;n của nam&rdquo;, đ&ocirc; cử Thạch Kim Tuấn cạnh tranh c&ugrave;ng đồng đội Nguyễn Văn Vinh v&agrave; nh&agrave; v&ocirc; địch ch&acirc;u &Aacute; thể dục dụng cụ L&ecirc; Thanh T&ugrave;ng. Điều đặc biệt l&agrave; Thạch Kim Tuấn mới được v&agrave;o danh s&aacute;ch ứng vi&ecirc;n nhờ &ldquo;v&eacute; vớt&rdquo; sau khi gi&agrave;nh hai HC v&agrave;ng giải cử tạ thế giới.</p>\n\n<p>Tại hạng mục &ldquo;HLV của năm&rdquo;, &ocirc;ng Mai Đức Chung đang c&oacute; lợi thế lớn. Vị chiến lược gia n&agrave;y g&acirc;y ấn tượng mạnh khi gi&uacute;p tuyển nữ Việt Nam gi&agrave;nh HC v&agrave;ng SEA Games 29, đồng thời nhận vai tr&ograve; HLV tạm quyền ở đội tuyển nam, gi&agrave;nh s&aacute;u điểm trước Campuchia, g&oacute;p c&ocirc;ng lớn đoạt dự v&ograve;ng chung kết Asian Cup. Cạnh tranh c&ugrave;ng &ocirc;ng l&agrave; hai HLV bộ m&ocirc;n điền kinh Thanh Hương v&agrave; Vũ Ngọc Lợi.</p>\n\n<p>Người chiến thắng ở c&aacute;c hạng mục sẽ được xướng t&ecirc;n tại lễ trao giải v&agrave;o ng&agrave;y 16/1 tới.&nbsp;</p>', 'chú thích Kỳ thủ tám tuổi gây bất ngờ ở Cup Chiến thắng', 'metakeyword Kỳ thủ tám tuổi gây bất ngờ ở Cup Chiến thắng', 'metadescription Kỳ thủ tám tuổi gây bất ngờ ở Cup Chiến thắng', 18, 10, 6, 1, '2018-01-04 18:52:02', '2018-03-19 07:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `project_member`
--

DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
  `id` bigint(20) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_member`
--

INSERT INTO `project_member` (`id`, `project_id`, `member_id`, `created_at`, `updated_at`) VALUES
(1, 10, 4, '2018-01-07 14:09:20', '2018-01-07 14:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'An Giang', 'an-giang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:34'),
(2, 'Bà Rịa Vũng Tàu', 'ba-ria-vung-tau', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:28'),
(3, 'Bình Dương', 'binh-duong', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:21'),
(4, 'Bình Phước', 'binh-phuoc', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:16'),
(5, 'Bình Thuận', 'binh-thuan', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:09'),
(6, 'Bình Định', 'binh-dinh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:02'),
(7, 'Bắc Giang', 'bac-giang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:55'),
(8, 'Bắc Kạn', 'bac-kan', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:49'),
(9, 'Bắc Ninh', 'bac-ninh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:43'),
(10, 'Bến Tre', 'ben-tre', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:37'),
(11, 'Cao Bằng', 'cao-bang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:28'),
(12, 'Cà Mau', 'ca-mau', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:22'),
(13, 'Cần Thơ', 'can-tho', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:15'),
(14, 'Gia Lai', 'gia-lai', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:40'),
(15, 'Hà Giang', 'ha-giang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:47'),
(16, 'Hà Nam', 'ha-nam', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:16:54'),
(17, 'Hà Nội', 'ha-noi', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:18:14'),
(18, 'Hà Tĩnh', 'ha-tinh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:18:08'),
(19, 'Hòa Bình', 'hoa-binh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:18:02'),
(20, 'Hưng Yên', 'hung-yen', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:55'),
(21, 'Hải Dương', 'hai-duong', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:50'),
(22, 'Hải Phòng', 'hai-phong', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:43'),
(23, 'Hồ Chí Minh', 'ho-chi-minh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:38'),
(24, 'Khánh Hòa', 'khanh-hoa', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:32'),
(25, 'Kiên Giang', 'kien-giang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:26'),
(26, 'Kon Tum', 'kon-tum', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:21'),
(27, 'Lai Châu', 'lai-chau', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:14'),
(28, 'Long An', 'long-an', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:08'),
(29, 'Lào Cai', 'lao-cai', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:17:01'),
(30, 'Lâm Đồng', 'lam-dong', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:08'),
(31, 'Lạng Sơn', 'lang-son', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:15:01'),
(32, 'Nam Định', 'nam-dinh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:14:54'),
(33, 'Nghệ An', 'nghe-an', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:41'),
(34, 'Ninh Bình', 'ninh-binh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:33'),
(35, 'Ninh Thuận', 'ninh-thuan', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:27'),
(36, 'Phú Thọ', 'phu-tho', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:20'),
(37, 'Phú Yên', 'phu-yen', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:14'),
(38, 'Quảng Nam', 'quang-nam', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:09'),
(39, 'Quảng Ngãi', 'quang-ngai', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:03'),
(40, 'Quảng Ninh', 'quang-ninh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:11:57'),
(41, 'Quảng Trị', 'quang-tri', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:11:52'),
(42, 'Sơn La', 'son-la', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:11:45'),
(43, 'Thanh Hóa', 'thanh-hoa', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:11:39'),
(44, 'Thái Bình', 'thai-binh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:11:33'),
(45, 'Thái Nguyên', 'thai-nguyen', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:11:28'),
(46, 'Thừa Thiên Huế', 'thua-thien-hue', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:47'),
(47, 'Tiền Giang', 'tien-giang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:52'),
(48, 'Trà Vinh', 'tra-vinh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:12:58'),
(49, 'Tuyên Quang', 'tuyen-quang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:14:49'),
(50, 'Tây Ninh', 'tay-ninh', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:14:34'),
(51, 'Vĩnh Long', 'vinh-long', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:14:25'),
(52, 'Vĩnh Phúc', 'vinh-phuc', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:14:20'),
(53, 'Yên Bái', 'yen-bai', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:14:11'),
(54, 'Đà Nẵng', 'da-nang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:58'),
(55, 'Đắk Lắk', 'dak-lak', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:52'),
(56, 'Đồng Nai', 'dong-nai', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:46'),
(57, 'Đồng Tháp', 'dong-thap', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:40'),
(58, 'Bạc Liêu', 'bac-lieu', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:33'),
(59, 'Sóc Trăng', 'soc-trang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:19'),
(60, 'Hậu Giang', 'hau-giang', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:11'),
(61, 'Đắk Nông', 'dak-nong', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:13:05'),
(62, 'Điện Biên', 'dien-bien', 1, 1, '2018-02-26 00:00:00', '2018-02-26 03:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting_system`
--

DROP TABLE IF EXISTS `setting_system`;
CREATE TABLE `setting_system` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `title` text,
  `meta_keyword` text,
  `meta_description` text,
  `author` varchar(255) DEFAULT NULL,
  `copyright` text,
  `google_site_verification` text,
  `google_analytics` text,
  `logo_frontend` text,
  `favicon` varchar(255) DEFAULT NULL,
  `setting` text,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting_system`
--

INSERT INTO `setting_system` (`id`, `fullname`, `alias`, `title`, `meta_keyword`, `meta_description`, `author`, `copyright`, `google_site_verification`, `google_analytics`, `logo_frontend`, `favicon`, `setting`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'settingsystem', 'setting-system', 'DC Mobile Chuyên kinh doanh điện thoại, máy tính laptop mới cũ', 'máy tính,  laptop cũ,  điện thoại thông minh', 'Bán lẻ máy tính, laptop, điện thoại mới cũ trên toàn quốc. DC Mobile một trong những thương hiệu có tiếng lâu đời về các sản phẩm công nghệ', 'DC Mobile Chuyên kinh doanh điện thoại, máy tính laptop mới cũ', 'DC Mobile Chuyên kinh doanh điện thoại, máy tính laptop mới cũ [seodekiemtien@gmail.com]', 'KqqAiIZhyvjETFMGGAwT_GliP8lOHb4-lIpwli3Fua8', '444111222', 'logo-8290.png', 'favicon-ico-6361.ico', '[{\"field_name\":\"Số bài viết trên 1 trang\",\"field_code\":\"article_perpage\",\"field_value\":\"10\"},{\"field_name\":\"Độ rộng hình bài viết\",\"field_code\":\"article_width\",\"field_value\":\"400\"},{\"field_name\":\"Độ cao hình bài viết\",\"field_code\":\"article_height\",\"field_value\":\"250\"},{\"field_name\":\"Số sản phẩm trên 1 trang\",\"field_code\":\"product_perpage\",\"field_value\":\"32\"},{\"field_name\":\"Độ rộng hình sản phẩm\",\"field_code\":\"product_width\",\"field_value\":\"400\"},{\"field_name\":\"Độ cao hình sản phẩm\",\"field_code\":\"product_height\",\"field_value\":\"250\"},{\"field_name\":\"Đơn vị tiền tệ\",\"field_code\":\"currency_unit\",\"field_value\":\"vi_VN\"},{\"field_name\":\"Smtp host\",\"field_code\":\"smtp_host\",\"field_value\":\"smtp.gmail.com\"},{\"field_name\":\"Smtp port\",\"field_code\":\"smtp_port\",\"field_value\":\"465\"},{\"field_name\":\"Smtp authication\",\"field_code\":\"authentication\",\"field_value\":\"1\"},{\"field_name\":\"Encription\",\"field_code\":\"encription\",\"field_value\":\"ssl\"},{\"field_name\":\"Smtp username\",\"field_code\":\"smtp_username\",\"field_value\":\"dien.toannang@gmail.com\"},{\"field_name\":\"Smtp password\",\"field_code\":\"smtp_password\",\"field_value\":\"bjsdgetadsutdono\"},{\"field_name\":\"Email to\",\"field_code\":\"email_to\",\"field_value\":\"dienit02@gmail.com\"},{\"field_name\":\"Contact person\",\"field_code\":\"contacted_person\",\"field_value\":\"Công Ty TNHH GreenEcoLife\"},{\"field_name\":\"Trụ sở\",\"field_code\":\"address\",\"field_value\":\"50/2/59 Dương Quảng Hàm, Phường 5, Quận Gò Vấp\"},{\"field_name\":\"Hotline\",\"field_code\":\"telephone\",\"field_value\":\"0902.90.74.75\"},{\"field_name\":\"Facebook\",\"field_code\":\"facebook_url\",\"field_value\":\"https://www.facebook.com/nguyenvan.laptrinh\"},{\"field_name\":\"Twitter\",\"field_code\":\"twitter_url\",\"field_value\":\"https://twitter.com/\"},{\"field_name\":\"Google Plus\",\"field_code\":\"google_plus\",\"field_value\":\"https://plus.google.com/u/0/?hl=vi\"},{\"field_name\":\"Youtube\",\"field_code\":\"youtube_url\",\"field_value\":\"https://www.youtube.com/watch?v=kAcV7S3sySU\"},{\"field_name\":\"Instagram\",\"field_code\":\"instagram_url\",\"field_value\":\"http://flickr.com\"},{\"field_name\":\"Pinterest\",\"field_code\":\"pinterest_url\",\"field_value\":\"http://daidung.vn/\"},{\"field_name\":\"Map\",\"field_code\":\"map_url\",\"field_value\":\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.7765505259867!2d106.68751671435092!3d10.828404792286284!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528f0d3be7c47%3A0x3f95e11384c4817f!2zNTAgRMawxqFuZyBRdeG6o25nIEjDoG0sIHBoxrDhu51uZyA1LCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5oLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1515998374369\"},{\"field_name\":\"Văn phòng giao dịch\",\"field_code\":\"office\",\"field_value\":\"27/13/8 Đường số 27, P.Hiệp Bình Chánh, Q.Thủ Đức\"},{\"field_name\":\"Skype NVKD 1\",\"field_code\":\"skype_nvkd_1\",\"field_value\":\"quocquy2010\"},{\"field_name\":\"Skype NVKD 2\",\"field_code\":\"skype_nvkd_2\",\"field_value\":\"greenecolife.vn\"},{\"field_name\":\"Skype NVKD 3\",\"field_code\":\"skype_nvkd_3\",\"field_value\":\"hiiamduc\"},{\"field_name\":\"Skype NVKD 4\",\"field_code\":\"skype_nvkd_4\",\"field_value\":\"phong.nguyen1984\"},{\"field_name\":\"Email NVKD 1\",\"field_code\":\"email_nvkd_1\",\"field_value\":\"dienit02@gmail.com\"},{\"field_name\":\"Email NVKD 2\",\"field_code\":\"email_nvkd_2\",\"field_value\":\"dienit02@gmail.com\"},{\"field_name\":\"Email NVKD 3\",\"field_code\":\"email_nvkd_3\",\"field_value\":\"dienit02@gmail.com\"},{\"field_name\":\"Email NVKD 4\",\"field_code\":\"email_nvkd_4\",\"field_value\":\"dienit02@gmail.com\"},{\"field_name\":\"Tel NVKD 1\",\"field_code\":\"tel_nvkd_1\",\"field_value\":\"0918.17.88.96\"},{\"field_name\":\"Tel NVKD 2\",\"field_code\":\"tel_nvkd_2\",\"field_value\":\"0902.90.74.75\"},{\"field_name\":\"Tel NVKD 3\",\"field_code\":\"tel_nvkd_3\",\"field_value\":\"0918.17.88.96\"},{\"field_name\":\"Tel NVKD 4\",\"field_code\":\"tel_nvkd_4\",\"field_value\":\"0918.17.88.96\"},{\"field_name\":\"NVKD1\",\"field_code\":\"name_nvkd_1\",\"field_value\":\"Mr Cooc Cui\"},{\"field_name\":\"NVKD2\",\"field_code\":\"name_nvkd_2\",\"field_value\":\"Mr Anh Lạc\"},{\"field_name\":\"NVKD3\",\"field_code\":\"name_nvkd_3\",\"field_value\":\"Nguyễn Tấn Phát\"},{\"field_name\":\"NVKD4\",\"field_code\":\"name_nvkd_4\",\"field_value\":\"Nguyễn Hùng Phương\"}]', 1, 1, '2017-12-03 07:45:35', '2018-03-29 02:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `supporter`
--

DROP TABLE IF EXISTS `supporter`;
CREATE TABLE `supporter` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_money` decimal(11,0) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supporter`
--

INSERT INTO `supporter` (`id`, `fullname`, `number_money`, `payment_method_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Nguyễn Thị Thu Hằng', '1000000', 1, 1, 1, '2018-01-07 17:32:50', '2018-01-07 17:47:21'),
(7, 'Trần Gia Lạc', '2000000', 2, 2, 1, '2018-01-07 18:02:15', '2018-01-08 07:19:18'),
(8, 'Lê Văn Đại', '2000000', 1, 3, 1, '2018-01-08 02:38:56', '2018-01-08 09:29:07'),
(9, 'Nguyễn Mạnh Hùng', '3000000', 2, 4, 1, '2018-01-08 02:39:19', '2018-01-08 02:39:19'),
(10, 'Trần Tiến Dư', '3000000', 2, 5, 1, '2018-01-08 02:39:35', '2018-01-08 02:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2017-11-12 07:00:10', '2017-11-12 07:00:10'),
(2, NULL, 'ip', '127.0.0.1', '2017-11-12 07:00:10', '2017-11-12 07:00:10'),
(3, NULL, 'global', NULL, '2017-11-12 07:00:22', '2017-11-12 07:00:22'),
(4, NULL, 'ip', '127.0.0.1', '2017-11-12 07:00:22', '2017-11-12 07:00:22'),
(5, NULL, 'global', NULL, '2017-11-12 07:00:36', '2017-11-12 07:00:36'),
(6, NULL, 'ip', '127.0.0.1', '2017-11-12 07:00:36', '2017-11-12 07:00:36'),
(7, NULL, 'global', NULL, '2017-11-12 07:05:02', '2017-11-12 07:05:02'),
(8, NULL, 'ip', '127.0.0.1', '2017-11-12 07:05:02', '2017-11-12 07:05:02'),
(9, NULL, 'global', NULL, '2017-11-12 07:30:11', '2017-11-12 07:30:11'),
(10, NULL, 'ip', '127.0.0.1', '2017-11-12 07:30:11', '2017-11-12 07:30:11'),
(11, NULL, 'global', NULL, '2017-11-12 07:32:49', '2017-11-12 07:32:49'),
(12, NULL, 'ip', '127.0.0.1', '2017-11-12 07:32:49', '2017-11-12 07:32:49'),
(13, NULL, 'global', NULL, '2017-11-12 07:39:23', '2017-11-12 07:39:23'),
(14, NULL, 'ip', '127.0.0.1', '2017-11-12 07:39:23', '2017-11-12 07:39:23'),
(15, NULL, 'global', NULL, '2017-11-12 07:55:42', '2017-11-12 07:55:42'),
(16, NULL, 'ip', '127.0.0.1', '2017-11-12 07:55:42', '2017-11-12 07:55:42'),
(17, NULL, 'global', NULL, '2017-11-12 07:59:33', '2017-11-12 07:59:33'),
(18, NULL, 'ip', '127.0.0.1', '2017-11-12 07:59:33', '2017-11-12 07:59:33'),
(19, NULL, 'global', NULL, '2017-11-12 08:01:13', '2017-11-12 08:01:13'),
(20, NULL, 'ip', '127.0.0.1', '2017-11-12 08:01:13', '2017-11-12 08:01:13'),
(21, NULL, 'global', NULL, '2017-11-12 08:01:34', '2017-11-12 08:01:34'),
(22, NULL, 'ip', '127.0.0.1', '2017-11-12 08:01:34', '2017-11-12 08:01:34'),
(23, NULL, 'global', NULL, '2017-11-12 08:01:41', '2017-11-12 08:01:41'),
(24, NULL, 'ip', '127.0.0.1', '2017-11-12 08:01:41', '2017-11-12 08:01:41'),
(25, NULL, 'global', NULL, '2017-11-12 08:02:05', '2017-11-12 08:02:05'),
(26, NULL, 'ip', '127.0.0.1', '2017-11-12 08:02:05', '2017-11-12 08:02:05'),
(27, NULL, 'global', NULL, '2017-11-12 08:12:23', '2017-11-12 08:12:23'),
(28, NULL, 'ip', '127.0.0.1', '2017-11-12 08:12:23', '2017-11-12 08:12:23'),
(29, NULL, 'global', NULL, '2017-11-12 08:18:51', '2017-11-12 08:18:51'),
(30, NULL, 'ip', '127.0.0.1', '2017-11-12 08:18:51', '2017-11-12 08:18:51'),
(31, NULL, 'global', NULL, '2017-11-12 08:19:22', '2017-11-12 08:19:22'),
(32, NULL, 'ip', '127.0.0.1', '2017-11-12 08:19:22', '2017-11-12 08:19:22'),
(33, NULL, 'global', NULL, '2017-11-12 08:34:38', '2017-11-12 08:34:38'),
(34, NULL, 'ip', '127.0.0.1', '2017-11-12 08:34:38', '2017-11-12 08:34:38'),
(35, NULL, 'global', NULL, '2017-11-12 10:21:38', '2017-11-12 10:21:38'),
(36, NULL, 'ip', '127.0.0.1', '2017-11-12 10:21:38', '2017-11-12 10:21:38'),
(37, NULL, 'global', NULL, '2017-11-12 10:38:16', '2017-11-12 10:38:16'),
(38, NULL, 'ip', '127.0.0.1', '2017-11-12 10:38:16', '2017-11-12 10:38:16'),
(39, 1, 'user', NULL, '2017-11-12 10:38:16', '2017-11-12 10:38:16'),
(40, NULL, 'global', NULL, '2017-11-12 10:39:37', '2017-11-12 10:39:37'),
(41, NULL, 'ip', '127.0.0.1', '2017-11-12 10:39:37', '2017-11-12 10:39:37'),
(42, 1, 'user', NULL, '2017-11-12 10:39:37', '2017-11-12 10:39:37'),
(43, NULL, 'global', NULL, '2017-11-12 10:58:13', '2017-11-12 10:58:13'),
(44, NULL, 'ip', '127.0.0.1', '2017-11-12 10:58:13', '2017-11-12 10:58:13'),
(45, NULL, 'global', NULL, '2017-11-12 10:59:19', '2017-11-12 10:59:19'),
(46, NULL, 'ip', '127.0.0.1', '2017-11-12 10:59:19', '2017-11-12 10:59:19'),
(47, 4, 'user', NULL, '2017-11-12 10:59:19', '2017-11-12 10:59:19'),
(48, NULL, 'global', NULL, '2017-11-12 11:00:10', '2017-11-12 11:00:10'),
(49, NULL, 'ip', '127.0.0.1', '2017-11-12 11:00:10', '2017-11-12 11:00:10'),
(50, 4, 'user', NULL, '2017-11-12 11:00:10', '2017-11-12 11:00:10'),
(51, NULL, 'global', NULL, '2017-11-12 11:04:27', '2017-11-12 11:04:27'),
(52, NULL, 'ip', '127.0.0.1', '2017-11-12 11:04:27', '2017-11-12 11:04:27'),
(53, 4, 'user', NULL, '2017-11-12 11:04:27', '2017-11-12 11:04:27'),
(54, NULL, 'global', NULL, '2017-11-12 11:05:04', '2017-11-12 11:05:04'),
(55, NULL, 'ip', '127.0.0.1', '2017-11-12 11:05:04', '2017-11-12 11:05:04'),
(56, 1, 'user', NULL, '2017-11-12 11:05:04', '2017-11-12 11:05:04'),
(57, NULL, 'global', NULL, '2017-11-12 11:08:43', '2017-11-12 11:08:43'),
(58, NULL, 'ip', '127.0.0.1', '2017-11-12 11:08:43', '2017-11-12 11:08:43'),
(59, 1, 'user', NULL, '2017-11-12 11:08:43', '2017-11-12 11:08:43'),
(60, NULL, 'global', NULL, '2017-11-12 11:14:37', '2017-11-12 11:14:37'),
(61, NULL, 'ip', '127.0.0.1', '2017-11-12 11:14:37', '2017-11-12 11:14:37'),
(62, 1, 'user', NULL, '2017-11-12 11:14:37', '2017-11-12 11:14:37'),
(63, NULL, 'global', NULL, '2017-11-12 11:18:13', '2017-11-12 11:18:13'),
(64, NULL, 'ip', '127.0.0.1', '2017-11-12 11:18:13', '2017-11-12 11:18:13'),
(65, 4, 'user', NULL, '2017-11-12 11:18:13', '2017-11-12 11:18:13'),
(66, NULL, 'global', NULL, '2017-11-12 11:19:22', '2017-11-12 11:19:22'),
(67, NULL, 'ip', '127.0.0.1', '2017-11-12 11:19:22', '2017-11-12 11:19:22'),
(68, 4, 'user', NULL, '2017-11-12 11:19:22', '2017-11-12 11:19:22'),
(69, NULL, 'global', NULL, '2017-11-12 12:21:15', '2017-11-12 12:21:15'),
(70, NULL, 'ip', '127.0.0.1', '2017-11-12 12:21:15', '2017-11-12 12:21:15'),
(71, 1, 'user', NULL, '2017-11-12 12:21:15', '2017-11-12 12:21:15'),
(72, NULL, 'global', NULL, '2017-11-12 12:30:54', '2017-11-12 12:30:54'),
(73, NULL, 'ip', '127.0.0.1', '2017-11-12 12:30:54', '2017-11-12 12:30:54'),
(74, 1, 'user', NULL, '2017-11-12 12:30:54', '2017-11-12 12:30:54'),
(75, NULL, 'global', NULL, '2017-11-12 12:31:09', '2017-11-12 12:31:09'),
(76, NULL, 'ip', '127.0.0.1', '2017-11-12 12:31:09', '2017-11-12 12:31:09'),
(77, 1, 'user', NULL, '2017-11-12 12:31:09', '2017-11-12 12:31:09'),
(78, NULL, 'global', NULL, '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(79, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(80, NULL, 'global', NULL, '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(81, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(82, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(83, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(84, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(85, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(86, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(87, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(88, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(89, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(90, NULL, 'global', NULL, '2017-11-12 19:24:30', '2017-11-12 19:24:30'),
(91, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:30', '2017-11-12 19:24:30'),
(92, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(93, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(94, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(95, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(96, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(97, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(98, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(99, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(100, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(101, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(102, NULL, 'global', NULL, '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(103, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(104, NULL, 'global', NULL, '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(105, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(106, NULL, 'global', NULL, '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(107, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(108, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(109, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(110, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(111, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(112, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(113, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(114, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(115, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(116, NULL, 'global', NULL, '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(117, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(118, NULL, 'global', NULL, '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(119, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(120, NULL, 'global', NULL, '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(121, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(122, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(123, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(124, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(125, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(126, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(127, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(128, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(129, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(130, NULL, 'global', NULL, '2017-11-12 19:24:39', '2017-11-12 19:24:39'),
(131, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:39', '2017-11-12 19:24:39'),
(132, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(133, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(134, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(135, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(136, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(137, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(138, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(139, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(140, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(141, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(142, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(143, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(144, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(145, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(146, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(147, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(148, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(149, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(150, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(151, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(152, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(153, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(154, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(155, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(156, NULL, 'global', NULL, '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(157, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(158, NULL, 'global', NULL, '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(159, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(160, NULL, 'global', NULL, '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(161, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(162, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(163, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(164, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(165, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(166, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(167, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(168, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(169, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(170, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(171, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(172, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(173, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(174, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(175, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(176, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(177, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(178, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(179, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(180, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(181, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(182, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(183, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(184, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(185, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(186, NULL, 'global', NULL, '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(187, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(188, NULL, 'global', NULL, '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(189, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(190, NULL, 'global', NULL, '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(191, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(192, NULL, 'global', NULL, '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(193, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(194, NULL, 'global', NULL, '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(195, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(196, NULL, 'global', NULL, '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(197, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(198, NULL, 'global', NULL, '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(199, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(200, NULL, 'global', NULL, '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(201, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(202, NULL, 'global', NULL, '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(203, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(204, NULL, 'global', NULL, '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(205, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(206, NULL, 'global', NULL, '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(207, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(208, NULL, 'global', NULL, '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(209, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(210, NULL, 'global', NULL, '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(211, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(212, NULL, 'global', NULL, '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(213, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(214, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(215, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(216, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(217, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(218, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(219, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(220, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(221, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(222, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(223, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(224, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(225, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(226, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(227, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(228, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(229, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(230, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(231, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(232, NULL, 'global', NULL, '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(233, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(234, NULL, 'global', NULL, '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(235, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(236, NULL, 'global', NULL, '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(237, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(238, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(239, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(240, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(241, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(242, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(243, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(244, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(245, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(246, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(247, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(248, NULL, 'global', NULL, '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(249, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(250, NULL, 'global', NULL, '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(251, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(252, NULL, 'global', NULL, '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(253, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(254, NULL, 'global', NULL, '2017-11-12 19:25:02', '2017-11-12 19:25:02'),
(255, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:02', '2017-11-12 19:25:02'),
(256, NULL, 'global', NULL, '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(257, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(258, NULL, 'global', NULL, '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(259, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(260, NULL, 'global', NULL, '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(261, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(262, NULL, 'global', NULL, '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(263, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(264, NULL, 'global', NULL, '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(265, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(266, NULL, 'global', NULL, '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(267, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(268, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(269, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(270, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(271, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(272, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(273, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(274, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(275, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(276, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(277, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(278, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(279, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(280, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(281, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(282, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(283, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(284, NULL, 'global', NULL, '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(285, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(286, NULL, 'global', NULL, '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(287, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(288, NULL, 'global', NULL, '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(289, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(290, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(291, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(292, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(293, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(294, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(295, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(296, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(297, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(298, NULL, 'global', NULL, '2017-11-12 19:36:41', '2017-11-12 19:36:41'),
(299, NULL, 'ip', '127.0.0.1', '2017-11-12 19:36:41', '2017-11-12 19:36:41'),
(300, 4, 'user', NULL, '2017-11-12 19:36:41', '2017-11-12 19:36:41'),
(301, NULL, 'global', NULL, '2017-11-12 19:44:35', '2017-11-12 19:44:35'),
(302, NULL, 'ip', '127.0.0.1', '2017-11-12 19:44:35', '2017-11-12 19:44:35'),
(303, 1, 'user', NULL, '2017-11-12 19:44:35', '2017-11-12 19:44:35'),
(304, NULL, 'global', NULL, '2017-11-13 12:12:10', '2017-11-13 12:12:10'),
(305, NULL, 'ip', '127.0.0.1', '2017-11-13 12:12:10', '2017-11-13 12:12:10'),
(306, 1, 'user', NULL, '2017-11-13 12:12:10', '2017-11-13 12:12:10'),
(307, NULL, 'global', NULL, '2017-11-15 04:15:14', '2017-11-15 04:15:14'),
(308, NULL, 'ip', '127.0.0.1', '2017-11-15 04:15:14', '2017-11-15 04:15:14'),
(309, NULL, 'global', NULL, '2017-11-25 05:02:29', '2017-11-25 05:02:29'),
(310, NULL, 'ip', '127.0.0.1', '2017-11-25 05:02:29', '2017-11-25 05:02:29'),
(311, 1, 'user', NULL, '2017-11-25 05:02:29', '2017-11-25 05:02:29'),
(312, NULL, 'global', NULL, '2017-11-25 21:57:16', '2017-11-25 21:57:16'),
(313, NULL, 'ip', '127.0.0.1', '2017-11-25 21:57:16', '2017-11-25 21:57:16'),
(314, 6, 'user', NULL, '2017-11-25 21:57:16', '2017-11-25 21:57:16'),
(315, NULL, 'global', NULL, '2017-11-25 21:57:22', '2017-11-25 21:57:22'),
(316, NULL, 'ip', '127.0.0.1', '2017-11-25 21:57:22', '2017-11-25 21:57:22'),
(317, 6, 'user', NULL, '2017-11-25 21:57:22', '2017-11-25 21:57:22'),
(318, NULL, 'global', NULL, '2017-11-26 20:07:31', '2017-11-26 20:07:31'),
(319, NULL, 'ip', '127.0.0.1', '2017-11-26 20:07:31', '2017-11-26 20:07:31'),
(320, 1, 'user', NULL, '2017-11-26 20:07:31', '2017-11-26 20:07:31'),
(321, NULL, 'global', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(322, NULL, 'ip', '127.0.0.1', '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(323, 1, 'user', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(324, NULL, 'global', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(325, NULL, 'ip', '127.0.0.1', '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(326, 1, 'user', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(327, NULL, 'global', NULL, '2017-11-30 08:03:16', '2017-11-30 08:03:16'),
(328, NULL, 'ip', '127.0.0.1', '2017-11-30 08:03:16', '2017-11-30 08:03:16'),
(329, 1, 'user', NULL, '2017-11-30 08:03:16', '2017-11-30 08:03:16'),
(330, NULL, 'global', NULL, '2017-12-03 07:41:47', '2017-12-03 07:41:47'),
(331, NULL, 'ip', '127.0.0.1', '2017-12-03 07:41:47', '2017-12-03 07:41:47'),
(332, 1, 'user', NULL, '2017-12-03 07:41:47', '2017-12-03 07:41:47'),
(333, NULL, 'global', NULL, '2017-12-03 11:49:24', '2017-12-03 11:49:24'),
(334, NULL, 'ip', '127.0.0.1', '2017-12-03 11:49:24', '2017-12-03 11:49:24'),
(335, NULL, 'global', NULL, '2017-12-03 11:49:31', '2017-12-03 11:49:31'),
(336, NULL, 'ip', '127.0.0.1', '2017-12-03 11:49:31', '2017-12-03 11:49:31'),
(337, NULL, 'global', NULL, '2017-12-03 11:49:49', '2017-12-03 11:49:49'),
(338, NULL, 'ip', '127.0.0.1', '2017-12-03 11:49:49', '2017-12-03 11:49:49'),
(339, NULL, 'global', NULL, '2017-12-03 11:50:32', '2017-12-03 11:50:32'),
(340, NULL, 'ip', '127.0.0.1', '2017-12-03 11:50:32', '2017-12-03 11:50:32'),
(341, NULL, 'global', NULL, '2017-12-03 11:54:18', '2017-12-03 11:54:18'),
(342, NULL, 'ip', '127.0.0.1', '2017-12-03 11:54:18', '2017-12-03 11:54:18'),
(343, NULL, 'global', NULL, '2017-12-04 11:12:12', '2017-12-04 11:12:12'),
(344, NULL, 'ip', '127.0.0.1', '2017-12-04 11:12:12', '2017-12-04 11:12:12'),
(345, 1, 'user', NULL, '2017-12-04 11:12:12', '2017-12-04 11:12:12'),
(346, NULL, 'global', NULL, '2017-12-05 09:04:13', '2017-12-05 09:04:13'),
(347, NULL, 'ip', '127.0.0.1', '2017-12-05 09:04:13', '2017-12-05 09:04:13'),
(348, 1, 'user', NULL, '2017-12-05 09:04:13', '2017-12-05 09:04:13'),
(349, NULL, 'global', NULL, '2017-12-08 11:51:32', '2017-12-08 11:51:32'),
(350, NULL, 'ip', '127.0.0.1', '2017-12-08 11:51:32', '2017-12-08 11:51:32'),
(351, 1, 'user', NULL, '2017-12-08 11:51:32', '2017-12-08 11:51:32'),
(352, NULL, 'global', NULL, '2017-12-08 11:51:37', '2017-12-08 11:51:37'),
(353, NULL, 'ip', '127.0.0.1', '2017-12-08 11:51:37', '2017-12-08 11:51:37'),
(354, 1, 'user', NULL, '2017-12-08 11:51:37', '2017-12-08 11:51:37'),
(355, NULL, 'global', NULL, '2017-12-13 11:11:12', '2017-12-13 11:11:12'),
(356, NULL, 'ip', '127.0.0.1', '2017-12-13 11:11:12', '2017-12-13 11:11:12'),
(357, 1, 'user', NULL, '2017-12-13 11:11:12', '2017-12-13 11:11:12'),
(358, NULL, 'global', NULL, '2017-12-13 11:11:19', '2017-12-13 11:11:19'),
(359, NULL, 'ip', '127.0.0.1', '2017-12-13 11:11:19', '2017-12-13 11:11:19'),
(360, 1, 'user', NULL, '2017-12-13 11:11:19', '2017-12-13 11:11:19'),
(361, NULL, 'global', NULL, '2017-12-13 11:11:21', '2017-12-13 11:11:21'),
(362, NULL, 'ip', '127.0.0.1', '2017-12-13 11:11:21', '2017-12-13 11:11:21'),
(363, 1, 'user', NULL, '2017-12-13 11:11:21', '2017-12-13 11:11:21'),
(364, NULL, 'global', NULL, '2017-12-13 19:46:17', '2017-12-13 19:46:17'),
(365, NULL, 'ip', '127.0.0.1', '2017-12-13 19:46:17', '2017-12-13 19:46:17'),
(366, 1, 'user', NULL, '2017-12-13 19:46:17', '2017-12-13 19:46:17'),
(367, NULL, 'global', NULL, '2017-12-13 19:46:22', '2017-12-13 19:46:22'),
(368, NULL, 'ip', '127.0.0.1', '2017-12-13 19:46:22', '2017-12-13 19:46:22'),
(369, 1, 'user', NULL, '2017-12-13 19:46:22', '2017-12-13 19:46:22'),
(370, NULL, 'global', NULL, '2017-12-16 00:21:37', '2017-12-16 00:21:37'),
(371, NULL, 'ip', '127.0.0.1', '2017-12-16 00:21:37', '2017-12-16 00:21:37'),
(372, 1, 'user', NULL, '2017-12-16 00:21:37', '2017-12-16 00:21:37'),
(373, NULL, 'global', NULL, '2017-12-17 18:07:51', '2017-12-17 18:07:51'),
(374, NULL, 'ip', '127.0.0.1', '2017-12-17 18:07:51', '2017-12-17 18:07:51'),
(375, 1, 'user', NULL, '2017-12-17 18:07:51', '2017-12-17 18:07:51'),
(376, NULL, 'global', NULL, '2017-12-29 02:09:21', '2017-12-29 02:09:21'),
(377, NULL, 'ip', '127.0.0.1', '2017-12-29 02:09:21', '2017-12-29 02:09:21'),
(378, 1, 'user', NULL, '2017-12-29 02:09:21', '2017-12-29 02:09:21'),
(379, NULL, 'global', NULL, '2017-12-29 02:09:27', '2017-12-29 02:09:27'),
(380, NULL, 'ip', '127.0.0.1', '2017-12-29 02:09:27', '2017-12-29 02:09:27'),
(381, 1, 'user', NULL, '2017-12-29 02:09:27', '2017-12-29 02:09:27'),
(382, NULL, 'global', NULL, '2017-12-29 05:40:34', '2017-12-29 05:40:34'),
(383, NULL, 'ip', '127.0.0.1', '2017-12-29 05:40:34', '2017-12-29 05:40:34'),
(384, 1, 'user', NULL, '2017-12-29 05:40:34', '2017-12-29 05:40:34'),
(385, NULL, 'global', NULL, '2017-12-29 05:40:39', '2017-12-29 05:40:39'),
(386, NULL, 'ip', '127.0.0.1', '2017-12-29 05:40:39', '2017-12-29 05:40:39'),
(387, 1, 'user', NULL, '2017-12-29 05:40:39', '2017-12-29 05:40:39'),
(388, NULL, 'global', NULL, '2018-01-01 19:20:37', '2018-01-01 19:20:37'),
(389, NULL, 'ip', '127.0.0.1', '2018-01-01 19:20:37', '2018-01-01 19:20:37'),
(390, 1, 'user', NULL, '2018-01-01 19:20:37', '2018-01-01 19:20:37'),
(391, NULL, 'global', NULL, '2018-01-05 05:03:06', '2018-01-05 05:03:06'),
(392, NULL, 'ip', '127.0.0.1', '2018-01-05 05:03:06', '2018-01-05 05:03:06'),
(393, 1, 'user', NULL, '2018-01-05 05:03:06', '2018-01-05 05:03:06'),
(394, NULL, 'global', NULL, '2018-01-07 02:06:01', '2018-01-07 02:06:01'),
(395, NULL, 'ip', '127.0.0.1', '2018-01-07 02:06:01', '2018-01-07 02:06:01'),
(396, NULL, 'global', NULL, '2018-01-08 23:12:58', '2018-01-08 23:12:58'),
(397, NULL, 'ip', '127.0.0.1', '2018-01-08 23:12:58', '2018-01-08 23:12:58'),
(398, NULL, 'global', NULL, '2018-01-08 23:13:07', '2018-01-08 23:13:07'),
(399, NULL, 'ip', '127.0.0.1', '2018-01-08 23:13:07', '2018-01-08 23:13:07'),
(400, NULL, 'global', NULL, '2018-01-08 23:13:09', '2018-01-08 23:13:09'),
(401, NULL, 'ip', '127.0.0.1', '2018-01-08 23:13:09', '2018-01-08 23:13:09'),
(402, NULL, 'global', NULL, '2018-01-15 01:13:23', '2018-01-15 01:13:23'),
(403, NULL, 'ip', '127.0.0.1', '2018-01-15 01:13:23', '2018-01-15 01:13:23'),
(404, NULL, 'global', NULL, '2018-01-15 11:12:12', '2018-01-15 11:12:12'),
(405, NULL, 'ip', '127.0.0.1', '2018-01-15 11:12:12', '2018-01-15 11:12:12'),
(406, NULL, 'global', NULL, '2018-01-18 09:25:07', '2018-01-18 09:25:07'),
(407, NULL, 'ip', '127.0.0.1', '2018-01-18 09:25:07', '2018-01-18 09:25:07'),
(408, 1, 'user', NULL, '2018-01-18 09:25:07', '2018-01-18 09:25:07'),
(409, NULL, 'global', NULL, '2018-01-18 21:48:18', '2018-01-18 21:48:18'),
(410, NULL, 'ip', '127.0.0.1', '2018-01-18 21:48:18', '2018-01-18 21:48:18'),
(411, 1, 'user', NULL, '2018-01-18 21:48:18', '2018-01-18 21:48:18'),
(412, NULL, 'global', NULL, '2018-01-19 00:25:45', '2018-01-19 00:25:45'),
(413, NULL, 'ip', '127.0.0.1', '2018-01-19 00:25:45', '2018-01-19 00:25:45'),
(414, 1, 'user', NULL, '2018-01-19 00:25:45', '2018-01-19 00:25:45'),
(415, NULL, 'global', NULL, '2018-02-01 02:50:18', '2018-02-01 02:50:18'),
(416, NULL, 'ip', '127.0.0.1', '2018-02-01 02:50:18', '2018-02-01 02:50:18'),
(417, 1, 'user', NULL, '2018-02-01 02:50:18', '2018-02-01 02:50:18'),
(418, NULL, 'global', NULL, '2018-02-01 02:50:22', '2018-02-01 02:50:22'),
(419, NULL, 'ip', '127.0.0.1', '2018-02-01 02:50:22', '2018-02-01 02:50:22'),
(420, 1, 'user', NULL, '2018-02-01 02:50:22', '2018-02-01 02:50:22'),
(421, NULL, 'global', NULL, '2018-02-20 18:58:16', '2018-02-20 18:58:16'),
(422, NULL, 'ip', '127.0.0.1', '2018-02-20 18:58:16', '2018-02-20 18:58:16'),
(423, 1, 'user', NULL, '2018-02-20 18:58:16', '2018-02-20 18:58:16'),
(424, NULL, 'global', NULL, '2018-02-20 18:58:54', '2018-02-20 18:58:54'),
(425, NULL, 'ip', '127.0.0.1', '2018-02-20 18:58:54', '2018-02-20 18:58:54'),
(426, 1, 'user', NULL, '2018-02-20 18:58:54', '2018-02-20 18:58:54'),
(427, NULL, 'global', NULL, '2018-02-20 22:47:51', '2018-02-20 22:47:51'),
(428, NULL, 'ip', '127.0.0.1', '2018-02-20 22:47:51', '2018-02-20 22:47:51'),
(429, 1, 'user', NULL, '2018-02-20 22:47:51', '2018-02-20 22:47:51'),
(430, NULL, 'global', NULL, '2018-02-21 18:45:17', '2018-02-21 18:45:17'),
(431, NULL, 'ip', '127.0.0.1', '2018-02-21 18:45:17', '2018-02-21 18:45:17'),
(432, 1, 'user', NULL, '2018-02-21 18:45:17', '2018-02-21 18:45:17'),
(433, NULL, 'global', NULL, '2018-02-25 05:36:15', '2018-02-25 05:36:15'),
(434, NULL, 'ip', '127.0.0.1', '2018-02-25 05:36:15', '2018-02-25 05:36:15'),
(435, 1, 'user', NULL, '2018-02-25 05:36:15', '2018-02-25 05:36:15'),
(436, NULL, 'global', NULL, '2018-02-25 18:36:58', '2018-02-25 18:36:58'),
(437, NULL, 'ip', '127.0.0.1', '2018-02-25 18:36:58', '2018-02-25 18:36:58'),
(438, 1, 'user', NULL, '2018-02-25 18:36:58', '2018-02-25 18:36:58'),
(439, NULL, 'global', NULL, '2018-02-26 00:59:18', '2018-02-26 00:59:18'),
(440, NULL, 'ip', '127.0.0.1', '2018-02-26 00:59:18', '2018-02-26 00:59:18'),
(441, 1, 'user', NULL, '2018-02-26 00:59:18', '2018-02-26 00:59:18'),
(442, NULL, 'global', NULL, '2018-03-28 00:32:03', '2018-03-28 00:32:03'),
(443, NULL, 'ip', '127.0.0.1', '2018-03-28 00:32:03', '2018-03-28 00:32:03'),
(444, 1, 'user', NULL, '2018-03-28 00:32:03', '2018-03-28 00:32:03'),
(445, NULL, 'global', NULL, '2018-03-28 19:17:59', '2018-03-28 19:17:59'),
(446, NULL, 'ip', '127.0.0.1', '2018-03-28 19:17:59', '2018-03-28 19:17:59'),
(447, 1, 'user', NULL, '2018-03-28 19:17:59', '2018-03-28 19:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permissions`, `last_login`, `fullname`, `address`, `phone`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'diennk@dienkim.com', '$2y$10$jeW7xaNuq9I3.Oerer8FE.ibP6fv00VDPHYevC1dGUio33xj0W1KK', NULL, '2018-05-11 01:54:49', 'Nguyễn Kim Điền', NULL, NULL, 'cang-bong-da-han-quoc-3-3585.jpg', 5, 1, '2017-11-12 07:23:56', '2018-05-11 01:54:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_member`
--

DROP TABLE IF EXISTS `user_group_member`;
CREATE TABLE `user_group_member` (
  `id` bigint(20) NOT NULL,
  `group_member_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_group_member`
--

INSERT INTO `user_group_member` (`id`, `group_member_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '2018-01-26 04:05:58', '2018-01-26 04:05:58'),
(9, 4, 6, '2018-01-26 08:57:35', '2018-01-26 08:57:35'),
(10, 4, 7, '2018-01-28 16:36:54', '2018-01-28 16:36:54'),
(25, 3, 8, '2018-01-29 02:40:24', '2018-01-29 02:40:24'),
(27, 4, 10, '2018-02-04 15:06:20', '2018-02-04 15:06:20'),
(28, 3, 9, '2018-02-04 16:48:12', '2018-02-04 16:48:12'),
(29, 4, 11, '2018-02-07 10:33:37', '2018-02-07 10:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `fullname`, `category_id`, `image`, `video_url`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Đi tham quan núi Bà Đen 2', 1, 'thuvienhinh-1.png', 'F5gQLpScOsI', 2, 1, '2018-01-09 11:01:55', '2018-01-09 11:49:30'),
(5, 'Đi tham quan núi Bà Đen', 1, 'thuvienhinh-2.png', 'BDBb1h-eLsY', 1, 1, '2018-01-09 11:04:06', '2018-01-09 11:49:08'),
(6, 'Đi tham quan núi Bà Đen 3', 1, 'thuvienhinh-3.png', 'rQt2EuoN6oo', 3, 1, '2018-01-09 11:04:29', '2018-01-09 11:49:42'),
(7, 'Đi tham quan núi Bà Đen 4', 1, 'thuvienhinh-4.png', 'jLzAqwCjPuU', 4, 1, '2018-01-09 11:04:54', '2018-01-09 11:49:49'),
(8, 'Đi tham quan núi Bà Đen 5', 1, 'thuvienhinh-5.png', 'koeu_AnZ0BQ', 5, 1, '2018-01-09 11:05:20', '2018-01-09 11:49:56'),
(9, 'Đi tham quan núi Bà Đen 6', 1, 'thuvienhinh-6.png', 'jM53ZU2MCzU', 6, 1, '2018-01-09 11:05:37', '2018-01-09 11:50:04'),
(10, 'Đi tham quan núi Bà Đen 7', 1, 'thuvienhinh-7.png', 'u7xIydku_Yw', 7, 1, '2018-01-09 11:05:53', '2018-01-09 11:50:11'),
(11, 'Đi tham quan núi Bà Đen 8', 1, 'thuvienhinh-8.png', 'yGvSEhQXu4g', 8, 1, '2018-01-09 11:06:08', '2018-01-09 11:50:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_article`
--
ALTER TABLE `category_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_banner`
--
ALTER TABLE `category_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_param`
--
ALTER TABLE `category_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_video`
--
ALTER TABLE `category_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_member`
--
ALTER TABLE `group_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_privilege`
--
ALTER TABLE `group_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_item`
--
ALTER TABLE `module_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_param`
--
ALTER TABLE `post_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_article`
--
ALTER TABLE `project_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_member`
--
ALTER TABLE `project_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `setting_system`
--
ALTER TABLE `setting_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supporter`
--
ALTER TABLE `supporter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_group_member`
--
ALTER TABLE `user_group_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category_article`
--
ALTER TABLE `category_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_banner`
--
ALTER TABLE `category_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_param`
--
ALTER TABLE `category_param`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_video`
--
ALTER TABLE `category_video`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_member`
--
ALTER TABLE `group_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_privilege`
--
ALTER TABLE `group_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3182;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module_item`
--
ALTER TABLE `module_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `post_param`
--
ALTER TABLE `post_param`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project_article`
--
ALTER TABLE `project_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project_member`
--
ALTER TABLE `project_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_system`
--
ALTER TABLE `setting_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supporter`
--
ALTER TABLE `supporter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=448;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_group_member`
--
ALTER TABLE `user_group_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
