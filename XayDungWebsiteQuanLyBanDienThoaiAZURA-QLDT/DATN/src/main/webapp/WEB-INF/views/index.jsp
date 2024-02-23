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
    <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">

    <!-- all css here -->
    <link rel="stylesheet" href="../../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../assets/css/plugin.css">
    <link rel="stylesheet" href="../../../assets/css/bundle.css">
    <link rel="stylesheet" href="../../../assets/css/style.css">
    <link rel="stylesheet" href="../../../assets/css/responsive.css">
    <script src="../../../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://example.com/path/to/currencyFormat.js"></script>

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
                                <div class="search_bar">
                                    <form action="/hien-thi-shop/${kh.maKhachHang}" method="post">
                                        <!-- Chỉnh sửa action -->
                                        <input name="tenSanPham" placeholder="Search..." type="text">
                                        <!-- Đặt tên cho input để gửi dữ liệu tìm kiếm -->
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
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

            <!--pos home section-->
            <div class=" pos_home_section">
                <div class="row pos_home">
                    <div class="col-lg-3 col-md-8 col-12">
                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/banner5.jpg"
                                                 alt=""></a>
                            </div>
                            <div class="banner_img">
                                <a href="#"><img src="../../../assets/img/banner/banner6.jpg" alt=""></a>
                            </div>
                        </div>
                        <!--sidebar banner end-->

                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/sildebar1.jpg"
                                                 alt=""></a>
                            </div>
                            <%--                            <div class="banner_img">--%>
                            <%--                                <a href="#"><img src="../../../assets/img/banner/banner6.jpg" alt=""></a>--%>
                            <%--                            </div>--%>
                        </div>
                        <!--sidebar banner end-->


                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/dien-thoai-samsung-galaxy-s.jpg"
                                                 alt=""></a>
                            </div>
                            <%--                            <div class="banner_img">--%>
                            <%--                                <a href="#"><img src="../../../assets/img/banner/banner6.jpg" alt=""></a>--%>
                            <%--                            </div>--%>
                        </div>
                        <!--sidebar banner end-->

                        <!--sidebar banner-->
                        <div class="sidebar_widget bottom ">
                            <div class="banner_img">
                                <a href="#"><img style="width: 300px;height: 280px;"
                                                 src="../../../assets/img/banner/banner9.jpg"
                                                 alt=""></a>
                            </div>
                        </div>
                        <!--sidebar banner end-->


                    </div>
                    <div class="col-lg-9 col-md-12">
                        <!--banner slider start-->
                        <div class="banner_slider slider_1">
                            <div class="slider_active owl-carousel">
                                <div class="single_slider"
                                     style="background-image: url(../../../assets/img/slider/slider_1.png)">
                                    <div class="slider_content">
                                        <div class="slider_content_inner">
                                            <h1></h1>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                                            <a href="#">shop now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="single_slider"
                                     style="background-image: url(../../../assets/img/slider/slider_2.png)">
                                    <div class="slider_content">
                                        <div class="slider_content_inner">
                                            <h1>New Collection</h1>
                                            <p>Iphone 15</p>
                                            <a href="#">shop now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="single_slider"
                                     style="background-image: url(../../../assets/img/slider/slider_3.png)">
                                    <div class="slider_content">
                                        <div class="slider_content_inner">
                                            <h1>Best Collection</h1>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                                            <a href="#">shop now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--banner slider start-->

                        <!--new product area start-->
                        <div class="new_product_area">
                            <div class="block_title">
                                <h3>Sản phẩm mới</h3>
                            </div>

                            <div class="row">
                                <div class="product_active owl-carousel">
                                    <c:forEach var="ctsp" items="${ctsp}">
                                        <div class="col-lg-3">
                                            <div class="single_product" style="height: 450.9px;width: 300.5px">
                                                <form action="#">
                                                    <div class="product_thumb">
                                                        <a href="/view/${kh.maKhachHang}/${ctsp.tenSanPham}/${ctsp.dungLuong}"><img
                                                                src="/img/${ctsp.hinhAnhURL}"
                                                                style="height: 308.9px;width: 308.9px"></a>
                                                        <div class="img_icone">
                                                            <img src="assets\img\cart\span-new.png" alt="">
                                                        </div>
                                                        <div class="product_action">
<%--                                                            <a href="javascript:void(0);"--%>
<%--                                                               onclick="addToCart(${kh.maKhachHang},${ctsp.maChiTietSanPham});">--%>
<%--                                                                <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng--%>
<%--                                                            </a>--%>
                                                            <div id="notification_${kh.maKhachHang}_${ctsp.maChiTietSanPham}"
                                                                 style="display: none;"></div>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <span class="product_price"
                                                              id="productPrice${ctsp.giaBan}">${ctsp.giaBan}</span>

                                                        <h3 class="product_title">
                                                            <a href="/view/${kh.maKhachHang}/${ctsp.tenSanPham}/${ctsp.dungLuong}">${ctsp.tenSanPham}</a>
                                                        </h3>
                                                        <input type="hidden" id="tenSanPham" name="tenSanPham"
                                                               value="${ctsp.tenSanPham}">
                                                        <input type="hidden" id="maDungLuong" name="maDungLuong"
                                                               value="${ctsp.maDL}">
                                                        <input type="hidden" id="maMauSac" name="maMauSac"
                                                               value="${ctsp.maMS}">
                                                    </div>
                                                    <div class="product_info">
                                                        <ul>
                                                            <li>
                                                                <a href="/view/${kh.maKhachHang}/${ctsp.tenSanPham}/${ctsp.dungLuong}"
                                                                   title="Quick view">Chi tiết sản phẩm</a></li>
                                                        </ul>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>

                        </div>
                        <!--new product area start-->

                        <!--new product area start-->

                        <div class="new_product_area">
                            <div class="block_title">
                                <h3>Sản phẩm đang giảm giá</h3>
                            </div>
                            <div class="row">

                                <div class="product_active owl-carousel">
                                    <c:forEach var="ctsp" items="${ctspgg}">

                                        <div class="col-lg-3">
                                            <div class="single_product" style="height: 500px;width: 300.5px">
                                                <form action="#">
                                                    <div class="product_thumb">
                                                        <a href="/view/${kh.maKhachHang}/${ctsp.tenSanPham}/${ctsp.dungLuong}"><img
                                                                src="/img/${ctsp.hinhAnhURL}"
                                                                style="height: 308.9px;width: 308.9px"></a>
                                                        <div class="img_icone">
                                                            <img src="../../../assets/img/cart/sale2.png" alt=""
                                                                 style="max-width: 70px;max-height: 70px">
                                                        </div>
                                                        <div class="product_action">

                                                        </div>
                                                    </div>
                                                    <div class="product_content">

                                                        <span class="product_price"
                                                              id="productPrice${ctsp.maChiTietSanPham}"
                                                              style="font-size: 15px; text-decoration: line-through;">${ctsp.giaBan}</span>

                                                        <span class="product_price" style="color: red"
                                                              id="productPrice_${ctsp.maChiTietSanPham}">${ctsp.giaSauKhiGiam}</span>

                                                        <input type="hidden" name="gia" id="gia"
                                                               value="${ctsp.giaSauKhiGiam}">
                                                        <h3 class="product_title"><a
                                                                href="/view/${kh.maKhachHang}/${ctsp.tenSanPham}/${ctsp.dungLuong}">${ctsp.tenSanPham}</a>
                                                        </h3>
                                                    </div>
                                                    <div class="product_info">
                                                        <ul>
                                                            <li>
                                                                <a href="/view/${kh.maKhachHang}/${ctsp.tenSanPham}/${ctsp.dungLuong}"
                                                                   title="Quick view">Chi tiết sản phẩm</a></li>
                                                        </ul>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>


                        <!--featured product end-->

                        <!--banner area start-->
                        <div class="banner_area mb-60">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="single_banner">
                                        <a href="#"><img style="width: 420px;height: 221px;"
                                                         src="../../../assets/img/banner/banner7.jpg" alt=""></a>
                                        <div class="banner_title">
                                            <p>Up to <span> 20%</span> off</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="single_banner">
                                        <a href="#"><img style="width: 420px;height: 221px;"
                                                         src="../../../assets/img/banner/banner8.jpg" alt=""></a>
                                        <div class="banner_title title_2">
                                            <p>Đổi trả trong<span> 7 ngày</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--banner area end-->

                        <!--brand logo strat-->
                        <div class="brand_logo mb-60">
                            <div class="block_title">
                                <h3>Brands</h3>
                            </div>
                            <div class="row">
                                <div class="brand_active owl-carousel">
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand1.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand2.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand3.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand4.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand5.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand7.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img style="width: 120px;height: 24.49px;"
                                                             src="../../../assets/img/brand/brand6.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand8.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--brand logo end-->
                    </div>
                </div>
            </div>
            <!--pos home section end-->
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

<!-- modal area start -->
<div class="modal fade" id="modal_box" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="modal_body">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-12">
                            <div class="modal_tab">
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="../../../assets/img/product/product13.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="../../../assets/img/product/product14.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab3" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="../../../assets/img/product/product15.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal_tab_button">
                                    <ul class="nav product_navactive" role="tablist">
                                        <li>
                                            <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab"
                                               aria-controls="tab1" aria-selected="false"><img
                                                    src="../../../assets/img/cart/cart17.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-toggle="tab" href="#tab2" role="tab"
                                               aria-controls="tab2" aria-selected="false"><img
                                                    src="../../../assets/img/cart/cart18.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link button_three" data-toggle="tab" href="#tab3"
                                               role="tab" aria-controls="tab3" aria-selected="false"><img
                                                    src="../../../assets/img/cart/cart19.jpg" alt=""></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12">
                            <div class="modal_right">
                                <div class="modal_title mb-10">
                                    <c:forEach items="${chiTietSanPham}" var="ctsp">
                                        <option value="${ctsp.sanPham.tenSanPham}">${ctsp.sanPham.tenSanPham}</option>
                                    </c:forEach>
                                </div>
                                <div class="modal_price mb-10">
                                    <span class="new_price">$64.99</span>
                                    <span class="old_price">$78.99</span>
                                </div>
                                <div class="modal_content mb-10">
                                    <%--                                    <h4>Màu</h>--%>
                                </div>
                                <div class="modal_size mb-15">
                                    <h2>Bộ nhớ</h2>
                                    <ul>
                                        <li><a href="#">64Gb</a></li>
                                        <li><a href="#">128Gb</a></li>
                                        <li><a href="#">256Gb</a></li>
                                        <li><a href="#">512Gb</a></li>
                                        <li><a href="#">1Tb</a></li>
                                    </ul>
                                </div>
                                <div class="modal_add_to_cart mb-15">
                                    <form action="#">
                                        <input min="0" max="100" step="2" value="1" type="number">
                                        <button type="submit">add to cart</button>
                                    </form>
                                </div>
                                <div class="modal_description mb-15">
                                    <p>Iphone 15 pro max siêu hịn
                                    </p>
                                </div>
                                <div class="modal_social">
                                    <h2>Share this product</h2>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- modal area end -->
<script>
    function addToCart(maKhachHang, maChiTietSanPham) {
        // var gia = document.getElementById("gia").value;
        // console.log(soLuongTrongGioHang);
        // console.log(soLuongTon);
        // if (1 + soLuongTrongGioHang > soLuongTon) {
        //     Swal.fire({
        //         title: 'Thông báo:',
        //         text: 'Hết Hàng!',
        //         icon: 'warning',
        //         confirmButtonText: 'Đồng ý'
        //     });
        //     return;
        // }

        Swal.fire({
            title: 'Bạn có muốn thêm sản phẩm vào giỏ hàng không?',
            showCancelButton: true,
            confirmButtonText: 'Có',
            cancelButtonText: 'Không'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "GET",
                    url: "/cart/" + maKhachHang + "/add-san-pham/" + maChiTietSanPham,
                    success: function (data) {
                        var notificationId = "notification_" + maKhachHang + "_" + maChiTietSanPham;
                        Swal.fire({
                            title: 'Thành công!',
                            text: data,
                            icon: 'success',
                            timer: 2000,
                            showConfirmButton: false
                        });
                        // Load lại trang
                        // setTimeout(function () {
                        //     window.location.href = "/home_clients/" + maKhachHang;
                        // }, 1000)
                        $('#' + notificationId).html(data);
                        $('#' + notificationId).fadeIn().delay(2000).fadeOut(); // Hiển thị thông báo và ẩn sau 2 giây
                    },
                    error: function () {
                        Swal.fire('Lỗi!', 'Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng!', 'error');
                    }
                });
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire('Hủy thao tác', 'Sản phẩm không được thêm vào giỏ hàng.', 'error');
            }
        });

    }

    function addToCart1(maKhachHang, maChiTietSanPham) {
        var gia = document.getElementById("gia").value;

        Swal.fire({
            title: 'Bạn có muốn thêm sản phẩm vào giỏ hàng không?',
            showCancelButton: true,
            confirmButtonText: 'Có',
            cancelButtonText: 'Không'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "Post",
                    url: "/cart/" + maKhachHang + "/add-san-pham2/" + maChiTietSanPham,
                    data: {gia: gia},
                    success: function (data) {
                        var notificationId = "notification_" + maKhachHang + "_" + maChiTietSanPham;
                        Swal.fire({
                            title: 'Thành công!',
                            text: data,
                            icon: 'success',
                            timer: 2000,
                            showConfirmButton: false
                        });
                        $('#' + notificationId).html(data);
                        $('#' + notificationId).fadeIn().delay(2000).fadeOut(); // Hiển thị thông báo và ẩn sau 2 giây
                    },
                    error: function () {
                        Swal.fire('Lỗi!', 'Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng!', 'error');
                    }
                });
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire('Hủy thao tác', 'Sản phẩm không được thêm vào giỏ hàng.', 'error');
            }
        });

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
<%--<input type="hidden" name="maChiTietSanPham"--%>
<%--       value="${maChiTietSanPham}">--%>
<script>
    function formatCurrencyVND(number) {
        return new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(number);
    }

    // Lấy ra các thẻ span có class là "product_price"
    const productPrices = document.querySelectorAll('.product_price');

    // Duyệt qua từng thẻ và thay đổi nội dung bằng giá tiền đã được định dạng VND
    productPrices.forEach(span => {
        // Lấy nội dung số hiện tại trong thẻ span
        const currentPrice = parseFloat(span.textContent);

        // Chuyển đổi và thay đổi nội dung của thẻ span
        span.textContent = formatCurrencyVND(currentPrice);
    });
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