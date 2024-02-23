<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                <a href="/home_clients/${kh.maKhachHang}"><img src="../../../assets/img/logo/AZURA.png" alt="" style="height: 80px;width: 90px"></a>
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
                                                                <li><a href="/MyAccount/${kh.maKhachHang}">Tài khoản của
                                                                    tôi </a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="mega_items">
                                                            <ul>
                                                                <li><a href="/contact1/${kh.maKhachHang}">Liên hệ
                                                                    <hệ></hệ>
                                                                </a></li>
                                                                <li><a href="/hoadon/${kh.maKhachHang}">Hóa Đơn</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li><a href="/blog1/${kh.maKhachHang}">blog</a>
                                            </li>
                                            <li><a href="/contact1/${kh.maKhachHang}">Liên hệ chúng tôi</a></li>

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

            <!--header end -->
            <!--breadcrumbs area start-->
            <div class="breadcrumbs_area">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home_clients/${kh.maKhachHang}">Trang chủ</a></li>
                                <li><i class="fa fa-angle-right"></i></li>
                                <li>blog</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->

            <!--blog area start-->
            <div class="blog_area">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/OIP.in6dJg7VUY7loQgSXZbymwHaEK?rs=1&pid=ImgDetMain"
                                        width="328.4" height="328.4" alt="Apple"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Apple</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Tin tức Apple mới nhất</a></h3>
                                <p>Cập nhật các tin tức mới nhất về sản phẩm và dịch vụ của Apple, cùng với những xu
                                    hướng công nghệ.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>10 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog về điện thoại 9 (Samsung) -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/OIP.139d6YXVs0OD_kw4vm2IDwHaDt?rs=1&pid=ImgDetMain"
                                        width="328.4" height="328.4" alt="Samsung News"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Samsung</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Tin tức Samsung mới nhất</a></h3>
                                <p>Cập nhật các tin tức hàng đầu về sản phẩm và các sự kiện của Samsung trên thị trường
                                    điện thoại di động.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>12 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Blog về điện thoại 1 -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://static-images.vnncdn.net/files/publish/2022/8/16/iphone-14-pro-max4-137.jpg"
                                        alt="iPhone"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">iPhone</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Đánh giá iPhone mới nhất</a></h3>
                                <p>Đánh giá chi tiết về sản phẩm iPhone mới ra mắt, bao gồm các tính năng và đặc điểm
                                    nổi bật.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>5 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog về điện thoại 2 (Samsung) -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/OIP.u5dUQr0SjD1DKQTYpEw8IQHaEo?rs=1&pid=ImgDetMain"
                                        width="328.4" height="328.4" alt="Samsung"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Samsung</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Đánh giá Samsung Galaxy mới nhất</a></h3>
                                <p>Thông tin chi tiết về sản phẩm Samsung Galaxy mới nhất, cập nhật về công nghệ và
                                    thiết kế.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>7 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog về điện thoại 3 (Oppo) -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/OIP.PzsAehT9Lw0szYis6OZOngHaFi?rs=1&pid=ImgDetMain"
                                        width="328.4" height="328.4" alt="Oppo"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Oppo</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Đánh giá Oppo mới nhất</a></h3>
                                <p>Thông tin chi tiết về sản phẩm Oppo mới nhất, với những cải tiến về camera và hiệu
                                    suất.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>4 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Các blog khác có thể thêm tương tự -->
                    <!-- Blog về điện thoại 4 (Redmi) -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/OIP.ZMLIhzQarV7XEdPEhjEXvAAAAA?rs=1&pid=ImgDetMain"
                                        width="328.4" height="328.4" alt="Redmi"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Redmi</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Đánh giá Redmi mới nhất</a></h3>
                                <p>Thông tin chi tiết về sản phẩm Redmi mới nhất, với những tính năng và hiệu suất ấn
                                    tượng.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>6 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog về điện thoại 5 (Nokia) -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/R.533b5b0110f3d3e968b4d8ebcf552963?rik=oyOkoBTkQZAIIg&pid=ImgRaw&r=0"
                                        width="328.4" height="328.4" alt="Nokia"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Nokia</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Đánh giá Nokia mới nhất</a></h3>
                                <p>Cập nhật thông tin về sản phẩm Nokia mới nhất, với công nghệ camera và thiết kế độc
                                    đáo.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>8 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog về điện thoại 6 (Vivo) -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/OIP.6NymbK3_2ZXe6FB8pwYfhAHaHa?rs=1&pid=ImgDetMain"
                                        width="328.4" height="328.4" alt="Vivo"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Vivo</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Đánh giá Vivo mới nhất</a></h3>
                                <p>Thông tin về sản phẩm Vivo mới nhất, với thiết kế và tính năng hiện đại.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>5 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog về điện thoại 7 (Xiaomi) -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single_blog">
                            <div class="blog_thumb">
                                <a href="#"><img
                                        src="https://th.bing.com/th/id/OIP.ueXAd81HhWX_uPk50b-JgQHaEK?rs=1&pid=ImgDetMain"
                                        width="328.4" height="328.4" alt="Xiaomi"></a>
                            </div>
                            <div class="blog_content">
                                <div class="blog_post">
                                    <ul>
                                        <li>
                                            <a href="#">Xiaomi</a>
                                        </li>
                                    </ul>
                                </div>
                                <h3><a href="#">Đánh giá Xiaomi mới nhất</a></h3>
                                <p>Thông tin chi tiết về sản phẩm Xiaomi mới nhất, với các tính năng và công nghệ tiên
                                    tiến.</p>
                                <div class="post_footer">
                                    <div class="post_meta">
                                        <ul>
                                            <li>Tháng 11, 2023</li>
                                            <li>7 Bình luận</li>
                                        </ul>
                                    </div>
                                    <div class="Read_more">
                                        <a href="#">Xem thêm <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--blog area end-->


                <!--brand logo strat-->
                <div class="brand_logo brand_about">
                    <div class="block_title">
                        <h3>Brands</h3>
                    </div>
                    <div class="row">
                        <div class="brand_active owl-carousel">
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img src="assets\img\brand\brand1.jpg" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img src="assets\img\brand\brand2.jpg" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img src="assets\img\brand\brand3.jpg" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img src="assets\img\brand\brand4.jpg" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img src="assets\img\brand\brand5.jpg" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img src="assets\img\brand\brand7.jpg" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img style="width: 170px;height: 35px;"
                                                     src="assets\img\brand\brand6.jpg" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="single_brand">
                                    <a href="#"><img src="assets\img\brand\brand8.jpg" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--brand logo end-->
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
    <script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="../../../assets/js/popper.js"></script>
    <script src="../../../assets/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/ajax-mail.js"></script>
    <script src="../../../assets/js/plugins.js"></script>
    <script src="../../../assets/js/main.js"></script>
</body>

</html>