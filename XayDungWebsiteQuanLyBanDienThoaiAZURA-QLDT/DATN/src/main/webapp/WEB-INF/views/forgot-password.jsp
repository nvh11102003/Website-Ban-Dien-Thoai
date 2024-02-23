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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                            <li><a href="#"><img src="../../../assets/img/logo/fontlogo2.jpg" alt=""> French
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
                                    <%--                                    <li><a href="#" title="Contact">Contact</a></li>--%>
                                    <%--                                    <li><a href="/home" title="My account">My account</a></li>--%>
                                    <%--                                    <li><a href="/home" title="My cart">My cart</a></li>--%>
                                        <li><a onclick="confirmLogout()" title="Login">Đăng nhập <i
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
                                <a href="/home_clients/${kh.maKhachHang}"><img src="../../../assets/img/logo/AZURA.png" alt="" style="height: 80px;width: 90px"></a>
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
                                            <li class="active"><a href="/home">Trang chủ</a>
                                            </li>
                                            <li><a href="/hien-thi-shop">Điện thoại thông minh</a>

                                            </li>
                                            <li><a href="#">Trang</a>
                                                <div class="mega_menu">
                                                    <div class="mega_top fix">
                                                        <div class="mega_items">

                                                            <ul>
                                                                <li><a href="#">Thông tin tài khoản</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="mega_items">

                                                            <ul>
                                                                <li><a href="/contact">Liên hệ</a></li>
                                                                <li><a onclick="check()">Giỏ hàng</a></li>
                                                                <li><a onclick="check()">Hóa Đơn</a></li>

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
                                <li><a href="/home">Trang chủ</a></li>
                                <li><i class="fa fa-angle-right"></i></li>
                                <li>Đăng nhập</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->

            <!-- customer login start -->
            <div class="customer_login">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="account_form">
                            <h2>Quên Mật Khẩu</h2>
                            <form id="forgotPasswordForm">
                                <p>
                                    <label>Email <span>*</span></label>
                                    <input type="email" name="email" id="email">
                                    <span id="emailError" style="color: red;"></span>
                                </p>
                                <div class="login_submit">
                                    <!-- Gọi hàm checkEmailAndSendPassword khi người dùng nhấn nút -->
                                    <button type="button" onclick="checkEmailAndSendPassword()">Gửi yêu cầu</button>
                                    <button type="button" onclick="window.location.href='/loginView'">Quay lại</button>
                                </div>
                            </form>
                        </div>
                        <script>

                            function checkEmailAndSendPassword() {
                                var email = document.getElementById('email').value;
                                var emailError = document.getElementById('emailError');
                                var emailPattern = /^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                                // Xóa thông báo lỗi trước khi kiểm tra lại
                                emailError.textContent = '';

                                if (email.trim() == '') {
                                    emailError.textContent = 'Vui lòng nhập email.';
                                } else if (!emailPattern.test(email.trim())) {
                                    emailError.textContent = 'Email không hợp lệ.';
                                } else {
                                    // Tiến hành kiểm tra email bằng AJAX nếu email hợp lệ
                                    $.ajax({
                                        type: 'POST',
                                        url: '/auth/check-email',
                                        contentType: 'application/json',
                                        data: JSON.stringify({ email: email }),
                                        success: function(response) {
                                            if (response.exists) {
                                                sendNewPassword(email);
                                            } else {
                                                // Hiển thị thông báo nếu email không tồn tại
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Thông báo',
                                                    text: 'Tài khoản chưa được đăng kí vui lòng đăng ký hoặc dùng email khác.'
                                                });
                                            }
                                        },
                                        error: function(xhr, status, error) {
                                            // Xử lý lỗi khi gửi yêu cầu
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Thông báo',
                                                text: 'Đã xảy ra lỗi khi kiểm tra email.'
                                            });
                                        }
                                    });
                                }
                            }
                            function sendNewPassword(email) {
                                $.ajax({
                                    type: 'POST',
                                    url: '/auth/forgot-password',
                                    data: { email: email },
                                    success: function(response) {
                                        // Hiển thị thông báo khi gửi mật khẩu mới thành công
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Thông báo',
                                            text: 'Mật khẩu mới đã được gửi đến email của bạn.'
                                        });

                                        // Chuyển hướng về đường dẫn /loginView sau một khoảng thời gian (ví dụ: 3 giây)
                                        setTimeout(function() {
                                            window.location.href = '/loginView';
                                        }, 2000); // Thời gian chờ tính bằng mili giây (3000ms = 3 giây)
                                    },
                                    error: function(xhr, status, error) {
                                        // Hiển thị thông báo nếu có lỗi khi gửi mật khẩu mới
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Thông báo',
                                            text: 'Đã xảy ra lỗi khi gửi mật khẩu mới.'
                                        });
                                    }
                                });
                            }

                        </script>
                    </div>
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
<script>
    function check(){
        Swal.fire({
            title: 'Bạn chưa đăng nhập?',
            text: 'Yêu cầu đăng nhập !',
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
            title: 'Bạn có chắc chắn muốn đăng nhập?',
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


<!-- all js here -->
<script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../../../assets/js/popper.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/ajax-mail.js"></script>
<script src="../../../assets/js/plugins.js"></script>
<script src="../../../assets/js/main.js"></script>
</body>

</html>