<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="vi">

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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    <script src="https://example.com/path/to/currencyFormat.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

                                                                </a></li>
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
                                <li>Giỏ hàng</li>
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
                                            <th class="product_remove">Xóa</th>
                                            <th class="product_thumb">ảnh</th>
                                            <th class="product_name">Sản phẩm</th>
                                            <th class="product_name">Dung lượng</th>
                                            <th class="product_name">Màu sắc</th>
                                            <th class="product-price">giá trước giảm</th>
                                            <th class="product-price">giá sau giảm</th>
                                            <th class="product_quantity">số lượng</th>
                                            <th class="product_total">Tổng cộng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${cart}" var="c">
                                            <tr>
                                                <td class="product_remove"><a
                                                        href="/cart/${kh.maKhachHang}/xoaSanPham/${c.chiTietSanPham.maChiTietSanPham}"><i
                                                        class="fa fa-trash-o"></i></a></td>
                                                <td class="product_thumb"><a href="/view/${kh.maKhachHang}/${c.chiTietSanPham.sanPham.tenSanPham}/${c.chiTietSanPham.dungLuong.tenDungLuong}"><img
                                                        src="/img/${c.chiTietSanPham.hinhAnhURL}"
                                                        style="height: 87px; width:87px"></a></td>
                                                <td class="product_name"><a
                                                        href="/view/${kh.maKhachHang}/${c.chiTietSanPham.sanPham.tenSanPham}/${c.chiTietSanPham.dungLuong.tenDungLuong}">${c.chiTietSanPham.sanPham.tenSanPham}</a></td>
                                                <td class="product_name"><a
                                                        href="#">${c.chiTietSanPham.dungLuong.tenDungLuong}</a></td>
                                                <td class="product_name"><a
                                                        href="#">${c.chiTietSanPham.mauSac.tenMauSac}</a></td>
                                                <td class="product-price">
<%--                                                        ${c.chiTietSanPham.giaBan}--%>
                                                    <script>document.write(formatCurrencyVND(${c.chiTietSanPham.giaBan}))</script>
                                                </td>
                                                <td class="product-price" >
<%--                                                        ${c.giaSauKhiGiam}--%>
                                                            <script>document.write(formatCurrencyVND(${c.giaSauKhiGiam}))</script>
                                                </td>
                                                <td class="product_quantity">
                                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                                        <div class="input-group-btn">
                                                            <a href="/cart/${kh.maKhachHang}/giamSoLuong/${c.chiTietSanPham.maChiTietSanPham}"
                                                               class="btn btn-sm btn-primary btn-minus">
                                                                <i class="fa fa-minus"></i>
                                                            </a>
                                                        </div>
                                                        <input style="height: 30px ;width: 40px;text-align: center;"
                                                               min="1" max="100" value="${c.soLuong}" readonly
                                                               id="soLuongMua_ +${c.chiTietSanPham.maChiTietSanPham}">
                                                        <div class="input-group-btn">
                                                            <a class="btn btn-sm btn-primary btn-plus"
                                                               onclick="check(document.getElementById('soLuongMua_ +${c.chiTietSanPham.maChiTietSanPham}').value,'${c.chiTietSanPham.maChiTietSanPham}')">
                                                                <i class="fa fa-plus"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="product_total">
<%--                                                        ${c.soLuong * c.giaSauKhiGiam}--%>
                                                            <script>document.write(formatCurrencyVND(${c.soLuong * c.giaSauKhiGiam}))</script>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--coupon code area start-->
                    <div class="coupon_area">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">

                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="coupon_code">
                                    <h3>Tổng số giỏ hàng</h3>
                                    <div class="coupon_inner">
                                        <div class="cart_subtotal">
                                            <p>Tổng tiền</p>
                                            <p class="cart_amount">
                                                    <script>document.write(formatCurrencyVND(${tongTien}))</script>
                                            </p>
                                        </div>
                                        <div class="cart_subtotal ">
                                            <p>Số tiền được giảm</p>
                                            <p class="cart_amount">
                                                    <script>document.write(formatCurrencyVND(${tongTienGiam}))</script>
                                            </p>
                                        </div>
                                        <a href="#">Sau khi giảm giá</a>

                                        <div class="cart_subtotal">
                                            <p>Số tiền phải thanh toán</p>
                                            <p class="cart_amount">
                                                    <script>document.write(formatCurrencyVND(${tongTienSG}))</script>
                                            </p>
                                        </div>

                                        <div class="checkout_btn">
                                            <a onclick="checkThanhToan()">Tiến hành thanh toán</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--coupon code area end-->
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
<input type="text" class="text-white" name="" id="" value="${kh.maKhachHang}" readonly>

<!-- all js here -->
<script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../../../assets/js/popper.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/ajax-mail.js"></script>
<script src="../../../assets/js/plugins.js"></script>
<script src="../../../assets/js/main.js"></script>

<script>




    function check(soLuongMua,maChiTietSanPham) {

        var maKhachHang = "${kh.maKhachHang}";


        $.ajax({
            url: '/admin/chi-tiet-san-pham/detailCtsp',
            type: 'GET',
            data: {maChiTietSanPham: maChiTietSanPham},
            success: function (data) {
                console.log(data);



                var checkSoLuongSP = data.soLuongNhap - data.soLuongBan;
                console.log(checkSoLuongSP);
                console.log(soLuongMua);
                if (soLuongMua >= checkSoLuongSP) {
                    swal.fire({
                        title: 'Thông báo',
                        text: "Hết hàng!",
                        icon: 'warning',
                        confirmButtonText: 'OK'
                    });
                    return; // Dừng kiểm tra khi tìm được sản phẩm cần kiểm tra
                }
                if (soLuongMua < checkSoLuongSP) {

                    window.location.href = "/cart/" + maKhachHang + "/tangSoLuong/" + maChiTietSanPham;
                    console.log(checkSoLuongSP);
                }

            },
            error: function (error) {
                console.error('Error fetching details:', error);
            }
        });

    }


    function checkThanhToan() {
        var cartLength = ${fn:length(cart)};

        if (cartLength === 0) {
            swal.fire({
                title: 'Lỗi',
                text: "Giỏ hàng của bạn đang trống! Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán.",
                icon: 'error',
                confirmButtonText: 'OK'
            });
            return;
        }
        var  checkSoLuongSP;
        var maKhachHang = "${kh.maKhachHang}";
        var  soLuongGio;
        <c:forEach items="${cart}" var="c">
        soLuongGio = "${c.soLuong}";
        checkSoLuongSP = "${c.chiTietSanPham.soLuongNhap}" - "${c.chiTietSanPham.soLuongBan}";
        </c:forEach>

        if (checkSoLuongSP <= 0) {
            swal.fire({
                title: 'Thông báo',
                text: "Sản phẩm đã hết hàng! Vui lòng chọn sản phẩm khác!",
                icon: 'warning',
                confirmButtonText: 'OK'
            });
            return;
        }
        if (soLuongGio > checkSoLuongSP) {
            swal.fire({
                title: 'Thông báo',
                text: "Sản phẩm đã hết hàng! Vui lòng chọn sản phẩm khác!",
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        }else {
            swal.fire({
                title: 'Thông báo',
                text: 'Bạn có muốn tiến hành thanh toán?',
                icon: 'info',
                showCancelButton: true,
                confirmButtonText: 'Tiến hành thanh toán',
                cancelButtonText: 'Hủy bỏ'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "/thanhtoan/" + maKhachHang;
                }
            });
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

</script>
<script>

</script>
</body>

</html>