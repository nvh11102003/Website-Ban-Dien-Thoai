<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Điện thoại thông minh</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
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
    <style>
        #modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 330px;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            z-index: 10;
        }

        #modal h2 {
            margin-top: 0;
            margin-bottom: 10px;
        }

        #modal .form-group {
            margin-bottom: 10px;
        }

        #modal input,
        #modal textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            outline: none;
        }

        #modal button {
            margin-top: 10px;
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
        }

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
            display: flex;
        }

        #addForm1 {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }
    </style>
</head>
<body>
<script>
    function formatCurrencyVND(number) {
        return new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(number);
    }
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
                                <a href="/home_clients/${kh.maKhachHang}"><img src="../../../assets/img/logo/AZURA.png"
                                                                               alt="" style="height: 80px;width: 90px"></a>
                            </div>
                        </div>
                        <!--logo end-->
                        <div class="col-lg-9 col-md-9">
                            <div class="header_right_info">
<%--                                <div class="search_bar">--%>
<%--                                    <form action="#">--%>
<%--                                        <input placeholder="Search..." type="text">--%>
<%--                                        <button type="submit"><i class="fa fa-search"></i></button>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
                                <div class="shopping_cart">
                                    <a href="/cart/${kh.maKhachHang}"><i class="fa fa-shopping-cart"></i> <i
                                            class="fa fa-angle-down"></i></a>
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
                                                                <li><a href="/MyAccount/${kh.maKhachHang}">Thông tin tài khoản </a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="mega_items">
                                                            <ul>
                                                                <li><a href="/contact1/${kh.maKhachHang}">Liên hệ

                                                                </a></li>
                                                                <li><a href="/cart/${kh.maKhachHang}">Giỏ hàng</a></li>
                                                                <li><a href="/hoadon/${kh.maKhachHang}">Hóa Đơn</a></li>
                                                                <li><a onclick="confirmLogout()" title="Login">Đăng xuất <i
                                                                        class="fas fa-sign-out-alt"></i></a></li>
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
                                <li>Hóa Đơn</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->


            <!--shopping cart area start -->
            <div class="shopping_cart_area">
                <form action="#">
                    <div class="row">
                        <div class="col-12">
                            <div class="table_desc">
                                <div class="cart_page table-responsive">
                                    <table>
                                        <thead>
                                        <tr>
                                            <th class="product_remove">Mã hóa đơn</th>
                                            <th class="product_thumb">Người nhận</th>
                                            <th class="product_name">Địa Chỉ Nhận</th>
                                            <th class="product-price">Sđt Người Nhận</th>
                                            <th class="product_quantity">Ngày Tạo</th>
                                            <th class="product_total">Trạng Thái</th>
                                            <th class="product_total">Loại ThanhToán</th>
                                            <th class="product_total">Yêu Cầu</th>
                                            <th class="product_total">Chi Tiết hóa đơn</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${hd}" var="c">
                                            <tr>
                                                <td class="product_remove">${c.maHoaDon}</td>
                                                <td class="product_thumb">${c.nguoiNhan}</td>
                                                <td class="product_name">${c.diaChi}, ${c.xa}, ${c.huyen}, ${c.tinh}</td>
                                                <td class="product-price">${c.sdt}</td>
                                                <td class="product_quantity">${c.ngayTao}</td>
                                                <td class="product_total">
                                                    <c:choose>
                                                        <c:when test="${c.trangThai == 0}">
                                                            Chờ xác nhận
                                                        </c:when>
                                                        <c:when test="${c.trangThai == 1}">
                                                            Đang giao hàng
                                                        </c:when>
                                                        <c:when test="${c.trangThai == 2}">
                                                            Giao hàng thành công
                                                        </c:when>
                                                        <c:when test="${c.trangThai == 3}">
                                                            Hủy
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td class="product_total">
                                                    <c:choose>
                                                        <c:when test="${c.loaiThanhToan == 0}">
                                                            Thanh toán khi nhận hàng
                                                        </c:when>
                                                        <c:when test="${c.loaiThanhToan == 1}">
                                                            Đã thanh toán
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${c.trangThai == 0}">
                                                            <a href="/update/${kh.maKhachHang}/${c.maHoaDon}">Hủy</a>
                                                        </c:when>
                                                    </c:choose>
<%--                                                    <c:choose>--%>
<%--                                                        <c:when test="${c.trangThai == 2}">--%>
<%--                                                            <a href="/danh_gia_view/${c.maHoaDon}" onclick="showReviewForm()" class="custom-button">--%>
<%--                                                                Đánh giá--%>
<%--                                                            </a>--%>
<%--                                                        </c:when>--%>
<%--                                                    </c:choose>--%>
                                                </td>
                                                <td>
                                                    <a href="/hoadon/${kh.maKhachHang}/${c.maHoaDon}"
                                                       class="modal-title">Hoá đơn chi tiết</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--shopping cart area end -->

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
                        <p>Chào mừng bạn đến với trang web bán điện thoại của chúng tôi. Chúng tôi cung cấp một loạt các sản phẩm điện thoại di động từ các thương hiệu hàng đầu với chất lượng tốt nhất.</p>
                        <%--                        <p>Chúng tôi cam kết cung cấp dịch vụ chăm sóc khách hàng tốt nhất cùng với sản phẩm chất lượng và trải nghiệm mua sắm thuận tiện.</p>--%>
                        <div class="footer_widget_contect">
                            <p><i class="fa fa-map-marker" aria-hidden="true"></i> 14A, Ngõ 80/47 Đường Xuân Phương, phường Phương Canh
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
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="modal_body">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-7 col-sm-12">
                            <div class="modal_right">
                                <form class="row" id="form-update">
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Mã hóa đơn</label>
                                        <%--                                        <input class="form-control" type="text" required id="maHoaDon" value="maHoaDon"--%>
                                        name="maHoaDon">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Người Nhận</label>
                                        <input class="form-control" type="text" required id="nguoiNhan"
                                               value="nguoiNhan"
                                               name="nguoiNhan">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Số Điện Thoại</label>
                                        <input class="form-control" type="text" required id="sdt" value="sdt"
                                               name="sdt">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Hình thức thanh toán</label>
                                        <select class="form-control" required id="trangThai" name="trangThai">
                                            <option value="0">Chưa thanh toán</option>
                                            <option value="1">Đã thanh toán</option>
                                            <option value="2">Đang chờ</option>
                                        </select>
                                    </div>
                                </form>
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Hoá đơn chi tiết</h4>
                                </div>
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <table class="table table-light table-borderless table-hover text-center mb-0">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th>Sản Phẩm</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Tổng</th>
                                        </tr>
                                        </thead>
                                        <tbody class="align-middle">
                                        <c:forEach items="${listHDCT}" var="hdct">
                                            <tr>
                                                <td class="align-middle">${hdct.chiTietSanPham.sanPham.tenSanPham}</td>
                                                <td class="align-middle">
<%--                                                        ${hdct.chiTietSanPham.giaBan}--%>
                                                            <script>document.write(formatCurrencyVND( ${hdct.chiTietSanPham.giaBan}))</script>
                                                </td>
                                                <td class="align-middle">${hdct.soLuongMua}</td>
                                                <td class="align-middle">
<%--                                                        ${hdct.chiTietSanPham.giaBan * hdct.soLuongMua}--%>
                                                            <script>document.write(formatCurrencyVND(${hdct.chiTietSanPham.giaBan * hdct.soLuongMua}))</script>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    function showModal() {
        document.getElementById('modal').style.display = 'block';
    }

    function hideModal() {
        document.getElementById('modal').style.display = 'none';
    }

    //view modal update
    function editProductModal(button) {
        var row = button.closest("tr");
        var maHoaDon = row.cells[0].textContent;
        var nguoiNhan = row.cells[1].textContent;
        var sdt = row.cells[3].textContent;
        var trangThai = row.cells[5].textContent;


        document.getElementById("maHoaDon").value = maHoaDon;
        document.getElementById("nguoiNhan").value = nguoiNhan;
        document.getElementById("sdt").value = sdt;
        // document.getElementById("trangThai").value = trangThai;

        var selectElementTT = document.getElementById("trangThai");
        for (var i = 0; i < selectElementTT.options.length; i++) {
            var option = selectElementTT.options[i];
            if (option.text === trangThai) {
                option.selected = true;
                break;
            }
        }

        // Mở modal
        $('#ModalUP').modal('show');
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
</script>
<script>
    // Get references to the button and form container
    var addFormContainer2 = document.getElementById("addFormContainer1");

    const reviewForm = document.getElementById("addFormContainer1");


    function showReviewForm() {
        reviewForm.style.display = "block";
    }

    // Tạo một biến để lưu trữ vị trí của form đánh giá sản phẩm
    // let reviewFormPosition;
    //
    // // Khi form đánh giá sản phẩm được hiển thị
    // reviewForm.addEventListener("show", function() {
    //     // Lưu trữ vị trí của form đánh giá sản phẩm
    //     reviewFormPosition = reviewForm.getBoundingClientRect();
    // });

    // Khi người dùng click ở vùng bên ngoài form đánh giá sản phẩm
    // window.addEventListener("click", function(event) {
    //     // Kiểm tra xem vị trí của form đánh giá sản phẩm có nằm trong vùng click hay không
    //     if (!reviewFormPosition.contains(event.target)) {
    //         // Ẩn form đánh giá sản phẩm
    //         reviewForm.style.display = "none";
    //     }
    // });
    // Add an event listener to the background overlay
    addFormContainer2.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer2) {
            // Hide the form
            addFormContainer2.style.display = "none";
        }
    });
</script>

<input type="text" class="text-white" name="" id="" value="${kh.maKhachHang}" disabled>

<!-- all js here -->
<script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../../../assets/js/popper.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/ajax-mail.js"></script>
<script src="../../../assets/js/plugins.js"></script>
<script src="../../../assets/js/main.js"></script>
</body>

</html>