<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Bảo hành sản phẩm | Quản trị Admin</title>
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
            <li class="breadcrumb-item">Danh sách sản phẩm bảo hành</li>
            <li class="breadcrumb-item"><a href="#"></a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Bảo hành sản phẩm</h3>
                <div class="tile-body">
                    <form class="row" id="form-add">
                        <div class="form-group col-md-3">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" id="tenSanPhamSearch">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Imei</label>
                            <input class="form-control" type="text" id="imei">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="ngayBatDau" class="control-label">Ngày bắt đầu</label>
                            <input id="ngayBatDau" class="form-control" type="date" name="ngayBatDau" >
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="ngayKetThuc" class="control-label">Ngày kết thúc</label>
                            <input id="ngayKetThuc" class="form-control" type="date" name="ngayKetThuc">
                        </div>
                    </form>
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" id="search" title="In" form="form-add"><i
                                    class="fas fa-search-plus" ></i>Tìm kiếm
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
                                <th>Imei</th>
                                <th>Khách hàng</th>
                                <th>Ngày mua</th>
                                <th>Ngày hết hạn bảo hành</th>
                                <th>Trạng thái</th>

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
            request.tenSanPhamSearch = $("#tenSanPhamSearch").val();
            request.imei = $("#imei").val();
            request.ngayBatDau = $("#ngayBatDau").val();
            request.ngayKetThuc = $("#ngayKetThuc").val();
            console.log(request)
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/admin/hoa-don-chi-tiet/search-san-pham-bao-hanh",
                data: JSON.stringify(request),
                dataType: 'json',
                success: function (response) {
                    console.log(response);

                    displayResults(response);

                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });

        });


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
                var spbh = results[i];
                var spanClass = '';
                var spanText = '';
                switch (spbh.trangThai) {
                    case 0:
                        spanClass = 'bg-warning';
                        spanText = 'Hết hạn';
                        break;
                    case 1:
                        spanClass = 'bg-success';
                        spanText = 'Bảo hành';
                        break;

                        break;
                    default:
                        spanClass = '';
                        spanText = 'Error';
                }
                var row = "<tr>" +
                    "<td>" + spbh.maSanPham + "</td>" +
                    "<td>" + spbh.tenSanPham + "</td>" +
                    "<td>" + spbh.mauSac + "</td>" +
                    "<td>" + spbh.dungLuong + "</td>" +
                    "<td>" + spbh.imei + "</td>" +
                    "<td>" + spbh.khachHang + "</td>" +
                    "<td>" + spbh.ngayMuaString + "</td>" +
                    "<td>" + spbh.ngayHetHanBaoHanhString + "</td>" +
                    "<td><span class='badge " + spanClass + "'>" + spanText + "</span></td>" +
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

</script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>