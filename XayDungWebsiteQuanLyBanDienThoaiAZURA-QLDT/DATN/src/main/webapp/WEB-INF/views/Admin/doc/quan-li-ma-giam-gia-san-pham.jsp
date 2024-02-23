<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách Sản Phẩm | Quản trị Admin</title>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.1/dist/sweetalert2.all.min.js"></script>

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
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách mã giảm giá sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" id="updateTT" title="In" type="submit"><i
                                    class="fas fc-agenda-view" >Cập nhập trạng thái</i>
                            </button>
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-excel btn-sm" id="updateTTDungHD" title="In" type="submit"><i
                                    class="fas fc-agenda-view" >Dừng hoạt động toàn bộ</i>
                            </button>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th style="display: none">Mã giảm giá</th>
                            <th>Tên mã giảm giá</th>
                            <th>Phần trăm Sale</th>
                            <th>Ngày bắt đầu</th>
                            <th>Ngày kết thúc</th>
                            <th>Trạng thái</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="ggsp" items="${ggsp}">
                            <tr>
                                <td style="display: none">${ggsp.maGiamGia}</td>
                                <td>${ggsp.tenGiamGia}</td>
                                <td>${ggsp.phanTramSale}</td>
                                <td>${ggsp.ngayBatDau}</td>
                                <td>${ggsp.ngayKetThuc}</td>
                                <td><span class='${ggsp.statusV == 1 ? 'badge bg-success' : ' badge bg-danger'}'>${ggsp.statusV == 1 ? "Hoạt động" : "Ngừng hoạt động" }</span></td>
                                <td>
<%--                                    <button class="btn btn-primary btn-sm edit" type="button" title="Xóa"--%>
<%--                                            onclick="return deleteRow(${ggsp.maGiamGia})"><i--%>
<%--                                            class="fas fa-edit-alt"></i>--%>
<%--                                    </button>--%>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            data-toggle="modal" data-target="#ModalUP" onclick="editProductModal(this)">
                                        <i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
            <h5>Chỉnh sửa thông tin sản phẩm</h5>
          </span>
                    </div>
                </div>
                <form class="row" id="form-update" >
                    <div class="row">
                        <div class="form-group col-md-6" style="display: none">
                            <label class="control-label">Mã giảm giá</label>
                            <input class="form-control" type="text" required id="ma" value="ma"
                                   name="maGiamGia">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Tên </label>
                            <input class="form-control" type="text" required id="tenGiamGia" value="tenGiamGia"
                                   name="tenGiamGia">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label">Phần trăm Sale</label>
                            <input class="form-control" type="number" required id="phanTram" value="phanTram"
                                   name="phamTramSale">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label">Ngày bắt đầu</label>
                            <input class="form-control" type="date" required id="ngayBatDau" value="ngayBatDau"
                                   name="ngayBatDau">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Ngày kết thúc</label>
                            <input class="form-control" type="date" required id="ngayKetThuc" value="ngayKetThuc"
                                   name="ngayKetThuc">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="trangThai" class="control-label">Trạng thái</label>
                            <select class="form-control" name="trangThai" id="trangThai">
                                <option value="">-- Chọn trạng thái --</option>
                                <option value="0">Ngừng hoạt động</option>
                                <option value="1">Hoạt động</option>
                            </select>
                        </div>
                    </div>
                    <BR>
                    <BR>
                    <div style="align-content: center; margin: auto">
                        <button class="btn btn-save" type="button" onclick="return updateConfirm()">Lưu lại</button>
                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                    </div>
                    <BR>
                </form>
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
<script type="text/javascript">
    $('#sampleTable').DataTable();

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
</script>
<script>
    //view modal update
    function editProductModal(button) {
        var row = button.closest("tr");
        var ma = row.cells[0].textContent;
        var tenGiamGia = row.cells[1].textContent;
        var phanTram = row.cells[2].textContent;
        var ngayBatDau = row.cells[3].textContent;
        var ngayKetThuc = row.cells[4].textContent;
        var trangThai = row.cells[5].textContent;

        document.getElementById("ma").value = ma;
        document.getElementById("tenGiamGia").value = tenGiamGia;
        document.getElementById("phanTram").value = phanTram;
        document.getElementById("ngayBatDau").value = ngayBatDau;
        document.getElementById("ngayKetThuc").value = ngayKetThuc;

        var trangThaiSelected = document.getElementById("trangThai");
        for (var i = 0; i < trangThaiSelected.options.length; i++) {
            var option = trangThaiSelected.options[i];
            if (option.text === trangThai) {
                option.selected = true;
                break;
            }
        }
        // Mở modal
        $('#ModalUP').modal('show');
    }

    function updateConfirm() {
        var form = document.getElementById("form-update");
        var formData = new FormData(form);

        // Validation checks
        var ten = document.getElementById("tenGiamGia").value;
        var phanTramVoucher = document.getElementById("phanTram").value;
        var ngayBatDau = new Date(document.getElementById("ngayBatDau").value);
        var ngayKetThuc = new Date(document.getElementById("ngayKetThuc").value);
        var trangThaiSelect = document.getElementById("trangThai");
        var trangThai = trangThaiSelect.options[trangThaiSelect.selectedIndex].text;
        // Check if required fields are empty
        if (!ten.trim() || !phanTramVoucher|| !ngayBatDau || !ngayKetThuc) {
            swal("Lỗi!", "Vui lòng điền đầy đủ thông tin.", "error");
            return;
        }

        // Check if numeric fields are valid numbers
        if (isNaN(phanTramVoucher)) {
            swal("Lỗi!", "Vui lòng nhập giá trị số hợp lệ cho các trường số.", "error");
            return;
        }
        if (phanTramVoucher <= 0) {
            swal("Lỗi", "Phần trăm giảm không hợp lệ.", "error");
            return; // Stop further execution
        }

        if (phanTramVoucher >= 100) {
            swal("Lỗi", "Phần trăm giảm không hợp lệ.", "error");
            return; // Stop further execution
        }

        // Check if Ngày bắt đầu is before Ngày kết thúc
        if (ngayBatDau >= ngayKetThuc) {
            swal("Lỗi!", "Ngày bắt đầu phải trước ngày kết thúc.", "error");
            return;
        }
        if(trangThai === "Hoạt động"){
            if (ngayKetThuc <= new Date()) {
                swal("Lỗi!", "Ngày kết thúc phải lớn hơn ngày hôm này mới có thể hoạt động", "error");
                return;
            }
        }
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn sửa sản phẩm này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willUpdate) => {
            if (willUpdate) {
                fetch('/admin/${nhanVien.maNhanVien}/update-giam-gia-ma-san-pham', {
                    method: 'POST',
                    body: formData
                })
                    .then(response => {
                        if (response.ok) {
                            swal("Sửa thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/' + ${nhanVien.maNhanVien} +'/quan-li-ma-giam-gia-san-pham';
                            }, 2000);
                        } else {
                            swal("Sửa không thành công!", {
                                icon: "error",
                            });
                        }
                    })
                    .catch(error => {
                        console.error(error);
                        swal("Sửa không thành công!", {
                            icon: "error",
                        });
                    });
            }
        });
    }

    function deleteRow(maGiamGia) {
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn xóa mã giảm giá này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willDelete) => {
            if (willDelete) {
                fetch('/admin/${nhanVien.maNhanVien}/xoa-ma-giam-gia-san-pham/' + maGiamGia, {
                    method: 'PUT'
                })
                    .then(response => {
                        if (response.ok) {
                            swal("Xóa thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/' + ${nhanVien.maNhanVien} +'/quan-li-ma-giam-gia-hoa-don';
                            }, 2000);
                        } else {
                            swal("Xóa không thành công!", {
                                icon: "error",
                            });
                        }
                    })
                    .catch(error => {
                        console.error(error);
                        swal("Xóa không thành công!", {
                            icon: "error",
                        });
                    });
            }
        });
    }
</script>
<script>
    $("#updateTT").click(function (e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/giam-gia/update-tt-giam-gia-san-pham",
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

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/giam-gia/update-dung-hoat-dong-toan-bo",
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
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>