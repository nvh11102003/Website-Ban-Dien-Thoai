<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <title>POS Bán Hàng</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../../../assetsAdmin/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.7/dist/sweetalert2.min.css">
    <link rel="icon" type="image/png" href="../../../../../assets/img/logo/AZURA.png">

</head>


<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
    <!-- Sidebar toggle button-->
    <!-- Navbar Right Menu-->
    <ul class="app-nav">

        <li><a class="app-nav__item" href="/loginView"><i class='bx bx-log-out bx-rotate-180'></i> </a>
        </li>
    </ul>
</header>
<!-- Sidebar menu-->

<main class="app app-ban-hang">
    <div class="row">
        <div class="col-md-12">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><b>POS bán hàng</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="tile">
                <h3 class="tile-title">Phần mềm bán hàng</h3>
                <form class="row align-items-end" id="searchForm">
                    <div class="form-group col-md-4">
                        <label for="tenSanPham" class="control-label">Tên sản phẩm</label>
                        <input id="tenSanPham" class="form-control" type="text" name="tenSanPham">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="maDungLuong" class="control-label">Dung lượng</label>
                        <select class="form-control" id="maDungLuong" name="maDungLuong">
                            <option value="">-- Chọn dung lượng --</option>
                            <c:forEach items="${dungLuongs}" var="dl">
                                <option value="${dl.maDungLuong}">${dl.tenDungLuong}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="maMauSac" class="control-label">Màu sắc</label>
                        <select class="form-control" id="maMauSac" name="maMauSac">
                            <option value="">-- Chọn màu sắc --</option>
                            <c:forEach items="${mauSacs}" var="ms">
                                <option value="${ms.maMauSac}">${ms.tenMauSac}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="maNSX" class="control-label">Nhà sản xuất</label>
                        <select class="form-control" id="maNSX" name="maNSX">
                            <option value="">-- Chọn nhà sản xuất --</option>
                            <c:forEach items="${nsxs}" var="nsx">
                                <option value="${nsx.maNSX}">${nsx.tenNSX}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <div class="form-group col-md-12">
                        <button class="btn btn-excel btn-sm" title="Tìm kiếm" type="submit"><i
                                class="fas fa-search"></i>Tìm kiếm
                        </button>
                    </div>
                </form>

                <table class="table table-hover table-bordered display" id="sampleTableSP">
                    <thead>
                    <tr>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng còn</th>
                        <th>Ảnh</th>
                        <th>Tình trạng</th>
                        <th>Giá tiền</th>
                        <th>Màu sắc</th>
                        <th>Dung lượng</th>
                        <th>Chip</th>
                        <th>Dung lượng pin (mAh)</th>
                        <th>Tính năng</th>
                        <th style="display: none">Tính năng</th>
                    </tr>
                    </thead>
                    <tbody id="data-body">

                    </tbody>
                </table>
                <div class="du--lieu-san-pham">
                    <table class="table table-hover table-bordered" id="productTable">
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Imei</th>
                            <th>Giá tiền</th>
                            <th>Tổng tiền</th>
                            <th>Xóa</th>
                        </tr>
                        </thead>
                        <tbody id="productTableBody">

                        </tbody>
                    </table>
                </div>
                <div class="alert">

                    <i class="fas fa-exclamation-triangle"></i> Gõ mã hoặc tên sản phẩm vào thanh tìm kiếm để thêm hàng
                    vào đơn hàng
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="tile">
                <h3 class="tile-title">Thông tin thanh toán</h3>
                <div class="row">
                    <div class="form-group  col-md-10">
                        <label class="control-label">Họ tên khách hàng</label>
                        <input class="form-control" type="text" placeholder="" id="tenKhachHangAdd" required>
                    </div>
                    <div class="form-group col-md-10" >
                        <label class="control-label" >Địa chỉ</label>
                        <input class="form-control"  type="text" required id="diaChiAdd">
                    </div>
                    <div class="form-group col-md-10">
                        <label class="control-label">SDT</label>
                        <input class="form-control" type="text" required id="sdtAdd">
                    </div>
                    <div class="form-group  col-md-12">
                        <label class="control-label">Ghi chú đơn hàng</label>
                        <textarea class="form-control" rows="4" placeholder="Ghi chú thêm đơn hàng"
                                  id="ghiChu" name="ghiChu"></textarea>
                    </div>

                </div>
                <div class="row">

                    <div class="form-group  col-md-12">
                        <label class="control-label">Hình thức thanh toán</label>
                        <select class="form-control" id="hinhThucThanhToan" required readonly="">
                            <option value="0">Thanh toán khi nhận hàng</option>
                            <option value="2">Trả tiền mặt tại quầy</option>
                            <option value="3">Thanh toán chuyển khoản</option>
                        </select>
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Tạm tính tiền hàng: </label>
                        <p class="control-all-money-tamtinh"></p>
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Giảm giá: </label>
                        <select class="form-control" name="maVoucher" id="voucher" onchange="displayDiscountInfo()">
                            <option value="">-- Chọn voucher --</option>
                            <option></option>
                        </select>
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Tổng cộng thanh toán: </label>
                        <p class="control-all-money-total" id="tongTienAdd">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Phần trăm giảm giá: </label>
                        <input class="form-control" type="number" id="phanTramGiamGia">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Khách hàng đưa tiền (F8): </label>
                        <input class="form-control" type="number" id="customerPayment">
                    </div>
                    <div class="form-group  col-md-12">
                        <label class="control-label">Khách hàng còn nợ: </label>
                        <p id="remainingAmount" class="control-all-money"></p>
                    </div>
                    <div class="col-md-12">
                        <div id="qrCodeContainer" style="display: none;"><img src="../../../../assets/img/QR/qr.jpg"
                                                                              style="height: 430px;width: 430px;text-align: center">
                        </div>
                    </div>
                    <div class="tile-footer col-md-12">
                        <button class="btn btn-primary luu-va-in" type="button" id="submitButton"> Lưu đơn hàng (F9)
                        </button>

                        <a class="btn btn-secondary luu-va-in"
                           style="${nhanVien.chucVu.maChucVu == 1 ? 'display:none': ''}"
                           href="/admin/${nhanVien.maNhanVien}/home">Quay về</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>

<!-- The Modal -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">X</span>
        </div>


    </div>

</div>
<script src="../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
<script src="../../../../assetsAdmin/js/popper.min.js"></script>
<script src="../../../../assetsAdmin/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="../../../../assetsAdmin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../../../assetsAdmin/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="../../../../assetsAdmin/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../../../assetsAdmin/js/plugins/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> <i class="bx bxs-calendar" ></i> ' + today + ' | <i class="fa fa-clock-o" aria-hidden="true"></i>  : ' + nowTime +
            '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
</script>
<script>
    $(document).ready(function () {

        $("#searchForm").submit(function (event) {
            event.preventDefault();

            var tenSanPham = $("#tenSanPham").val();
            var maDungLuong = $("#maDungLuong").val();
            var maMauSac = $("#maMauSac").val();
            var maNSX = $("#maNSX").val();
            var request = {
                tenSanPham: tenSanPham,
                maDungLuong: maDungLuong,
                maMauSac: maMauSac,
                maNSX: maNSX,
            }
            console.log(request);
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/admin/chi-tiet-san-pham/search-tai-quay",
                data: JSON.stringify(request),
                dataType: 'json',
                success: function (response) {
                    // Handle the response from the backend
                    console.log(response);
                    displayResults(response);
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        });

        //view Table sp
        function displayResults(results) {
            var tableBody = $("#sampleTableSP tbody");
            tableBody.empty();
            if (results.length === 0) {
                var noResultsRow = "<tr><td colspan='8' class='text-center'>Không có kết quả</td></tr>";
                tableBody.append(noResultsRow);
                return;
            }
            for (var i = 0; i < results.length; i++) {
                var sanPham = results[i];
                var spanClass = '';
                var spanText = '';

                switch (sanPham.tinhTrang) {
                    case 0:
                        spanClass = 'bg-warning';
                        spanText = 'Hết hàng';
                        break;
                    case 1:
                        spanClass = 'bg-success';
                        spanText = 'Còn hàng';
                        break;
                    default:
                        spanClass = '';
                        spanText = 'Error';
                }
                var addButton = sanPham.tinhTrang === 1 ?
                    "<button class='btn btn-primary btn-sm edit position-relative a-hover addProductButton' type='button' title='Cập nhập'  " +
                    "data-id='" + sanPham.maChiTietSanPham + "'><i class='fa fa-edit'></i> ADD" :
                    "";
                var row = "<tr>" +
                    "<td>" + sanPham.maSanPham + "</td>" +
                    "<td>" + sanPham.tenSanPham + "</td>" +
                    "<td>" + sanPham.soLuongTon + "</td>" +
                    "<td>" + "<img src='/img/" + sanPham.hinhAnh + "' alt='' width='100px;'>" + "</td>" +
                    "<td><span class='badge " + spanClass + "'>" + spanText + "</span></td>" +
                    "<td>" + sanPham.giaBan + "</td>" +
                    "<td>" + sanPham.mauSac + "</td>" +
                    "<td>" + sanPham.dungLuong + "</td>" +
                    "<td>" + sanPham.tenChip + "</td>" +
                    "<td>" + sanPham.dungLuongPin + "</td>" +
                    "<td>" + addButton + "</td>";

                tableBody.append(row);
            }
        }

    });
    $('#sampleTableSP').on('click', '.addProductButton', function () {
        var selectedProduct = {
            maSanPham: $(this).data('id'),
            tenSanPham: $(this).closest('tr').find('td:eq(1)').text(),
            hinhAnh: $(this).closest('tr').find('td:eq(3) img').attr('src'),
            tinhTrang: $(this).closest('tr').find('td:eq(4) span').text(),
            giaBanString: $(this).closest('tr').find('td:eq(5)').text(),
            mauSac: $(this).closest('tr').find('td:eq(6)').text(),
            dungLuong: $(this).closest('tr').find('td:eq(7)').text(),
            tenChip: $(this).closest('tr').find('td:eq(8)').text(),
            dungLuongPin: $(this).closest('tr').find('td:eq(9)').text()
        };

        var quantity = 1;

        var totalPrice = calculateTotalPrice(selectedProduct.giaBanString, quantity);

        var newRow = "<tr>" +
            "<td>" + selectedProduct.maSanPham + "</td>" +
            "<td>" + selectedProduct.tenSanPham + "</td>" +
            "<td><img src='" + selectedProduct.hinhAnh + "' alt='Product Image' width='50'></td>" +
            "<td><input type='number' readonly class='form-control quantityInput' value='" + quantity + "' min='1'></td>" +
            "<td><input type='text' class='form-control' id='imei'>" + "</td>" +
            "<td>" + selectedProduct.giaBanString + "</td>" +
            "<td class='productPrice'>" + totalPrice + "</td>" +
            "<td><button class='btn btn-danger btn-sm removeProduct'>Remove</button></td>" +
            "</tr>";

        $('#productTableBody').append(newRow);

        updateTotalAmount();
        $('.quantityInput').on('input', function () {
            var newQuantity = $(this).val();
            var row = $(this).closest('tr');
            var price = selectedProduct.giaBanString;
            var newTotalPrice = calculateTotalPrice(price, newQuantity);
            row.find('.productPrice').text(newTotalPrice);
            updateTotalAmount();
            callApiFillList(getTotalQuantity(), getTotalAmount());
        });


        $('.quantityInput').on('change', function () {
            var newQuantity = $(this).val();
            var row = $(this).closest('tr');
            var price = selectedProduct.giaBanString;
            var newTotalPrice = calculateTotalPrice(price, newQuantity);
            row.find('.productPrice').text(newTotalPrice);
            updateTotalAmount();
            callApiFillList(getTotalQuantity(), getTotalAmount());
        });


        $('.removeProduct').on('click', function () {
            $(this).closest('tr').remove();
            updateTotalAmount();
            callApiFillList(getTotalQuantity(), getTotalAmount());
        });


        function calculateTotalPrice(price, quantity) {
            return parseFloat(price) * parseInt(quantity);
        }


        function updateTotalAmount() {
            var totalAmount = 0;
            $('.productPrice').each(function () {
                totalAmount += parseFloat($(this).text());
            });
            $('.control-all-money-tamtinh').text(totalAmount);
            $('.control-all-money-total').text(totalAmount);
        }

        updateTotalAmount();
        callApiFillList(getTotalQuantity(), getTotalAmount());
    });
    callApiFillList(getTotalQuantity(), getTotalAmount());
    function callApiFillList(totalQuantity, totalAmount) {
        var request = {
            soLuongMuaTT: totalQuantity,
            donGiaMuaTT: totalAmount,
        }
        console.log(request);
        $.ajax({
            type: 'POST',
            url: '/voucher/list',
            contentType: 'application/json',
            data: JSON.stringify(request),
            success: function (response) {
                console.log(response);
                updateList(response);
            },
            error: function (error) {
                console.error(error);
            }
        });
    }

    function updateList(data) {
        var selectOptions = "<option value=''>-- Chọn voucher --</option>";

        data.forEach(function (item) {
            selectOptions += "<option value='" + item.maVoucher + "' data-discount='" + item.phanTramVoucher + "'>" + item.ten + "</option>";
        });

        $('#voucher').html(selectOptions);

    }

    function getTotalQuantity() {
        var totalQuantity = 0;
        $('.quantityInput').each(function () {
            totalQuantity += parseInt($(this).val());
        });
        return totalQuantity;
    }

    function getTotalAmount() {
        var totalAmount = 0;
        $('.productPrice').each(function () {
            totalAmount += parseFloat($(this).text());
        });
        return totalAmount;
    }
</script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function addKhachHang() {
        var formData = {
            tenKhachHang: $("#tenKhachHang").val(),
            diaChi: $("#diaChi").val(),
            email: $("#email").val(),
            ngaySinh: $("#ngaySinh").val(),
            soDienThoai: $("#soDienThoai").val(),
            cccd: $("#cccd").val(),
            gioiTinh: $("#gioiTinh").val() === "true" ? true : false
        };

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/chi-tiet-san-pham/add-khach-hang",
            data: JSON.stringify(formData),
            dataType: 'json',
            success: function (response) {
                console.log(response);
                if (confirm("Thêm khách hàng thành công!")) {
                    // User clicked OK, close the modal
                    // $('#exampleModalCenter').hide();
                    $('#hoTenKhachHang').val(response.maKhachHang);
                    $('#hoTenKhachHang').attr('placeholder', response.ten);
                }

            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    }
</script>
<script>
    function updateTotalAmount() {
        var totalAmount = 0;
        $('.productPrice').each(function () {
            totalAmount += parseFloat($(this).text());
        });
        $('.control-all-money-tamtinh').text(totalAmount);

        updateRemainingAmount();
    }

    function updateRemainingAmount() {
        var customerPayment = $('#customerPayment').val();
        var totalAmount = parseFloat($('.control-all-money-total').text());
        var remainingAmount = customerPayment - totalAmount;

        $('#remainingAmount').text(formatCurrency(remainingAmount) + ' VNĐ');
    }

    function formatCurrency(amount) {
        return amount.toLocaleString('vi-VN');
    }

    updateRemainingAmount();

    updateTotalAmount();

    $('#customerPayment').on('input', function () {
        updateRemainingAmount();
    });
</script>

<script>
    $(document).ready(function () {

        $("#submitButton").click(function () {
            var tenKhachHang = $("#tenKhachHangAdd").val();
            var sdt = $("#sdtAdd").val();
            var diaChi = $("#diaChiAdd").val();
            var maVoucher = $("#voucher").val();
            var sanPhamThanhToanTaiQuayDTOS = getSelectedProductsData();
            var loaiThanhToan = parseInt($("#hinhThucThanhToan").val())
            var imeiInput = document.getElementById('imei').value;
            if (!tenKhachHang) {
                swal.fire({
                    title: 'Cảnh báo',
                    text: 'Tên khách hàng không được để trống!',
                    icon: 'warning',
                    confirmButtonText: 'Đóng',
                });
                return;
            }

            // Kiểm tra IMEI trùng lặp trực tiếp trên giao diện
            if (hasDuplicateIMEI(sanPhamThanhToanTaiQuayDTOS, imeiInput)) {
                swal.fire({
                    title: 'Cảnh báo',
                    text: 'IMEI trùng lặp, vui lòng kiểm tra lại.',
                    icon: 'warning',
                    confirmButtonText: 'Đóng',
                });
                return;
            }
            //check imei

            const vietnameseMobileRegex = /^(\+84|0)(3[2-9]|5[689]|7[06-9]|8[1-9]|9\d)\d{7}$/;
            if(sdt){
                if (!vietnameseMobileRegex.test(sdt)) {
                    swal.fire({
                        title: 'Cảnh báo',
                        text: 'Số điện thoại không đúng định dạng!',
                        icon: 'warning',
                        confirmButtonText: 'Đóng',
                    });
                    return;
                }
            }

            if (!sanPhamThanhToanTaiQuayDTOS || sanPhamThanhToanTaiQuayDTOS.length === 0) {
                swal.fire({
                    title: 'Cảnh báo',
                    text: 'Vui lòng thêm sản phẩm!',
                    icon: 'warning',
                    confirmButtonText: 'Đóng',
                });
                return;
            }

            if (isNaN(loaiThanhToan) || loaiThanhToan === null) {
                swal.fire({
                    title: 'Cảnh báo',
                    text: 'Vui lòng chọn loại thanh toán!',
                    icon: 'warning',
                    confirmButtonText: 'Đóng',
                });
                return;
            }
            var ghiChuInput = document.getElementById("ghiChu");
            var customerData = {
                tenKhachHang: tenKhachHang,
                sdt: sdt,
                diaChi: diaChi,
                tongTien: parseFloat($("#tongTienAdd").text()),
                loaiThanhToan: loaiThanhToan,
                sanPhamThanhToanTaiQuayDTOS: sanPhamThanhToanTaiQuayDTOS,
                ghiChu: ghiChuInput.value,
                maNhanVien: '${nhanVien.maNhanVien}',
                maVoucher: maVoucher,
            };
            console.log(customerData);
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/admin/hoa-don/add-hoa-don-tai-quay",
                data: JSON.stringify(customerData),
                dataType: 'text',
                success: function (response) {
                    if (response !== "Success") {
                        swal.fire({
                            title: 'Cảnh báo',
                            text: response,
                            icon: 'warning',
                            confirmButtonText: 'Đóng',
                        });
                    } else {
                        swal.fire({
                            icon: 'success',
                            title: 'Thêm thành công!',
                        });
                        setTimeout(() => {
                            location.reload();
                        }, 1000);
                    }
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        });
    });

    // Hàm kiểm tra IMEI trùng lặp trực tiếp trên giao diện
    function hasDuplicateIMEI(selectedProducts, imeiInput) {
        var imeiSet = new Set();

        for (var i = 0; i < selectedProducts.length; i++) {
            var imei = selectedProducts[i].imei;

            // Kiểm tra xem IMEI đã tồn tại trong Set chưa
            if (imeiSet.has(imei) || imeiSet === imeiInput) {
                return true; // Trùng lặp
            } else {
                imeiSet.add(imei);
            }
        }

        return false; // Không trùng lặp
    }

    function getSelectedProductsData() {
        var selectedProducts = [];

        $('#productTableBody tr').each(function () {
            var row = $(this);

            var maSanPham = row.find('td:eq(0)').text();
            var quantity = row.find('td:eq(3) input').val();
            var imei = row.find('td:eq(4) input').val();
            var giaBanString = row.find('td:eq(5)').text();

            var product = {
                maChiTietSanPham: maSanPham,
                soLuongMua: quantity,
                giaTien: giaBanString,
                imei: imei
            };

            selectedProducts.push(product);
        });

        return selectedProducts;
    }
</script>

<script>
    document.getElementById('hinhThucThanhToan').addEventListener('change', function () {
        var selectedValue = this.value;

        if (selectedValue === '3') {
            document.getElementById('qrCodeContainer').style.display = 'block';

            generateQRCode('YourTransferInformationHere');
        } else {
            document.getElementById('qrCodeContainer').style.display = 'none';
        }
    });
</script>
<script>
    function displayDiscountInfo() {
        var voucherSelect = document.getElementById("voucher");
        var discountInfoInput = document.getElementById("phanTramGiamGia");
        var selectedOption = voucherSelect.options[voucherSelect.selectedIndex];

        if (selectedOption) {
            var discountValue = selectedOption.getAttribute("data-discount");
            var discountedTotal;
            var tongTien = getTotalAmount();
            if(discountValue === null){
                discountInfoInput.value = "";
                discountedTotal = tongTien;
            }else{
                discountInfoInput.value = discountValue ;
                discountedTotal = tongTien - (tongTien * discountValue / 100);
            }
            $('.control-all-money-total').text(discountedTotal);
        } else {
            discountInfoInput.value = "";
            $('.control-all-money-total').text(tongTien);
        }
    }
</script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>