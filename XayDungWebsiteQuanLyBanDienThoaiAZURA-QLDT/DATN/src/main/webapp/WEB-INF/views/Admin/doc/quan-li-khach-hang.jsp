<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách khách hàng | Quản trị Admin</title>
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
        #sampleTable_filter {
            display: none;
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
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách khách hàng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <form class="row" id="searchForm">
                        <div class="form-group col-md-4">
                            <label for="tenKhachHang" class="control-label">Tên khách hàng</label>
                            <input id="tenKhachHang" class="form-control" type="text" name="tenKhachHang">
                        </div>
                        <div class="form-group col-md-4 ">
                            <label for="diaChi" class="control-label">Địa chỉ</label>
                            <input id="diaChi" class="form-control" type="text" name="diaChi">
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
                    </div>
                    <div id="divPrint">
                        <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0"
                               border="0"
                               id="sampleTable">
                            <thead>
                            <tr>
                                <th style="width: 30px">ID</th>
                                <th>Họ và tên</th>
                                <th>Giới tính</th>
                                <th>CCCD</th>
                                <th>Ngày sinh</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>SĐT</th>
<%--                                <th>Tính năng</th>--%>
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
<div class="modal fade" id="ModalNVUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thông tin nhân viên cơ bản</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID nhân viên</label>
                        <input class="form-control" id="maNV" type="text" required value="" disabled>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Họ</label>
                        <input class="form-control" id="ho" type="text" required value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên đệm</label>
                        <input class="form-control" id="ten-dem" type="text" required value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên</label>
                        <input class="form-control" id="ten" type="text" required value="">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Số điện thoại</label>
                        <input class="form-control" id="sdt-nv" type="text" required value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Địa chỉ email</label>
                        <input class="form-control" id="email" type="text" required value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Địa chỉ</label>
                        <input class="form-control" id="dia-chi" type="text" required value="">
                    </div>
                    <div class="form-group  col-md-6">
                        <label for="chucvu" class="control-label">Chức vụ</label>
                        <select class="form-control" id="chucvu">
                            <c:forEach items="${listChucVu}" var="chucVu">
                                <option value="${chucVu.maChucVu}">${chucVu.tenChucVu}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <BR>
                <a href="#" style="    float: right;
        font-weight: 600;
        color: #ea0000;">Chỉnh sửa nâng cao</a>
                <BR>
                <BR>
                <button class="btn btn-save" type="button" onclick="saveNhanVien()">Lưu lại</button>
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
<%--<script type="text/javascript">$('#sampleTable').DataTable();</script>--%>
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
            var tenKhachHang = $("#tenKhachHang").val();
            var diaChi = $("#diaChi").val();
            var request = {};

            if (tenKhachHang !== null && tenKhachHang.trim() !== "") {
                request.tenKhachHang = tenKhachHang;
            }

            if (diaChi !== null && diaChi.trim() !== "") {
                request.diaChi = diaChi;
            }

            if ($.fn.DataTable.isDataTable('#sampleTable')) {
                $('#sampleTable').DataTable().destroy();
            }
            // Send the AJAX request to the backend
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/admin/khach-hang/search",
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
            // Get the table body element
            var tableBody = $("#sampleTable tbody");
            // Clear existing table rows
            tableBody.empty();

            if (dataTableInstance) {
                dataTableInstance.destroy();
            }
            if (results.length === 0) {
                var noResultsRow = "<tr><td colspan='8' class='text-center'>Không có kết quả</td></tr>";
                tableBody.append(noResultsRow);
                return;
            }
            // Iterate over the results and populate the table rows
            for (var i = 0; i < results.length; i++) {
                var khachHang = results[i];
                var row = "<tr>" +
                    "<td>" + khachHang.maKhachHang + "</td>" +
                    "<td>" + khachHang.tenKhachHang + "</td>" +
                    "<td>" + khachHang.gioiTinhString + "</td>" +
                    "<td>" + khachHang.cccd + "</td>" +
                    "<td>" + khachHang.ngaySinh + "</td>" +
                    "<td>" + khachHang.email + "</td>" +
                    "<td>" + khachHang.diaChi + "</td>" +
                    "<td>" + khachHang.sdt + "</td>" +
                    // "<td><button class='btn btn-primary btn-sm detail' type='button' title='Chi tiết' data-toggle='modal' data-target='#ModalUP'" +
                    // " data-id='" + hoaDon.maHoaDon + "'><i class='fa fa-info'></i></button></td>"
                "</tr>";
                tableBody.append(row);
            }
            if (!$.fn.DataTable.isDataTable('#sampleTable')) {
                $('#sampleTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: false
                });
            }
        }

    });

    //export excel
    $(document).ready(function () {
        $("#exportExcel").click(function (e) {
            e.preventDefault();

            var tenKhachHang = $("#tenKhachHang").val();
            var diaChi = $("#diaChi").val();
            var request = {};

            if (tenKhachHang !== null && tenKhachHang.trim() !== "") {
                request.tenKhachHang = tenKhachHang;
            }

            if (diaChi !== null && diaChi.trim() !== "") {
                request.diaChi = diaChi;
            }
            // Gọi API để tải xuống Excel
            fetch('/admin/khach-hang/download-result', {
                method: 'POST',
                body: JSON.stringify(request), // Sử dụng dữ liệu từ đối tượng request
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.blob();
                })
                .then(blob => {
                    // Tạo đường dẫn URL từ Blob và tải xuống file
                    var link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.download = "template_export_khach_hang.xls";
                    link.click();
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
        });
    });
</script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>