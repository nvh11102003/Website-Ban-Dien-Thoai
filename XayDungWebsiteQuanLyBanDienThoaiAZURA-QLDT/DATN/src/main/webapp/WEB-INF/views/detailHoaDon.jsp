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
</head>
<body>
<script>
    function formatCurrencyVND(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }

    window.onload = function () {
        var giaBanInput = document.getElementById('tongTienBanDau');
        giaBanInput.value = formatCurrencyVND(giaBanInput.value);
        var giaBanInput1 = document.getElementById('tongTien');
        giaBanInput1.value = formatCurrencyVND(giaBanInput1.value);
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
                                                                    khoản</a></li>
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
                                <li>Hóa Đơn</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->


            <!--shopping cart area start -->
            <div class="shopping_cart_area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-7 col-sm-12">
                            <div class="modal_right">
                                <form class="row" id="form-update">
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Mã hóa đơn</label>
                                        <input class="form-control" type="text" required id="maHoaDon"
                                               value="${hd.maHoaDon}"
                                               name="maHoaDon" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Người Nhận</label>
                                        <input class="form-control" type="text" required id="nguoiNhan"
                                               value="${hd.nguoiNhan}"
                                               name="nguoiNhan" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Số Điện Thoại</label>
                                        <input class="form-control" type="text" required id="sdt" value="${hd.sdt}"
                                               name="sdt" disabled>
                                    </div>
                                    <%--                                    <div class="form-group col-md-6">--%>
                                    <%--                                        <label class="control-label">Hình thức thanh toán</label>--%>
                                    <%--                                        <select class="form-control" required id="trangThai" name="trangThai" disabled>--%>
                                    <%--                                            <option value="0" ${hd.trangThai == 0 ? 'selected' : ''}>Thanh Toán Khi Nhận Hàng--%>
                                    <%--                                            </option>--%>
                                    <%--                                            <option value="1" ${hd.trangThai == 1 ? 'selected' : ''}>Đã thanh toán--%>
                                    <%--                                            </option>--%>
                                    <%--                                            <option value="2" ${hd.trangThai == 2 ? 'selected' : ''}>Thanh toán thành công & Chờ xử lí</option>--%>
                                    <%--                                        </select>--%>
                                    <%--                                    </div>--%>
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
                                        <c:forEach items="${hdct}" var="hdct">
                                            <tr>
                                                <td class="align-middle">${hdct.chiTietSanPham.sanPham.tenSanPham}</td>
                                                <td class="align-middle">
                                                        <%--                                                        ${hdct.giaTien}--%>
                                                    <script>document.write(formatCurrencyVND(${hdct.giaTien}))</script>
                                                </td>
                                                <td class="align-middle">${hdct.soLuongMua}</td>
                                                <td class="align-middle">
                                                        <%--                                                        ${hdct.giaTien * hdct.soLuongMua}--%>
                                                    <script>document.write(formatCurrencyVND(${hdct.giaTien * hdct.soLuongMua}))</script>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    <div>
                                        <label>Tổng tiền:</label>
                                        <input type="text" class="form-control" readonly
                                               value="${tongTien}" id="tongTienBanDau">
                                        <label>Phần trăm giảm giá:</label>
                                        <input class="form-control" type="text" id="discountInfo" value="${giamGia}"
                                               readonly>
                                        <label for="tongTien">Tổng tiền phải thanh toán:</label>
                                        <input type="text" class="form-control" id="tongTien" name="tongTien"
                                               value="${tongTienThanhToan}" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--shopping cart area end -->
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
                            <p>Chào mừng bạn đến với trang web bán điện thoại của chúng tôi. Chúng tôi cung cấp một loạt
                                các sản phẩm điện thoại di động từ các thương hiệu hàng đầu với chất lượng tốt nhất.</p>
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
</body>

</html>