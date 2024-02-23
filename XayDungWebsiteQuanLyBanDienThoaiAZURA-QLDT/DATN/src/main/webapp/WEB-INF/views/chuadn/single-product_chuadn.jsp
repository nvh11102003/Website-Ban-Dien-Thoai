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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    <script src="https://example.com/path/to/currencyFormat.js"></script>
    <script>
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


    </script>
    <style>
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            /* Các thuộc tính khác tùy thuộc vào thiết kế của bạn */
        }

        .card-title {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
            /* Các thuộc tính khác tùy thuộc vào thiết kế của bạn */
        }

        .card-body {
            /* Các thuộc tính khác tùy thuộc vào thiết kế của bạn */
        }

        .st-pd-table {
            width: 100%;
            border-collapse: collapse;
            /* Các thuộc tính khác tùy thuộc vào thiết kế của bạn */
        }

        .st-pd-table td {
            padding: 8px;
            border-bottom: 1px solid #ccc;
            /* Các thuộc tính khác tùy thuộc vào thiết kế của bạn */
        }

        .property {
            font-weight: bold;
            /* Các thuộc tính khác tùy thuộc vào thiết kế của bạn */
        }

        .value {
            /* Các thuộc tính khác tùy thuộc vào thiết kế của bạn */
        }

        .product_d_right input[type="text"] {
            border: none; /* Loại bỏ viền */
            background-color: transparent; /* Nền trong suốt */
            font-size: 16px; /* Cỡ chữ */
            font-family: inherit; /* Sử dụng font chữ của phần tử cha */
            padding: 0; /* Loại bỏ khoảng cách xung quanh */
            margin: 0; /* Loại bỏ margin */
            outline: none; /* Loại bỏ đường viền khi focus */
        }

        .st-select__item {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            display: -webkit-inline-box;
            display: -ms-inline-flexbox;
            display: inline-flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            padding: 6px 0;
            -webkit-transition: all .3s ease;
            -o-transition: all .3s ease;
            transition: all .3s ease;
            border-radius: 4px;
            cursor: pointer;
            color: #444b52;
            border: 1px;
        }

        .st-select {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin-bottom: 16px;
            background: #f8f9fa;
            border-radius: 4px;
            border-color: black;
        }

        .st-select__item .radio {
            width: 20px;
        }

        .checkbox, .radio {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }

        a, a:active, a:focus, a:hover {
            outline: 0;
            text-decoration: none;
            color: #000;
        }

        .st-select-color {
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
        }

        .st-select-color {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin-bottom: 16px;
        }

        .st-select-color__item {
            text-align: center;
            margin-right: 18px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<script>
    function formatCurrencyVND(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }

    window.onload = function () {
        var giaBanInput = document.getElementById('giaTrcGiam');
        // giaBanInput.value = formatCurrencyVND(giaBanInput.value);
        var giaBanInput1 = document.getElementById('giaBan');
        // giaBanInput1.value = formatCurrencyVND(giaBanInput1.value);
        var giaBanInput2 = document.getElementById('giaSauGiam');
        // giaBanInput2.value = formatCurrencyVND(giaBanInput2.value);
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
                                    <li class="languages"><a href="#"><img src="../../../assets\img\logo\fontlogo.jpg"
                                                                           alt=""> English <i
                                            class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_languages">
                                            <li><a href="#"><img src="../../../assets\img\logo\fontlogo.jpg" alt="">
                                                English</a></li>
                                            <li><a href="#"><img src="../../../assets\img\logo\fontlogo2.jpg" alt="">
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
                                <li>Sản phẩm</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
            <!--breadcrumbs area end-->

            <!--product wrapper start-->
            <div class="product_details" id="spkgg">
                <form id="purchaseForm" action="/thanhToanCDN/${sanPham.tenSanPham}" method="get">
                    <input name="check" value="${check}" style="display: none">
                    <div class="row">
                        <div class="col-lg-5 col-md-6">
                            <div class="modal_img">
                                <img id="productImage" style="width: 470px;height: 470px" src="/img/${sanPham.hinhAnh}" alt="">
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                            <div class="product_d_right">
                                <h1><input type="text" value="${sanPham.tenSanPham}" id="tenSanPham"
                                           name="tenSanPham" readonly
                                           style="font-size: 60px"></h1><br>
                                <div class="product_desc">
                                    <p>${sanPham.moTa}</p>
                                </div>
                                <!-- Không cần input tìm kiếm -->
                                <!-- Đoạn mã HTML cho Dung Luong -->
                                <div class="st-select">
                                    <c:forEach var="dungLuong" items="${sanPham.listDungLuongOfSanPhamDTOS}">
                                        <a href="javascript:void(0);" class="st-select__item js--select-item"
                                           onclick="handleRadioClick('${sanPham.tenSanPham}', '${dungLuong.tenDungLuong}', '${dungLuong.giaBan}')">
                                            <div class="radio">
                                                <input type="radio" name="gp"
                                                       value="${dungLuong.maDungLuong}"
                                                    ${dungLuong.tenDungLuong == tenDungLuongCheck ? 'checked' : ''}>
                                                    ${dungLuong.tenDungLuong}
                                                <input type="hidden" id="radio_DungLuong" name="tenDungLuong"
                                                       value="${tenDungLuongCheck}">
                                            </div>
                                            <c:if test="${dungLuong.giaBanSauKhiGG == null}">
                                                        <span class="product_price" disabled="" name="giaBan">
                                                        <script>document.write(formatCurrencyVND(${dungLuong.giaBan}))</script>
                                                        </span>
                                            </c:if>

                                            <c:if test="${dungLuong.giaBanSauKhiGG != null}">
                                                    <span class="product_price" disabled="" name="giaBan">
                                                        <script>document.write(formatCurrencyVND(${dungLuong.giaBanSauKhiGG}))</script>
                                                        </span>
                                            </c:if>
                                        </a>
                                    </c:forEach>
                                </div>
                                <div class="st-select">
                                    <c:forEach var="mauSac" items="${listMauSac}" varStatus="loop">
                                        <div class="st-select__item js--select-item">
                                            <div class="radio">
                                                <input
                                                        type="radio"
                                                        id="radio_MauSac" name="tenMauSac"
                                                        value="${mauSac.tenMauSac}"
                                                        onchange="handleRadioChange(this)">
                                            </div>
                                            <p>${mauSac.tenMauSac}</p>
                                        </div>
                                        <input type="hidden" name="tMS" id="tMS">
                                    </c:forEach>

                                </div>
                                <div class="content_price mb-15">
                                    <c:if test="${empty giaBanGG}">
                                                        <span class="product_price" style="color: red" disabled=""
                                                              name="giaBan">
                                                            <input type="hidden" name="giaBan" value="${giaBan}">
                                                        <script>document.write(formatCurrencyVND(${giaBan}))</script>
                                                        </span>
                                    </c:if>

                                    <c:if test="${not empty giaBanGG}">
                                                        <span class="product_price"
                                                              style="text-decoration: line-through; font-size: small; font-weight: normal"
                                                              disabled="">
                                                        <script>document.write(formatCurrencyVND(${giaBan}))</script>
                                                        </span>
                                        <span class="product_price" style="color: red" disabled="" name="giaBan">
                                                <input type="hidden" name="giaBan" value="${giaBanGG}">

                                                        <script>document.write(formatCurrencyVND(${giaBanGG}))</script>
                                                        </span>
                                    </c:if>
                                </div>
                                <script>
                                    function handleRadioChange(radio) {
                                        console.log("Đã chọn màu sắc: " + radio.value);
                                        document.getElementById('tMS').value = radio.value;

                                        const tenSanPham = document.getElementById('tenSanPham').value;
                                        const tenDungLuong = document.getElementById('radio_DungLuong').value;
                                        const tenMauSac = radio.value;

                                        fetch(`/soluongtonChuaDangNhap?tenSanPham=` + tenSanPham + `&tenDungLuong=` + tenDungLuong + `&tenMauSac=` + tenMauSac)
                                            .then(response => response.json())
                                            .then(data => {
                                                // Hiển thị số lượng tồn trong HTML
                                                document.getElementById('soLuongTon').value = data;
                                            })
                                            .catch(error => console.error('Error:', error));
                                        fetch(`/hinhAnhURL?tenSanPham=` + tenSanPham + `&tenDungLuong=` + tenDungLuong + `&tenMauSac=` + tenMauSac)
                                            .then(response => {
                                                if (!response.ok) {
                                                    throw new Error('Lỗi kết nối');
                                                }
                                                return response.text(); // Vì bạn mong đợi một đường dẫn hình ảnh (string)
                                            })
                                            .then(duongDanHinhAnh => {
                                                document.getElementById('productImage').src =/img/ +  duongDanHinhAnh;
                                            })
                                            .catch(error => console.error('Lỗi:', error));
                                    }
                                </script>


                                <div class="content_price mb-15">
                                    <h1><input type="text" id="giaBanBanDau" name="giaBan"
                                               value="${sanPham.giaBan}" readonly
                                               style="font-size: 35px"></h1>
                                </div>
                                <div class="box_quantity mb-20">
                                    <label>Số lượng</label>
                                    <input min="1" max="100" value="1" name="soLuong1" id="soLuong1" type="number">
                                    <input type="hidden" value="${maChiTietSanPham.maChiTietSanPham}">
                                    <button type="button" onclick="checkSLCDN()"><i class="fa fa-shopping-cart"></i>
                                        Mua
                                        ngay
                                    </button>
                                    <button type="button"
                                            onclick="dangnhap()">
                                        <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                    </button>
                                </div>
<%--                                <p >Số lượng tồn: <span id="soLuongTon"></span></p>--%>
                                <input type="hidden" id="soLuongTon" >
                            </div>
                        </div>
                    </div>
                </form>
            </div>


            <!--product info start-->
            <div class="product_d_info">
                <div class="row">
                    <div class="col-12">
                        <div class="product_d_inner">
                            <div class="product_info_button">
                                <ul class="nav" role="tablist">
                                    <li>
                                        <a class="active" data-toggle="tab" href="#info" role="tab"
                                           aria-controls="info" aria-selected="false">Thêm thông tin</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#sheet" role="tab" aria-controls="sheet"
                                           aria-selected="false">Bảng dữ liệu</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews"
                                           aria-selected="false">Đánh giá</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="info" role="tabpanel">
                                    <div class="product_info_content">
                                        <p>${sanPham.moTa}</p>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="sheet" role="tabpanel">
                                    <div class="product_d_table">
                                        <div class="card re-card st-card">
                                            <h2 class="card-title">Thông số kỹ thuật</h2>
                                            <div class="card-body">
                                                <table class="st-pd-table">
                                                    <tbody>
                                                    <tr>
                                                        <td class="property">Màn hình:</td>
                                                        <td class="value">${sanPham.manHinh}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="property">Camera sau:</td>
                                                        <td class="value">${sanPham.camerasau}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="property">Camera Trước:</td>
                                                        <td class="value">${sanPham.cameratruoc}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="property">Hệ điều hành:</td>
                                                        <td class="value">${sanPham.heDieuHanh}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="property">Ram:</td>
                                                        <td class="value">${sanPham.ram}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="property">Chip:</td>
                                                        <td class="value">${sanPham.tenChip}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="property">Dung Lượng Pin:</td>
                                                        <td class="value">${sanPham.dungLuongPin}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="property">Thẻ sim:</td>
                                                        <td class="value">${sanPham.sim}</td>
                                                    </tr>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product_info_content">
                                        <p>${maChiTietSanPham.moTa}</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews" role="tabpanel">
                                    <div class="product_info_content">
                                        <p>${maChiTietSanPham.moTa}</p>
                                    </div>
                                    <br>
                                    <c:if test="${empty danhGiaList}">
                                        <p>Không có đánh giá nào.</p>
                                    </c:if>
                                    <c:forEach items="${danhGiaList}" var="list">
                                        <div class="product_info_inner">
                                            <div class="product_ratting mb-10">
                                                <ul>
                                                </ul>
                                                <p>${ngayDanhGia}</p>
                                            </div>
                                            <div class="product_demo">
                                                <strong>${list.khachHang.ten}</strong>
                                                <p>${list.danhGia}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <br>
                                    <div class="product_review_form">
                                        <form id="reviewForm" action="/add_danh_gia" method="post">
                                            <h2>Thêm một đánh giá</h2>
                                            <input type="hidden" name="san-pham"
                                                   value="${sanPham.tenSanPham}">
                                            <input type="hidden" name="maKhachHang" value="${kh.maKhachHang}">
                                            <div class="row">
                                                <div class="col-12">
                                                    <label for="comment">Nhận xét:</label>
                                                    <textarea name="comment" id="comment" required></textarea>
                                                </div>
                                            </div>
                                            <button type="button" onclick="check()">Submit</button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--product info end-->

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
                                            <a href="#"><img src="../../../assets\img\product\product13.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="../../../assets\img\product\product14.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab3" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="../../../assets\img\product\product15.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal_tab_button">
                                    <ul class="nav product_navactive" role="tablist">
                                        <li>
                                            <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab"
                                               aria-controls="tab1" aria-selected="false"><img
                                                    src="../../../assets\img\cart\cart17.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-toggle="tab" href="#tab2" role="tab"
                                               aria-controls="tab2" aria-selected="false"><img
                                                    src="../../../assets\img\cart\cart18.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link button_three" data-toggle="tab" href="#tab3"
                                               role="tab" aria-controls="tab3" aria-selected="false"><img
                                                    src="../../../assets\img\cart\cart19.jpg" alt=""></a>
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
                                    <h4>Màu</h4>
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


    function checkSLCDN() {
        var sLCDN = parseInt(document.getElementById('soLuong1').value);
        var soLuongTon = parseInt(document.getElementById('soLuongTon').value);
        var maMauSac = document.getElementById('tMS').value;
        if (maMauSac == '') {
            Swal.fire({
                title: 'Thông báo:',
                text: 'Vui lòng chọn màu sắc !',
                icon: 'warning',
                confirmButtonText: 'Đồng ý'
            });
            return;
        }
        if (sLCDN <= 0 || isNaN(sLCDN)) {
            Swal.fire({
                title: 'Thông báo:',
                text: 'Vui lòng nhập số lượng hoặc lớn hơn 0!',
                icon: 'warning',
                confirmButtonText: 'Đồng ý'
            });
            return;
        }

        if (sLCDN > soLuongTon) {
            Swal.fire({
                title: 'Thông báo:',
                text: 'Sản phẩm không đủ hàng !',
                icon: 'warning',
                confirmButtonText: 'Đồng ý'
            });
        } else
            Swal.fire({
                title: 'Xác nhận mua hàng',
                text: "Bạn có muốn mua sản phẩm này không?",
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Có',
                cancelButtonText: 'Không'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('purchaseForm').submit();
                }
            });
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

    function showCTSPKGG() {
        document.getElementById("spkgg").style.display = "block";
        document.getElementById("spgg").style.display = "none";
    }

    function showCTSPGG() {
        document.getElementById("spkgg").style.display = "none";
        document.getElementById("spgg").style.display = "block";
    }

    <%--document.addEventListener("DOMContentLoaded", function () {--%>
    <%--    if (${check == 0}) {--%>
    <%--        showCTSPKGG();--%>
    <%--    } else {--%>
    <%--        showCTSPGG();--%>
    <%--    }--%>
    <%--});--%>

    // Function to handle radio button click
    function handleRadioClick(tenSanPham, tenDungLuong, giaBan) {
        // Save the selected value
        selectedValue = tenDungLuong;

        // You can handle the click event here, for example, redirect to the specified URL
        var redirectUrl = "/viewCDN/" + tenSanPham + "/" + tenDungLuong;
        window.location.href = redirectUrl;
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