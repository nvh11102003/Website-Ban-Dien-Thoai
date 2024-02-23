<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Gán mã giảm giá | Quản trị Admin</title>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.1/dist/sweetalert2.all.min.js"></script>
    <link rel="icon" type="image/png" href="../../../../../assets/img/logo/AZURA.png">

</head>

<body class="app sidebar-mini rtl">
<style>
    .Choicefile {
        display: block;
        background: #14142B;
        border: 1px solid #fff;
        color: #fff;
        width: 150px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        padding: 5px 0px;
        border-radius: 5px;
        font-weight: 500;
        align-items: center;
        justify-content: center;
    }

    .Choicefile:hover {
        text-decoration: none;
        color: white;
    }

    #uploadfile,
    .removeimg {
        display: none;
    }

    #thumbbox {
        position: relative;
        width: 100%;
        margin-bottom: 20px;
    }

    .removeimg {
        height: 25px;
        position: absolute;
        background-repeat: no-repeat;
        top: 5px;
        left: 5px;
        background-size: 25px;
        width: 25px;
        /* border: 3px solid red; */
        border-radius: 50%;

    }

    .removeimg::before {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        content: '';
        border: 1px solid red;
        background: red;
        text-align: center;
        display: block;
        margin-top: 11px;
        transform: rotate(45deg);
    }

    .removeimg::after {
        /* color: #FFF; */
        /* background-color: #DC403B; */
        content: '';
        background: red;
        border: 1px solid red;
        text-align: center;
        display: block;
        transform: rotate(-45deg);
        margin-top: -2px;
    }
</style>
<!-- Navbar-->
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="/loginView"><i class='bx bx-log-out bx-rotate-180'></i> </a>

        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <jsp:include page="template/header.jsp"></jsp:include>

    <jsp:include page="template/slidebar.jsp"></jsp:include>
</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">Dang sách giảm giá</li>
            <li class="breadcrumb-item"><a href="#">Thêm giảm giá cho sản phẩm</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Thêm giảm giá cho sản phẩm</h3>
                <div class="tile-body">
                    <form class="row" id="form-add">
                        <div class="form-group col-md-3">
                            <label for="maCTSP" class="control-label">Danh sách sản phẩm</label>
                            <select class="form-control" id="maCTSP" name="maCTSP" onchange="getDungLuongOptions()">
                                <option value="">-- Chọn sản phẩm --</option>
                                <c:forEach items="${ctsp}" var="sp">
                                    <option value="${sp.maSanPham}">${sp.tenSanPham}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="maDL" class="control-label">Dung lượng</label>
                            <select class="form-control" id="maDL" name="maDL">
                                <option value="">-- Chọn dung lượng --</option>

                            </select>
                        </div>
                        <%--                        <div class="form-group col-md-3">--%>
                        <%--                            <label for="maMS" class="control-label">Màu sắc</label>--%>
                        <%--                            <select class="form-control" id="maMS" name="maMS">--%>
                        <%--                                <option value="">-- Chọn màu sắc --</option>--%>
                        <%--                                <c:forEach items="${mauSacs}" var="ms">--%>
                        <%--                                    <option value="${ms.maMauSac}">${ms.tenMauSac}</option>--%>
                        <%--                                </c:forEach>--%>
                        <%--                            </select>--%>
                        <%--                        </div>--%>
                        <div class="form-group col-md-3">
                            <label for="maGG" class="control-label">Danh sách mã giảm giá</label>
                            <select class="form-control" id="maGG" name="maGG">
                                <option value="">-- Chọn giảm giá --</option>
                                <c:forEach items="${ggsp}" var="ggsp">
                                    <option value="${ggsp.maGiamGia}">${ggsp.tenGiamGiaView}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả giảm giá</label>
                            <textarea class="form-control" name="moTa" id="moTa"></textarea>
                        </div>
                    </form>
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" id="addNew" title="In" form="form-add"><i
                                    class="fas fa-plus"></i>Thêm giảm giá cho sản phẩm
                            </button>
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" id="search" title="In" form="form-add"><i
                                    class="fas fa-search-plus"></i>Tìm
                                kiếm
                            </button>
                        </div>

                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" id="updateTT" title="In" type="submit" form="form-add">
                                <i
                                        class="fas fc-agenda-view">Cập nhập trạng thái</i>
                            </button>
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" id="updateTTDungHD" title="In" type="submit"
                                    form="form-add"><i
                                    class="fas fc-agenda-view">Dừng hoạt động</i>
                            </button>
                        </div>
                    </div>
                    <div id="divPrint">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Màu sắc</th>
                                <th>Dung lượng</th>
                                <th>Tên giảm giá</th>
                                <th>Phần trăm giảm(%)</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>Giá ban đầu</th>
                                <th>Giá sau khi giảm</th>
                                <th>Trạng thái</th>
                                <th>Mô tả</th>
                                <th>Tính năng</th>
                            </tr>
                            </thead>
                            <tbody id="data-body">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!--
MODAL
-->
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thông tin giảm giá sản phẩm</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6" style="display: none">
                        <label class="control-label">Mã giảm giá sản phẩm</label>
                        <input class="form-control" id="maGGCTSP" type="text" required value="" readonly>
                    </div>
                    <div class="form-group col-md-6" style="display: none">
                        <label class="control-label">Mã chi tiết sản phẩm</label>
                        <input class="form-control" id="maCTSP1" type="text" required value="" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên sản phẩm</label>
                        <input class="form-control" id="tenSP" type="text" required value="" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="maGG" class="control-label">Danh sách mã giảm giá</label>
                        <select class="form-control" id="maGG1" name="maGG">
                            <option value="">-- Chọn giảm giá --</option>
                            <c:forEach items="${ggsp}" var="ggsp">
                                <option value="${ggsp.maGiamGia}">${ggsp.tenGiamGiaView}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="maGG" class="control-label">Trạng thái</label>
                        <select class="form-control" id="trangThai" name="trangThai">
                            <option value="">-- Chọn trạng thái --</option>
                            <option value="1">Hoạt động</option>
                            <option value="0">Dừng hoạt động</option>
                        </select>
                    </div>
                </div>
                <BR>
                <BR>
                <button class="btn btn-save" type="button" id="update">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->

<script src="../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
<script src="../../../../assetsAdmin/js/popper.min.js"></script>
<script src="../../../../assetsAdmin/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../../../../assetsAdmin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../../../assetsAdmin/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="../../../../assetsAdmin/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../../../assetsAdmin/js/plugins/dataTables.bootstrap.min.js"></script>
<script>
    var dataTableInstance;


    var request = {};
    $(document).ready(function () {

        if ($.fn.DataTable.isDataTable('#sampleTable')) {
            $('#sampleTable').DataTable().destroy();
        }
        $("#search").click(function () {
            event.preventDefault();
            request.maSP = $("#maCTSP").val();
            request.maMS = $("#maMS").val();
            request.maDL = $("#maDL").val();
            request.maGG = $("#maGG").val();
            request.moTa = $("#moTa").val();
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/admin/giam-gia/search-giam-gia-SP",
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

        function formatCurrencyVND(number) {
            return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
        }

        // window.onload = function() {
        //     var giaBanInput = document.getElementById('tongTienSG');
        //     giaBanInput.innerText = formatCurrencyVND(giaBanInput.value);
        // };

        //view Table giam gia
        function displayResults(results) {
            // Get the table body element
            var tableBody = $("#sampleTable tbody");
            // Clear existing table rows
            tableBody.empty();

            if (results.length === 0) {
                var noResultsRow = "<tr><td colspan='8' class='text-center'>Không có kết quả</td></tr>";
                tableBody.append(noResultsRow);
                return;
            }
            if (dataTableInstance) {
                dataTableInstance.destroy();
            }
            // Iterate over the results and populate the table rows
            for (var i = 0; i < results.length; i++) {
                var gg = results[i];
                var giaSauGiam = formatCurrencyVND(parseInt(gg.giaBanDau - (gg.giaBanDau * gg.phanTramGiam/100)));
                var spanClass = '';
                var spanText = '';
                switch (gg.trangThai) {
                    case 0:
                        spanClass = 'bg-warning';
                        spanText = 'Dừng hoạt động';
                        break;
                    case 1:
                        spanClass = 'bg-success';
                        spanText = 'Hoạt động';
                        break;

                        break;
                    default:
                        spanClass = '';
                        spanText = 'Error';
                }
                var row = "<tr>" +
                    "<td>" + gg.maGiamGiaChiTiet + "</td>" +
                    "<td>" + gg.tenSanPham + "</td>" +
                    "<td>" + gg.tenMauSac + "</td>" +
                    "<td>" + gg.tenDungLuong + "</td>" +
                    "<td>" + gg.tenGiamGia + "</td>" +
                    "<td>" + gg.phanTramGiam + "</td>" +
                    "<td>" + gg.ngayBatDau + "</td>" +
                    "<td>" + gg.ngayKetThuc + "</td>" +
                    "<td>" + gg.giaBanDauString + "</td>" +
                    "<td id='tongTienSG'>" + giaSauGiam + "</td>" +
                    "<td><span class='badge " + spanClass + "'>" + spanText + "</span></td>" +
                    "<td>" + gg.moTa + "</td>" +
                    "<td><button class='btn btn-primary btn-sm detail' type='button' title='Chi tiết' data-toggle='modal' data-target='#ModalUP'" +
                    " data-id='" + gg.maGiamGiaChiTiet + "'><i class='fa fa-info'></i></button></td>" +
                    "</tr>";
                tableBody.append(row);
            }
            if (!$.fn.DataTable.isDataTable('#sampleTable')) {
                $('#sampleTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: false,
                    order: [[0, 'asc']]
                });
            }
        }
    });
    $("#addNew").click(function (e) {
        e.preventDefault();
        request.maSP = $("#maCTSP").val();
        request.maMS = $("#maMS").val();
        request.maDL = $("#maDL").val();
        request.maGG = $("#maGG").val();
        request.moTa = $("#moTa").val();
        if (!request.maSP) {
            Swal.fire({
                icon: "error",
                title: "Lỗi",
                text: "Vui lòng chọn sản phẩm.",
            });
            return;  // Stop further execution
        }
        if (!request.maGG) {
            Swal.fire({
                icon: "error",
                title: "Lỗi",
                text: "Vui lòng chọn loại giảm giá.",
            });
            return;
        }

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/giam-gia/add-giam-gia-SP",
            data: JSON.stringify(request),
            dataType: 'text',
            success: function (response) {
                console.log(response);
                if (response !== "Success") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Thông báo',
                        text: response,
                    });
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: 'Thêm thành công!',
                    });
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    });

    function detail(maGGCTSP) {
        $.ajax({
            url: '/admin/giam-gia/detail-giam-gia-SP',
            type: 'GET',
            data: {maGGCTSP: maGGCTSP},
            success: function (data) {
                console.log(data);
                $('#maCTSP1').val(data.maChiTietSanPham);
                $('#maGGCTSP').val(data.maGiamGiaChiTiet);
                $('#tenSP').val(data.tenSanPham);
                $('#maGG1').val(data.maGiamGia);
                $('#trangThai').val(data.trangThai);
            },
            error: function (error) {
                console.error('Error fetching details:', error);
            }
        });
    }

    $(document).on('click', '.detail', function () {
        var maGGCTSP = parseInt($(this).data('id'));
        console.log(maGGCTSP);
        detail(maGGCTSP);
    });

    $("#update").click(function (e) {
        e.preventDefault();
        var selectedMaGGCTSP = $('#maGGCTSP').val();
        var selectMaCTSP = $('#maCTSP1').val();
        var selectedMaGG = $('#maGG1').val();
        var selectedTrangThai = $('#trangThai').val();
        var request = {
            maGGCTSP: selectedMaGGCTSP,
            maGG: selectedMaGG,
            trangThai: selectedTrangThai,
            maCTSP: selectMaCTSP,
        };
        $.ajax({
            url: '/admin/giam-gia/update-giam-gia-SP',
            type: 'POST',
            data: JSON.stringify(request),
            dataType: 'text',
            contentType: 'application/json',
            success: function (data) {
                console.log(data);
                if (data === "Success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Sửa thành công!',
                    });
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                } else {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Thông báo',
                        text: data,
                    });
                }
            }
        });
    });

    $("#updateTT").click(function (e) {
        e.preventDefault();
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/admin/giam-gia/update-tt-giam-gia",
            dataType: 'text',
            success: function (response) {
                console.log(response);
                if (response !== "Success") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Thông báo',
                        text: response,
                    });
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: 'Thành công!',
                    });
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    });


    $("#updateTTDungHD").click(function (e) {
        e.preventDefault();
        request.maSP = $("#maCTSP").val();
        request.maDL = $("#maDL").val();

        if (!request.maSP) {
            Swal.fire({
                icon: "error",
                title: "Lỗi",
                text: "Vui lòng chọn sản phẩm.",
            });
            return;  // Stop further execution
        }
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/giam-gia/update-dung-hoat-dong",
            dataType: 'text',
            data: JSON.stringify(request),
            success: function (response) {
                console.log(response);
                if (response !== "Success") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Thông báo',
                        text: response,
                    });
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: 'Thành công!',
                    });
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    });

    function getDungLuongOptions() {
        var selectedMaSP = $("#maCTSP").val();

        if (selectedMaSP !== "") {
            $.ajax({
                type: "GET",
                url: "/admin/giam-gia/fill-list-dung-luong",
                data: {maSP: selectedMaSP},
                success: function (data) {
                    // Update "Dung lượng" dropdown options
                    var maDLDropdown = $("#maDL");
                    maDLDropdown.empty(); // Clear existing options

                    // Add new options based on the response
                    $.each(data, function (index, dungLuong) {
                        maDLDropdown.append('<option value="' + dungLuong.maDungLuong + '">' + dungLuong.tenDungLuong + '</option>');
                    });
                },
                error: function (error) {
                    console.error("Error fetching dung luong options:", error);
                }
            });
        } else {
            // Clear "Dung lượng" dropdown if no product is selected
            $("#maDL").empty();
        }
    }

</script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>