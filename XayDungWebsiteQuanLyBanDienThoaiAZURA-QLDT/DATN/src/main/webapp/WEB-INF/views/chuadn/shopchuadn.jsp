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
    <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://example.com/path/to/currencyFormat.js"></script>
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
                                    <li class="languages"><a href="/home"><img
                                            src="../../../assets/img/logo/fontlogo.jpg"
                                            alt=""> English <i
                                            class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_languages">
                                            <li><a href="/home"><img src="../../../assets/img/logo/fontlogo.jpg" alt="">
                                                English</a></li>
                                            <li><a href="/home"><img src="../../../assets/img/logo/fontlogo2.jpg"
                                                                     alt="">
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
                                    <li><a href="/contact" title="Contact">Liên hệ</a></li>
                                    <li>
                                        <a href="/home" title="My account">Tài khoản
                                        </a>
                                    </li>
                                    <li><a href="/home" title="My cart">Giỏ hàng</a></li>
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
                                <a href="/home"><img src="../../../assets/img/logo/AZURA.png" alt=""
                                                     style="height: 80px;width: 90px"></a>
                            </div>
                        </div>
                        <!--logo end-->
                        <div class="col-lg-9 col-md-9">
                            <div class="header_right_info">
                                <div class="search_bar">
                                    <form action="/hien-thi-shop" method="post">
                                        <!-- Chỉnh sửa action -->
                                        <input name="tenSanPham" placeholder="Search..." type="text">
                                        <!-- Đặt tên cho input để gửi dữ liệu tìm kiếm -->
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                                <div class="shopping_cart">
                                    <a onclick="dangnhap()"><i class="fa fa-shopping-cart"></i> <i
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
                                                                <li><a onclick="check()">giỏ hàng</a></li>
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
                                <li>Điện thoại thông minh</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->

            <!--pos home section-->
            <div class=" pos_home_section">
                <div class="row pos_home">
                    <div class="col-lg-3 col-md-12">
                        <!--layere categorie"-->
                        <div class="sidebar_widget shop_c">
                            <div class="categorie__titile">
                                <h4>Hãng</h4>
                            </div>
                            <div class="layere_categorie">
                                <c:forEach items="${listNSX}" var="nsx">
                                    <ul class="danh-muc-list justify-content-center align-items-center">
                                        <li>
                                            <!-- Nếu id của checkbox giống với param type trên URL (?type=)  thì đánh dấu checkbox -->
                                            <input id="${nsx.maNSX}" type="checkbox"
                                                   class="danh-muc-checkbox" ${param.type==nsx.maNSX ? 'checked': ''} />
                                            <label for="${nsx.maNSX}" class="danh-muc-label font-weight-bold">
                                                    ${nsx.tenNSX}<span class="danh-muc-count" style="color: red"></span>
                                            </label>
                                        </li>
                                    </ul>
                                </c:forEach>
                                <ul class="danh-muc-list justify-content-center align-items-center">
                                    <li>
                                        <!-- Nếu id của checkbox giống với param type trên URL (?type=)  thì đánh dấu checkbox -->
                                        <input id="all" type="checkbox"
                                               class="danh-muc-checkbox" ${param.type==null ? 'checked': ''} />
                                        <label for="all" class="danh-muc-label font-weight-bold">
                                            Tất cả <span class="danh-muc-count" style="color: red"></span>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--layere categorie end-->


                        <!--price slider start-->
                        <div class="sidebar_widget price">

                            <h2>Giá</h2>
                            <div class="layere_categorie">
                                <ul class="justify-content-center align-items-center">
                                    <li>
                                        <input id="all-price" type="checkbox"
                                               class="gia-checkbox" ${param.range == null ? 'checked' : ''} />
                                        <label for="all-price" class="danh-muc-label font-weight-bold">
                                            Tất cả<span class="danh-muc-count" style="color: red"></span>
                                        </label>
                                    </li>
                                    <li>
                                        <input id="0-11000" type="checkbox"
                                               class="gia-checkbox" ${param.range == '0-11000' ? 'checked' : ''} />
                                        <label for="0-11000" class="danh-muc-label font-weight-bold">
                                            Nhỏ hơn 11 Triệu<span class="danh-muc-count" style="color: red"></span>
                                        </label>
                                    </li>
                                    <li>
                                        <input id="11000-15000" type="checkbox"
                                               class="gia-checkbox" ${param.range == '11000-15000' ? 'checked' : ''} />
                                        <label for="11000-15000" class="danh-muc-label font-weight-bold">
                                            11 Triệu - 15 Triệu<span class="danh-muc-count" style="color: red"></span>
                                        </label>
                                    </li>
                                    <li>
                                        <input id="15000-999999999" type="checkbox"
                                               class="gia-checkbox" ${param.range == '15000-999999999' ? 'checked' : ''} />
                                        <label for="15000-999999999" class="danh-muc-label font-weight-bold">
                                            Lớn hơn 15 triệu<span class="danh-muc-count" style="color: red"></span>
                                        </label>
                                    </li>
                                </ul>

                            </div>


                        </div>
                        <br/>
                        <br/>
                        <br/>


                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/sildebar1.jpg"
                                                 alt=""></a>
                            </div>

                        </div>
                        <!--sidebar banner end-->


                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/dien-thoai-samsung-galaxy-s.jpg"
                                                 alt=""></a>
                            </div>
                        </div>
                        <!--sidebar banner end-->


                    </div>
                    <div class="col-lg-9 col-md-12">
                        <!--banner slider start-->
                        <div class="banner_slider mb-35">
                            <img src="../../../assets/img/slider/slider_1.png" alt="">
                        </div>


                        <!--shop tab product-->
                        <div class="shop_tab_product">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="large" role="tabpanel">
                                    <div class="row">
                                        <c:forEach var="ctsp" items="${ctsps}">
                                            <div class="col-lg-4 col-md-6">
                                                <div class="single_product">

                                                    <div class="product_thumb">
                                                        <a href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}"><img
                                                                src="/img/${ctsp.hinhAnhURL}"
                                                                style="height: 308.9px;width: 308.9px"></a>
                                                        <div class="img_icone">
                                                            <img src="../../../assets/img/cart/span-new.png" alt="">
                                                        </div>
                                                        <div class="product_action">
<%--                                                            <a onclick="dangnhap()">--%>
<%--                                                                <i class="fa fa-shopping-cart"></i> Thêm vào giỏ--%>
<%--                                                                hàng</a>--%>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <c:if test="${empty ctsp.giaSauKhiGiam}">
                                                        <span class="product_price" style="color: red" disabled="">
                                                        <script>document.write(formatCurrencyVND(${ctsp.giaBan}))</script>
                                                        </span>
                                                        </c:if>

                                                        <c:if test="${not empty ctsp.giaSauKhiGiam}">
                                                        <span class="product_price"
                                                              style="text-decoration: line-through; font-size: small; font-weight: normal"
                                                              disabled="">
                                                        <script>document.write(formatCurrencyVND(${ctsp.giaBan}))</script>
                                                        </span>
                                                            <span class="product_price" style="color: red" disabled="">
                                                        <script>document.write(formatCurrencyVND(${ctsp.giaSauKhiGiam}))</script>
                                                        </span>
                                                        </c:if>
                                                        <h3 class="product_title"><a
                                                                href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}">${ctsp.tenSanPham}</a>
                                                        </h3>
                                                    </div>

                                                    <div class="product_info">
                                                        <ul>
                                                            <li><a href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}" title="Quick view">Chi tiết sản phẩm</a></li>
                                                        </ul>
                                                    </div>


                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--shop tab product end-->

                        <!--pagination style start-->
                        <div class="row justify-content-center" style="margin-top:40px; margin-bottom: 40px">
                            <ul class="pagination" id="pagination"></ul>
                            <form action="/hien-thi-shop" id="pageform" method="GET">
                                <input type="hidden" value="" id="page" name="page">
                                <c:if test="${param.type != null}">
                                    <input type="hidden" value="${param.type}" id="type" name="type">
                                </c:if>
                                <c:if test="${param.range != null}">
                                    <input type="hidden" value="${param.range}" id="range" name="range">
                                </c:if>
                            </form>
                        </div>
                        <!--pagination style end-->
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
                                            <a href="#"><img src="assets\img\product\product13.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="assets\img\product\product14.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab3" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="assets\img\product\product15.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal_tab_button">
                                    <ul class="nav product_navactive" role="tablist">
                                        <li>
                                            <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab"
                                               aria-controls="tab1" aria-selected="false"><img
                                                    src="assets\img\cart\cart17.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-toggle="tab" href="#tab2" role="tab"
                                               aria-controls="tab2" aria-selected="false"><img
                                                    src="assets\img\cart\cart18.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link button_three" data-toggle="tab" href="#tab3"
                                               role="tab" aria-controls="tab3" aria-selected="false"><img
                                                    src="assets\img\cart\cart19.jpg" alt=""></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12">
                            <div class="modal_right">
                                <div class="modal_title mb-10">
                                    <h2>Iphone 15 pro max</h2>
                                </div>
                                <div class="modal_price mb-10">
                                    <span class="new_price">$64.99</span>
                                    <span class="old_price">$78.99</span>
                                </div>
                                <div class="modal_content mb-10">

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

<%--    thong bao khi chua dang nhap--%>
<script>
    function dangnhap() {
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
<input type="text" class="text-white" name="" id="" value="${kh.maKhachHang}" disabled>

<!-- all js here -->
<script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../../../assets/js/popper.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/ajax-mail.js"></script>
<script src="../../../assets/js/plugins.js"></script>
<script src="../../../assets/js/main.js"></script>
<script src="../../../assets/js/jquery.twbsPagination.min.js" type="text/javascript"></script>

<script>
    // Chuyển trang khi click checkbox, set type= id của checkbox vừa nhấn
    $(".danh-muc-checkbox").on("click", function () {
        let typeId = $(this).attr('id')
        console.log(typeId)
        if (typeId === 'all') {
            window.location.href = "/hien-thi-shop";
        } else {
            window.location.href = "/hien-thi-shop?type=" + typeId;
        }

    })
</script>

<script>
    // Chuyển trang khi click checkbox, set type= id của checkbox vừa nhấn

    $(".gia-checkbox").on("click", function () {
        let range = $(this).attr('id');
        let type = '${param.type}';

        let url = "/hien-thi-shop?";
        let params = "";

        if (type !== '') {
            params += "type=" + type + "&";
        }

        if (range !== 'all-price') {
            params += "range=" + range + "&";
        } else {
            params = params.replace('range=' + '${param.range}' + '&', '');
        }

        window.location.href = url + params; // Load lại trang với phạm vi giá mới và về trang đầu tiên
    });


</script>

<script type="text/javascript">
    let currentPage =${page};
    let totalPage =${totalPage};

    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            startPage: currentPage,
            totalPages: totalPage,
            visiblePages: 5,
            initiateStartPageClick: false,
            onPageClick: function (event, page) {
                $("#page").val(page);
                $("#pageform").submit();
            }
        });
    });
</script>
</body>

</html>