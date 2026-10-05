-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 05, 2026 lúc 02:22 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `library`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `sach_id` int(11) NOT NULL,
  `tieu_de` varchar(200) NOT NULL,
  `tac_gia_id` int(11) DEFAULT NULL,
  `the_loai_id` int(11) DEFAULT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 0,
  `so_luong_con` int(11) NOT NULL DEFAULT 0,
  `anh_bia` varchar(255) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `la_sach_hot` tinyint(1) NOT NULL DEFAULT 0,
  `trang_thai` enum('Đang mở','Đã khóa') NOT NULL DEFAULT 'Đang mở',
  `ngay_tao` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`sach_id`, `tieu_de`, `tac_gia_id`, `the_loai_id`, `so_luong`, `so_luong_con`, `anh_bia`, `mo_ta`, `la_sach_hot`, `trang_thai`, `ngay_tao`) VALUES
(1, 'Lập Trình Web Cơ Bản', 1, 1, 15, 14, 'images/covers/lap-trinh-web-co-ban.svg', 'Cuốn sách cung cấp những kiến thức nhập môn toàn diện về lập trình web dành cho người mới bắt đầu. Bạn sẽ được hướng dẫn chi tiết từ cách xây dựng cấu trúc trang web với HTML5, định dạng giao diện bắt mắt với CSS3 đến việc xử lý các tương tác người dùng cơ bản bằng JavaScript.\n\nNỘI DUNG CHÍNH:\n- Chương 1: Giới thiệu về Web và môi trường phát triển\n- Chương 2: HTML5 - Cấu trúc và ngữ nghĩa trang web\n- Chương 3: CSS3 - Thiết kế giao diện và bố cục trang\n- Chương 4: JavaScript cơ bản - Xử lý sự kiện và DOM\n- Chương 5: Xây dựng website cá nhân hoàn chỉnh', 0, 'Đang mở', '2026-10-05 15:04:52'),
(2, 'Lập Trình Web Với Bootstrap 5', 1, 1, 15, 15, NULL, 'Hướng dẫn thực chiến xây dựng giao diện website chuyên nghiệp và tương thích trên mọi thiết bị (Responsive Design) với Bootstrap 5. Sách giúp bạn làm chủ hệ thống lưới Grid, các component UI phổ biến và kỹ năng tùy biến CSS framework một cách hiệu quả.\n\nNỘI DUNG CHÍNH:\n- Chương 1: Làm quen với Bootstrap 5 và cài đặt\n- Chương 2: Hệ thống Grid System và Responsive Layout\n- Chương 3: Các thành phần giao diện (Navbar, Card, Modal, Form)\n- Chương 4: Tùy biến Bootstrap với SASS/CSS\n- Chương 5: Dự án thực hành: Website tin tức & bán hàng', 1, 'Đang mở', '2026-10-05 15:04:52'),
(3, 'Cấu Trúc Dữ Liệu', 2, 1, 10, 10, NULL, 'Tài liệu nền tảng không thể thiếu cho sinh viên ngành CNTT và lập trình viên. Cuốn sách trình trình bày chi tiết về các cấu trúc dữ liệu cốt lõi như Mảng, Danh sách liên kết, Ngăn xếp, Hàng đợi, Cây, Đồ thị cùng các thuật toán tìm kiếm và sắp xếp phổ biến đi kèm ví dụ minh họa bằng code.\n\nNỘI DUNG CHÍNH:\n- Chương 1: Độ phức tạp của thuật toán (Big O Notation)\n- Chương 2: Mảng và Danh sách liên kết (Linked List)\n- Chương 3: Stack và Queue\n- Chương 4: Cây và Cây nhị phân tìm kiếm (BST)\n- Chương 5: Đồ thị và các thuật toán duyệt đồ thị (BFS, DFS)', 1, 'Đang mở', '2026-10-05 15:04:52'),
(4, 'Clean Code', 3, 1, 6, 6, NULL, 'Cuốn sách kinh điển giúp bạn nâng cao tư duy lập trình và viết mã nguồn sạch, dễ đọc, dễ bảo trì. Bạn sẽ học được cách đặt tên biến chuẩn xác, viết hàm ngắn gọn, tối ưu cấu trúc lớp và kỹ thuật Refactoring mã nguồn một cách chuyên nghiệp.\n\nNỘI DUNG CHÍNH:\n- Chương 1: Quy tắc đặt tên và viết hàm hiệu quả\n- Chương 2: Chú thích (Comments) đúng cách trong code\n- Chương 3: Định dạng mã nguồn và xử lý ngoại lệ\n- Chương 4: Kỹ thuật Refactoring và viết Unit Test\n- Chương 5: Xử lý Code Smells và anti-patterns', 1, 'Đang mở', '2026-10-05 15:04:52'),
(5, 'Python Cơ Bản', 4, 1, 9, 9, NULL, 'Cuốn sách hướng dẫn học ngôn ngữ lập trình Python một cách nhanh chóng và dễ hiểu nhất. Với cú pháp đơn giản, Python là lựa chọn hoàn hảo cho người mới bắt đầu học lập trình, phân tích dữ liệu cũng như tự động hóa công việc hàng ngày.\n\nNỘI DUNG CHÍNH:\n- Chương 1: Cài đặt môi trường và cú pháp Python cơ bản\n- Chương 2: Kiểu dữ liệu, Biến và Cấu trúc điều khiển\n- Chương 3: Hàm và Lập trình hướng đối tượng (OOP) cơ bản\n- Chương 4: Thao tác với File và Xử lý ngoại lệ\n- Chương 5: Làm quen với các thư viện phổ biến (NumPy, Pandas)', 0, 'Đang mở', '2026-10-05 15:04:52'),
(6, 'Sách cho người thành công', 1, 2, 8, 8, NULL, 'Tổng hợp những nguyên lý sống, tư duy đột phá và thói quen tích cực của những cá nhân xuất sắc trên thế giới. Cuốn sách truyền cảm hứng mạnh mẽ, giúp bạn định hình mục tiêu cuộc sống, vượt qua nghịch cảnh và kiến tạo thành công bền vững.\n\nNỘI DUNG CHÍNH:\n- Chương 1: Định hình tư duy của người thành công\n- Chương 2: Thiết lập mục tiêu và kế hoạch hành động\n- Chương 3: Xây dựng thói quen tích cực mỗi ngày\n- Chương 4: Vượt qua thất bại và làm chủ cảm xúc\n- Chương 5: Nghệ thuật kết nối và lãnh đạo bản thân', 0, 'Đang mở', '2026-10-05 15:04:52'),
(7, 'Đắc Nhân Tâm', 5, 2, 20, 20, NULL, 'Đắc Nhân Tâm của Dale Carnegie là cuốn sách nghệ thuật ứng xử nổi tiếng nhất thế giới. Tác phẩm mang đến những nguyên tắc vàng trong giao tiếp, thu phục lòng người, tạo dựng mối quan hệ tốt đẹp và phát triển kỹ năng lãnh đạo trong công việc lẫn cuộc sống.\n\nNỘI DUNG CHÍNH:\n- Phần 1: Nghệ thuật ứng xử cơ bản\n- Phần 2: Sáu nguyên tắc tạo thiện cảm với mọi người\n- Phần 3: Mười hai cách hướng người khác suy nghĩ theo bạn\n- Phần 4: Nhắc nhở, chuyển hóa người khác mà không gây oán giận', 1, 'Đang mở', '2026-10-05 15:04:52'),
(8, 'Quản Lý Thời Gian', 6, 2, 0, 0, NULL, 'Cuốn sách giúp bạn loại bỏ thói quen trì hoãn, sắp xếp thứ tự ưu tiên công việc khoa học và tối ưu hóa hiệu suất làm việc mỗi ngày. Bạn sẽ làm chủ các phương pháp quản lý thời gian nổi tiếng như Pomodoro, Ma trận Eisenhower hay nguyên lý Pareto 80/20.\n\nNỘI DUNG CHÍNH:\n- Chương 1: Đánh giá thực trạng sử dụng thời gian cá nhân\n- Chương 2: Phương pháp Ma trận Eisenhower sắp xếp ưu tiên\n- Chương 3: Kỹ thuật Pomodoro tập trung cao độ\n- Chương 4: Loại bỏ xao lãng và khắc phục thói trì hoãn\n- Chương 5: Cân bằng giữa công việc và cuộc sống', 0, 'Đã khóa', '2026-10-05 15:04:52'),
(9, 'Nhà Giả Kim', 7, 3, 12, 12, NULL, 'Tiểu thuyết kinh điển của Paulo Coelho kể về chuyến hành trình đi tìm kho báu của chú bé chăn cừu Santiago. Cuốn sách mang đến những triết lý sâu sắc về việc theo đuổi ước mơ, lắng nghe tiếng nói của trái tim và học cách nhận biết những điềm báo trên con đường đời.\n\nNỘI DUNG CHÍNH:\n- Phần 1: Cậu bé chăn cừu và ước mơ về kho báu\n- Phần 2: Hành trình băng qua sa mạc Sahara\n- Phần 3: Cuộc gặp gỡ với Nhà Giả Kim\n- Phần 4: Bài học tại Kim Tự Tháp và kho báu thực sự', 0, 'Đang mở', '2026-10-05 15:04:52'),
(10, 'Kinh Tế Học Cơ Bản', 1, 2, 15, 5, NULL, 'Cuốn sách \"Kinh Tế Học Cơ Bản\" cung cấp những nền tảng kiến thức nhập môn dễ hiểu nhất về kinh tế vĩ mô và vi mô. Sách giúp người đọc nắm bắt cách thức vận hành của thị trường, các quy luật kinh tế quan trọng và ứng dụng vào quản lý tài chính cá nhân.\n\nNỘI DUNG CHÍNH & MỤC LỤC:\n- Chương 1: Tổng quan về Kinh tế học và Tư duy Kinh tế\n- Chương 2: Quy luật Cung - Cầu và Giá cả thị trường\n- Chương 3: Lạm phát, Lãi suất và Tăng trưởng Kinh tế\n- Chương 4: Vai trò của Chính phủ trong nền Kinh tế\n- Chương 5: Quản lý Tài chính cá nhân và Đầu tư hiệu quả', 0, 'Đang mở', '2026-10-05 15:04:52'),
(11, 'Lập Trình C++ Cho Người Mới', 2, 1, 12, 12, NULL, 'Giáo trình C++ dành cho sinh viên CNTT.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(12, 'Kiến Trúc Máy Tính', 3, 1, 8, 8, NULL, 'Tài liệu nghiên cứu kiến trúc hệ thống máy tính.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(13, 'Hệ Điều Hành Linux', 1, 1, 15, 15, NULL, 'Quản trị và sử dụng hệ điều hành Linux.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(14, 'Lập Trình Web Với ReactJS', 2, 1, 20, 20, NULL, 'Xây dựng ứng dụng web hiện đại với React.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(15, 'Lập Trình Mobile Với Flutter', 4, 1, 10, 10, NULL, 'Phát triển ứng dụng đa nền tảng iOS và Android.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(16, 'Trí Tuệ Nhân Tạo AI', 1, 1, 7, 7, NULL, 'Tổng quan về AI, Machine Learning và Deep Learning.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(17, 'An Toàn Và Bảo Mật Thông Tin', 2, 1, 9, 9, NULL, 'Các nguyên lý mã hóa và bảo mật mạng.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(18, 'Nhập Môn Mạng Máy Tính', 3, 1, 14, 14, NULL, 'Mô hình OSI, TCP/IP và cấu hình Router.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(19, 'Phân Tích Thiết Kế Hệ Thống', 1, 1, 6, 6, NULL, 'Quy trình phát triển phần mềm chuyên nghiệp.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(20, 'Lập Trình Java Nâng Cao', 2, 1, 11, 11, NULL, 'Spring Boot và RESTful API với Java.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(21, 'Cơ Sở Dữ Liệu NoSQL', 3, 1, 13, 13, NULL, 'Tìm hiểu MongoDB, Redis và Cassandra.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(22, 'Kỹ Thuật Lập Trình C#', 1, 1, 10, 10, NULL, 'Lập trình ứng dụng Desktop với .NET Framework.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(23, 'Kiểm Thử Phần Mềm (QA/QC)', 2, 1, 8, 8, NULL, 'Phương pháp kiểm thử tự động và thủ công.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(24, 'Điện Toán Đám Mây AWS', 3, 1, 15, 15, NULL, 'Triển khai hạ tầng dịch vụ trên AWS Cloud.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(25, 'Xử Lý Dữ Liệu Lớn Big Data', 1, 1, 5, 5, NULL, 'Công nghệ Hadoop, Spark và Kafka.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(26, 'Lược Sử Thời Gian', 8, 4, 10, 10, NULL, 'Khám phá về vũ trụ, lỗ đen và lý thuyết tương đối.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(27, 'Sapiens: Lược Sử Loài Người', 9, 6, 18, 18, NULL, 'Hành trình phát triển của loài người từ tiến hóa đến hiện đại.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(28, 'Dạy Con Làm Giàu (Tập 1)', 10, 2, 25, 25, NULL, 'Tư duy tài chính và quản lý dòng tiền.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(29, '1984 - George Orwell', 11, 3, 12, 12, NULL, 'Tiểu thuyết giả tưởng nổi tiếng thế giới.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(30, 'Mắt Biếc', 12, 3, 30, 30, NULL, 'Tác phẩm lãng mạn nhẹ nhàng của Nguyễn Nhật Ánh.', 1, 'Đang mở', '2026-10-05 16:08:27'),
(31, 'Tư Duy Nhanh Và Chậm', 5, 5, 14, 14, NULL, 'Nghiên cứu về hai hệ thống tư duy của con người.', 0, 'Đang mở', '2026-10-05 16:08:27'),
(32, 'Kỹ Năng Giao Tiếp Đỉnh Cao', 6, 2, 20, 20, NULL, 'Bí quyết truyền đạt và thu phục lòng người.', 0, 'Đang mở', '2026-10-05 16:08:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`sach_id`),
  ADD KEY `fk_sach_tl` (`the_loai_id`),
  ADD KEY `fk_sach_tac_gia` (`tac_gia_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `sach_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `fk_sach_tac_gia` FOREIGN KEY (`tac_gia_id`) REFERENCES `tac_gia` (`tac_gia_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sach_tg` FOREIGN KEY (`tac_gia_id`) REFERENCES `tac_gia` (`tac_gia_id`),
  ADD CONSTRAINT `fk_sach_tl` FOREIGN KEY (`the_loai_id`) REFERENCES `the_loai` (`the_loai_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
