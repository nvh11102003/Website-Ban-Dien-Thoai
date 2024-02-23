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
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="/admin/${nhanVien.maNhanVien}/add-ten-san-pham" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo tên mới sản phẩm</a>
                        </div>
<%--                        <div class="col-sm-2">--%>
<%--                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất--%>
<%--                                Excel</a>--%>
<%--                        </div>--%>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th style="display: none">Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Dung lượng pin (mAh)</th>
                            <th>Màn hình</th>
                            <th>Hệ điều hành</th>
                            <th>Ram</th>
                            <th>Camera Trước</th>
                            <th>Camera Sau</th>
                            <th>Sim</th>
                            <th>Trạng thái</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sanPham}" var="sanPham">
                            <tr>
                                <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                <td style="display: none">${sanPham.maSanPham}</td>
                                <td>${sanPham.tenSanPham}</td>
                                <td>${sanPham.dungLuongPin}</td>
                                <td>${sanPham.manhinh}</td>
                                <td>${sanPham.heDieuHanh}</td>
                                <td>${sanPham.ram}</td>
                                <td>${sanPham.cameratruoc}</td>
                                <td>${sanPham.camerasau}</td>
                                <td>${sanPham.sim}</td>
                                <td><span
                                        class='${sanPham.trangThai == 1 ? 'badge bg-success' : ' badge bg-danger'}'>${sanPham.trangThai == 1 ? "Hoạt động" : "Ngừng hoạt động" }</span>
                                </td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                            onclick="return deleteRow(${sanPham.maSanPham})"><i
                                            class="fas fa-trash-alt"></i>
                                    </button>
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
v>

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
                            <label class="control-label">Mã sản phẩm</label>
                            <input class="form-control" type="text" required id="maSanPham" value="maSanPham"
                                   name="maSanPham">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Tên Sản Phẩm</label>
                            <input class="form-control" type="text" required id="tenSanPham1" value="tenSanPham"
                                   name="tenSanPham">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Dung lượng pin (mAh)</label>
                            <input class="form-control" type="number" required id="dungLuongPin" value="dungLuongPin"
                                   name="dungLuongPin">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Màn hình</label>
                            <input class="form-control" type="text" required id="manHinh" value="manHinh"
                                   name="manHinh">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Hệ điều hành</label>
                            <input class="form-control" type="text" required id="heDieuHanh" value="heDieuHanh"
                                   name="heDieuHanh">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Ram</label>
                            <input class="form-control" type="text" required id="ram" value="ram"
                                   name="ram">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Camera trước</label>
                            <input class="form-control" type="text" required id="cameratruoc" value="cameratruoc"
                                   name="cameratruoc">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Camera sau</label>
                            <input class="form-control" type="text" required id="camerasau" value="camerasau"
                                   name="camerasau">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Sim</label>
                            <input class="form-control" type="text" required id="sim" value="sim"
                                   name="sim">
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
    $(document).ready(function() {
        $('#myDataTable').DataTable({
            "paging": true,
            "searching": true
        });
    });

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
    //confirm
    function deleteRow(maSanPham) {
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willDelete) => {
            if (willDelete) {
                fetch('/admin/chi-tiet-san-pham/deleteSP/' + maSanPham, {
                    method: 'GET'
                })
                    .then(response => {
                        if (response.ok) {
                            swal("Xóa thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/'+ ${nhanVien.maNhanVien} +'/quan-li-ten-san-pham';
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

    function updateConfirm() {
        var form = document.getElementById("form-update");
        var formData = new FormData(form);
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn sửa sản phẩm này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willUpdate) => {
            if (willUpdate) {
                fetch('/admin/chi-tiet-san-pham/updateSanPham', {
                    method: 'POST',
                    body: formData
                })
                    .then(response => response.text())
                    .then(message => {
                        if (message.includes("Success")) {
                            swal("Sửa thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/' + ${nhanVien.maNhanVien} + '/quan-li-ten-san-pham';
                            }, 2000);
                        } else {
                            swal(message, {
                                icon: "error",
                            });
                        }
                    })
                    .catch(error => {
                        console.error(error);
                        swal("Thêm không thành công!", {
                            icon: "error",
                        });
                    });
            }
        });
    }

    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });

    //view modal update
    function editProductModal(button) {
        var row = button.closest("tr");
        var maSanPham = row.cells[1].textContent;
        var tenSanPham = row.cells[2].innerHTML;
        var dungLuongPin = row.cells[3].textContent;
        var manHinh = row.cells[4].textContent;
        var heDieuHanh = row.cells[5].textContent;
        var ram = row.cells[6].textContent;
        var cameratruoc = row.cells[7].textContent;
        var camerasau = row.cells[8].textContent;
        var sim = row.cells[9].textContent;

        document.getElementById("maSanPham").value = maSanPham;
        document.getElementById("tenSanPham1").value = tenSanPham;
        document.getElementById("dungLuongPin").value = dungLuongPin;
        document.getElementById("manHinh").value = manHinh;
        document.getElementById("heDieuHanh").value = heDieuHanh;
        document.getElementById("ram").value = ram;
        document.getElementById("cameratruoc").value = cameratruoc;
        document.getElementById("camerasau").value = camerasau;
        document.getElementById("sim").value = sim;

        console.log(tenSanPham)
    }

</script>
<script>
    function handleFileSelect() {
        // Lấy thông tin về tệp đã chọn
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];

        // Kiểm tra xem đã chọn tệp nào chưa
        if (file) {
            console.log('Tên tệp: ' + file.name);
            console.log('Loại tệp: ' + file.type);
            console.log('Kích thước tệp: ' + file.size + ' bytes');
        } else {
            console.log('Chưa chọn tệp nào.');
        }
        var imagePreview = document.getElementById('imagePreview');
        if (fileInput.files.length > 0) {
            var imagePath = URL.createObjectURL(file);
            imagePreview.src = imagePath;
            imagePreview.style.display = 'block';
        } else {
            imagePreview.style.display = 'none';
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>