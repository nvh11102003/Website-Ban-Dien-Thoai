<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://example.com/path/to/currencyFormat.js"></script>


    <script>
        function thanhToanNgay() {
            alert("Thanh toán  thành công!");
        }
    </script>
    <style>
        .error {
            color: red;
        }
    </style>
</head>

<body>
<script>
    function formatCurrencyVND(number) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
    }

    window.onload = function() {
        var giaBanInput = document.getElementById('tongTienSG');
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
                                    <li><a href="/contact1/${US.maKhachHang}" title="Contact">Liên hệ</a></li>
                                    <li>
                                        <a href="/detailKh/${US.maKhachHang}" title="My account">${US.ten }</a>
                                    </li>
                                    </li>
                                    <li><a href="/cart/${US.maKhachHang}" title="My cart">Giỏ hàng </a></li>
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
                                <a href="/home_clients/${US.maKhachHang}"><img src="../../../assets/img/logo/AZURA.png"
                                                                               alt="" style="height: 80px;width: 90px"></a>
                            </div>
                        </div>
                        <!--logo end-->
                        <div class="col-lg-9 col-md-9">
                            <div class="header_right_info">
                                <div class="shopping_cart">
                                    <a href="/cart/${US.maKhachHang}"><i class="fa fa-shopping-cart"></i> <i
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
                                            <li class="active"><a href="/home_clients/${US.maKhachHang}">Trang chủ</a>
                                            </li>
                                            <li><a href="/hien-thi-shop/${US.maKhachHang}">Điện thoại thông minh</a>

                                            </li>
                                            <li><a href="#">Trang</a>
                                                <div class="mega_menu">
                                                    <div class="mega_top fix">
                                                        <div class="mega_items">
                                                            <ul>
                                                                <li><a href="/MyAccount/${US.maKhachHang}">Thông tin tài
                                                                    khoản </a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="mega_items">
                                                            <ul>
                                                                <li><a href="/contact1/${kh.maKhachHang}">Liên hệ

                                                                </a></li>
                                                                <li><a href="/cart/${US.maKhachHang}">Giỏ hàng</a></li>
                                                                <li><a href="/hoadon/${US.maKhachHang}">Hóa Đơn</a></li>

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
                                <li><a href="/home_clients/${US.maKhachHang}">Trang chủ</a></li>
                                <li><i class="fa fa-angle-right"></i></li>
                                <li>Thanh toán</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->


            <!--Checkout page section-->
            <div class="Checkout_section">

                <div class="checkout_form">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <form id="paymentForm" action="/addHD/${US.maKhachHang}" method="get">
                                <input type="hidden" name="maChiTietSanPham" id="maChiTietSanPham"
                                       value="${lol.maChiTietSanPham}">
                                <input type="hidden" name="soLuong" value="${sl}">
                                <div class="row">
                                    <div class="col-12 mb-30">
                                        <label>Tên người nhận:</label>
                                        <input type="text" id="nguoiNhan" class="form-control" name="nguoiNhan"
                                               value="${US.ten}" required>
                                        <span id="nguoiNhanError" class="error"></span>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Số điện thoại người nhận:</label>
                                        <input type="text" id="sdt" class="form-control" name="sdt" value="${US.sdt}"
                                               required>
                                        <span id="sdtError" class="error"></span>
                                    </div>
                                    <input type="text" id="maVoucher1" class="form-control" name="maVoucher1"
                                           required hidden>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="province">Tỉnh:</label>
                                            <select id="province" class="form-control"
                                                    onchange="loadDistricts(); checkSelection()">
                                                <option value="">Chọn tỉnh</option>
                                            </select>
                                            <input type="hidden" id="tinh1" name="quocGia1">
                                            <span id="provinceError" class="error"></span>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="district">Huyện:</label>
                                            <select id="district" class="form-control"
                                                    onchange="loadWards(); checkSelection()"
                                                    disabled>
                                                <option value="">Chọn huyện</option>
                                            </select>
                                            <input type="hidden" id="huyen1" name="thanhPho1">
                                            <span id="districtError" class="error"></span>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="ward">Xã:</label>
                                            <select id="ward" class="form-control" onchange="checkSelection()"
                                                    disabled>
                                                <option value="">Chọn xã</option>
                                            </select>
                                            <input type="hidden" id="xa1" name="diaChi1">
                                            <span id="wardError" class="error"></span>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="diaChi">Địa chỉ người nhận:</label>
                                                <input type="text" id="diaChi" class="form-control"
                                                       name="diaChi"  required>
                                                <span id="diaChiError" class="error"></span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-12 mb-30">
                                        <input type="text" id="tongTien1" class="form-control" name="tongTien1"
                                               value="${tongTienSG}" hidden>
                                        <input type="text" id="giaSauGiam" class="form-control" name="giaSauGiam"
                                               value="${gia}" hidden>
                                    </div>

                                    <div class="order_button">
                                        <button type="button" onclick="confirmPayment()">Thanh toán khi nhận hàng
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <form action="/addHDVi/${US.maKhachHang}" method="get" id="secondForm1">
                                <input type="hidden" name="maChiTietSanPham"
                                       value="${lol.maChiTietSanPham}">
                                <input type="hidden" name="giaSauGiam"
                                       value="${gia}">
                                <input type="number" hidden id="tienVi" name="tienVi" value="${viShop.tongTien}">
                                <input type="hidden" name="soLuong" value="${sl}">
                                <input type="hidden" id="nguoiNhan3" name="nguoiNhan">
                                <input type="hidden" id="maChiTietSanPham3" name="maChiTietSanPham">
                                <input type="hidden" id="sdt3" name="sdt">
                                <input type="hidden" id="quocGia3" name="quocGia1">
                                <input type="hidden" id="thanhPho3" name="thanhPho1">
                                <input type="hidden" id="diaChiXa3" name="diaChi1">
                                <input type="hidden" id="diaChi3" name="diaChi">
                                <input type="text" id="maVoucher2" class="form-control" name="maVoucher2"
                                       required hidden>
                                <div class="col-12 mb-30">
                                    <input type="text" class="form-control" name="tongTien1" id="tongSoTien"
                                           value="${tongTienSG}" hidden>
                                </div>
                                <div class="order_button">
                                    <button type="button" onclick="submitSecondForm1()">Thanh toán ví
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <form action="/submitOrder" method="post" id="secondForm">
                                <input type="text" id="giaSauGiam1" class="form-control" name="giaSauGiam1"
                                       value="${gia}" hidden>
                                <h3>Đơn hàng của bạn</h3>
                                <div class="order_table table-responsive mb-30">

                                    <input type="hidden" id="nguoiNhan2" name="nguoiNhan">
                                    <input type="hidden" id="maChiTietSanPham2" name="maChiTietSanPham">
                                    <input type="hidden" id="sdt2" name="sdt">
                                    <input type="hidden" id="quocGia2" name="quocGia1">
                                    <input type="hidden" id="thanhPho2" name="thanhPho1">
                                    <input type="hidden" id="diaChiXa" name="diaChi1">
                                    <input type="hidden" id="diaChi2" name="diaChi">
                                    <input type="text" id="maVoucher3" class="form-control" name="maVoucher3"
                                           required hidden>
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Total</th>
                                            <th>Total Sau Giảm</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tr>
                                        <c:forEach items="${cart}" var="cc">
                                            <tr>
                                                <td><label for="orderInfo"></label>
                                                    <input style="border: none;outline: none; text-align: center"
                                                           type="text" class="form-control" id="orderInfo"
                                                           name="orderInfo"
                                                           value="${cc.chiTietSanPham.sanPham.tenSanPham}"
                                                           readonly>
                                                </td>
                                                <input type="hidden" name="maChiTietSanPham" value="${cc.chiTietSanPham.maChiTietSanPham}">
                                                <td>${cc.soLuong}</td>
                                                <input type="hidden" name="soLuong" value="${cc.soLuong}">
                                                <td>
<%--                                                        ${cc.chiTietSanPham.giaBan * cc.soLuong}--%>
                                                            <script>document.write(formatCurrencyVND(${cc.chiTietSanPham.giaBan * cc.soLuong}))</script>
                                                </td>
                                                <td>
<%--                                                        ${cc.giaSauKhiGiam * cc.soLuong}--%>
                                                            <script>document.write(formatCurrencyVND(${cc.giaSauKhiGiam * cc.soLuong}))</script>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        <br>
                                        </tbody>
                                    </table>

                                        <div class="coupon_code">
                                            <h3>Phiếu mua hàng</h3>
                                            <div class="coupon_inner">
                                                <p>Nhập mã phiếu giảm giá của bạn nếu bạn có.</p>
                                                <select class="form-control" name="maVoucher" id="voucher" onchange="displayDiscountInfo()">
                                                    <option value="">-- Chọn voucher --</option>
                                                    <c:forEach items="${listVoucher}" var="v">
                                                        <option value="${v.maVoucher}" data-discount="${v.phanTramVoucher}">${v.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    <label>Tổng tiền:</label>
                                    <input type="text" class="form-control" readonly
                                           value="${tongTienSG}" id="tongTienSG">
                                    <label>Phần trăm giảm giá:</label>
                                    <input class="form-control" type="text" id="discountInfo" readonly>
                                    <label for="tongTien">Tổng tiền phải thanh toán:</label>
                                    <input type="text" class="form-control" id="tongTien" name="tongTien"
                                           value="${tongTienSG}" readonly>
                                </div>
                                <br>
                                <div class="order_button">
                                    <button type="button" onclick="submitSecondForm()">Thanh toán ngay</button>
                                </div>
                            </form>
                            <br>

                        </div>
                    </div>
                </div>
            </div>
            <!--Checkout page section end-->

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
<input type="text" class="text-white" name="" id="" value="${US.maKhachHang}" disabled>
<!--footer area end-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function submitSecondForm1() {
        var tt = parseFloat(document.getElementById('tongSoTien').value);
        var tienVi = parseFloat(document.getElementById('tienVi').value);

        var nguoiNhan = document.getElementById('nguoiNhan').value.trim();
        var maChiTietSanPham = document.getElementById('maChiTietSanPham').value;
        var sdt = document.getElementById('sdt').value.trim();
        var diaChi = document.getElementById('diaChi').value.trim();
        var tinh = document.getElementById("tinh1").value;
        var huyen1 = document.getElementById("huyen1").value;
        var xa = document.getElementById("xa1").value;

        var nguoiNhanError = document.getElementById('nguoiNhanError');
        var diaChiError = document.getElementById('diaChiError');
        var sdtError = document.getElementById('sdtError');
        var sdtPattern = /^\d{10,11}$/;

        var sdtInput = document.getElementsByName('sdt')[0];
        var provinceError = document.getElementById("provinceError");
        var districtError = document.getElementById("districtError");
        var wardError = document.getElementById("wardError");

        document.getElementById('secondForm1').elements['maChiTietSanPham3'].value = maChiTietSanPham;
        document.getElementById('secondForm1').elements['nguoiNhan3'].value = nguoiNhan;
        document.getElementById('secondForm1').elements['sdt3'].value = sdt;
        document.getElementById('secondForm1').elements['diaChiXa3'].value = xa;
        document.getElementById('secondForm1').elements['quocGia3'].value = tinh;
        document.getElementById('secondForm1').elements['thanhPho3'].value = huyen1;
        document.getElementById('secondForm1').elements['diaChi3'].value = diaChi;


        nguoiNhanError.textContent = '';
        diaChiError.textContent = '';
        sdtError.textContent = '';


        if (nguoiNhan.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            nguoiNhanError.textContent = 'Vui lòng nhập tên người nhận.';

        } else if (tinh.trim() == '') {
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            nguoiNhanError.textContent = '';
            provinceError.textContent = 'Vui lòng chọn tỉnh';

        } else if (huyen1.trim() == '') {
            provinceError.textContent = '';
            nguoiNhanError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            districtError.textContent = 'Vui lòng chọn huyện.';

        } else if (xa.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            nguoiNhanError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            wardError.textContent = 'Vui lòng chọn xã.';

        } else if (sdt.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = 'Vui lòng nhập số điện thoại.';

        } else if (diaChi.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = 'Vui lòng nhập địa chỉ.';

        } else if (!sdtPattern.test(sdtInput.value)) {
            nguoiNhanError.textContent = '';
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = 'Số điện thoại không hợp lệ.';

        }  else if (tienVi < tt) {
            Swal.fire({
                title: "Cảnh báo!",
                text: "Số dư trong ví của bạn không đủ để thanh toán. Vui lòng nạp thêm hoặc chọn phương thức thanh toán khác.",
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        }else {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = '';

            Swal.fire({
                title: 'Xác nhận thanh toán',
                text: 'Bạn có chắc muốn thanh toán bằng ví?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy bỏ'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('secondForm1').submit();
                }
            });
        }

    }

    function submitSecondForm() {
        var nguoiNhan = document.getElementById('nguoiNhan').value.trim();
        var sdt = document.getElementById('sdt').value.trim();
        var diaChi = document.getElementById('diaChi').value.trim();
        var tinh = document.getElementById("tinh1").value;
        var huyen1 = document.getElementById("huyen1").value;
        var xa = document.getElementById("xa1").value;

        var nguoiNhanError = document.getElementById('nguoiNhanError');
        var diaChiError = document.getElementById('diaChiError');
        var sdtError = document.getElementById('sdtError');
        var sdtPattern = /^\d{10,11}$/;

        var sdtInput = document.getElementsByName('sdt')[0];
        var provinceError = document.getElementById("provinceError");
        var districtError = document.getElementById("districtError");
        var wardError = document.getElementById("wardError");

        document.getElementById('secondForm').elements['maChiTietSanPham2'].value = maChiTietSanPham;
        document.getElementById('secondForm').elements['nguoiNhan2'].value = nguoiNhan;
        document.getElementById('secondForm').elements['sdt2'].value = sdt;
        // document.getElementById('secondForm').elements['email2'].value = email;
        document.getElementById('secondForm').elements['diaChiXa'].value = xa;
        document.getElementById('secondForm').elements['quocGia2'].value = tinh;
        document.getElementById('secondForm').elements['thanhPho2'].value = huyen1;
        document.getElementById('secondForm').elements['diaChi2'].value = diaChi;




        nguoiNhanError.textContent = '';
        diaChiError.textContent = '';
        sdtError.textContent = '';


        if (nguoiNhan.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            nguoiNhanError.textContent = 'Vui lòng nhập tên người nhận.';

        } else if (tinh.trim() == '') {
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            nguoiNhanError.textContent = '';
            provinceError.textContent = 'Vui lòng chọn tỉnh';

        } else if (huyen1.trim() == '') {
            provinceError.textContent = '';
            nguoiNhanError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            districtError.textContent = 'Vui lòng chọn huyện.';

        } else if (xa.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            nguoiNhanError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            wardError.textContent = 'Vui lòng chọn xã.';

        } else if (sdt.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = 'Vui lòng nhập số điện thoại.';

        } else if (diaChi.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = 'Vui lòng nhập địa chỉ.';

        } else if (!sdtPattern.test(sdtInput.value)) {
            nguoiNhanError.textContent = '';
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = 'Số điện thoại không hợp lệ.';

        } else {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = '';

            Swal.fire({
                title: 'Xác nhận thanh toán',
                text: 'Bạn có chắc muốn thanh toán ngay?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy bỏ'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('secondForm').submit();
                }
            });
        }

    }


    function confirmPayment() {
        var nguoiNhan = document.getElementById('nguoiNhan').value;
        var sdt = document.getElementById('sdt').value;
        var diaChi = document.getElementById('diaChi').value;
        var tinh = document.getElementById("tinh1").value;
        var huyen1 = document.getElementById("huyen1").value;
        var xa = document.getElementById("xa1").value;
        var maVoucher = document.getElementById("voucher").value;

        var provinceError = document.getElementById("provinceError");
        var districtError = document.getElementById("districtError");
        var wardError = document.getElementById("wardError");
        var nguoiNhanError = document.getElementById('nguoiNhanError');
        var diaChiError = document.getElementById('diaChiError');

        var sdtInput = document.getElementsByName('sdt')[0];
        var sdtError = document.getElementById('sdtError');
        var sdtPattern = /^\d{10,11}$/;

        if (nguoiNhan.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            nguoiNhanError.textContent = 'Vui lòng nhập tên người nhận.';

        } else if (tinh.trim() == '') {
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            nguoiNhanError.textContent = '';
            provinceError.textContent = 'Vui lòng chọn tỉnh';

        } else if (huyen1.trim() == '') {
            provinceError.textContent = '';
            nguoiNhanError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            districtError.textContent = 'Vui lòng chọn huyện.';

        } else if (xa.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            nguoiNhanError.textContent = '';
            sdtError.textContent = '';
            diaChiError.textContent = '';
            wardError.textContent = 'Vui lòng chọn xã.';

        } else if (sdt.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = 'Vui lòng nhập số điện thoại.';

        } else if (diaChi.trim() == '') {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            sdtError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = 'Vui lòng nhập địa chỉ.';

        } else if (!sdtPattern.test(sdtInput.value)) {
            nguoiNhanError.textContent = '';
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = 'Số điện thoại không hợp lệ.';

        } else {
            provinceError.textContent = '';
            districtError.textContent = '';
            wardError.textContent = '';
            nguoiNhanError.textContent = '';
            diaChiError.textContent = '';
            sdtError.textContent = '';
            Swal.fire({
                title: 'Xác nhận thanh toán khi nhận hàng',
                text: 'Bạn có muốn tiến hành thanh toán khi nhận hàng không?',
                icon: 'info',
                showCancelButton: true,
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy bỏ'
            }).then((result) => {
                if (result.isConfirmed) {
                    // submitSecondForm(); // Gọi hàm để sao chép dữ liệu và submit form
                    document.getElementById('paymentForm').submit();
                    Swal.fire({
                        title: "Thanh toán thành công!",
                        text: "Cảm ơn bạn đã đặt hàng. Chúng tôi sẽ liên hệ để xác nhận.",
                        icon: "success",
                        confirmButtonText: "Đóng"

                    });
                }
            });
        }
    }


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
<script>
    function showCondition(condition) {
        document.getElementById("condition-text").innerHTML = condition;
        document.getElementById("condition-popup").style.display = "block";
    }

    function closeCondition() {
        document.getElementById("condition-popup").style.display = "none";
    }
</script>

<script>
    function kiemTra() {

        var box1 = document.getElementById("checkbox1");
        var box2 = document.getElementById("checkbox2");

        var radioBank = document.getElementById("banktransfer");
        var radioCash = document.getElementById("directcheck");

        if ((!box1.checked && !box2.checked) || (box1.checked && !validateDiaChiCu()) || (box2.checked && !validateDiaChiMoi())) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng điền đầy đủ thông tin để nhận hàng</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true,
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            event.preventDefault();
        }

        if (!radioBank.checked && !radioCash.checked) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng chọn phương thức thanh toán</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true,
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            event.preventDefault();
        }

        for (var i = 0; i < 99; i++) {
            var slTon = parseFloat(document.getElementById("slTon" + (i + 1)).value);
            var sl = parseFloat(document.getElementById("sl" + (i + 1)).value);


            console.log(sl);
            console.log(slTon);

            if (sl > slTon) {
                Swal.fire({
                    icon: 'warning',
                    html: '<div class="swal-text">Số lượng chọn quá lớn cho sản phẩm</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                    allowOutsideClick: true,
                });
                setTimeout(() => {
                    Swal.close();
                }, 2000);
                event.preventDefault();
            }
        }
    }


</script>
<script>

    var priceInput = document.getElementById("price");
    var priceInput1 = document.getElementById("price1");
    var currentPrice = parseFloat(${tongTienSG});

    async function loadProvinces() {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        const provinceSelect = document.getElementById("province");
        provinceSelect.innerHTML = '<option value="">Chọn tỉnh</option>';

        for (const province of data.data) { // Thay đổi dòng này để lấy dữ liệu từ data.data
            const option = document.createElement("option");
            option.value = province.ProvinceID;
            option.text = province.ProvinceName;
            provinceSelect.appendChild(option);
            console.log(province.ProvinceID, province.ProvinceName);
        }
    }


    async function loadDistricts() {
        const provinceId = document.getElementById("province").value;

        if (!provinceId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/districts?province_id=' + provinceId);
        const data = await response.json();

        const districtSelect = document.getElementById("district");
        districtSelect.innerHTML = '<option value="">Chọn huyện</option>';

        for (const district of data.data) {
            const option = document.createElement("option");
            option.value = district.DistrictID;
            option.text = district.DistrictName;
            districtSelect.appendChild(option);
        }

        districtSelect.disabled = false;
        document.getElementById("ward").disabled = true;
        // document.getElementById("message").innerText = "";
    }

    async function loadWards() {
        const districtId = document.getElementById("district").value;

        if (!districtId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/wards?district_id=' + districtId);
        const data = await response.json();

        const wardSelect = document.getElementById("ward");
        wardSelect.innerHTML = '<option value="">Chọn xã</option>';

        for (const ward of data.data) {
            const option = document.createElement("option");
            option.value = ward.WardCode;
            option.text = ward.WardName;
            wardSelect.appendChild(option);
        }

        wardSelect.disabled = false;
        // document.getElementById("message").innerText = "";
    }

    function checkSelection() {
        const provinceSelect = document.getElementById("province");
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");

        const provinceName = provinceSelect.options[provinceSelect.selectedIndex].text;
        const districtName = districtSelect.options[districtSelect.selectedIndex].text;
        const wardName = wardSelect.options[wardSelect.selectedIndex].text;

        if (provinceName) {
            document.getElementById("tinh1").value = provinceName;
            if (provinceName === "Chọn tỉnh") {
                document.getElementById("tinh1").value = null;
            }
            console.log(document.getElementById("tinh1").value);
        }

        if (districtName) {
            document.getElementById("huyen1").value = districtName;
            if (districtName === "Chọn huyện") {
                document.getElementById("huyen1").value = null;
            }

            console.log(document.getElementById("huyen1").value);
        }

        if (wardName) {
            document.getElementById("xa1").value = wardName;
            if (wardName === "Chọn xã") {
                document.getElementById("xa1").value = null;
            }
            console.log(document.getElementById("xa1").value);
        }


    }

    loadProvinces();
    document.getElementById("province").addEventListener("change", loadDistricts);
    document.getElementById("district").addEventListener("change", loadWards);
    document.getElementById("ward").addEventListener("change", checkSelection);

</script>

<script>
    function displayDiscountInfo() {
        var voucherSelect = document.getElementById("voucher");
        var discountInfoInput = document.getElementById("discountInfo");
        var tongTienInput = document.getElementById("tongTien");
        var tongTienInput1 = document.getElementById("tongTien1");
        var tongTienInputVi = document.getElementById("tongSoTien");
        var maVoucher1 = document.getElementById("maVoucher1");
        var maVoucher2 = document.getElementById("maVoucher2");
        var maVoucher3 = document.getElementById("maVoucher3");
        var selectedOption = voucherSelect.options[voucherSelect.selectedIndex];

        if (selectedOption) {
            var discountValue = selectedOption.getAttribute("data-discount");
            var discountedTotal;
            var tongTien = ${tongTienSG};
            if(discountValue === null){
                discountInfoInput.value = "";
                discountedTotal = ${tongTienSG};
            }else{
                discountInfoInput.value = "Giảm giá: " + discountValue + "%";
                discountedTotal = tongTien - (tongTien * discountValue / 100);
            }
            tongTienInput.value = formatCurrencyVND(discountedTotal);
            tongTienInput1.value = formatCurrencyVND(discountedTotal);
            tongTienInputVi.value = (discountedTotal);
            maVoucher1.value = selectedOption.value;
            maVoucher2.value = selectedOption.value;
            maVoucher3.value = selectedOption.value;
        } else {
            discountInfoInput.value = "";
            tongTienInput.value = formatCurrencyVND(${tongTienSG});
            tongTienInput1.value = formatCurrencyVND(${tongTienSG});
            tongTienInputVi.value = (${tongTienSG});
            maVoucher1.value = "";
            maVoucher2.value = "";
            maVoucher3.value = "";
        }
        console.log(maVoucher1);
    }
</script>
<!-- all js here -->
<script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../../../assets/js/popper.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/ajax-mail.js"></script>
<script src="../../../assets/js/plugins.js"></script>
</body>

</html>