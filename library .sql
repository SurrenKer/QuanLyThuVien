-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 05, 2026 lúc 02:31 PM
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
-- Cấu trúc bảng cho bảng `cau_hinh_giao_dien`
--

CREATE TABLE `cau_hinh_giao_dien` (
  `id` int(11) NOT NULL,
  `khu_vuc` enum('public','admin') NOT NULL,
  `nhom` enum('site','menu') NOT NULL,
  `khoa` varchar(100) NOT NULL,
  `gia_tri` varchar(255) NOT NULL,
  `thu_tu` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `cau_hinh_giao_dien`
--

INSERT INTO `cau_hinh_giao_dien` (`id`, `khu_vuc`, `nhom`, `khoa`, `gia_tri`, `thu_tu`) VALUES
(1, 'admin', 'site', 'ten_site', 'Admin Lib', 0),
(2, 'admin', 'site', 'logo', 'images/logo.jpg', 0),
(3, 'admin', 'menu', 'Dashboard', 'admin-dashboard.html', 1),
(4, 'admin', 'menu', 'Quản lý Sách', 'admin-books.html', 2),
(5, 'admin', 'menu', 'Danh mục', 'admin-categories.html', 3),
(6, 'admin', 'menu', 'Tác giả', 'admin-authors.html', 4),
(7, 'admin', 'menu', 'Độc giả', 'admin-readers.html', 5),
(8, 'admin', 'menu', 'Mượn / Trả', 'admin-borrow.html', 6),
(9, 'admin', 'menu', 'Phạt & Vi phạm', 'admin-fines.html', 7),
(10, 'admin', 'menu', 'Báo cáo', 'admin-reports.html', 8),
(11, 'public', 'site', 'logo', 'images/logo.jpg', 0),
(12, 'public', 'menu', 'Trang chủ', 'index.html', 1),
(13, 'public', 'menu', 'Danh sách sách', 'book-list.html', 2),
(14, 'public', 'menu', 'Tin tức', 'news.html', 3),
(15, 'public', 'menu', 'Giới thiệu', 'gioi-thieu.html', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_muon`
--

CREATE TABLE `chi_tiet_muon` (
  `id` int(11) NOT NULL,
  `phieu_id` int(11) NOT NULL,
  `sach_id` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_muon`
--

INSERT INTO `chi_tiet_muon` (`id`, `phieu_id`, `sach_id`, `so_luong`) VALUES
(1, 1, 1, 1),
(2, 2, 10, 1),
(3, 3, 10, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coc_tien`
--

CREATE TABLE `coc_tien` (
  `coc_id` int(11) NOT NULL,
  `phieu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `so_tien` decimal(12,0) NOT NULL,
  `trang_thai` enum('Đã thu','Đã hoàn','Đã trừ phạt','Giữ lại') NOT NULL DEFAULT 'Đã thu',
  `ngay_thu` datetime NOT NULL DEFAULT current_timestamp(),
  `ngay_hoan` datetime DEFAULT NULL,
  `so_tien_tru_phat` decimal(12,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_muon`
--

CREATE TABLE `gio_muon` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sach_id` int(11) NOT NULL,
  `ngay_them` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `user_id` int(11) NOT NULL,
  `ma_the` varchar(20) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `mat_khau_hash` varchar(255) DEFAULT NULL,
  `vai_tro` enum('doc_gia','admin') NOT NULL DEFAULT 'doc_gia',
  `trang_thai` enum('Hoạt động','Khóa thẻ') NOT NULL DEFAULT 'Hoạt động',
  `anh_dai_dien` varchar(255) NOT NULL DEFAULT 'images/avatar.svg',
  `ngay_tao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`user_id`, `ma_the`, `ho_ten`, `email`, `so_dien_thoai`, `mat_khau_hash`, `vai_tro`, `trang_thai`, `anh_dai_dien`, `ngay_tao`) VALUES
(1, 'DG001', 'Nguyễn Văn A', 'nguyenvana@gmail.com', '0901234567', NULL, 'doc_gia', 'Hoạt động', 'images/avatar.svg', '2026-10-05 15:04:52'),
(2, 'DG002', 'Trần Thị B', 'tranthib@gmail.com', '0987654321', NULL, 'doc_gia', 'Khóa thẻ', 'images/avatar.svg', '2026-10-05 15:04:52'),
(3, 'AD001', 'Quản trị viên', 'admin@library.local', NULL, NULL, 'admin', 'Hoạt động', 'images/avatar.svg', '2026-10-05 15:04:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhat_ky_tim_kiem`
--

CREATE TABLE `nhat_ky_tim_kiem` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tu_khoa` varchar(200) NOT NULL,
  `so_ket_qua` int(11) NOT NULL DEFAULT 0,
  `thoi_gian` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhat_ky_tim_kiem`
--

INSERT INTO `nhat_ky_tim_kiem` (`id`, `user_id`, `tu_khoa`, `so_ket_qua`, `thoi_gian`) VALUES
(1, NULL, 'a', 27, '2026-10-05 16:43:16'),
(2, NULL, 'Lập trình cơ bản', 0, '2026-10-05 16:43:23'),
(3, NULL, 'Lập trình', 7, '2026-10-05 16:43:27'),
(4, NULL, 'Lập trình web cơ bản', 1, '2026-10-05 16:43:37'),
(5, NULL, 'Lập trình', 7, '2026-10-05 18:12:51'),
(6, NULL, 'spider man', 0, '2026-10-05 18:38:52'),
(7, NULL, 'Cấu trúc', 1, '2026-10-05 18:41:12'),
(8, NULL, 'Đắc nhân tâm', 1, '2026-10-05 18:41:22'),
(9, NULL, 'Đắc nhân tâm', 1, '2026-10-05 18:41:25'),
(10, NULL, 'Cấu trúc', 1, '2026-10-05 19:05:16'),
(11, NULL, 'clean code', 1, '2026-10-05 19:08:03'),
(12, NULL, 'clean code', 1, '2026-10-05 19:08:16'),
(13, NULL, 'clean code', 1, '2026-10-05 19:15:06'),
(14, NULL, 'clean code', 1, '2026-10-05 19:21:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phat_vi_pham`
--

CREATE TABLE `phat_vi_pham` (
  `phat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phieu_id` int(11) DEFAULT NULL,
  `ly_do` varchar(255) NOT NULL,
  `so_ngay_tre` int(11) NOT NULL DEFAULT 0,
  `so_tien` decimal(12,0) NOT NULL,
  `da_tru_coc` decimal(12,0) NOT NULL DEFAULT 0,
  `trang_thai` enum('Chưa nộp','Đã nộp') NOT NULL DEFAULT 'Chưa nộp',
  `ngay_tao` datetime NOT NULL DEFAULT current_timestamp(),
  `ngay_nop` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `phat_vi_pham`
--

INSERT INTO `phat_vi_pham` (`phat_id`, `user_id`, `phieu_id`, `ly_do`, `so_ngay_tre`, `so_tien`, `da_tru_coc`, `trang_thai`, `ngay_tao`, `ngay_nop`) VALUES
(1, 2, 2, 'Trả sách quá hạn 5 ngày', 5, 25000, 0, 'Chưa nộp', '2026-10-05 15:04:52', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_muon`
--

CREATE TABLE `phieu_muon` (
  `phieu_id` int(11) NOT NULL,
  `ma_phieu` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ngay_muon` date NOT NULL,
  `han_tra` date NOT NULL,
  `ngay_tra_thuc_te` date DEFAULT NULL,
  `trang_thai` enum('Chờ duyệt','Đang mượn','Quá hạn','Đã trả') NOT NULL DEFAULT 'Đang mượn',
  `ghi_chu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `phieu_muon`
--

INSERT INTO `phieu_muon` (`phieu_id`, `ma_phieu`, `user_id`, `ngay_muon`, `han_tra`, `ngay_tra_thuc_te`, `trang_thai`, `ghi_chu`) VALUES
(1, 'PM001', 1, '2026-09-20', '2026-10-04', NULL, 'Đang mượn', NULL),
(2, 'PM002', 2, '2026-09-10', '2026-09-24', NULL, 'Quá hạn', NULL),
(3, 'PM003', 1, '2026-09-01', '2026-09-15', '2026-09-15', 'Đã trả', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quy_dinh`
--

CREATE TABLE `quy_dinh` (
  `id` int(11) NOT NULL,
  `khoa` varchar(50) NOT NULL,
  `gia_tri` decimal(12,0) NOT NULL,
  `hieu_luc_tu` datetime NOT NULL,
  `hieu_luc_den` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `quy_dinh`
--

INSERT INTO `quy_dinh` (`id`, `khoa`, `gia_tri`, `hieu_luc_tu`, `hieu_luc_den`) VALUES
(1, 'phat_tre_moi_ngay', 5000, '2026-01-01 00:00:00', NULL),
(2, 'so_ngay_muon', 14, '2026-01-01 00:00:00', NULL),
(3, 'coc_moi_phieu', 50000, '2026-01-01 00:00:00', NULL),
(4, 'so_sach_toi_da', 5, '2026-01-01 00:00:00', NULL);

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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tac_gia`
--

CREATE TABLE `tac_gia` (
  `tac_gia_id` int(11) NOT NULL,
  `ten_tac_gia` varchar(100) NOT NULL,
  `quoc_tich` varchar(50) DEFAULT NULL,
  `tieu_su` text DEFAULT NULL,
  `trang_thai` enum('Hiển thị','Ẩn') NOT NULL DEFAULT 'Hiển thị'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tac_gia`
--

INSERT INTO `tac_gia` (`tac_gia_id`, `ten_tac_gia`, `quoc_tich`, `tieu_su`, `trang_thai`) VALUES
(1, 'Nguyễn Văn A', NULL, NULL, 'Hiển thị'),
(2, 'Trần C', NULL, NULL, 'Hiển thị'),
(3, 'Robert C. Martin', 'Hoa Kỳ', NULL, 'Hiển thị'),
(4, 'Lê D', NULL, NULL, 'Hiển thị'),
(5, 'Dale Carnegie', 'Hoa Kỳ', NULL, 'Hiển thị'),
(6, 'Phạm E', NULL, NULL, 'Hiển thị'),
(7, 'Paulo Coelho', 'Brazil', NULL, 'Hiển thị'),
(8, 'Stephen Hawking', 'Anh', NULL, 'Hiển thị'),
(9, 'Yuval Noah Harari', 'Israel', NULL, 'Hiển thị'),
(10, 'Robert Kiyosaki', 'Mỹ', NULL, 'Hiển thị'),
(11, 'George Orwell', 'Anh', NULL, 'Hiển thị'),
(12, 'Nguyễn Nhật Ánh', 'Việt Nam', NULL, 'Hiển thị');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `the_loai`
--

CREATE TABLE `the_loai` (
  `the_loai_id` int(11) NOT NULL,
  `ten_the_loai` varchar(100) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `trang_thai` enum('Hiển thị','Ẩn') NOT NULL DEFAULT 'Hiển thị'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `the_loai`
--

INSERT INTO `the_loai` (`the_loai_id`, `ten_the_loai`, `mo_ta`, `trang_thai`) VALUES
(1, 'CNTT', 'Sách công nghệ thông tin và lập trình', 'Hiển thị'),
(2, 'Kinh Tế - Kỹ Năng', 'Sách kinh tế và kỹ năng sống', 'Hiển thị'),
(3, 'Văn Học', 'Tiểu thuyết và văn học', 'Hiển thị'),
(4, 'Khoa Học & Vũ Trụ', 'Sách khám phá khoa học và thiên văn', 'Hiển thị'),
(5, 'Tâm Lý & Kỹ Năng', 'Sách phát triển bản thân và tâm lý học', 'Hiển thị'),
(6, 'Lịch Sử & Văn Hoá', 'Tài liệu nghiên cứu lịch sử thế giới và Việt Nam', 'Hiển thị');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao`
--

CREATE TABLE `thong_bao` (
  `thong_bao_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tieu_de` varchar(200) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `loai` enum('nhac_han','qua_han','phat','he_thong') NOT NULL DEFAULT 'he_thong',
  `da_doc` tinyint(1) NOT NULL DEFAULT 0,
  `ngay_tao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tin_tuc`
--

CREATE TABLE `tin_tuc` (
  `tin_id` int(11) NOT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `tom_tat` varchar(500) DEFAULT NULL,
  `noi_dung` text DEFAULT NULL,
  `anh` varchar(255) DEFAULT NULL,
  `ngay_dang` datetime NOT NULL DEFAULT current_timestamp(),
  `trang_thai` enum('Hiển thị','Ẩn') NOT NULL DEFAULT 'Hiển thị'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_tinh`
--

CREATE TABLE `trang_tinh` (
  `slug` varchar(50) NOT NULL,
  `tieu_de` varchar(200) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `cap_nhat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `trang_tinh`
--

INSERT INTO `trang_tinh` (`slug`, `tieu_de`, `noi_dung`, `cap_nhat`) VALUES
('gioi-thieu', 'Giới thiệu', '', '2026-10-05 15:04:52');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cau_hinh_giao_dien`
--
ALTER TABLE `cau_hinh_giao_dien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chi_tiet_muon`
--
ALTER TABLE `chi_tiet_muon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ct_pm` (`phieu_id`),
  ADD KEY `fk_ct_sach` (`sach_id`);

--
-- Chỉ mục cho bảng `coc_tien`
--
ALTER TABLE `coc_tien`
  ADD PRIMARY KEY (`coc_id`),
  ADD KEY `fk_coc_pm` (`phieu_id`),
  ADD KEY `fk_coc_user` (`user_id`);

--
-- Chỉ mục cho bảng `gio_muon`
--
ALTER TABLE `gio_muon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_gio` (`user_id`,`sach_id`),
  ADD KEY `fk_gio_sach` (`sach_id`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `ma_the` (`ma_the`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `nhat_ky_tim_kiem`
--
ALTER TABLE `nhat_ky_tim_kiem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nhat_ky_nguoi_dung` (`user_id`);

--
-- Chỉ mục cho bảng `phat_vi_pham`
--
ALTER TABLE `phat_vi_pham`
  ADD PRIMARY KEY (`phat_id`),
  ADD KEY `fk_phat_user` (`user_id`),
  ADD KEY `fk_phat_pm` (`phieu_id`);

--
-- Chỉ mục cho bảng `phieu_muon`
--
ALTER TABLE `phieu_muon`
  ADD PRIMARY KEY (`phieu_id`),
  ADD UNIQUE KEY `ma_phieu` (`ma_phieu`),
  ADD KEY `fk_pm_user` (`user_id`);

--
-- Chỉ mục cho bảng `quy_dinh`
--
ALTER TABLE `quy_dinh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_quydinh` (`khoa`,`hieu_luc_tu`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`sach_id`),
  ADD KEY `fk_sach_tl` (`the_loai_id`),
  ADD KEY `fk_sach_tac_gia` (`tac_gia_id`);

--
-- Chỉ mục cho bảng `tac_gia`
--
ALTER TABLE `tac_gia`
  ADD PRIMARY KEY (`tac_gia_id`);

--
-- Chỉ mục cho bảng `the_loai`
--
ALTER TABLE `the_loai`
  ADD PRIMARY KEY (`the_loai_id`),
  ADD UNIQUE KEY `ten_the_loai` (`ten_the_loai`);

--
-- Chỉ mục cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD PRIMARY KEY (`thong_bao_id`),
  ADD KEY `fk_tb_user` (`user_id`);

--
-- Chỉ mục cho bảng `tin_tuc`
--
ALTER TABLE `tin_tuc`
  ADD PRIMARY KEY (`tin_id`);

--
-- Chỉ mục cho bảng `trang_tinh`
--
ALTER TABLE `trang_tinh`
  ADD PRIMARY KEY (`slug`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cau_hinh_giao_dien`
--
ALTER TABLE `cau_hinh_giao_dien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_muon`
--
ALTER TABLE `chi_tiet_muon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `coc_tien`
--
ALTER TABLE `coc_tien`
  MODIFY `coc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gio_muon`
--
ALTER TABLE `gio_muon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nhat_ky_tim_kiem`
--
ALTER TABLE `nhat_ky_tim_kiem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `phat_vi_pham`
--
ALTER TABLE `phat_vi_pham`
  MODIFY `phat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `phieu_muon`
--
ALTER TABLE `phieu_muon`
  MODIFY `phieu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `quy_dinh`
--
ALTER TABLE `quy_dinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `sach_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tac_gia`
--
ALTER TABLE `tac_gia`
  MODIFY `tac_gia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `the_loai`
--
ALTER TABLE `the_loai`
  MODIFY `the_loai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  MODIFY `thong_bao_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tin_tuc`
--
ALTER TABLE `tin_tuc`
  MODIFY `tin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chi_tiet_muon`
--
ALTER TABLE `chi_tiet_muon`
  ADD CONSTRAINT `fk_ct_pm` FOREIGN KEY (`phieu_id`) REFERENCES `phieu_muon` (`phieu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ct_sach` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`sach_id`);

--
-- Các ràng buộc cho bảng `coc_tien`
--
ALTER TABLE `coc_tien`
  ADD CONSTRAINT `fk_coc_pm` FOREIGN KEY (`phieu_id`) REFERENCES `phieu_muon` (`phieu_id`),
  ADD CONSTRAINT `fk_coc_user` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`user_id`);

--
-- Các ràng buộc cho bảng `gio_muon`
--
ALTER TABLE `gio_muon`
  ADD CONSTRAINT `fk_gio_sach` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`sach_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gio_user` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`user_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nhat_ky_tim_kiem`
--
ALTER TABLE `nhat_ky_tim_kiem`
  ADD CONSTRAINT `fk_nhat_ky_nguoi_dung` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phat_vi_pham`
--
ALTER TABLE `phat_vi_pham`
  ADD CONSTRAINT `fk_phat_pm` FOREIGN KEY (`phieu_id`) REFERENCES `phieu_muon` (`phieu_id`),
  ADD CONSTRAINT `fk_phat_user` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`user_id`);

--
-- Các ràng buộc cho bảng `phieu_muon`
--
ALTER TABLE `phieu_muon`
  ADD CONSTRAINT `fk_pm_user` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`user_id`);

--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `fk_sach_tac_gia` FOREIGN KEY (`tac_gia_id`) REFERENCES `tac_gia` (`tac_gia_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sach_tg` FOREIGN KEY (`tac_gia_id`) REFERENCES `tac_gia` (`tac_gia_id`),
  ADD CONSTRAINT `fk_sach_tl` FOREIGN KEY (`the_loai_id`) REFERENCES `the_loai` (`the_loai_id`);

--
-- Các ràng buộc cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD CONSTRAINT `fk_tb_user` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
