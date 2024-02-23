<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <!-- all css here -->
    <link rel="stylesheet" href="../../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../assets/css/plugin.css">
    <link rel="stylesheet" href="../../../assets/css/bundle.css">
    <link rel="stylesheet" href="../../../assets/css/style.css">
    <link rel="stylesheet" href="../../../assets/css/responsive.css">
    <script src="../../../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>
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
    </style>

</head>

<body>
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
                                    <%--                                    <li><a href="/home" title="Contact">Contact</a></li>--%>
                                    <%--                                    <li><a href="/home" title="My account">My account</a></li>--%>
                                    <%--                                    <li><a href="/home" title="My cart">My cart</a></li>--%>
                                    <li><a onclick="confirmLogout()" title="Login">Đăng xuất <i
                                            class="fas fa-sign-out-alt"></i></a></li>
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
                                <a href="/home"><img src="../../../assets/img/logo/AZURA.png"
                                                     alt="" style="height: 80px;width: 90px"></a>
                            </div>
                        </div>
                        <!--logo end-->
                        <div class="col-lg-9 col-md-9">
                            <div class="header_right_info">
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
                                                                <li><a onclick="check()">Thông tin tài khoản </a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="mega_items">

                                                            <ul>
                                                                <li><a href="/contact">Liên hệ</a></li>
                                                                <li><a href="/cart/${kh.maKhachHang}">Giỏ hàng</a></li>
                                                                <li><a href="/hoadon/${kh.maKhachHang}">Hóa Đơn</a></li>

                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li><a href="/blog">blog</a>
                                            </li>
                                            <li><a href="/contact">Liên hệ chúng tôi</a></li>

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
                                <li>Khách hàng</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->

            <!-- customer login start -->
            <div class="customer_login">
                <div class="row">
                    <!--login area start-->
                    <div class="col-lg-12 col-md-12">
                        <div class="account_form">
                            <h2> Thông tin khách hàng</h2>
                            <form action="/update1/${kh.maKhachHang}" id="myForm"
                                  method="post">
                                <p>
                                    <label>Tên <span>*</span></label>
                                    <%--                                        <input type="text" name="ten" value="${kh.ten}" required>--%>
                                    <input type="text" id="nguoiNhan" name="nguoiNhan" value="${kh.ten}"
                                           required>
                                    <span id="nguoiNhanError" class="error"></span>
                                </p>
                                <p>
                                    <label>Email <span>*</span></label>
                                    <%--                                        <input type="email" name="email" id="emailInput" value="${kh.email}" required>--%>
                                    <input type="email" id="email" value="${kh.email}" name="email" required>
                                    <span id="emailError" class="error"></span>

                                </p>
                                <p>
                                    <label>Mật khẩu <span>*</span></label>
                                <div class="password-container">
                                    <input type="password" name="matKhau" id="passwordField" minlength="6" value="${kh.matKhau}" required>

                                    <span class="toggle-password"
                                          onclick="togglePassword('passwordField', 'toggleIcon1')">
            <i class="fas fa-eye" id="toggleIcon1"></i>
        </span>
                                    <span id="passwordError" class="error"></span>
                                </div>
                                </p>
                                <p>
                                    <label>Căn Cước Công Dân <span>*</span></label>
                                    <%--                                        <input type="text" name="cccd" value="${kh.cccd}" required>--%>
                                    <input type="text" name="cccd" id="cccd" value="${kh.cccd}" required>
                                    <span id="cccdError" class="error"></span>
                                </p>
                                <p>
                                    <label>Ngày Sinh <span>*</span></label>
                                    <%--                                        <input type="date" name="ngaySinh" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(request.getAttribute("ngaySinh")) %>" required>--%>
                                    <input type="date" name="ngaySinh" id="ngaySinh"
                                           value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(request.getAttribute("ngaySinh")) %>"
                                           required>
                                    <span id="dobError" class="error"></span>
                                </p>
                                <p>
                                    <label>Số điện thoại <span>*</span></label>
                                    <%--                                        <input type="text" name="sdt" value="${kh.sdt}" required>--%>
                                    <input type="text" id="sdt" value="${kh.sdt}" name="sdt" required>
                                    <span id="sdtError" class="error"></span>
                                </p>
                                <p>
                                    <label>Địa chỉ <span>*</span></label>
                                    <%--                                        <input type="text" name="diaChi" value="${kh.diaChi}" required>--%>
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
                    <!--register area end-->
                </div>
            </div>
            <!-- customer login end -->

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
<script>
    function check() {
        Swal.fire({
            title: 'Bạn chưa đăng nhập?',
            text: 'Vui lòng đăng nhập',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                // Chuyển hướng đến đường dẫn mong muốn khi đồng ý
                window.location.href = '/loginView';
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire('Đã hủy bỏ', 'Hành động không được thực hiện.', 'error');
            }
        });
    };
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
        }else {
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

<!-- all js here -->
<script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../../../assets/js/popper.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/ajax-mail.js"></script>
<script src="../../../assets/js/plugins.js"></script>
<script src="../../../assets/js/main.js"></script>
</body>

</html>