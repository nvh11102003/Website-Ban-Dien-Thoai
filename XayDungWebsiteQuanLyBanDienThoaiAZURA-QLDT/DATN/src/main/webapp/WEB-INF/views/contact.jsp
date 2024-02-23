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
    <link rel="stylesheet" href="assets\css\bootstrap.min.css">
    <link rel="stylesheet" href="assets\css\plugin.css">
    <link rel="stylesheet" href="assets\css\bundle.css">
    <link rel="stylesheet" href="assets\css\style.css">
    <link rel="stylesheet" href="assets\css\responsive.css">
    <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<style>
    .contact_area {
        padding: 50px 0;
        background-color: #f9f9f9;
    }

    .contact_message h1 {
        font-size: 36px;
        margin-bottom: 20px;
    }

    .contact_message p {
        font-size: 16px;
        line-height: 1.6;
    }

    .contact_details,
    .working_hours,
    .customer_support,
    .feedback {
        margin-bottom: 30px;
    }

    .contact_details ul,
    .feedback ul {
        list-style: none;
        padding: 0;
    }

    .contact_details ul li,
    .feedback ul li {
        font-size: 16px;
        line-height: 1.6;
    }

    .contact_details ul li strong,
    .feedback ul li strong {
        font-weight: bold;
    }

    .working_hours p {
        font-size: 16px;
        line-height: 1.6;
    }

    .customer_support p {
        font-size: 16px;
        line-height: 1.6;
    }

    .feedback p {
        font-size: 16px;
        line-height: 1.6;
    }
</style>

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
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="header_links">
                                    <ul>
                                        <li><a href="/contact" title="Contact">Liên hệ</a></li>
                                        <li>
                                            <a onclick="check()" title="My account">Tài khoản
                                            </a>
                                        </li>
                                        <li><a onclick="check()" title="My cart">Giỏ hàng</a></li>
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
                                    <a href="/home"><img src="../../../assets/img/logo/AZURA.png" alt="" style="height: 80px;width: 90px"></a>
                                </div>
                            </div>
                            <!--logo end-->
                            <div class="col-lg-9 col-md-9">
                                <div class="header_right_info">
                                    <div class="search_bar">
                                        <form action="/home" method="post">
                                            <!-- Chỉnh sửa action -->
                                            <input name="tenSanPham" placeholder="Search..." type="text">
                                            <!-- Đặt tên cho input để gửi dữ liệu tìm kiếm -->
                                            <button type="submit"><i class="fa fa-search"></i></button>
                                        </form>
                                    </div>
                                    <div class="shopping_cart">
                                        <a onclick="check()"><i class="fa fa-shopping-cart"></i>  <i
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
                                                <li class="active"><a href="/home">Trang chủ</a>
                                                </li>
                                                <li><a href="/hien-thi-shop">Điện thoại thông minh</a>

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
                                    <li>Liên hệ với chúng tôi</li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
                <!--breadcrumbs area end-->

                <!--contact area start-->
                <div class="contact_area">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="col-lg-12 col-md-12">
                                <div class="contact_message contact_info">
                                    <h1>Liên hệ chúng tôi</h1>
                                    <p>Cảm ơn bạn đã quan tâm đến dịch vụ của chúng tôi. Nếu bạn có bất kỳ câu hỏi, yêu cầu hoặc đề xuất nào, xin vui lòng liên hệ với chúng tôi.</p>

                                    <div class="contact_details">
                                        <h2>Thông tin liên hệ</h2>
                                        <ul>
                                            <li><strong>Địa chỉ:</strong> 14A, Ngõ 80/47 Đường Xuân Phương, phường Phương Canh, quận Nam Từ Liêm, Hà Nội</li>
                                            <li><strong>Điện thoại:</strong> 0374236759</li>
                                            <li><strong>Email:</strong> phamson2012003@gmail.com</li>
                                        </ul>
                                    </div>

                                    <div class="working_hours">
                                        <h2>Thời gian làm việc</h2>
                                        <p>Thứ Hai - Thứ Sáu: 8:00 AM - 5:00 PM (Giờ địa phương)<br>
                                            Thứ Bảy: 9:00 AM - 1:00 PM (Giờ địa phương)<br>
                                            Chúng tôi nghỉ vào Chủ Nhật và các ngày lễ lớn.</p>
                                    </div>

                                    <div class="customer_support">
                                        <h2>Hỗ trợ khách hàng</h2>
                                        <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn trong quá trình mua sắm và sau khi mua hàng. Nếu bạn có bất kỳ câu hỏi hoặc thắc mắc nào về sản phẩm, đơn hàng, hoặc cần hỗ trợ kỹ thuật, vui lòng liên hệ với bộ phận hỗ trợ khách hàng của chúng tôi.</p>
                                    </div>

                                    <div class="feedback">
                                        <h2>Gửi phản hồi</h2>
                                        <p>Chúng tôi luôn hoan nghênh mọi phản hồi từ phía khách hàng. Nếu bạn có ý kiến đóng góp hoặc muốn chia sẻ trải nghiệm của mình với chúng tôi, xin vui lòng gửi phản hồi. Chúng tôi sẽ rất biết ơn và sẵn sàng lắng nghe.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--contact area end-->

                <!--contact map start-->
                <div class="contact_map">
                    <div class="row">
                        <div class="col-12">
<%--                            <iframe src="https://maps.app.goo.gl/nFnvVfhzHhLRN5539" width="500" height="450" style="border:0"--%>
<%--                                allowfullscreen=""></iframe>--%>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.554193009018!2d105.72863457989082!3d21.050516630593663!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454585fa2e6a5%3A0xe23480827c1a704b!2zOC8xNCDEkC4gWHXDom4gUGjGsMahbmcsIFREUCBT4buRIDIsIE5hbSBU4burIExpw6ptLCBIw6AgTuG7mWksIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1701143135984!5m2!1sen!2s" width="500" height="450" style="border:0"
                                    allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
                <!--contact map end-->


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
            function dangnhap(){
                Swal.fire({
                    title: 'Bạn chưa đăng nhập?',
                    text: 'Yêu cầu đăng nhập để thêm vào giỏ hàng!',
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
    <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
    <script src="assets\js\popper.js"></script>
    <script src="assets\js\bootstrap.min.js"></script>
    <script src="assets\js\ajax-mail.js"></script>
    <script src="assets\js\plugins.js"></script>
    <script src="assets\js\main.js"></script>
</body>

</html>