<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">


    <!-- all css here -->
    <link rel="stylesheet" href="../../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../assets/css/plugin.css">
    <link rel="stylesheet" href="../../../assets/css/bundle.css">
    <link rel="stylesheet" href="../../../assets/css/style.css">
    <link rel="stylesheet" href="../../../assets/css/responsive.css">
    <script src="../../../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <%--    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>--%>
    <%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>


    <!-- Favicon -->
    <link href="../../../resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">


    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">--%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

    <!-- Favicon -->
    <link href="../../../resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        var giaBanInput2 = document.getElementById('giaTienSauGiam1');
        giaBanInput2.value = formatCurrencyVND(giaBanInput2.value);
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
                                <div class="shopping_cart">
                                    <a onclick="check()"><i class="fa fa-shopping-cart"></i> <i
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
                                <li>Thanh toán</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->


            <div class="Checkout_section">

                <div class="checkout_form">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <form id="paymentForm" action="/update111" method="post">
                                <input type="hidden" id="maChiTietSanPham" name="maChiTietSanPham"
                                       value="${lol.maChiTietSanPham}">
                                <input type="hidden" name="giaSauGiam" id="giaSauGiam"
                                       value="${giaBan}">
                                <input type="hidden" name="soLuong" value="${sl}">
                                <div class="row">
                                    <div class="col-12 mb-30">
                                        <label >Tên người nhận:</label>
                                        <input type="text" id="nguoiNhan" class="form-control" name="nguoiNhan"
                                               required>
                                        <span id="nguoiNhanError" class="error"></span>
                                    </div>

                                    <div class="col-12 mb-30">
                                        <labqel >Số điện thoại người nhận:</labqel>
                                        <input type="text" id="sdt" class="form-control" name="sdt" required>
                                        <span id="sdtError" class="error"></span>
                                    </div>

                                    <div class="col-12 mb-30">
                                        <label for="email">Email người nhận:</label>
                                        <input type="email" id="email" class="form-control" name="email" required>
                                        <span id="emailError" class="error"></span>
                                    </div>


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
                                                       name="diaChi" required>
                                                <span id="diaChiError" class="error"></span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-12 mb-30">

                                    <input type="text" id="tongTien1" class="form-control" name="tongTien1"
                                           value="${lol.giaBan * sl}" hidden>
                                        <input type="text" id="giaTienSauGiam" class="form-control" name="giaTienSauGiam"
                                               value="${giaBan}" hidden>

                                    </div>
                                    <div class="order_button">
                                        <button type="button" onclick="confirmPayment()" class="btn btn-primary">Thanh
                                            toán
                                            khi nhận hàng
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-lg-6 col-md-6">
                            <form action="/submitOrder1" method="post" id="secondForm">
                                <input type="hidden" name="maChiTietSanPham"
                                       value="${lol.maChiTietSanPham}">
                                <input type="text" class="form-control" name="giaTienSauGiam1"
                                       value="${giaBan}" hidden >
                                <h3>Đơn hàng của bạn</h3>
                                <div class="order_table table-responsive mb-30">
                                    <!-- Xóa các trường input, giữ lại các trường có giá trị từ form trên -->
                                    <input type="hidden" id="nguoiNhan2" name="nguoiNhan">
                                    <input type="hidden" id="maChiTietSanPham2" name="maChiTietSanPham">
                                    <input type="hidden" id="sdt2" name="sdt">
                                    <input type="hidden" id="email2" name="email">
                                    <input type="hidden" id="quocGia2" name="quocGia1">
                                    <input type="hidden" id="thanhPho2" name="thanhPho1">
                                    <input type="hidden" id="diaChiXa" name="diaChi1">
                                    <input type="hidden" id="diaChi2" name="diaChi">
                                    <%--                                    <input type="hidden" name="tongTien1">--%>
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <input style="border: none;outline: none; text-align: center"
                                                       type="text" class="form-control" id="orderInfo"
                                                       name="orderInfo"
                                                       value="${lol.sanPham.tenSanPham}"
                                                       readonly>
                                            </td>
                                            <td>
                                                <input style="border: none;outline: none; text-align: center"
                                                       type="text"
                                                       name="soLuong"
                                                       value="${sl}"
                                                       readonly>
                                            </td>
                                            <td type="text">
<%--                                                ${lol.giaBan * sl}--%>
                                                        <script>document.write(formatCurrencyVND(${tongTien}))</script>
                                            </td>
                                        </tr>
                                        <br>
                                        </tbody>
                                    </table>
                                    <label>Tổng tiền:</label>
                                    <input type="text" class="form-control" readonly
                                           value="${lol.giaBan * sl}" id="tongTienBanDau">
                                    <label>Giảm giá:</label>
                                    <input type="text" class="form-control" readonly
                                           value="${phanTramGiamGia}">
                                    <label for="tongTien">Tổng tiền phải thanh toán:</label>
                                    <input type="text" class="form-control" id="tongTien" name="tongTien" readonly
                                           value="${tongTien}">
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
                            <p>Chào mừng bạn đến với trang web bán điện thoại của chúng tôi. Chúng tôi cung cấp một loạt
                                các
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

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function checkEmail(email) {
            fetch('/check-email', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({email: email})
            })
                .then(response => {
                    if (response.status === 200) {
                        return response.json();
                    } else {
                        throw new Error('Network response was not ok.');
                    }
                })
                .then(data => {
                    if (data.exists) {
                        Swal.fire({
                            title: 'Lỗi',
                            text: 'Tài khoản đã được đăng kí vui lòng đăng nhập hoặc dùng email khác.',
                            icon: 'error'
                        });
                    } else {
                        Swal.fire({
                            title: 'Xác nhận đặt hàng',
                            text: 'Bạn có muốn tiến hành đặt nhận hàng không?',
                            icon: 'info',
                            showCancelButton: true,
                            confirmButtonText: 'Đồng ý',
                            cancelButtonText: 'Hủy bỏ'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                document.getElementById('secondForm').submit();

                            }
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    Swal.fire({
                        title: 'Lỗi',
                        text: 'Có lỗi xảy ra khi kiểm tra email.',
                        icon: 'error'
                    });
                });
        }

        // Hàm để sao chép dữ liệu từ form trên xuống form dưới
        function submitSecondForm() {
            var nguoiNhan = document.getElementById('nguoiNhan').value;
            var maChiTietSanPham = document.getElementById('maChiTietSanPham').value;
            var sdt = document.getElementById('sdt').value;
            var email = document.getElementById('email').value;
            var diaChi = document.getElementById('diaChi').value;
            var tinh = document.getElementById("tinh1").value;
            var huyen = document.getElementById("huyen1").value;
            var xa = document.getElementById("xa1").value;
            // var tongTien1 = document.getElementById('tongTien1').value;
            // Gán giá trị từ form trên vào form dưới
            document.getElementById('secondForm').elements['maChiTietSanPham2'].value = maChiTietSanPham;
            document.getElementById('secondForm').elements['nguoiNhan2'].value = nguoiNhan;
            document.getElementById('secondForm').elements['sdt2'].value = sdt;
            document.getElementById('secondForm').elements['email2'].value = email;
            document.getElementById('secondForm').elements['diaChiXa'].value = xa;
            document.getElementById('secondForm').elements['quocGia2'].value = tinh;
            document.getElementById('secondForm').elements['thanhPho2'].value = huyen;
            document.getElementById('secondForm').elements['diaChi2'].value =diaChi ;
            // document.getElementById('secondForm').elements['tongTien'].value = tongTien1;


            var nguoiNhanError = document.getElementById('nguoiNhanError');
            var diaChiError = document.getElementById('diaChiError');
            var emailError = document.getElementById('emailError');
            var emailPattern = /^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;


            var sdtInput = document.getElementsByName('sdt')[0];
            var sdtError = document.getElementById('sdtError');
            var sdtPattern = /^\d{10,11}$/;
            var provinceError = document.getElementById("provinceError");
            var districtError = document.getElementById("districtError");
            var wardError = document.getElementById("wardError");


            if (nguoiNhan.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                nguoiNhanError.textContent = 'Vui lòng nhập tên người nhận.';

            } else if (tinh.trim() == '') {
                districtError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                nguoiNhanError.textContent = '';
                emailError.textContent = '';
                provinceError.textContent = 'Vui lòng chọn tỉnh';

            } else if (huyen.trim() == '') {
                provinceError.textContent = '';
                nguoiNhanError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                districtError.textContent = 'Vui lòng chọn huyện.';

            } else if (xa.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                nguoiNhanError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                wardError.textContent = 'Vui lòng chọn xã.';

            } else if (sdt.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                nguoiNhanError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                sdtError.textContent = 'Vui lòng nhập số điện thoại.';

            } else if (diaChi.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                nguoiNhanError.textContent = '';
                emailError.textContent = '';
                diaChiError.textContent = 'Vui lòng nhập địa chỉ.';

            } else if (!sdtPattern.test(sdtInput.value)) {
                nguoiNhanError.textContent = '';
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                diaChiError.textContent = '';
                sdtError.textContent = 'Số điện thoại không hợp lệ.';

            } else if (email.trim() == '') {
                nguoiNhanError.textContent = '';
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                diaChiError.textContent = '';
                sdtError.textContent = '';
                emailError.textContent = 'Vui lòng nhập email.';

            } else if (!emailPattern.test(email.trim())) {
                nguoiNhanError.textContent = '';
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                diaChiError.textContent = '';
                sdtError.textContent = '';
                emailError.textContent = 'Email không hợp lệ.';
            } else {
                nguoiNhanError.textContent = '';
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                diaChiError.textContent = '';
                sdtError.textContent = '';
                emailError.textContent = '';
                checkEmail(email);

            }
        }

        function confirmPayment() {
            var nguoiNhan = document.getElementById('nguoiNhan').value;
            var sdt = document.getElementById('sdt').value;
            var email = document.getElementById('email').value;
            var diaChi = document.getElementById('diaChi').value;
            var tinh = document.getElementById("tinh1").value;
            var huyen = document.getElementById("huyen1").value;
            var xa = document.getElementById("xa1").value;


            var nguoiNhanError = document.getElementById('nguoiNhanError');
            var diaChiError = document.getElementById('diaChiError');
            var emailError = document.getElementById('emailError');
            var emailPattern = /^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;


            var sdtInput = document.getElementsByName('sdt')[0];
            var sdtError = document.getElementById('sdtError');
            var sdtPattern = /^\d{10,11}$/;
            var provinceError = document.getElementById("provinceError");
            var districtError = document.getElementById("districtError");
            var wardError = document.getElementById("wardError");

            if (nguoiNhan.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                nguoiNhanError.textContent = 'Vui lòng nhập tên người nhận.';

            } else if (tinh.trim() == '') {
                districtError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                nguoiNhanError.textContent = '';
                emailError.textContent = '';
                provinceError.textContent = 'Vui lòng chọn tỉnh';

            } else if (huyen.trim() == '') {
                provinceError.textContent = '';
                nguoiNhanError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                districtError.textContent = 'Vui lòng chọn huyện.';

            } else if (xa.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                nguoiNhanError.textContent = '';
                sdtError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                wardError.textContent = 'Vui lòng chọn xã.';

            } else if (sdt.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                nguoiNhanError.textContent = '';
                diaChiError.textContent = '';
                emailError.textContent = '';
                sdtError.textContent = 'Vui lòng nhập số điện thoại.';

            } else if (diaChi.trim() == '') {
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                sdtError.textContent = '';
                nguoiNhanError.textContent = '';
                emailError.textContent = '';
                diaChiError.textContent = 'Vui lòng nhập địa chỉ.';

            } else if (!sdtPattern.test(sdtInput.value)) {
                nguoiNhanError.textContent = '';
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                diaChiError.textContent = '';
                sdtError.textContent = 'Số điện thoại không hợp lệ.';

            } else if (email.trim() == '') {
                nguoiNhanError.textContent = '';
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                diaChiError.textContent = '';
                sdtError.textContent = '';
                emailError.textContent = 'Vui lòng nhập email.';

            } else if (!emailPattern.test(email.trim())) {
                nguoiNhanError.textContent = '';
                provinceError.textContent = '';
                districtError.textContent = '';
                wardError.textContent = '';
                diaChiError.textContent = '';
                sdtError.textContent = '';
                emailError.textContent = 'Email không hợp lệ.';
            } else {
                // nguoiNhanError.textContent = '';
                // provinceError.textContent = '';
                // districtError.textContent = '';
                // wardError.textContent = '';
                // diaChiError.textContent = '';
                // sdtError.textContent = '';
                // emailError.textContent = '';
                checkEmail1(email);

            }
        }
        function checkEmail1(email) {
            fetch('/check-email', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({email: email})
            })
                .then(response => {
                    if (response.status === 200) {
                        return response.json();
                    } else {
                        throw new Error('Network response was not ok.');
                    }
                })
                .then(data => {
                    if (data.exists) {
                        Swal.fire({
                            title: 'Lỗi',
                            text: 'Tài khoản đã được đăng kí vui lòng đăng nhập hoặc dùng email khác.',
                            icon: 'error'
                        });
                    } else {
                        Swal.fire({
                            title: 'Xác nhận đặt hàng',
                            text: 'Bạn có muốn tiến hành đặt nhận hàng không?',
                            icon: 'info',
                            showCancelButton: true,
                            confirmButtonText: 'Đồng ý',
                            cancelButtonText: 'Hủy bỏ'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                document.getElementById('paymentForm').submit();
                                Swal.fire({
                                    title: "Đặt hàng thành công!",
                                    text: "Cảm ơn bạn đã đặt hàng. Chúng tôi sẽ xác nhận sau.",
                                    icon: "success",
                                    confirmButtonText: "Đóng"
                                });
                            }
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    Swal.fire({
                        title: 'Lỗi',
                        text: 'Có lỗi xảy ra khi kiểm tra email.',
                        icon: 'error'
                    });
                });
        }



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
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>


    <script>

        // var gia = parseFloat(document.getElementById("price").value);
        var gia1 = gia;
        document.getElementById("price1").value = gia1.toFixed(0);

        var gia1Formatted1 = gia.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

        document.getElementById("price").value = gia1WithCurrency1;

        function togglePaymentDetails1() {
            var ctggDetails = document.getElementById("ctgg-details");
            var ctggRadio = document.getElementById("ctgg");

            if (ctggRadio.checked) {
                ctggDetails.style.display = "block";
            }
        }

        function updatePrice(radioButton) {
            var priceInput = document.getElementById("price");
            var currentPrice = parseFloat(${tongTien});
            var selectedValue = parseFloat(radioButton.value);
            var newPrice = currentPrice - (currentPrice * selectedValue / 100);

            var gia1Formatted = newPrice.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

            var gia1WithCurrency = gia1Formatted + " VNĐ";

            priceInput.value = gia1WithCurrency;
        }

        function toggleView(elementId) {
            var element = document.getElementById(elementId);
            element.style.display = (element.style.display === "block") ? "none" : "block";
        }

        function toggleView(elementId) {
            var element = document.getElementById(elementId);
            element.style.display = (element.style.display === "block") ? "none" : "block";
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

        var checkbox1 = document.getElementById("checkbox1");
        var checkbox2 = document.getElementById("checkbox2");
        var view_dia_chi_cu = document.getElementById("view_dia_chi_cu");
        var view_dia_chi_moi = document.getElementById("view_dia_chi_moi");

        var bothUnchecked = true;

        // Thêm sự kiện cho checkbox1 để kiểm tra trạng thái của checkbox2
        // checkbox1.addEventListener("change", async function () {
        //     if (checkbox1.checked) {
        //         checkbox2.checked = false;
        //         view_dia_chi_moi.style.display = "none";
        //         view_dia_chi_cu.style.display = "block";
        //         await findCalculateShipping();
        //     }
        //     checkBothUnchecked();
        // });

        // Thêm sự kiện cho checkbox2 để kiểm tra trạng thái của checkbox1
        checkbox2.addEventListener("change", function () {
            if (checkbox2.checked) {
                checkbox1.checked = false;
                view_dia_chi_moi.style.display = "block";
            }
            checkBothUnchecked();
        });

        function checkBothUnchecked() {
            if (!checkbox1.checked && !checkbox2.checked) {
                const shippingCost = 0;

                var tongSoTien = currentPrice + shippingCost;
                priceInput1.value = tongSoTien;

                var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                document.getElementById("ship").value = gia1WithCurrency3;

                var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                priceInput.value = gia1WithCurrency2;
                bothUnchecked = true;
            }
            if (!checkbox1.checked && checkbox2.checked) {
                const shippingCost = 0;

                var tongSoTien = currentPrice + shippingCost;
                priceInput1.value = tongSoTien;

                var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                document.getElementById("ship").value = gia1WithCurrency3;

                var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                priceInput.value = gia1WithCurrency2;
                bothUnchecked = true;
            }
        }

        // Thêm sự kiện onchange cho các combobox

        // Hàm để cập nhật giá trị các input dựa trên các combobox đã chọn


        async function findProvinceIdByName(provinceName) {
            const response = await fetch(`http://localhost:8080/public/provinces`);
            const data = await response.json();

            for (const province of data.data) {
                if (province.ProvinceName === provinceName) {
                    return province.ProvinceID;
                }
            }

            return null;
        }

        async function findProvinceNameById(provinceid) {
            const response = await fetch(`http://localhost:8080/public/provinces`);
            const data = await response.json();

            for (const province of data.data) {
                if (province.ProvinceID === provinceid) {
                    return province.ProvinceName;
                }
            }

            return null;
        }

        async function findDistrictIdByName(districtName, provinceId) {
            const response = await fetch('http://localhost:8080/public/districts?province_id=' + provinceId);
            const data = await response.json();

            for (const district of data.data) {
                if (district.DistrictName === districtName) {
                    return district.DistrictID;
                }
            }

            // Trả về null nếu không tìm thấy huyện nào có tên tương ứng
            return null;
        }

        async function findWardIdByName(wardName, districtId) {
            const response = await fetch('http://localhost:8080/public/wards?district_id=' + districtId);
            const data = await response.json();

            for (const ward of data.data) {
                if (ward.WardName === wardName) {
                    return ward.WardCode;
                }
            }

            // Trả về null nếu không tìm thấy xã nào có tên tương ứng
            return null;
        }

        async function findCalculateShipping() {
            var tinh = document.getElementById("tinh").value;
            var provinceName = tinh;
            var provinceId = await findProvinceIdByName(provinceName);


            var huyen = document.getElementById("huyen").value;
            var districtName = huyen;
            var districtId = await findDistrictIdByName(districtName, provinceId);

            var xa = document.getElementById("xa").value;
            var wardName = xa;
            var wardId = await findWardIdByName(wardName, districtId);

            const transportationFeeDTO = {
                toDistrictId: districtId,
                toWardCode: wardId,
                quantity: 1,
                insuranceValue: 0
            };

            try {
                const response = await fetch('http://localhost:8080/public/transportationFee', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(transportationFeeDTO)
                });

                const data = await response.json();

                if (data && data.code === 200) {
                    const shippingCost = data.data.total;

                    var tongSoTien = currentPrice + shippingCost;
                    priceInput1.value = tongSoTien;

                    var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                        minimumFractionDigits: 0,
                        maximumFractionDigits: 3
                    });

                    var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                    document.getElementById("ship").value = gia1WithCurrency3;

                    var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                        minimumFractionDigits: 0,
                        maximumFractionDigits: 3
                    });

                    var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                    priceInput.value = gia1WithCurrency2;

                } else {
                    // document.getElementById("shippingCost").innerText = "Không thể tính phí vận chuyển.";
                }
            } catch (error) {
                console.error('Error:', error);
                // document.getElementById("shippingCost").innerText = "Lỗi khi tính phí vận chuyển. Chi tiết lỗi: " + error.message;
            }
        }


        // JavaScript code để kiểm tra địa chỉ cũ

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
        var currentPrice = parseFloat(${tongTien});

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

        async function calculateShipping() {
            const districtSelect = document.getElementById("district");
            const wardSelect = document.getElementById("ward");
            const toDistrictId = districtSelect.value;
            const toWardCode = wardSelect.value;

            const transportationFeeDTO = {
                toDistrictId: toDistrictId,
                toWardCode: toWardCode,
                quantity: 1,
                insuranceValue: 0
            };

            try {
                const response = await fetch('http://localhost:8080/public/transportationFee', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(transportationFeeDTO)
                });

                const data = await response.json();

                if (data && data.code === 200) {
                    const shippingCost = data.data.total;

                    var tongSoTien = currentPrice + shippingCost;
                    priceInput1.value = tongSoTien;

                    var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                        minimumFractionDigits: 0,
                        maximumFractionDigits: 3
                    });

                    var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                    document.getElementById("ship").value = gia1WithCurrency3;

                    var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                        minimumFractionDigits: 0,
                        maximumFractionDigits: 3
                    });

                    var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                    priceInput.value = gia1WithCurrency2;

                } else {
                    // document.getElementById("shippingCost").innerText = "Không thể tính phí vận chuyển.";
                }
            } catch (error) {
                // console.error('Error:', error);
                // document.getElementById("shippingCost").innerText = "Lỗi khi tính phí vận chuyển. Chi tiết lỗi: " + error.message;
            }
        }

        loadProvinces();
        document.getElementById("province").addEventListener("change", loadDistricts);
        document.getElementById("district").addEventListener("change", loadWards);
        document.getElementById("ward").addEventListener("change", checkSelection);

    </script>

    <c:forEach items="${kh}" var="k">
    <input type="hidden" name="emailExists" id="emailExists" value="${k.email}">
    </c:forEach>

    <!-- all js here -->
    <script src="../../../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="../../../assets/js/popper.js"></script>
    <script src="../../../assets/js/bootstrap.min.js"></script>
    <script src="../../../assets/js/ajax-mail.js"></script>
    <script src="../../../assets/js/plugins.js"></script>
    <%--<script src="../../../assets/js/main.js"></script>--%>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>


</body>


</html>