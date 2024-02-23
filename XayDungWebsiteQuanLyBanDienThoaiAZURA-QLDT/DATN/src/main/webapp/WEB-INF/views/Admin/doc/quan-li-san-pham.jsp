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
                    <%--                    <form class="row" action="/chi-tiet-san-pham/search" method="post">--%>
                    <%--                        <div class="form-group col-md-3">--%>
                    <%--                            <label class="control-label">Tên sản phẩm</label>--%>
                    <%--                            <input class="form-control" type="text" name="tenSanPham">--%>
                    <%--                        </div>--%>
                    <%--                        <div class="form-group col-md-3 ">--%>
                    <%--                            <label for="exampleSelect13" class="control-label">Tình trạng</label>--%>
                    <%--                            <select class="form-control" id="exampleSelect13">--%>
                    <%--                                <option>-- Chọn tình trạng --</option>--%>
                    <%--                                <option>Còn hàng</option>--%>
                    <%--                                <option>Hết hàng</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="form-group col-md-3">--%>
                    <%--                            <label for="exampleSelect12" class="control-label">Màu sắc</label>--%>
                    <%--                            <select class="form-control" id="exampleSelect12">--%>
                    <%--                                <option>-- Chọn màu sắc --</option>--%>
                    <%--                                <option>Bàn ăn</option>--%>
                    <%--                                <option>Giá đỡ</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="form-group col-md-3 ">--%>
                    <%--                            <label for="exampleSelect11" class="control-label">Nhà sản xuất</label>--%>
                    <%--                            <select class="form-control" id="exampleSelect11">--%>
                    <%--                                <option>-- Chọn nhà sản xuất --</option>--%>
                    <%--                                <option>Thế giới di động</option>--%>
                    <%--                                <option>FPT</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                        <div style="margin-left: auto; margin-right: 10px">--%>
                    <%--                            <button class="btn btn-save" type="submit">Tìm kiếm</button>--%>
                    <%--                        </div>--%>
                    <%--                    </form>--%>
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="/admin/${nhanVien.maNhanVien}/add-san-pham" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới chi tiết sản phẩm</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="/admin/${nhanVien.maNhanVien}/add-ten-san-pham" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới sản phẩm</a>
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
                            <th style="display: none">Mã CT sản phẩm</th>
                            <th style="display: none">Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng nhập</th>
                            <th>Số lượng bán</th>
                            <th>Tình trạng</th>
                            <th>Nhà sản xuất</th>
                            <th>Giá bán</th>
                            <th>Giá Nhập</th>
                            <th>Màu sắc</th>
                            <th>Dung lượng</th>
                            <th>Chip</th>
                            <th>Dung lượng pin (mAh)</th>
                            <th>Màn hình</th>
                            <th style="display: none"></th>
                            <th style="display: none"></th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${ctsp}" var="ctsp">
                            <tr>
                                <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                <td style="display: none">${ctsp.maChiTietSanPham}</td>
                                <td style="display: none">${ctsp.maSanPham}</td>
                                <td>${ctsp.tenSanPham}</td>
                                <td><img src="/img/${ctsp.hinhAnh}" alt="" width="100px;"></td>
                                <td>${ctsp.soLuongNhap}</td>
                                <td>${ctsp.soLuongBan}</td>
                                <td>${ctsp.tinhTrang == 1 ? "Còn hàng" : "Hết hàng" }</td>
                                <td>${ctsp.tenNSX}</td>
                                <td>${ctsp.giaBanString}</td>
                                <td>${ctsp.giaNhapString}</td>
                                <td>${ctsp.mauSac}</td>
                                <td>${ctsp.dungLuong}</td>
                                <td>${ctsp.tenChip}</td>
                                <td>${ctsp.dungLuongPin}</td>
                                <td>${ctsp.manHinh}</td>
                                <td style="display: none">${ctsp.giaBan}</td>
                                <td style="display: none">${ctsp.giaNhap}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                            onclick="return deleteRow(${ctsp.maChiTietSanPham})"><i
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
                        <div class="form-group col-md-6" style="display: none">
                            <label class="control-label">Mã CT sản phẩm</label>
                            <input class="form-control" type="text" required id="maChiTietSanPham"
                                   value="maChiTietSanPham"
                                   name="maChiTietSanPham">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" required id="tenSanPham1" value="tenSanPham" readonly
                                   name="tenSanPham">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label">Số lượng Nhập</label>
                            <input class="form-control" type="number" required id="soLuongNhap" value="soLuongNhap"
                                   name="soLuongNhap">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label">Số lượng Bán</label>
                            <input class="form-control" type="number" required id="soLuongBan" value="soLuongBan"
                                   name="soLuongBan" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Giá bán</label>
                            <input class="form-control" type="number" required id="giaBan" value="giaBan" name="giaBan">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Giá Nhập</label>
                            <input class="form-control" type="number" required id="giaNhap" value="giaNhap" name="giaNhap">
                        </div>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Dung lượng pin (mAh)</label>--%>
<%--                            <input class="form-control" type="number" required id="dungLuongPin" value="dungLuongPin"--%>
<%--                                   name="dungLuongPin">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Màn hình</label>--%>
<%--                            <input class="form-control" type="text" required id="manHinh" value="manHinh"--%>
<%--                                   name="manHinh">--%>
<%--                        </div>--%>
                        <div class="form-group  col-md-6">
                            <label for="nhaSanXuat" class="control-label">Nhà sản xuất</label>
                            <select class="form-control" id="nhaSanXuat" name="maNSX" required>
                                <option value="">-- Chọn nhà sản xuất --</option>
                                <c:forEach items="${nsxList}" var="nsx">
                                    <option value="${nsx.maNSX}">${nsx.tenNSX}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group  col-md-6">
                            <label for="chip1" class="control-label">Chip</label>
                            <select class="form-control" name="maChip" required id="chip1">
                                <option value="">-- Chọn chip --</option>
                                <c:forEach items="${chipList}" var="chip">
                                    <option value="${chip.maChip}">${chip.tenChip}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="dungLuong" class="control-label">Dung lượng (GB)</label>
                            <select class="form-control" name="maDungLuong" id="dungLuong">
                                <option value="">-- Chọn dung lượng --</option>
                                <c:forEach items="${dungLuongList}" var="dl">
                                    <option value="${dl.maDungLuong}">${dl.tenDungLuong}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mauSac1" class="control-label">Màu sắc</label>
                            <select class="form-control" name="maMauSac" id="mauSac1">
                                <option value="">-- Chọn màu sắc --</option>
                                <c:forEach items="${mauSacList}" var="ms">
                                    <option value="${ms.maMauSac}">${ms.tenMauSac}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Ảnh sản phẩm</label>
                            <img id="imageView" height="100" width="100"
                                 style="display: none;"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Chọn ảnh cập nhập</label>
                            <input type="file" id="fileInput" onchange="handleFileSelect()" name="image">
                        </div>
                        <div class="form-group col-md-12" id="imageContainer">
                            <img id="imagePreview" height="100" width="100" alt="Selected image"
                                 style="display: none;"/>
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
    function deleteRow(maChiTietSanPham) {
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willDelete) => {
            if (willDelete) {
                fetch('/admin/chi-tiet-san-pham/delete/' + maChiTietSanPham, {
                    method: 'GET'
                })
                    .then(response => {
                        if (response.ok) {
                            swal("Xóa thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/'+ ${nhanVien.maNhanVien} +'/quan-li-san-pham';
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
                fetch('/admin/chi-tiet-san-pham/update', {
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
                                window.location.href = '/admin/' + ${nhanVien.maNhanVien} + '/quan-li-san-pham';
                            }, 2000);
                        } else {
                            swal(message, {
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

    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });

    //view modal update
    function editProductModal(button) {
        var row = button.closest("tr");
        var maChiTietSanPham = row.cells[1].textContent;
        var maSanPham = row.cells[2].textContent;
        var tenSanPham = row.cells[3].textContent;
        var hinhAnh = row.cells[4].querySelector('img').src;
        var soLuongNhap = row.cells[5].textContent;
        var soLuongBan = row.cells[6].textContent;
        // var dungLuongPin = row.cells[14].textContent;
        // var manHinh = row.cells[15].textContent;
        var nhaSanXuat = row.cells[8].textContent;
        var mauSac = row.cells[11].textContent;
        var chip = row.cells[13].textContent;
        var dungLuong = row.cells[12].textContent;
        var giaBan = row.cells[16].textContent;
        var giaNhap = row.cells[17].textContent;

        document.getElementById("maChiTietSanPham").value = maChiTietSanPham;
        document.getElementById("maSanPham").value = maSanPham;
        document.getElementById("tenSanPham1").value = tenSanPham;
        document.getElementById("soLuongNhap").value = soLuongNhap;
        document.getElementById("soLuongBan").value = soLuongBan;
        document.getElementById("giaBan").value = giaBan;
        document.getElementById("giaNhap").value = giaNhap;
        // document.getElementById("dungLuongPin").value = dungLuongPin;
        // document.getElementById("manHinh").value = manHinh;

        var selectElementNSX = document.getElementById("nhaSanXuat");
        for (var i = 0; i < selectElementNSX.options.length; i++) {
            var option = selectElementNSX.options[i];
            if (option.text === nhaSanXuat) {
                option.selected = true;
                break;
            }
        }

        var selectElementChip = document.getElementById("chip1");
        for (var i = 0; i < selectElementChip.options.length; i++) {
            var option = selectElementChip.options[i];
            if (option.text === chip) {
                option.selected = true;
                break;
            }
        }
        var selectElementDL = document.getElementById("dungLuong");
        for (var i = 0; i < selectElementDL.options.length; i++) {
            var option = selectElementDL.options[i];
            if (option.text === dungLuong) {
                option.selected = true;
                break;
            }
        }
        var selectElementMS = document.getElementById("mauSac1");
        for (var i = 0; i < selectElementMS.options.length; i++) {
            var option = selectElementMS.options[i];
            if (option.text === mauSac) {
                option.selected = true;
                break;
            }
        }
        console.log(hinhAnh);
        var modalImageView = document.getElementById("imageView");

        modalImageView.src = hinhAnh;
        modalImageView.style.display = "block";

    }

    function displayImage() {
        var selectElement = document.getElementById("imageSelect");
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var selectedImageURL = selectedOption.getAttribute("data-image-url");
        var imagePreview = document.getElementById("imagePreview");
        imagePreview.src = selectedImageURL;
        imagePreview.style.display = "block";
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