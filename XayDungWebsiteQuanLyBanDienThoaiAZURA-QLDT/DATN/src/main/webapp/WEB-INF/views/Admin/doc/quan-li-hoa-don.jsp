<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách hóa đơn | Quản trị Admin</title>
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
    <link rel="icon" type="image/png" href="../../../../../assets/img/logo/AZURA.png">

    <style>
        #sampleTable1_filter {
            display: none;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .status-container {
            display: inline-block;
            flex-direction: row;
            justify-content: flex-start;
        }

        .status {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 5px;
            text-align: center;
        }

        .arrow {
            margin: 0 10px;
        }

        .notification-badge {
            position: absolute;
            top: 0;
            right: 0;
            background-color: red; /* Customize the background color */
            color: white; /* Customize the text color */
            border-radius: 50%;
            padding: 3px 6px;
            font-size: 12px;
        }

        .notification-badge_1 {
            position: absolute;
            top: 0;
            right: 0;
            background-color: lawngreen; /* Customize the background color */
            color: white; /* Customize the text color */
            border-radius: 50%;
            padding: 3px 6px;
            font-size: 12px;
        }

        .a-hover:hover {
            background-color: #007bff; /* Change the background color on hover */
            color: #fff; /* Change the text color on hover */
        }
    </style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
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
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách hóa đơn</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <form class="row" id="searchForm">
                        <div class="form-group col-md-4 ">
                            <label for="khachHangSearch" class="control-label">Tên khách hàng</label>
                            <input id="khachHangSearch" class="form-control" type="text" name="khachHang">
                        </div>
                        <div class="form-group col-md-4 ">
                            <label for="nguoiNhanSearch" class="control-label">Người nhận</label>
                            <input id="nguoiNhanSearch" class="form-control" type="text" name="nguoiNhan">
                        </div>
                        <div class="form-group col-md-4 ">
                            <label for="trangThai" class="control-label">Tình trạng</label>
                            <select class="form-control" id="trangThai" name="trangThai">
                                <option value="">-- Chọn tình trạng --</option>
                                <option value="1">Đang giao hàng</option>
                                <option value="0">Chờ xác nhận</option>
                                <option value="2">Giao hàng thành công</option>
                                <option value="4">Quầy</option>
                                <option value="3">Hủy</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="ngayBatDau" class="control-label">Ngày bắt đầu</label>
                            <input id="ngayBatDau" class="form-control" type="date" name="ngayBatDau">
                        </div>
                        <div class="form-group col-md-4 ">
                            <label for="ngayKetThuc" class="control-label">Ngày kết thúc</label>
                            <input id="ngayKetThuc" class="form-control" type="date" name="ngayKetThuc">
                        </div>
                    </form>
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" href="" title="In" type="submit" form="searchForm"><i
                                    class="fas fa-search"></i>Tìm
                                kiếm
                            </button>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In" id="exportExcel"><i
                                    class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In" id="updateHoanThanh"><i
                                    class="fas fa-upload"></i>Update Hoàn thành</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable1">
                        <thead>
                        <tr>
                            <th>ID hóa đơn</th>
                            <th>Khách hàng</th>
                            <th>Người nhận</th>
                            <th>Địa chỉ</th>
                            <th>Nhân viên thanh toán</th>
                            <th>Tổng tiền</th>
                            <th>Ngày thanh toán</th>
                            <th>Ghi chú</th>
                            <th>Tình trạng</th>
                            <th>Hình thức thanh toán</th>
                            <th>Voucher</th>
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

    <div class="modal fade" id="ModalUPTT" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
         data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group col-md-12">
                          <span class="thong-tin-thanh-toan" style="text-align: center">
                            <h4>Trạng thái đơn hàng</h4>
                          </span>
                        </div>
                    </div>
                    <form id="form-update-trang-thai">
                        <input class="form-control" type="number" required id="maHoaDon" name="maHoaDon"
                               style="display: none">
                        <div class="status-container">
                            <div id="no_1" style="display: none;">
                                <!-- Status 1 -->
                                <section class="content">
                                    <div class="container-fluid">
                                        <div class="status status-1" style="text-align: center;display:inline-block;">
                                            <i class="fas fa-hourglass-half"></i> Chờ xác nhận
                                        </div>
                                    </div>
                                </section>
                            </div>

                            <div id="no_2" style="display: none;">
                                <!-- Status 2 -->
                                <section class="content">
                                    <div class="container-fluid">
                                        <div class="status status-1" style="display:inline-block;">
                                            <i class="fas fa-hourglass-half"></i> Chờ xác nhận
                                        </div>
                                        <div class="arrow arrow1" style="display:inline-block;"><i
                                                class="fas fa-arrow-right"></i></div>
                                        <div class="status status-2" style="display:inline-block;">
                                            <i class="fas fa-truck"></i> Đang giao hàng
                                        </div>
                                    </div>
                                </section>
                            </div>

                            <div id="no_3" style="display: none;">
                                <!-- Status 3 -->
                                <section class="content">
                                    <div class="container-fluid">
                                        <div class="status status-1" style="display:inline-block;">
                                            <i class="fas fa-hourglass-half"></i> Chờ xác nhận
                                        </div>
                                        <div class="arrow arrow1" style="display:inline-block;"><i
                                                class="fas fa-arrow-right"></i></div>
                                        <div class="status status-2" style="display:inline-block;">
                                            <i class="fas fa-truck"></i> Đang giao hàng
                                        </div>
                                        <div class="arrow arrow2" style="display:inline-block;"><i
                                                class="fas fa-arrow-right"></i></div>
                                        <div class="status status-3" style="display:inline-block;">
                                            <i class="fas fa-check-circle"></i> Giao hàng thành công
                                        </div>
                                    </div>
                                </section>
                            </div>

                            <div id="no_4" style="display: none;">
                                <!-- Status 4 -->
                                <section class="content">
                                    <div class="container-fluid">
                                        <div class="status status-1" style="display:inline-block;">
                                            <i class="fas fa-hourglass-half"></i> Chờ xác nhận
                                        </div>
                                        <div class="arrow arrow1" style="display:inline-block;"><i
                                                class="fas fa-arrow-right"></i></div>
                                        <div class="status status-4" style="display:inline-block;">
                                            <i class="fas fa-times-circle"></i> Hủy
                                        </div>
                                    </div>
                                </section>
                            </div>

                            <div id="no_5" style="display: none;">
                                <!-- Status 5 -->
                                <section class="content">
                                    <div class="container-fluid">
                                        <div class="status status-1" style="display:inline-block;">
                                            <i class="fas fa-hourglass-half"></i> Quầy
                                        </div>
                                        <div class="arrow arrow1" style="display:inline-block;"><i
                                                class="fas fa-arrow-right"></i></div>
                                        <div class="status status-3"
                                             style="display:inline-block;">
                                            <i class="fas fa-times-circle"></i> Hoàn thành
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                        <BR>
                        <table class="table table-hover table-bordered" id="sampleTable2">
                            <thead>
                            <tr>
                                <th style="" >Mã CTSP</th>
                                <th>Tên Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá Bán</th>
                                <th>Màu sắc</th>
                                <th>Dung lượng</th>
                                <th style="width: 120px;">Imei</th>
                            </tr>
                            </thead>
                            <tbody id="data-body2">

                            </tbody>
                        </table>
                        <BR>
                        <section class="content" style="margin-bottom: 20px; text-align: center">
                            <form id="form-xac-nhan-update">
                                <div id="no_1_1" style="display: none;">
                                    <a class="btn btn-info btn-sm" type="submit" onclick="updateConfirm(1)">Xác nhận</a>
                                    <%--                                    <a class="btn btn-danger btn-sm" type="button" onclick="updateConfirm(3)">Hủy--%>
                                    <%--                                        đơn</a>--%>
                                    <a class="btn btn-danger btn-sm" type="button" data-toggle="modal"
                                       data-target="#cancelReasonModal">Hủy đơn</a>
                                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Thoát</a>
                                </div>
                                <div id="no_2_2" style="display: none;">
                                    <a class="btn btn-success btn-sm" type="submit" onclick="updateConfirmHoanThanh(2)">Hoàn
                                        thành</a>
                                     <a class="btn btn-danger btn-sm" type="button" data-toggle="modal"
                                       data-target="#ThatBai">Giao hàng thất bại</a>
                                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Thoát</a>
                                </div>
                                <div id="no_3_3" style="display: none;">
                                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Thoát</a>
                                </div>
                            </form>
                            <!-- /.container-fluid -->
                        </section>
                    </form>
                </div>

                <!-- Modal cho lý do hủy đơn -->
                <div class="modal fade" id="ThatBai" tabindex="-1" role="dialog"
                     aria-labelledby="cancelReasonModalLabel1" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cancelReasonModalLabel1">Lý do giao hàng thất bại</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="text" id="cancelReasonInput1" class="form-control"
                                       placeholder="Nhập lý do giao hàng thất bại">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn btn-primary" onclick="cancelOrderThatBai()">OK
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal cho lý do hủy đơn -->
                <div class="modal fade" id="cancelReasonModal" tabindex="-1" role="dialog"
                     aria-labelledby="cancelReasonModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cancelReasonModalLabel">Lý do hủy đơn</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="text" id="cancelReasonInput" class="form-control"
                                       placeholder="Nhập lý do hủy đơn">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn btn-primary" onclick="cancelOrder()">Xác nhận hủy
                                </button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!--
    MODAL
    -->
</main>
<!-- Essential javascripts for application to work-->
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.1/dist/sweetalert2.all.min.js"></script>
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
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
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

    //Modal
    $("#show-emp").on("click", function () {
        $("#ModalUP").modal({backdrop: false, keyboard: false})
    });

    var dataTableInstance;
    $(document).ready(function () {
        $("#searchForm").submit(function (event) {
            event.preventDefault();

            var trangThai = $("#trangThai").val();
            var ngayBatDau = $("#ngayBatDau").val();
            var ngayKetThuc = $("#ngayKetThuc").val();
            var khachHang = $("#khachHangSearch").val();
            var nguoiNhan = $("#nguoiNhanSearch").val();

            if (ngayKetThuc < ngayBatDau) {
                swal("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu!", {
                    icon: "error",
                });
                return;
            }
            var request = {
                trangThai: trangThai,
                ngayBatDau: ngayBatDau,
                ngayKetThuc: ngayKetThuc,
                khachHang: khachHang,
                nguoiNhan: nguoiNhan,
            };
            if ($.fn.DataTable.isDataTable('#sampleTable1')) {
                $('#sampleTable1').DataTable().destroy();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/admin/hoa-don/search",
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

        //view Table hoa don
        function displayResults(results) {
            var tableBody = $("#sampleTable1 tbody");
            tableBody.empty();
            if (results.length === 0) {
                var noResultsRow = "<tr><td colspan='8' class='text-center'>Không có kết quả</td></tr>";
                tableBody.append(noResultsRow);
                return;
            }

            if (dataTableInstance) {
                dataTableInstance.destroy();
            }
            for (var i = 0; i < results.length; i++) {
                var hoaDon = results[i];
                var spanClass = '';
                var spanText = '';
                var spanClass1 = '';
                var spanText1 = '';
                switch (hoaDon.trangThai) {
                    case 0:
                        spanClass = 'bg-warning';
                        spanText = 'Chờ xác nhận';
                        break;
                    case 1:
                        spanClass = 'bg-primary';
                        spanText = 'Đang giao hàng';
                        break;
                    case 2:
                        spanClass = 'bg-success';
                        spanText = 'Giao hàng thành công';
                        break;
                    case 3:
                        spanClass = 'bg-danger';
                        spanText = 'Hủy';
                        break;
                    case 4:
                        spanClass = 'bg-success';
                        spanText = 'Quầy';
                        break;
                    case 5:
                        spanClass = 'bg-danger';
                        spanText = 'Giao hàng thất bại';
                        break;
                    default:
                        spanClass = '';
                        spanText = 'Error';
                }

                switch (hoaDon.loaiThanhToan) {
                    case 0:
                        spanClass1 = 'bg-warning';
                        spanText1 = 'Thanh Toán khi nhận hàng';
                        break;
                    case 1:
                        spanClass1 = 'bg-primary';
                        spanText1 = 'Đã thanh toán';
                        break;
                    case 2:
                        spanClass1 = 'bg-success';
                        spanText1 = 'Thanh toán tại quầy';
                        break;
                    case 3:
                        spanClass1 = 'bg-success';
                        spanText1 = 'Thanh toán tại quầy';
                        break;
                    case 4:
                        spanClass1 = 'bg-primary';
                        spanText1 = 'Thanh toán ví shop';
                        break;
                    default:
                        spanClass1 = '';
                        spanText1 = 'Error';
                }
                var row = "<tr>" +
                    "<td>" + hoaDon.maHoaDon + "</td>" +
                    "<td>" + hoaDon.tenKhachHang + "</td>" +
                    "<td>" + hoaDon.nguoiNhan + "</td>" +
                    "<td>" + hoaDon.diaChi + ", " + hoaDon.xa + ", " + hoaDon.huyen + ", " + hoaDon.tinh + "</td>" +
                    "<td>" + hoaDon.tenNhanVien + "</td>" +
                    "<td>" + hoaDon.tongTienString + "</td>" +
                    "<td>" + hoaDon.ngayThanhToanString + "</td>" +
                    "<td>" + hoaDon.ghiChu + "</td>" +
                    "<td><span class='badge " + spanClass + "'>" + spanText + "</span></td>" +
                    "<td><span class='badge " + spanClass1 + "'>" + spanText1 + "</span></td>" +
                    "<td>" + hoaDon.tenVoucher + "-" + hoaDon.phanTramGiam + '%' + "</td>" +
                    "<td>" +
                    "<button class='btn btn-primary btn-sm edit position-relative a-hover' type='button' title='Cập nhập' data-toggle='modal' data-target='#ModalUPTT' " +
                    "data-id='" + hoaDon.maHoaDon + "'><i class='fa fa-edit'></i> Detail";

                if (hoaDon.trangThai === 0) {
                    row += "<span class='notification-badge'>!</span>";
                }
                if (hoaDon.trangThai === 1) {
                    row += "<span class='notification-badge_1'>!</span>";
                }

                row += "</button>" +
                    "</td>" +
                    "</tr>";
                tableBody.append(row);
            }
            if (!$.fn.DataTable.isDataTable('#sampleTable1')) {
                $('#sampleTable1').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: false
                });
            }
        }
    });


    //view trangthai
    function updateTrangThai(trangThai) {
        var spanClass = '';
        var spanText = '';

        switch (trangThai) {
            case 0:
                spanClass = 'bg-warning';
                spanText = 'Chờ xác nhận';
                break;
            case 1:
                spanClass = 'bg-primary';
                spanText = 'Đang giao hàng';
                break;
            case 2:
                spanClass = 'bg-success';
                spanText = 'Giao hàng thành công';
                break;
            case 3:
                spanClass = 'bg-danger';
                spanText = 'Hủy';
                break;
            case 4:
                spanClass = 'bg-success';
                spanText = 'Quầy';
                break;
            default:
                spanClass = '';
                spanText = 'Error';
        }

        $("#trangThaiSpan").attr("class", "badge " + spanClass).text(spanText);

        $("#trangThaiSelect").val(trangThai);
    }

    //export excel
    $(document).ready(function () {
        $("#exportExcel").click(function (e) {
            e.preventDefault();

            var trangThai = $("#trangThai").val();
            var ngayBatDau = $("#ngayBatDau").val();
            var ngayKetThuc = $("#ngayKetThuc").val();
            var khachHang = $("#khachHangSearch").val();
            var nguoiNhan = $("#nguoiNhanSearch").val();

            if (ngayKetThuc < ngayBatDau) {
                swal("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu!", {
                    icon: "error",
                });
                return;
            }
            var request = {
                trangThai: trangThai,
                ngayBatDau: ngayBatDau,
                ngayKetThuc: ngayKetThuc,
                khachHang: khachHang,
                nguoiNhan: nguoiNhan,
            };

            fetch('/admin/hoa-don/download-result', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(request),
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.blob();
                })
                .then(blob => {
                    var link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.download = "template_export_hoa_don.xls";
                    link.click();
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
        });
    });


    //update-trang-thai
    function updateConfirm(trangThai) {
        var maHoaDonString = document.getElementById('maHoaDon').value;
        var maHoaDon = parseInt(maHoaDonString, 10);
        var danhSachSanPhamHoaDonDTOS = getDSSPOfHDCT();
        var imeiInput = document.getElementById('thImei').value;

        // Kiểm tra sự trùng lặp của IMEI trong danh sách sản phẩm của hóa đơn
        if (hasDuplicateIMEI(danhSachSanPhamHoaDonDTOS, imeiInput)) {
            Swal.fire({
                icon: 'warning',
                title: 'Thông báo',
                text: 'IMEI trùng lặp, vui lòng kiểm tra lại.',
            });
            return; // Dừng hàm nếu có IMEI trùng lặp
        }

        var request = {
            maHoaDon: maHoaDon,
            trangThai: trangThai,
            danhSachSanPhamHoaDonDTOS: danhSachSanPhamHoaDonDTOS,
        };

        console.log(request);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/hoa-don/update-trang-thai",
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
                        title: 'Cập nhập thành công!',
                    });
                    setTimeout(() => {
                        window.location.href = `/admin/${nhanVien.maNhanVien}/quan-li-hoa-don`;
                    }, 10000);
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    }

    // Hàm kiểm tra sự trùng lặp của IMEI trong danh sách sản phẩm của hóa đơn và với giá trị nhập vào
    function hasDuplicateIMEI(danhSachSanPhamHoaDonDTOS, imeiInput) {
        var imeiSet = new Set();
        for (var i = 0; i < danhSachSanPhamHoaDonDTOS.length; i++) {
            var imei = danhSachSanPhamHoaDonDTOS[i].imei;
            if (imeiSet.has(imei) || imeiSet === imeiInput) {
                return true; // IMEI trùng lặp
            }
            imeiSet.add(imei);
        }
        return false; // Không có IMEI trùng lặp
    }

    document.getElementById('cancelReasonInput').addEventListener('click', function () {
        this.value = ''; // Xóa nội dung khi click
    });

    function cancelOrder() {
        var maHoaDonString = document.getElementById('maHoaDon').value;
        var maHoaDon = parseInt(maHoaDonString, 10);
        var lyyDoHuyDon = document.getElementById('cancelReasonInput').value;

        if (lyyDoHuyDon.trim() === '') {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Vui lòng nhập lý do hủy đơn hàng!',
            });
            return; // Dừng hàm nếu trường lý do hủy trống
        }

        var request = {
            maHoaDon: maHoaDon,
            trangThai: 3,
            ghiChu: lyyDoHuyDon
        };

        console.log(request);
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/hoa-don/update-trang-thai",
            data: JSON.stringify(request),
            dataType: 'text',
            success: function (response) {
                if (response !== "Success") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Thông báo',
                        text: response,
                    });
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: 'Cập nhập thành công!',
                    });
                    setTimeout(() => {
                        window.location.href = `/admin/${nhanVien.maNhanVien}/quan-li-hoa-don`;
                    }, 10000);
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    }

    document.getElementById('cancelReasonInput1').addEventListener('click', function () {
        this.value = ''; // Xóa nội dung khi click
    });

    function cancelOrderThatBai() {
        var maHoaDonString = document.getElementById('maHoaDon').value;
        var maHoaDon = parseInt(maHoaDonString, 10);
        var lyDoBoom = document.getElementById('cancelReasonInput1').value;

        if (lyDoBoom.trim() === '') {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Vui lòng nhập lý do hoàn đơn hàng!',
            });
            return; // Dừng hàm nếu trường lý do hủy trống
        }

        var request = {
            maHoaDon: maHoaDon,
            trangThai: 5,
            ghiChu: lyDoBoom
        };

        console.log(request);
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/hoa-don/update-trang-thai",
            data: JSON.stringify(request),
            dataType: 'text',
            success: function (response) {
                if (response !== "Success") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Thông báo',
                        text: response,
                    });
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: 'Cập nhập thành công!',
                    });
                    setTimeout(() => {
                        window.location.href = `/admin/${nhanVien.maNhanVien}/quan-li-hoa-don`;
                    }, 10000);
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    }

    //update-trang-thai-hoan-thanh
    function updateConfirmHoanThanh(trangThai) {
        var maHoaDonString = document.getElementById('maHoaDon').value;
        var maHoaDon = parseInt(maHoaDonString, 10);
        var request = {
            maHoaDon: maHoaDon,
            trangThai: trangThai
        };
        console.log(request);

        Swal.fire({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn cập nhập trạng thái hóa đơn này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willUpdate) => {
            if (willUpdate) {
                fetch('/admin/hoa-don/update-trang-thai-hoan-thanh', {
                    method: 'POST',
                    body: JSON.stringify(request),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                    .then(response => {
                        if (response.ok) {
                            Swal.fire({
                                title: 'Cập nhập thành công!',
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/'+${nhanVien.maNhanVien}+
                                '/quan-li-hoa-don';
                            }, 500);
                        } else {
                            Swal.fire({
                                title: response,
                                icon: "error",
                            });
                        }
                    })
                    .catch(error => {
                        console.error(error);
                        Swal.fire("Không thành công!", {
                            icon: "error",
                        });
                    });
            }
        });
    }


    $(document).on("click", ".edit", function () {
        var hoaDonId2 = $(this).data("id");
        console.log(hoaDonId2);
        // var hoaDonId2 = $(this).closest("tr").find("td:eq(1)").text();
        $.ajax({
            type: "GET",
            url: "/admin/hoa-don/detail/" + hoaDonId2,
            success: function (data) {
                console.log(data.danhSachSanPhamHoaDonDTOS);
                fillCtSPOfHoaDon(data.danhSachSanPhamHoaDonDTOS);
                $("#maHoaDon").val(data.maHoaDon);
                var no_1 = document.getElementById("no_1");
                var no_2 = document.getElementById("no_2");
                var no_3 = document.getElementById("no_3");
                var no_4 = document.getElementById("no_4");
                var no_5 = document.getElementById("no_5");

                var thImeiColumn = document.querySelectorAll("#sampleTable2 td:nth-child(5) input");

                for (var i = 0; i < thImeiColumn.length; i++) {
                    var thImei = thImeiColumn[i];

                    if (data.trangThai >= 1 && data.trangThai <= 4) {
                        thImei.readOnly = true;
                    }
                }
                if (data.trangThai === 0) {
                    no_1.style.display = "block";
                    no_1_1.style.display = "block";
                    no_2_2.style.display = "none";
                    no_3_3.style.display = "none";
                    no_2.style.display = "none";
                    no_3.style.display = "none";
                    no_4.style.display = "none";
                    no_5.style.display = "none";
                }
                if (data.trangThai === 1) {
                    no_2.style.display = "block";
                    no_2_2.style.display = "block";
                    no_1_1.style.display = "none";
                    no_3_3.style.display = "none";
                    no_1.style.display = "none";
                    no_3.style.display = "none";
                    no_4.style.display = "none";
                    no_5.style.display = "none";
                }

                if (data.trangThai === 2) {
                    no_3.style.display = "block";
                    no_3_3.style.display = "block";
                    no_1_1.style.display = "none";
                    no_2_2.style.display = "none";
                    no_2.style.display = "none";
                    no_1.style.display = "none";
                    no_4.style.display = "none";
                    no_5.style.display = "none";
                }

                if (data.trangThai === 3) {
                    no_4.style.display = "block";
                    no_2.style.display = "none";
                    no_1_1.style.display = "none";
                    no_2_2.style.display = "none";
                    no_3_3.style.display = "block";
                    no_3.style.display = "none";
                    no_1.style.display = "none";
                    no_5.style.display = "none";
                }
                if (data.trangThai === 4) {
                    no_3_3.style.display = "block";
                    no_1_1.style.display = "none";
                    no_2_2.style.display = "none";
                    no_5.style.display = "block";
                    no_2.style.display = "none";
                    no_3.style.display = "none";
                    no_1.style.display = "none";
                    no_4.style.display = "none";
                }
                if (data.trangThai === 5) {
                    no_4.style.display = "block";
                    no_2.style.display = "none";
                    no_1_1.style.display = "none";
                    no_2_2.style.display = "none";
                    no_3_3.style.display = "block";
                    no_3.style.display = "none";
                    no_1.style.display = "none";
                    no_5.style.display = "none";
                }
            },
            error: function () {
                swal("không tìm thấy!", {
                    icon: "error",
                });
            }
        });
    });

    function fillCtSPOfHoaDon(results) {
        var tableBody = $("#sampleTable2 tbody");
        tableBody.empty();
        if (results.length === 0) {
            var noResultsRow = "<tr><td colspan='8' class='text-center'>Không có kết quả</td></tr>";
            tableBody.append(noResultsRow);
            return;
        }

        if (dataTableInstance) {
            dataTableInstance.destroy();
        }
        for (var i = 0; i < results.length; i++) {
            var ctsp = results[i];

            var row = "<tr>" +
                "<td>" + ctsp.maHDCT + "</td>" +
                "<td>" + ctsp.tenSanpham + "</td>" +
                "<td>" + ctsp.soLuong + "</td>" +
                "<td>" + ctsp.giaTienString + "</td>" +
                "<td>" + ctsp.tenMauSac + "</td>" +
                "<td>" + ctsp.tenDungLuong + "</td>" +
                "<td><input id='thImei' type='text' class='form-control col-md-12' value='" + ctsp.imei + "'>" + "</td>"
                + "</tr>";
            tableBody.append(row);
        }
        if (!$.fn.DataTable.isDataTable('#sampleTable2')) {
            $('#sampleTable2').DataTable({
                paging: true,
                lengthChange: false,
                searching: false
            });
        }
    }

    function getDSSPOfHDCT() {
        var danhSachSanPhamHoaDonDTOS = [];

        $('#sampleTable2 tr').each(function () {
            var row = $(this);

            var maHDCT = row.find('td:eq(0)').text();
            var imei = row.find('td:eq(6) input').val();

            if (maHDCT) {
                var dsSP = {
                    maHDCT: maHDCT,
                    imei: imei
                };
                danhSachSanPhamHoaDonDTOS.push(dsSP);
            }
        });

        return danhSachSanPhamHoaDonDTOS;
    }


    $(document).ready(function () {
        $("#updateHoanThanh").click(function (e) {
            e.preventDefault();
            fetch('/admin/hoa-don/update-all-trang-thai-hoan-thanh', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
                .then(response => {
                    if (response.ok) {
                        Swal.fire({
                            title: 'Cập nhập thành công!',
                            icon: "success",
                        });
                        setTimeout(() => {
                            window.location.href = '/admin/'+${nhanVien.maNhanVien}+
                            '/quan-li-hoa-don';
                        }, 500);
                    } else {
                        Swal.fire({
                            title: response,
                            icon: "error",
                        });
                    }
                })
                .catch(error => {
                    console.error(error);
                    Swal.fire("Không thành công!", {
                        icon: "error",
                    });
                });
        })
    });
</script>

<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>