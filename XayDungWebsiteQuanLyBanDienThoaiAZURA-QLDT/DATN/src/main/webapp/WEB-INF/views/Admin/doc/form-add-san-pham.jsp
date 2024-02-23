<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Thêm sản phẩm | Quản trị Admin</title>
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
            <li class="breadcrumb-item">Danh sách sản phẩm</li>
            <li class="breadcrumb-item"><a href="#">Thêm sản phẩm</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới sản phẩm</h3>
                <div class="tile-body">
                    <form class="row" id="form-add" onsubmit="AddConfirm(event)" enctype="multipart/form-data">
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect11" class="control-label">Tên sản phẩm</label>
                            <select class="form-control" id="exampleSelect11" name="maSanPham">
                                <option value="">-- Chọn nhà cung cấp --</option>
                                <c:forEach items="${sanPhamList}" var="sanPham">
                                    <c:if test="${sanPham.trangThai eq 1}">
                                        <option value="${sanPham.maSanPham}">${sanPham.tenSanPham}</option>
                                    </c:if>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="form-group  col-md-3">
                            <label class="control-label">Số lượng nhập</label>
                            <input class="form-control" type="number" name="soLuongNhap">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleSelect1234" class="control-label">Dung lượng (GB)</label>
                            <select class="form-control" id="exampleSelect1234" name="maDungLuong">
                                <option value="">-- Chọn dung lượng --</option>
                                <c:forEach items="${dungLuongList.getContent()}" var="dl">
                                    <c:if test="${dl.trangThai eq 1}">
                                    <option value="${dl.maDungLuong}">${dl.tenDungLuong}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="chip" class="control-label">Chip</label>
                            <select class="form-control" id="chip" name="maChip">
                                <option value="">-- Chọn chip --</option>
                                <c:forEach items="${chipList.getContent()}" var="chip">
                                    <c:if test="${chip.trangThai eq 1}">
                                    <option value="${chip.maChip}">${chip.tenChip}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect1" class="control-label">Nhà cung cấp</label>
                            <select class="form-control" id="exampleSelect1" name="maNSX">
                                <option value="">-- Chọn nhà cung cấp --</option>
                                <c:forEach items="${nsxList.getContent()}" var="nsx">
                                    <c:if test="${nsx.trangThai eq 1}">
                                    <option value="${nsx.maNSX}">${nsx.tenNSX}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect112345" class="control-label">Màu sắc</label>
                            <select class="form-control" id="exampleSelect112345" name="maMauSac">
                                <option value="">-- Chọn màu sắc --</option>
                                <c:forEach items="${mauSacList.getContent()}" var="ms">
                                    <c:if test="${ms.trangThai eq 1}">
                                    <option value="${ms.maMauSac}">${ms.tenMauSac}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Giá bán</label>
                            <input class="form-control" type="number" name="giaBan">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Giá nhập</label>
                            <input class="form-control" type="number" name="giaNhap">
                        </div>


                        <div class="form-group col-md-12">
                            <label class="control-label">Chọn ảnh</label>
                            <input type="file" id="fileInput" onchange="handleFileSelect()" name="image">
                            <%--                            <form:input type="file" name="file" class="form-control-file" id="photo" path="image"/>--%>
                        </div>
                        <div class="form-group col-md-12" id="imageContainer">
                            <img id="imagePreview" height="150" width="150" alt="Selected image"
                                 style="display: none;"/>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả sản phẩm</label>
                            <textarea class="form-control" name="moTa" id="mota"></textarea>
                        </div>
                        <button class="btn btn-save" type="submit">Lưu lại</button>
                        <a class="btn btn-cancel" href="/admin/${nhanVien.maNhanVien}/quan-li-san-pham">Hủy bỏ</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>


<!--
MODAL CHỨC VỤ
-->
<div class="modal fade" id="modalNhaSanXuat" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <form action="/admin/${nhanVien.maNhanVien}/add-NSX" method="post">
                    <div class="row">
                        <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới nhà sản xuất</h5>
              </span>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập tên nhà sản xuất mới</label>
                            <input class="form-control" id="tenNSX" name="tenNSX" type="text" required>
                        </div>
                    </div>
                    <label class="control-label">Danh sách nhà sản xuất hiện có:</label>
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>Mã nhà sản xuất</th>
                            <th>Tên nhà sản xuất</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${nsxList.getContent()}" var="nsx">
                            <tr>
                                <td>${nsx.maNSX}</td>
                                <td>${nsx.tenNSX}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i
                                            class="fas fa-trash-alt"></i>
                                    </button>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            data-toggle="modal" data-target="#ModalUP">
                                        <i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <form>
                        <div>
                            <ul class="pagination">
                                <li class="page-item">
                                    <c:if test="${nsxList.getNumber() + 1 > 1}">
                                        <a class="page-link" href="?page=${nsxList.getNumber()}">
                                            Previous
                                        </a>
                                    </c:if>
                                </li>
                                <li class="page-item"><a class="page-link"> ${nsxList.getNumber() + 1}</a></li>
                                <li class="page-item"><a class="page-link">/</a></li>
                                <li class="page-item"><a class="page-link"> ${nsxList.getTotalPages()}</a></li>
                                <li class="page-item"><c:if
                                        test="${nsxList.getNumber() + 1 lt nsxList.getTotalPages()}">
                                    <a class="page-link" href="?page=${nsxList.getNumber() + 2}">
                                        Next
                                    </a>
                                </c:if>
                                </li>
                            </ul>
                        </div>
                    </form>
                    <BR>
                    <button class="btn btn-save" type="submit" onclick="return checkNSX()">Lưu lại</button>
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                </form>
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


<!--
MODAL MÀU SẮC
-->
<div class="modal fade" id="addMauSac" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <form action="/admin/${nhanVien.maNhanVien}/add-Mau-Sac" method="post">
                    <div class="row">
                        <div class="form-group col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới màu sắc</h5>
              </span>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập màu sắc mới</label>
                            <input class="form-control" id="tenMauSac" name="tenMauSac" type="text" required>
                        </div>
                    </div>
                    <label class="control-label">Danh sách màu sắc hiện có:</label>
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>Mã màu sắc</th>
                            <th>Tên màu sắc</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${mauSacList.getContent()}" var="ms">
                            <tr>
                                <td>${ms.maMauSac}</td>
                                <td>${ms.tenMauSac}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i
                                            class="fas fa-trash-alt"></i>
                                    </button>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            data-toggle="modal" data-target="#ModalUP">
                                        <i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <form id="paginationForm">
                        <div>
                            <ul class="pagination">
                                <li class="page-item">
                                    <c:if test="${mauSacList.getNumber() + 1 > 1}">
                                        <a class="page-link" href="javascript:void(0);"
                                           onclick="loadPage(${mauSacList.getNumber()})">
                                            Previous
                                        </a>
                                    </c:if>
                                </li>
                                <li class="page-item"><a class="page-link">${mauSacList.getNumber() + 1}</a></li>
                                <li class="page-item"><a class="page-link">/</a></li>
                                <li class="page-item"><a class="page-link">${mauSacList.getTotalPages()}</a></li>
                                <li class="page-item">
                                    <c:if test="${mauSacList.getNumber() + 1 < mauSacList.getTotalPages()}">
                                        <a class="page-link" href="javascript:void(0);"
                                           onclick="loadPage(${mauSacList.getNumber() + 1})">
                                            Next
                                        </a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </form>
                    <BR>
                    <button class="btn btn-save" type="submit">Lưu lại</button>
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                </form>
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

<!--
MODAL DUNG LƯỢNG
-->
<div class="modal fade" id="addDungLuong" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <form action="/admin/${nhanVien.maNhanVien}/add-Dung-Luong" method="post">
                    <div class="row">
                        <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới dung lượng</h5>
              </span>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập dung lượng mới</label>
                            <input class="form-control" id="tenDungLuong" name="tenDungLuong" type="text" required>
                        </div>
                    </div>
                    <label class="control-label">Danh sách dung lượng hiện có:</label>
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>Mã dung lượng</th>
                            <th>Tên dung lượng</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${dungLuongList.getContent()}" var="dl">
                            <tr>
                                <td>${dl.maDungLuong}</td>
                                <td>${dl.tenDungLuong}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i
                                            class="fas fa-trash-alt"></i>
                                    </button>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            data-toggle="modal" data-target="#ModalUP">
                                        <i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <BR>
                    <button class="btn btn-save" type="submit">Lưu lại</button>
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                </form>
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

<!--
MODAL CHIP
-->
<div class="modal fade" id="addChip" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <form action="/admin/${nhanVien.maNhanVien}/add-Chip" method="post">
                    <div class="row">
                        <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới Chip</h5>
              </span>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập chip mới</label>
                            <input class="form-control" id="tenChip" name="tenChip" type="text" required>
                        </div>
                    </div>
                    <label class="control-label">Danh sách chip hiện có:</label>
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>Mã chip</th>
                            <th>Tên chip</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${chipList.getContent()}" var="chip">
                            <tr>
                                <td>${chip.maChip}</td>
                                <td>${chip.tenChip}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i
                                            class="fas fa-trash-alt"></i>
                                    </button>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            data-toggle="modal" data-target="#ModalUP">
                                        <i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <BR>
                    <button class="btn btn-save" type="submit">Lưu lại</button>
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                </form>
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
<script src="../../../../assetsAdmin/js/main.js"></script>
<script src="../../../../assetsAdmin/js/plugins/pace.min.js"></script>
<script>
    const inpFile = document.getElementById("inpFile");
    const loadFile = document.getElementById("loadFile");
    const previewContainer = document.getElementById("imagePreview");
    const previewImage = previewContainer.querySelector(".image-preview__image");
    const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
    inpFile.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            previewDefaultText.style.display = "none";
            previewImage.style.display = "block";
            reader.addEventListener("load", function () {
                previewImage.setAttribute("src", this.result);
            });
            reader.readAsDataURL(file);
        }
    });

    function checkNSX() {
        var tenNSX = document.getElementById('tenNSX').value;
        var exists = false;

        for (var i = 0; i < nsxList.length; i++) {
            if (nsxList[i].tenNSX === tenNSX) {
                exists = true;
                break;
            }
        }

        if (exists == true) {
            swal.fire({
                title: 'Thông báo',
                text: "Đã tồn tại nhà sản xuất này !",
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        } else {
            window.location.href = "/admin/add-san-pham";
        }
    }

    function AddConfirm(event) {
        event.preventDefault();
        var form = document.getElementById("form-add");
        var formData = new FormData(form);

        swal({
            title: "Cảnh báo",
            text: "Bạn có muốn thêm sản phẩm này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willUpdate) => {
            if (willUpdate) {
                fetch('/admin/chi-tiet-san-pham/add', {
                    method: 'POST',
                    body: formData,
                })
                    .then(response => response.text())
                    .then(message => {
                        if (message.includes("Success")) {
                            swal("Thêm thành công!", {
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
                        swal("Thêm không thành công!", {
                            icon: "error",
                        });
                    });

            }
        });
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
<script>
    function loadPage(pageNumber) {
        // Tạo một thẻ a ẩn với href chứa đường dẫn mới
        var link = document.createElement('a');
        link.href = '?page=' + pageNumber;
        link.style.display = 'none';
        document.body.appendChild(link);

        // Simulate a click on the hidden link
        link.click();

        // Cleanup: remove the temporary link from the DOM
        document.body.removeChild(link);
    }
</script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>