<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Điện thoại thông minh</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">


    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <!-- all css here -->
    <link rel="shortcut icon" type="image/x-icon" href="../../../assets/img/favicon.png">

    <!-- all css here -->
    <link rel="stylesheet" href="../../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../assets/css/plugin.css">
    <link rel="stylesheet" href="../../../assets/css/bundle.css">
    <link rel="stylesheet" href="../../../assets/css/style.css">
    <link rel="stylesheet" href="../../../assets/css/responsive.css">
    <script src="../../../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://example.com/path/to/currencyFormat.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        #addFormContainer1 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            /*display: flex;*/
        }

        #addForm1 {
            position: fixed;
            top: 50%;
            left: 50%;
            width: 500px;
            height: 400px;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            transform: translate(-50%, -50%);
        }

        #addForm button[type="submit"] {
            background-color: #007BFF; /* Màu nền của nút */
            color: white; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }

        .error {
            color: #ff0000;
        }

        .password-container {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 10px;
            cursor: pointer;
        }





        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .pagination button {
            margin: 0 5px;
        }

        .btn-table {
            margin-top: 18px;
            padding-top: 5px;
            text-align: center;
            color: white;
            width: 80px;
            height: 40px;
            background: #0c84ff;
            border-radius: 5px;
        }

        .btn-table:hover {
            background: #0d6efd;
        }

        /* CSS để xếp các nút trang theo hàng ngang */
        .pagination-buttons {
            display: flex;
        }

        .page-link {
            margin: 0 5px; /* Khoảng cách giữa các nút trang */
            cursor: pointer;
            font-size: 10px;
            height: 25px;
            /* Thêm các thuộc tính CSS khác tùy thuộc vào thiết kế bạn muốn */
        }

        /* CSS cho nút trước và nút sau */
        .btn-table {
            cursor: pointer;
            /* Thêm các thuộc tính CSS khác tùy thuộc vào thiết kế bạn muốn */
        }

    </style>

    <style>
        .a-hover:hover {
            /*background-color: #ff003b; !* Change the background color on hover *!*/
            color: #fff; /* Change the text color on hover */
        }
    </style>
</head>
<body>
<script>
    function formatCurrencyVND(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }

    window.onload = function () {
        var tienhienco = document.getElementById('tienhienco');
        tienhienco.value = formatCurrencyVND(tienhienco.value);

    };
</script>
<!-- Add your site or application content here -->

<!--pos page start-->
<div class="pos_page">
    <div class="container">
        <!--pos page inner-->
        <div class="pos_page_inner">
            <!--header area -->
            <div class="header_area">
                <!--header top-->
                <div class="header_top">
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-md-6">
                            <div class="switcher">
                                <ul>
                                    <li class="languages"><a href="#"><img src="../../../assets/img/logo/fontlogo.jpg"
                                                                           alt=""> English <i
                                            class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_languages">
                                            <li><a href="#"><img src="../../../assets/img/logo/fontlogo.jpg" alt="">
                                                English</a></li>
                                            <li><a href="#"><img src="../../../assets/img/logo/fontlogo2.jpg" alt="">
                                                French
                                            </a></li>
                                        </ul>
                                    </li>

                                    <li class="currency"><a href="#"> Currency : $ <i
                                            class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_currency">
                                            <li><a href="#"> Dollar (USD)</a></li>
                                            <li><a href="#"> Euro (EUR) </a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header_links">
                                <ul>
                                    <li><a href="/contact1/${kh.maKhachHang}" title="Contact">Liên hệ</a></li>
                                    <li>
                                        <a href="/detailKh/${kh.maKhachHang}" title="My account">${kh.ten }</a>
                                    </li>
                                    </li>
                                    <li><a href="/cart/${kh.maKhachHang}" title="My cart">Giỏ hàng </a></li>
                                    <li><a onclick="confirmLogout()" title="Login">Đăng xuất <i
                                            class="fas fa-sign-out-alt"></i></a></li>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--header top end-->

                <!--header middel-->
                <div class="header_middel">
                    <div class="row align-items-center">
                        <!--logo start-->
                        <div class="col-lg-3 col-md-3">
                            <div class="logo">
                                <a href="index.html"><img src="../../../assets/img/logo/AZURA.png" alt=""
                                                          style="height: 80px;width: 90px"></a>
                            </div>
                        </div>
                        <!--logo end-->
                        <div class="col-lg-9 col-md-9">
                            <div class="header_right_info">

                                <div class="shopping_cart">
                                    <a href="/cart/${kh.maKhachHang}"><i class="fa fa-shopping-cart"></i> <i
                                            class="fa fa-angle-down"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--header middel end-->
            <div class="header_bottom">
                <div class="row">
                    <div class="col-12">
                        <div class="main_menu_inner">
                            <div class="main_menu d-none d-lg-block">
                                <nav>
                                    <ul>
                                        <li class="active"><a href="/home_clients/${kh.maKhachHang}">Trang chủ</a>
                                        </li>
                                        <li><a href="/hien-thi-shop/${kh.maKhachHang}">Điện thoại thông minh</a>

                                        </li>
                                        <li><a href="#">Trang</a>
                                            <div class="mega_menu">
                                                <div class="mega_top fix">
                                                    <div class="mega_items">

                                                        <ul>
                                                            <li><a href="/MyAccount/${kh.maKhachHang}">Thông tin tài
                                                                khoản </a></li>
                                                        </ul>
                                                    </div>

                                                    <div class="mega_items">

                                                        <ul>
                                                            <li><a href="/contact1/${kh.maKhachHang}">Liên hệ

                                                            </a></li>
                                                            <li><a href="/cart/${kh.maKhachHang}">Giỏ hàng</a></li>
                                                            <li><a href="/hoadon/${kh.maKhachHang}">Hóa Đơn</a></li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li><a href="/blog1/${kh.maKhachHang}">blog</a>
                                        </li>
                                        <li><a href="/contact1/${kh.maKhachHang}">liên hệ chúng tôi</a></li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--header end -->

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <ul>
                            <li><a href="/home_clients/${kh.maKhachHang}">Trang chủ</a></li>
                            <li><i class="fa fa-angle-right"></i></li>
                            <li>Thông tin tài khoản</li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!-- Start Maincontent  -->
        <section class="main_content_area">
            <div class="account_dashboard">
                <div class="row">
                    <div class="col-sm-12 col-md-3 col-lg-3">
                        <!-- Nav tabs -->
                        <div class="dashboard_tab_button">
                            <ul role="tablist" class="nav flex-column dashboard-list">
                                <%--                                <li><a href="#dashboard" data-toggle="tab" class="nav-link active">Dashboard</a>--%>
                                <li><a href="#vi" data-toggle="tab" class="nav-link">Ví</a></li>
                                <li><a href="#orders" data-toggle="tab" class="nav-link">Đơn đặt hàng</a></li>
                                <%--                                <li><a href="#address" data-toggle="tab" class="nav-link">Addresses</a></li>--%>
                                <li><a href="#account-details" data-toggle="tab" class="nav-link">Chi tiết khách
                                    hàng</a></li>
                                <li><a href="/home" class="nav-link">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-9 col-lg-9">

                        <!-- Tab panes -->
                        <div class="tab-content dashboard_content">
                            <div class="tab-pane fade" id="vi">
                                <div class="contact-form bg-light p-30">
                                    <div id="success"></div>
                                    <div class="row">
                                        <div class="col-6">Ví của : <span
                                                style="font-size: 20px;" >${kh.ten}</span>
                                        </div>
                                        <div class="col-6">
                                            <label id="tienhienco">Tiền hiện có: <span
                                                    style="font-size: 20px"></span></label>

                                            <script>
                                                function formatCurrencyVND(number) {
                                                    return new Intl.NumberFormat('vi-VN', {
                                                        style: 'currency',
                                                        currency: 'VND'
                                                    }).format(number);
                                                }

                                                var viShop = {
                                                    tongTien: ${viShop.tongTien}
                                                };

                                                // Lấy số tiền từ viShop.tongTien
                                                var soTienHienCo = viShop.tongTien;

                                                // Định dạng số tiền theo VND
                                                var soTienDaFormat = formatCurrencyVND(soTienHienCo);

                                                // Cập nhật nội dung của thẻ span
                                                document.getElementById('tienhienco').querySelector('span').innerText = soTienDaFormat;
                                            </script>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <button class="btn btn-success " style="margin-left: 50px;"  formaction="/user/nap_tien/${maKhachHang}" type="button" data-toggle="modal" data-target="#addFormContainerNT">
                                            Nạp tiền
                                        </button>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-12"
                                             style="text-align: center; color: #ffa95b; font-size: 30px">Lịch sử
                                            giao dịch
                                        </div>
                                        <div class="col-12" style="margin-top: 10px">
                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                <tr>
                                                    <th>Hình thức</th>
                                                    <th>Ngày</th>
                                                    <th>Đơn giá</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${gdVi}" var="list">
                                                    <tr>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.hinhThuc == 0}">Nạp tiền</c:when>
                                                                <c:when test="${list.hinhThuc == 1}">Hoàn tiền</c:when>
                                                                <c:when test="${list.hinhThuc == 2}">Thanh toán đơn hàng</c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:set var="dateTimeString"
                                                                   value="${list.ngayGiaoDich}"/>
                                                            <fmt:parseDate value="${dateTimeString}"
                                                                           var="parsedDate"
                                                                           pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                                                            <fmt:formatDate value="${parsedDate}"
                                                                            var="formattedDate"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                                                                ${formattedDate}
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.hinhThuc == 0}">
                                                <span style="color: #24c534">+
                                                     <script>document.write(formatCurrencyVND(${list.donGia}))</script>
                                                </span>
                                                                </c:when>
                                                                <c:when test="${list.hinhThuc == 1}">
                                                <span style="color: #24c534">+
                                                     <script>document.write(formatCurrencyVND(${list.donGia}))</script>
                                                </span>
                                                                </c:when>
                                                                <c:when test="${list.hinhThuc == 2}">
                                                <span style="color: red">-
                                                     <script>document.write(formatCurrencyVND(${list.donGia}))</script>
                                                </span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="pagination-container">
                                                <div class="pagination mt-3">
                                                    <%--                                                    <div class="btn-table" id="prevPage">Trước</div>--%>
                                                    <div id="pageButtons" class="pagination-buttons"></div>
                                                    <%--                                                    <div class="btn-table" id="nextPage">Sau</div>--%>
                                                </div>
                                            </div>
                                            <script>
                                                $(document).ready(function () {
                                                    var rowsPerPage = 8; // Số dòng trên mỗi trang
                                                    var totalRows = $('#example1 tbody tr').length;
                                                    var numPages = Math.ceil(totalRows / rowsPerPage);
                                                    var currentPage = 1;
                                                    var maxVisiblePages = 5; // Số trang tối đa hiển thị

                                                    // Ẩn tất cả các dòng ngoại trừ các dòng đầu tiên
                                                    $('#example1 tbody tr').hide();
                                                    $('#example1 tbody tr').slice(0, rowsPerPage).show();

                                                    // Hiển thị số trang và màu xanh cho trang hiện tại
                                                    function showPagination() {
                                                        $('#pageButtons').empty();

                                                        var startPage, endPage;

                                                        if (numPages <= maxVisiblePages) {
                                                            startPage = 1;
                                                            endPage = numPages;
                                                        } else {
                                                            if (currentPage <= Math.floor(maxVisiblePages / 2)) {
                                                                startPage = 1;
                                                                endPage = maxVisiblePages;
                                                            } else if (currentPage + Math.floor(maxVisiblePages / 2) >= numPages) {
                                                                startPage = numPages - maxVisiblePages + 1;
                                                                endPage = numPages;
                                                            } else {
                                                                startPage = currentPage - Math.floor(maxVisiblePages / 2);
                                                                endPage = currentPage + Math.floor(maxVisiblePages / 2) - 1;
                                                            }
                                                        }

                                                        for (var i = startPage; i <= endPage; i++) {
                                                            $('#pageButtons').append('<button class="page-link">' + i + '</button>');
                                                        }

                                                        $('.page-link').removeClass('active');
                                                        $('.page-link').eq(currentPage - startPage).addClass('active');
                                                    }

                                                    showPagination();

                                                    // Xử lý khi click vào trang
                                                    $('#pageButtons').on('click', '.page-link', function () {
                                                        currentPage = parseInt($(this).text());
                                                        var start = (currentPage - 1) * rowsPerPage;
                                                        var end = start + rowsPerPage;

                                                        $('#example1 tbody tr').hide().slice(start, end).show();
                                                        showPagination();
                                                    });

                                                    // Xử lý nút "Previous"
                                                    $('.pagination').on('click', '#prev', function () {
                                                        if (currentPage > 1) {
                                                            currentPage--;
                                                            var start = (currentPage - 1) * rowsPerPage;
                                                            var end = start + rowsPerPage;

                                                            $('#example1 tbody tr').hide().slice(start, end).show();
                                                            showPagination();
                                                        }
                                                    });

                                                    // Xử lý nút "Next"
                                                    $('.pagination').on('click', '#next', function () {
                                                        if (currentPage < numPages) {
                                                            currentPage++;
                                                            var start = (currentPage - 1) * rowsPerPage;
                                                            var end = start + rowsPerPage;

                                                            $('#example1 tbody tr').hide().slice(start, end).show();
                                                            showPagination();
                                                        }
                                                    });
                                                });
                                            </script>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="orders">
                                <h3>Đơn đặt hàng</h3>
                                <div class="col-lg-10" style="max-width: 850px">
                                    <section class="content-header">
                                        <div class="container-fluid">
                                            <div>
                                                <div class="tab1" id="optab1" onclick="openTab1()" style="display: inline-block;
            padding: 10px 20px;
            background-color: #aaa;
            cursor: pointer;
            border: 1px solid #aaa;
            margin-right: 3px;
            border-radius: 5px 5px 0 0;"><i class="fa fa-clock"></i> Chờ xác nhận
                                                </div>
                                                <div class="tab3" id="optab3" onclick="openTab3()" style="display: inline-block;
            padding: 10px 20px;
            background-color: #aaa;
            cursor: pointer;
            border: 1px solid #aaa;
            margin-right: 3px;
            border-radius: 5px 5px 0 0;"><i
                                                        class="fas fa-truck"></i> Đang giao
                                                </div>
                                                <div class="tab4" id="optab4" onclick="openTab4()" style="display: inline-block;
            padding: 10px 20px;
            background-color: #aaa;
            cursor: pointer;
            border: 1px solid #aaa;
            margin-right: 3px;
            border-radius: 5px 5px 0 0;"><i
                                                        class="fas fa-check-circle"></i> Hoàn
                                                    thành
                                                </div>
                                                <div class="tab5" id="optab5" onclick="openTab5()" style="display: inline-block;
            padding: 10px 20px;
            background-color: #aaa;
            cursor: pointer;
            border: 1px solid #aaa;
            margin-right: 3px;
            border-radius: 5px 5px 0 0;"><i class="fas fa-times"></i> Đã hủy
                                                </div>
                                            </div>

                                            <form action="">
                                                <div id="tab1" class="tab-content1" style=" display: none;
            padding: 20px;
            border: 1px solid #aaa;">
                                                    <div class="table_desc">
                                                        <div class="cart_page table-responsive">
                                                            <table>
                                                                <thead>
                                                                <tr>
                                                                    <th class="product_remove">Mã hóa đơn</th>
                                                                    <th class="product_thumb">Người nhận</th>
                                                                    <th class="product_thumb">Trạng Thái</th>
                                                                    <th class="product_total">Yêu Cầu</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${list}" var="c">
                                                                    <tr>
                                                                        <td class="product_remove">${c.maHoaDon}</td>
                                                                        <td class="product_thumb">${c.nguoiNhan}</td>
                                                                        <td class="product_total">
                                                                            <c:choose>
                                                                                <c:when test="${c.trangThai == 0}">
                                                                                    CHỜ XÁC NHẬN
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 1}">
                                                                                    ĐANG GIAO HÀNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 2}">
                                                                                    GIAO HÀNG THÀNH CÔNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 3}">
                                                                                    HỦY
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td class="product_total">
                                                                            <c:choose>
                                                                                <c:when test="${c.trangThai == 0}">
                                                                                    <a href="#" class="btn btn-danger a-hover cancel-btn"
                                                                                       data-makhachhang="${kh.maKhachHang}"
                                                                                       data-mahoadon="${c.maHoaDon}"
                                                                                       data-toggle="modal" data-target="#myModal">HỦY</a>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <%--                                                Modal--%>
                                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                                         aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title" id="myModalLabel">Nhập lý do hủy
                                                                    </h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <input type="text" id="noteInput" class="form-control"
                                                                           placeholder="Nhập lý do hủy">
                                                                    <span id="errorNote" style="color: red;"></span>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-dismiss="modal">Đóng
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary"
                                                                            id="confirmBtn">OK
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <script>
                                                        // Xác định hóa đơn cần hủy khi nút "HỦY" được nhấn
                                                        $('.cancel-btn').on('click', function () {
                                                            var maKhachHang = $(this).data('makhachhang');
                                                            var maHoaDon = $(this).data('mahoadon');

                                                            // Gán thông tin vào modal trước khi hiển thị modal
                                                            $('#myModal').data('makhachhang', maKhachHang);
                                                            $('#myModal').data('mahoadon', maHoaDon);

                                                            // Hiển thị modal sau khi gán thông tin
                                                            $('#myModal').modal('show');
                                                        });

                                                        // Xác nhận hủy hóa đơn khi người dùng xác nhận trong modal
                                                        $('#confirmBtn').on('click', function () {
                                                            var note = $('#noteInput').val().trim();
                                                            var maKhachHang = $('#myModal').data('makhachhang');
                                                            var maHoaDon = $('#myModal').data('mahoadon');

                                                            if (note === '') {
                                                                $('#errorNote').text("Vui lòng nhập lý do hủy.");
                                                            } else {
                                                                // Sử dụng SweetAlert thay vì thông báo thông thường
                                                                Swal.fire({
                                                                    title: 'Đơn hàng đã được hủy thành công!',
                                                                    icon: 'success',
                                                                    showCancelButton: false,
                                                                    confirmButtonText: 'OK',
                                                                    allowOutsideClick: false,
                                                                }).then((result) => {
                                                                    if (result.isConfirmed) {
                                                                        window.location.href = "/update1/" + maKhachHang + "/" + maHoaDon + "?note=" + encodeURIComponent(note);
                                                                    }
                                                                });
                                                            }
                                                        });

                                                        // Xóa dữ liệu nhập vào khi modal ẩn đi hoặc khi người dùng nhấn nút "Đóng"
                                                        $('#myModal').on('hide.bs.modal', function () {
                                                            $('#noteInput').val('');
                                                            $('#errorNote').text('');
                                                        });

                                                        $('.btn-secondary').on('click', function () {
                                                            $('#noteInput').val('');
                                                            $('#errorNote').text('');
                                                        });


                                                    </script>
                                                </div>



                                                <div id="tab3" class="tab-content" style=" display: none;
            padding: 20px;
            border: 1px solid #aaa;
            ">
                                                    <div class="table_desc">
                                                        <div class="cart_page table-responsive">
                                                            <table>
                                                                <thead>
                                                                <tr>
                                                                    <th class="product_remove">Mã hóa đơn</th>
                                                                    <th class="product_thumb">Người nhận</th>
                                                                    <th class="product_thumb">Trạng Thái</th>
                                                                    <th class="product_total">Yêu Cầu</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${list1}" var="c">
                                                                    <tr>
                                                                        <td class="product_remove">${c.maHoaDon}</td>
                                                                        <td class="product_thumb">${c.nguoiNhan}</td>
                                                                        <td class="product_total">
                                                                            <c:choose>
                                                                                <c:when test="${c.trangThai == 0}">
                                                                                    CHỜ XÁC NHẬN
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 1}">
                                                                                    ĐANG GIAO HÀNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 2}">
                                                                                    GIAO HÀNG THÀNH CÔNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 3}">
                                                                                    HỦY
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </td>
                                                                            <%--                                                                        <td>--%>
                                                                            <%--                                                                            <c:choose>--%>
                                                                            <%--                                                                                <c:when test="${c.trangThai == 1}">--%>
                                                                            <%--                                                                                    <a href="/update2/${kh.maKhachHang}/${c.maHoaDon}">Đã nhận được hàng</a>--%>
                                                                            <%--                                                                                </c:when>--%>
                                                                            <%--                                                                            </c:choose>--%>
                                                                            <%--                                                                        </td>--%>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="tab4" class="tab-content" style="display: none;
            padding: 20px;
            border: 1px solid #aaa;
            ">
                                                    <div class="table_desc">
                                                        <div class="cart_page table-responsive">
                                                            <table>
                                                                <thead>
                                                                <tr>
                                                                    <th class="product_remove">Mã hóa đơn</th>
                                                                    <th class="product_thumb">Người nhận</th>
                                                                    <th class="product_thumb">Trạng Thái</th>
                                                                    <th class="product_total">Yêu Cầu</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${list2}" var="c">
                                                                    <tr>
                                                                        <td class="product_remove">${c.maHoaDon}</td>
                                                                        <td class="product_thumb">${c.nguoiNhan}</td>
                                                                        <td class="product_total">
                                                                            <c:choose>
                                                                                <c:when test="${c.trangThai == 0}">
                                                                                    CHỜ XÁC NHẬN
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 1}">
                                                                                    ĐANG GIAO HÀNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 2}">
                                                                                    GIAO HÀNG THÀNH CÔNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 3}">
                                                                                    HỦY
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td class="product_total a-hover">
                                                                            <c:choose>
                                                                                <c:when test="${c.trangThai == 2}">
                                                                                    <a href="/danh_gia_view/${c.maHoaDon}"
                                                                                       class="custom-button">
                                                                                        Đánh giá
                                                                                    </a>
                                                                                </c:when>
                                                                            </c:choose>

                                                                                <%--                                                                            <c:choose>--%>
                                                                                <%--                                                                                <c:when test="${c.trangThai == 0}">--%>
                                                                                <%--                                                                                    <a href="/update1/${kh.maKhachHang}/${c.maHoaDon}"--%>
                                                                                <%--                                                                                       style="color: red">Hủy</a>--%>
                                                                                <%--                                                                                </c:when>--%>
                                                                                <%--                                                                            </c:choose>--%>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="tab5" class="tab-content" style=" display: none;
            padding: 20px;
            border: 1px solid #aaa;
            ">
                                                    <div class="table_desc">
                                                        <div class="cart_page table-responsive">
                                                            <table>
                                                                <thead>
                                                                <tr>
                                                                    <th class="product_remove">Mã hóa đơn</th>
                                                                    <th class="product_thumb">Người nhận</th>
                                                                    <th class="product_thumb">Trạng Thái</th>
                                                                    <th class="product_total">Lý do hủy</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${list3}" var="c">
                                                                    <tr>
                                                                        <td class="product_remove">${c.maHoaDon}</td>
                                                                        <td class="product_thumb">${c.nguoiNhan}</td>
                                                                        <td class="product_total" style="color: red">
                                                                            <c:choose>
                                                                                <c:when test="${c.trangThai == 0}">
                                                                                    CHỜ XÁC NHẬN
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 1}">
                                                                                    ĐANG GIAO HÀNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 2}">
                                                                                    GIAO HÀNG THÀNH CÔNG
                                                                                </c:when>
                                                                                <c:when test="${c.trangThai == 3}">
                                                                                    HỦY
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td >
                                                                        ${c.ghiChu}
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </section>

                                </div>
                            </div>

                            <div id="addFormContainer1" style="display: none;">
                                <div class="container-fluid">
                                    <div class="container">
                                        <form method="post" id="addForm1">
                                            <h2>Đánh giá sản phẩm</h2>
                                            <input type="hidden" name="maKhachHang" value="${kh.maKhachHang}">
                                            <div class="form-group">
                                                <h5>Chọn sản phẩm muốn đánh giá: </h5>
                                                <select class="form-control" id="san-pham" name="san-pham">
                                                    <c:forEach items="${listHoaDonChiTiets}" var="list">
                                                        <option value="${list.chiTietSanPham.sanPham.tenSanPham}">
                                                                ${list.chiTietSanPham.sanPham.tenSanPham}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <br>
                                            <br>
                                            <div class="form-group">
                                                <h5>Nhận xét:</h5>
                                                <textarea id="comment" name="binhLuan" class="form-control"
                                                          placeholder="Nhận xét của bạn" required></textarea>
                                                <span id="errorComment" class="text-danger"></span>
                                            </div>
                                            <br>
                                            <button class="btn-primary" type="submit" formaction="/danh_gia"
                                                    onclick="validateComment()">Gửi đánh giá
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="address">
                                <p>The following addresses will be used on the checkout page by default.</p>
                                <h4 class="billing-address">Billing address</h4>
                                <a href="#" class="view">Edit</a>
                                <p><strong>Bobby Jackson</strong></p>
                                <address>
                                    House #15<br>
                                    Road #1<br>
                                    Block #C <br>
                                    Banasree <br>
                                    Dhaka <br>
                                    1212
                                </address>
                                <p>Bangladesh</p>
                            </div>
                            <div class="tab-pane fade" id="account-details">
                                <h3>Chi tiết tài khoản </h3>
                                <form action="/update1/${kh.maKhachHang}" id="myForm"
                                      method="post">
                                    <p>
                                        <label>Tên <span>*</span></label>
                                        <input type="text" id="nguoiNhan" name="nguoiNhan" value="${kh.ten}"
                                               required>
                                        <span id="nguoiNhanError" class="error"></span>
                                    </p>
                                    <p>
                                        <label>Email <span>*</span></label>
                                        <input type="email" id="email" value="${kh.email}" name="email" required>
                                        <span id="emailError" class="error"></span>

                                    </p>
                                    <p>
                                        <label>Mật khẩu <span>*</span></label>
                                    <div class="password-container">
                                        <input type="password" name="matKhau" id="passwordField" minlength="6"
                                               value="${kh.matKhau}" required>

                                        <span class="toggle-password"
                                              onclick="togglePassword('passwordField', 'toggleIcon1')">
            <i class="fas fa-eye" id="toggleIcon1"></i>
        </span>
                                        <span id="passwordError" class="error"></span>
                                    </div>
                                    </p>
                                    <p>
                                        <label>Căn Cước Công Dân <span>*</span></label>
                                        <input type="text" name="cccd" id="cccd" value="${kh.cccd}" required>
                                        <span id="cccdError" class="error"></span>
                                    </p>
                                    <p>
                                        <label>Ngày Sinh <span>*</span></label>
                                        <input type="date" name="ngaySinh" id="ngaySinh"
                                               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(request.getAttribute("ngaySinh")) %>"
                                               required>
                                        <span id="dobError" class="error"></span>
                                    </p>
                                    <p>
                                        <label>Số điện thoại <span>*</span></label>
                                        <input type="text" id="sdt" value="${kh.sdt}" name="sdt" required>
                                        <span id="sdtError" class="error"></span>
                                    </p>
                                    <p>
                                        <label>Địa chỉ <span>*</span></label>
                                        <input type="text" id="diaChi"
                                               name="diaChi" value="${kh.diaChi}" required>
                                        <span id="diaChiError" class="error"></span>
                                    </p>
                                    <div class="login_submit">
                                        <button type="button" onclick="ValidateDk()">Cập nhật</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Maincontent  -->
    </div>
    <!--pos page inner end-->
</div>
</div>
<!--pos page end-->

<!--footer area start-->
<div class="footer_area">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer_widget">
                        <h3>Về chúng tôi</h3>
                        <p>Chào mừng bạn đến với trang web bán điện thoại của chúng tôi. Chúng tôi cung cấp một loạt các
                            sản phẩm điện thoại di động từ các thương hiệu hàng đầu với chất lượng tốt nhất.</p>
                        <%--                        <p>Chúng tôi cam kết cung cấp dịch vụ chăm sóc khách hàng tốt nhất cùng với sản phẩm chất lượng và trải nghiệm mua sắm thuận tiện.</p>--%>
                        <div class="footer_widget_contect">
                            <p><i class="fa fa-map-marker" aria-hidden="true"></i> 14A, Ngõ 80/47 Đường Xuân Phương,
                                phường Phương Canh
                                , quận Nam Từ Liêm, Hà Nội</p>

                            <p><i class="fa fa-mobile" aria-hidden="true"></i> 0374236759</p>
                            <a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i> phamson2012003@gmail.com
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer_widget">
                        <h3>Tài khoản</h3>
                        <ul>
                            <li><a href="#">Tài khoản</a></li>
                            <li><a href="#">Đơn đặt hàng </a></li>
                            <li><a href="#">Địa chỉ</a></li>
                            <li><a href="#">Đăng nhập</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer_widget">
                        <h3>Thông tin</h3>
                        <ul>
                            <li><a href="#">Khuyến mãi</a></li>
                            <li><a href="#">Cửa hàng </a></li>
                            <li><a href="#">Các điều khoản và điều kiện</a></li>
                            <li><a href="#">Về chúng tôi</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer_widget">
                        <h3>Tính năng bổ sung</h3>
                        <ul>
                            <li><a href="#"> Nhãn hiệu</a></li>
                            <li><a href="#"> Chi nhánh </a></li>
                            <li><a href="#"> Khuyến mãi </a></li>
                            <li><a href="#"> Chính sách bảo mật </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer_bottom">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="copyright_area">
                        <ul>
                            <li><a href="#"> Liên hệ </a></li>
                            <li><a href="#"> Dịch vụ khách hàng </a></li>
                            <li><a href="#"> Chính sách bảo mật </a></li>
                        </ul>
                        <p>Bản quyền & bản sao; 2023 <a href="#">Pos Coron</a>Đã đăng ký Bản quyền. </p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="footer_social text-right">
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            <li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"
                                                                 aria-hidden="true"></i></a></li>

                            <li><a href="#"><i class="fa fa-wifi" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer area end-->


<!-- Modal -->
<div class="modal fade" id="addFormContainerNT" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">NẠP TIỀN</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Nội dung modal -->
                <form method="post" id="addForm">
                    <div class="form-group">
                        <input type="text" name="soTien" class="form-control" id="soTien" placeholder="Nhập số tiền muốn nạp">
                        <span id="errorSoTien" class="text-danger"></span>
                    </div>
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Đóng
                    </button>
                    <button class="btn btn-success" formaction="/user/nap_tien/${maKhachHang}" type="submit" onclick="addProduct()" id="idThem">Nạp tiền</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // Sự kiện khi người dùng bấm nút "Đóng" trong modal
        $('.btn-secondary').on('click', function () {
            // Xóa dữ liệu đã nhập vào trường và xóa thông báo lỗi
            $('#soTien').val('');
            $('#errorSoTien').text('');
        });

        // Sự kiện khi modal được ẩn đi (đóng modal)
        $('#addFormContainerNT').on('hide.bs.modal', function () {
            // Xóa dữ liệu đã nhập vào trường và xóa thông báo lỗi
            $('#soTien').val('');
            $('#errorSoTien').text('');
        });
    });

    function addProduct() {
        var soTienInput = document.getElementById("soTien").value;

        // Kiểm tra xem giá trị có phải là số và là số dương không
        if (!(/^\d*\.?\d+$/.test(soTienInput)) || parseFloat(soTienInput) <= 0) {
            document.getElementById("errorSoTien").innerHTML = "Vui lòng nhập số tiền hợp lệ.";
            event.preventDefault();
        } else if (parseFloat(soTienInput) < 10000) {
            document.getElementById("errorSoTien").innerHTML = "Số tiền phải lớn hơn 10,000 VNĐ.";
            event.preventDefault();
        }
    }

</script>
<script>
    function openTab1() {

        document.getElementById("tab1").style.display = "block";
        document.getElementById("optab1").style.background = "white";

        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";


    }

    function openTab3() {
        document.getElementById("tab3").style.display = "block";
        document.getElementById("optab3").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";


        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";
    }

    function openTab4() {
        document.getElementById("tab4").style.display = "block";
        document.getElementById("optab4").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";


        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";
    }

    function openTab5() {
        document.getElementById("tab5").style.display = "block";
        document.getElementById("optab5").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";


        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";
    }
</script>
<script>
    // Get references to the button and form container
    var addFormContainer2 = document.getElementById("addFormContainer1");

    var noneOrBlock = "${noneOrBlock}";

    if (noneOrBlock == "block") {
        addFormContainer2.style.display = "block";

        document.getElementById("tab4").style.display = "block";
        document.getElementById("optab4").style.background = "white";
    } else {
        addFormContainer2.style.display = "none";

        document.getElementById("tab1").style.display = "block";
        document.getElementById("optab1").style.background = "white";
    }

    // Add an event listener to the background overlay
    addFormContainer2.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer2) {
            // Hide the form
            addFormContainer2.style.display = "none";
        }
    });
</script>
<script>
    function validateComment() {
        var comment = document.getElementById("comment").value;
        var errorComment = document.getElementById('errorComment');
        var addFormContainer = document.getElementById("addFormContainer1");
        var forbiddenWords = ["lol", "cc", "dm", "vai", "lon", "du", "me", "concac", "đéo", "con cặc"];
        var foundForbiddenWord = false;

        forbiddenWords.forEach(function (word) {
            if (comment.toLowerCase().includes(word)) {
                foundForbiddenWord = true;
            }
        });
        if (foundForbiddenWord) {
            addFormContainer.style.display = 'none';
            Swal.fire({
                icon: 'error',
                html: '<div class="swal-text">Xin lỗi, từ ngữ bạn sử dụng không phù hợp</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true

            });

            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = 'block';
            }, 1000);

            event.preventDefault();
        }
    }

    function confirmLogout() {
        Swal.fire({
            title: 'Bạn có chắc chắn muốn đăng xuất?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "/loginView"; // Chuyển hướng đến trang đăng xuất nếu xác nhận
            } else {
                // Ngừng hoặc xử lý khác nếu người dùng không xác nhận đăng xuất
            }
        });
    }

    function ValidateDk() {
        var nguoiNhan = document.getElementById('nguoiNhan').value;
        var sdt = document.getElementById('sdt').value;
        var email = document.getElementById('email').value;
        var diaChi = document.getElementById('diaChi').value;


        var nguoiNhanError = document.getElementById('nguoiNhanError');
        var diaChiError = document.getElementById('diaChiError');
        var emailError = document.getElementById('emailError');
        var emailPattern = /^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;


        var sdtInput = document.getElementsByName('sdt')[0];
        var sdtError = document.getElementById('sdtError');
        var sdtPattern = /^\d{10,11}$/;

        var passwordInput = document.getElementsByName('matKhau')[0].value;
        var passwordError = document.getElementById('passwordError');
        var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;


        var dobInput = document.getElementsByName('ngaySinh')[0].value;
        var dobError = document.getElementById('dobError');
        var selectedDate = new Date(dobInput);
        var currentDate = new Date();
        currentDate.setHours(0, 0, 0, 0);
        var cccdInput = document.getElementById("cccd").value;
        var cccdError = document.getElementById('cccdError');
        var cccdFormat = /^\d{12}$/;


        if (nguoiNhan.trim() == '') {
            sdtError.textContent = '';
            diaChiError.textContent = '';
            emailError.textContent = '';
            dobError.textContent = '';
            passwordError.textContent = '';

            cccdError.textContent = '';
            nguoiNhanError.textContent = 'Vui lòng nhập tên người nhận.';

        } else if (email.trim() == '') {
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = '';
            emailError.textContent = 'Vui lòng nhập email.';

        } else if (!emailPattern.test(email.trim())) {
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = '';
            emailError.textContent = 'Email không hợp lệ.';
        } else if (passwordInput.trim() == '') {
            sdtError.textContent = '';
            diaChiError.textContent = '';
            emailError.textContent = '';
            dobError.textContent = '';
            nguoiNhanError.textContent = '';

            cccdError.textContent = '';
            passwordError.textContent = 'Vui lòng nhập mật khẩu.';
        } else if (!passwordInput.match(passwordRegex)) {
            nguoiNhanError.textContent = '';
            sdtError.textContent = '';
            emailError.textContent = '';
            dobError.textContent = '';

            diaChiError.textContent = '';
            cccdError.textContent = '';
            passwordError.textContent = 'Mật khẩu cần chứa 6 ký tự ít nhất một chữ cái viết thường, một chữ cái viết hoa và một số.!';
        } else if (cccdInput.trim() == '') {
            sdtError.textContent = '';
            diaChiError.textContent = '';
            emailError.textContent = '';
            dobError.textContent = '';
            passwordError.textContent = '';
            nguoiNhanError.textContent = '';

            cccdError.textContent = 'Vui lòng nhập CCCD.'
        } else if (!cccdInput.trim().match(cccdFormat)) {
            nguoiNhanError.textContent = '';
            sdtError.textContent = '';
            emailError.textContent = '';
            dobError.textContent = '';
            passwordError.textContent = '';
            diaChiError.textContent = '';

            cccdError.textContent = 'Căn cước công dân phải có 12 số.';
        } else if (dobInput.trim() === '') {
            sdtError.textContent = '';
            diaChiError.textContent = '';
            emailError.textContent = '';
            nguoiNhanError.textContent = '';
            passwordError.textContent = '';

            cccdError.textContent = '';
            dobError.textContent = 'Vui lòng nhập ngày sinh.';
        } else if (selectedDate >= currentDate) {
            sdtError.textContent = '';
            diaChiError.textContent = '';
            emailError.textContent = '';
            nguoiNhanError.textContent = '';
            passwordError.textContent = '';

            cccdError.textContent = '';
            dobError.textContent = 'Ngày sinh phải nhỏ hơn ngày hiện tại.';
        } else if (sdt.trim() == '') {
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            emailError.textContent = '';
            dobError.textContent = '';
            passwordError.textContent = '';

            cccdError.textContent = '';
            sdtError.textContent = 'Vui lòng nhập số điện thoại.';

        } else if (!sdtPattern.test(sdtInput.value)) {
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = 'Số điện thoại không hợp lệ.';
        } else if (diaChi.trim() == '') {
            nguoiNhanError.textContent = '';
            sdtError.textContent = '';
            emailError.textContent = '';
            dobError.textContent = '';
            passwordError.textContent = '';

            cccdError.textContent = '';
            diaChiError.textContent = 'Vui lòng nhập địa chỉ.';
        } else {
            Swal.fire({
                title: 'Bạn có muốn Cập nhật không?',
                showCancelButton: true,
                confirmButtonText: 'Có',
                cancelButtonText: 'Không'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng chọn "Có", submit biểu mẫu đăng ký
                    document.getElementById('myForm').submit();
                    Swal.fire({
                        title: "Cập nhật thành công!",
                        icon: "success",
                        confirmButtonText: "Đóng"
                    });
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire('Hủy bỏ', 'Bạn không thực hiện cập nhật.', 'info');
                }
            });
        }
    }

    function togglePassword(fieldId, iconId) {
        var passwordField = document.getElementById(fieldId);
        var toggleIcon = document.getElementById(iconId);

        if (passwordField.type === "password") {
            passwordField.type = "text";
            toggleIcon.classList.remove("fa-eye");
            toggleIcon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            toggleIcon.classList.remove("fa-eye-slash");
            toggleIcon.classList.add("fa-eye");
        }
    }
</script>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<!-- all js here -->
<script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../../../assets/js/popper.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/ajax-mail.js"></script>
<script src="../../../assets/js/plugins.js"></script>
<script src="../../../assets/js/main.js"></script>
</body>

</html>