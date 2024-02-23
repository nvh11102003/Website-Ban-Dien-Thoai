<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách nhân viên | Quản trị Admin</title>
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
<
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <jsp:include page="template/header.jsp"></jsp:include>

    <jsp:include page="template/slidebar.jsp"></jsp:include>
</aside>
<main class="app-content">
    <div class="row">
        <div class="col-md-12">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><b>Thống kê</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-lg-3">
            <div class="widget-small primary coloured-icon"><i class='icon  bx bxs-user fa-3x'></i>
                <div class="info">
                    <h4>Tổng Nhân viên</h4>
                    <p><b>${tongNvHoatDong} nhân viên</b></p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="widget-small info coloured-icon"><i class='icon bx bxs-purchase-tag-alt fa-3x'></i>
                <div class="info">
                    <h4>Tổng sản phẩm</h4>
                    <p><b>${tongSanPhamDangCo} sản phẩm</b></p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-shopping-bag-alt'></i>
                <div class="info">
                    <h4>Tổng đơn hàng hoàn thành</h4>
                    <p><b>${tongDonHang} đơn hàng</b></p>
                </div>
            </div>
        </div>
        <!-- <div class="col-md-6 col-lg-3">
            <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-info-circle' ></i>
                <div class="info">
                    <h4>Bị cấm</h4>
                    <p><b>4 nhân viên</b></p>
                </div>
            </div>
        </div> -->
    </div>
    <div class="row">
        <div class="col-md-6 col-lg-3">
            <div class="widget-small primary coloured-icon"><i class='icon fa-3x bx bxs-chart'></i>
                <div class="info">
                    <h4>Tổng thu nhập</h4>
                    <p><b>${tongDoanhThu}</b></p>
                </div>
            </div>
        </div>
        <!-- <div class="col-md-6 col-lg-3">
            <div class="widget-small info coloured-icon"><i class='icon fa-3x bx bxs-user-badge' ></i>
                <div class="info">
                    <h4>Nhân viên mới</h4>
                    <p><b>3 nhân viên</b></p>
                </div>
            </div>
        </div> -->
        <div class="col-md-6 col-lg-3">
            <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-tag-x'></i>
                <div class="info">
                    <h4>Hết hàng</h4>
                    <p><b>${tongSanPhamHetHang} sản phẩm</b></p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-receipt'></i>
                <div class="info">
                    <h4>Đơn hàng hủy</h4>
                    <p><b>${tongDonHangHuy} đơn hàng</b></p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div>
                    <h3 class="tile-title">TOP 10 SẢN PHẨM BÁN CHẠY NHẤT</h3>
                </div>
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable1">
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá tiền</th>
                            <th>Tổng số lượng bán</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sanPhamTHongKeDTOS}" var="sp">
                            <tr>
                                <td>${sp.maSanPham}</td>
                                <td>${sp.tenSanPham}</td>
                                <td>${sp.giaBanString}</td>
                                <td>${sp.soLuongMua}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--    <div class="row">--%>
    <%--        <div class="col-md-12">--%>
    <%--            <div class="tile">--%>
    <%--                <div>--%>
    <%--                    <h3 class="tile-title">TỔNG ĐƠN HÀNG</h3>--%>
    <%--                </div>--%>
    <%--                <div class="tile-body">--%>
    <%--                    <table class="table table-hover table-bordered" id="sampleTable2">--%>
    <%--                        <thead>--%>
    <%--                        <tr>--%>
    <%--                            <th>ID đơn hàng</th>--%>
    <%--                            <th>Khách hàng</th>--%>
    <%--                            <th>Đơn hàng</th>--%>
    <%--                            <th>Số lượng</th>--%>
    <%--                            <th>Tổng tiền</th>--%>
    <%--                        </tr>--%>
    <%--                        </thead>--%>
    <%--                        <tbody>--%>
    <%--                        <c:forEach items="${hoaDonChiTietDTOS}" var="hdt">--%>
    <%--                            <tr>--%>
    <%--                                <td>${hdt.maHoaDon}</td>--%>
    <%--                                <td>${hdt.tenKhachHang}</td>--%>
    <%--                                <td>${hdt.danhSachSanPham}</td>--%>
    <%--                                <td>${hdt.soLuongMua} sản phẩm</td>--%>
    <%--                                <td>${hdt.tongTienString}</td>--%>
    <%--                            </tr>--%>
    <%--                        </c:forEach>--%>

    <%--                        <tr>--%>
    <%--                            <th colspan="4">Tổng cộng:</th>--%>
    <%--                            <td>${tongTienDonHangHoanThanh}</td>--%>
    <%--                        </tr>--%>
    <%--                        </tbody>--%>
    <%--                    </table>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>


    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div>
                    <h3 class="tile-title">Tổng Doanh Thu</h3>
                    <form class="row align-items-end" id="doanhThuTheoNgay">
                        <div class="form-group col-md-4">
                            <label for="ngayBatDau" class="control-label">Ngày bắt đầu</label>
                            <input id="ngayBatDau" class="form-control" type="date" name="ngayBatDau">
                        </div>
                        <div class="form-group col-md-4 ">
                            <label for="ngayKetThuc" class="control-label">Ngày kết thúc</label>
                            <input id="ngayKetThuc" class="form-control" type="date" name="ngayKetThuc">
                        </div>
                        <div class="form-group col-md-4">
                            <button class="btn btn-filter btn-sm btn-success" title="In" type="submit"><i
                                    class="fas fa-filter"></i>Lọc
                            </button>
                        </div>
                    </form>
                </div>
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable12">
                        <thead>
                        <tr>
                            <th>ID đơn hàng</th>
                            <th>Khách hàng</th>
                            <th>Đơn hàng</th>
                            <th>Ngày thanh toán</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                        </tr>
                        </thead>
                        <tbody id="data-body">
                        <tr>
                            <th colspan="5">Tổng cộng:</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div>
                    <h3 class="tile-title">SẢN PHẨM ĐÃ HẾT</h3>
                </div>
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Dung lượng</th>
                            <th>Màu sắc</th>
                            <th>Số lượng nhập</th>
                            <th>Số lượng bán</th>
                            <th>Tình trạng</th>
                            <th>Giá tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${danhSachSanPhamHetHang}" var="spHetHang">
                            <tr>
                                <td>${spHetHang.maSanPham}</td>
                                <td>${spHetHang.tenSanPham}</td>
                                <td><img src="${spHetHang.hinhAnh}" alt="" width="100px;"></td>
                                <td>${spHetHang.dungLuong}</td>
                                <td>${spHetHang.mauSac}</td>
                                <td>${spHetHang.soLuongNhap}</td>
                                <td>${spHetHang.soLuongBan}</td>
                                <td><span class="badge bg-danger">Hết hàng</span></td>
                                <td>${spHetHang.giaBanString}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="tile">
                <div class="tile-title">
                    <h3 style="display: inline-block; margin-right: 10px;">Thống kê số lượng toàn sản phẩm </h3>
                    <form class="row align-items-end" id="thongKeTongSoLuongBanNhap">
                        <div class="form-group col-md-4">
                            <label for="ngayBatDau2" class="control-label">Ngày bắt đầu</label>
                            <input id="ngayBatDau2" class="form-control" type="date" name="ngayBatDau">
                        </div>
                        <div class="form-group col-md-4 ">
                            <label for="ngayKetThuc2" class="control-label">Ngày kết thúc</label>
                            <input id="ngayKetThuc2" class="form-control" type="date" name="ngayKetThuc">
                        </div>
                        <div class="form-group col-md-4">
                            <button class="btn btn-filter btn-sm btn-success" title="In" type="submit"><i
                                    class="fas fa-filter"></i>Lọc
                            </button>
                        </div>
                    </form>
                </div>
                <br/>
                <div class="embed-responsive embed-responsive-16by9">
                    <canvas class="embed-responsive-item" id="barChartDemo1"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="tile">
                <div class="tile-title">
                    <h3 style="display: inline-block; margin-right: 10px;">Thống kê số lượng sản phẩm:</h3>
                    <form class="row align-items-end" id="thongKeSoLuongBanNhap">
                        <div class="form-group col-md-6">
                            <label for="ngayBatDau1" class="control-label">Ngày bắt đầu</label>
                            <input id="ngayBatDau1" class="form-control" type="date" name="ngayBatDau">
                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="ngayKetThuc1" class="control-label">Ngày kết thúc</label>
                            <input id="ngayKetThuc1" class="form-control" type="date" name="ngayKetThuc">
                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="maSP" class="control-label">Sản phẩm</label>
                            <select class="form-control" name="maSP" id="maSP">
                                <c:forEach items="${danhSachSPConHang}" var="sp">
                                    <option value="${sp.maSanPham}">${sp.tenSanPham}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <button class="btn btn-filter btn-sm btn-success" title="In" type="submit"><i
                                    class="fas fa-filter"></i>Lọc
                            </button>
                        </div>
                    </form>
                </div>
                <br/>
                <div class="embed-responsive embed-responsive-16by9">
                    <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Essential javascripts for application to work-->
<script src="../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
<script src="../../../../assetsAdmin/js/popper.min.js"></script>
<script src="../../../../assetsAdmin/js/bootstrap.min.js"></script>
<script src="../../../../assetsAdmin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../../../assetsAdmin/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<%--<script type="text/javascript" src="../../../../assetsAdmin/js/plugins/chart.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
    <%--var data = {--%>
    <%--    labels: ["Thống kê số lượng"],--%>
    <%--    datasets: [{--%>
    <%--        label: "Số lượng bán",--%>
    <%--        backgroundColor: "rgb(55,205,250)",--%>
    <%--        borderColor: "black",--%>
    <%--        pointColor: "rgb(55,205,250)",--%>
    <%--        pointStrokeColor: "#fff",--%>
    <%--        pointHighlightFill: "#fff",--%>
    <%--        pointHighlightStroke: "green",--%>
    <%--        pointRadius: 5,--%>
    <%--        pointHoverRadius: 8,--%>
    <%--        data: [${tongSoLuongBan}] // Remove the single quotes--%>
    <%--    },--%>
    <%--        {--%>
    <%--            label: "Số lượng tồn",--%>
    <%--            backgroundColor: "rgb(220, 64, 59)",--%>
    <%--            borderColor: "black",--%>
    <%--            pointColor: "rgb(220, 64, 59)",--%>
    <%--            pointStrokeColor: "#fff",--%>
    <%--            pointHighlightFill: "#fff",--%>
    <%--            pointHighlightStroke: "green",--%>
    <%--            pointRadius: 5,--%>
    <%--            pointHoverRadius: 8,--%>
    <%--            data: [${tongSoLuongNhap} - ${tongSoLuongBan}] // Remove the single quotes--%>
    <%--        }]--%>
    <%--};--%>


   // console.log("Labels: ", data.labels);
   // console.log("Data for dataset 1: ", data.datasets[0].data);
   // console.log("Data for dataset 2: ", data.datasets[1].data);

    // var ctxb = $("#barChartDemo").get(0).getContext("2d");
    // var barChart = new Chart(ctxb).Bar(data);
</script>
<!-- Google analytics script-->
<script type="text/javascript">
    if (document.location.hostname == 'pratikborsadiya.in') {
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-72504830-1', 'auto');
        ga('send', 'pageview');
    }
</script>
<script>
    var initialData = {
        labels: ['Số lượng bán', 'Số lượng tồn'],
        datasets: [{
            label: "Số lượng",
            backgroundColor: ["rgb(55,205,250)", "rgb(220, 64, 59)"],
            data: [0, 0]
        }]
    };

    var ctx = $("#barChartDemo").get(0).getContext("2d");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: initialData,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            responsive: true,
            plugins: {
                legend: {
                    display: false // Hide the legend
                }
            }
        }
    });

    $(document).ready(function () {

        $("#thongKeSoLuongBanNhap").submit(function (event) {
            event.preventDefault();
            var selectedValue = $("#maSP").val();
            var formData = {
                ngayBatDau: $("#ngayBatDau1").val(),
                ngayKetThuc: $("#ngayKetThuc1").val(),
                maSP: selectedValue
            };
            if (formData.ngayKetThuc < formData.ngayBatDau) {
                swal("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu!", {
                    icon: "error",
                });
                return;
            }
            $.ajax({
                type: "GET",
                url: "/admin/thong-ke/so-luong-san-pham",
                data: formData,
                success: function (data) {
                    myChart.data.datasets[0].data = data;
                    myChart.update();
                },
                error: function (error) {
                    console.error("Error fetching data:", error);
                }
            });

        });
    });

    //Tổng số lượng bán nhập


    var initialData1 = {
        labels: ['Số lượng bán', 'Số lượng tồn'],
        datasets: [{
            label: "Số lượng",
            backgroundColor: ["rgb(55,205,250)", "rgb(220, 64, 59)"],
            data: [0, 0]
        }]
    };

    var ctxl = $("#barChartDemo1").get(0).getContext("2d");
    var myChart1 = new Chart(ctxl, {
        type: 'bar',
        data: initialData1,
        options: {
            scales: {
                x: {
                    beginAtZero: true // This ensures that the x-axis starts at zero
                },
                y: {
                    beginAtZero: true
                }
            },
            responsive: true
        }
    });

    $(document).ready(function () {

        $("#thongKeTongSoLuongBanNhap").submit(function (event) {
            event.preventDefault();
            var formData = {
                ngayBatDau: $("#ngayBatDau2").val(),
                ngayKetThuc: $("#ngayKetThuc2").val(),
            };
            if (formData.ngayKetThuc < formData.ngayBatDau) {
                swal("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu!", {
                    icon: "error",
                });
                return;
            }
            $.ajax({
                type: "GET",
                url: "/admin/thong-ke/tong-so-luong-san-pham",
                data: formData,
                success: function (data) {
                    myChart1.data.datasets[0].data = data;
                    myChart1.update();
                },
                error: function (error) {
                    console.error("Error fetching data:", error);
                }
            });

        });
    });
</script>

<script>

    $(document).ready(function () {
        // Intercept the form submission
        $("#doanhThuTheoNgay").submit(function (event) {
            // Prevent the default form submission
            event.preventDefault();

            // Get the form data
            var formData = {
                ngayBatDau: $("#ngayBatDau").val(),
                ngayKetThuc: $("#ngayKetThuc").val()
            };
            if (formData.ngayKetThuc < formData.ngayBatDau) {
                swal("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu!", {
                    icon: "error",
                });
                return;
            }
            // Make an AJAX request
            $.ajax({
                type: "GET",
                url: "/admin/thong-ke/doanh-thu-theo-ngay",
                data: formData,
                dataType: "json",
                success: function (data) {
                    console.log("Data received:", data);

                    var tbody = $("#sampleTable12 tbody");
                    tbody.empty(); // Clear existing rows

                    // Iterate through each HoaDonChiTietDTO and add a new row for each
                    $.each(data.hoaDonChiTietDTOS, function (index, hoaDon) {
                        var newRow = "<tr>" +
                            "<td>" + hoaDon.maHoaDon + "</td>" +
                            "<td>" + hoaDon.tenKhachHang + "</td>" +
                            "<td>" + hoaDon.danhSachSanPham + "</td>" +
                            "<td>" + hoaDon.ngayThanhToan + "</td>" +
                            "<td>" + hoaDon.soLuongMua + "</td>" +
                            "<td>" + hoaDon.tongTienString + "</td>" +
                            "</tr>";

                        tbody.append(newRow);
                    });
                    // Update the total at the bottom of the table
                    var totalRow = "<tr><td colspan='5'>Tổng cộng:</td><td colspan='1'>" + "<h3>" + data.tongDoanhThu + "</h3>" + "</td></tr>";
                    tbody.append(totalRow);
                    $("#sampleTable12").DataTable({
                        paging: true,
                        lengthChange: false,
                        searching: false
                    });
                },
                error: function (error) {
                    console.error("Error:", error);
                }

            });
        });
    });

</script>
<jsp:include page="template/footer.jsp"></jsp:include>

</body>

</html>