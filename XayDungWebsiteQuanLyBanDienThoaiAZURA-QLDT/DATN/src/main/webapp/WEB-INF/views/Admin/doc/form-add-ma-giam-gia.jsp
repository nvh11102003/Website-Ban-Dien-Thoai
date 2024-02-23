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
            <li class="breadcrumb-item">Danh sách mã giảm giá</li>
            <li class="breadcrumb-item"><a href="#">Thêm mã giảm giá</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Thêm mã giảm giá</h3>
                <div class="tile-body">
                    <%--                    <form class="row" id="form-add"   enctype="multipart/form-data">--%>
                    <form class="row" id="form-add" onsubmit="AddConfirm(event)" enctype="multipart/form-data">
                        <div class="form-group col-md-3">
                            <label class="control-label" for="ten">Tên mã giảm giá</label>
                            <input class="form-control" type="text" id="ten" name="ten">
                        </div>
                        <br>
                        <div class="form-group col-md-4">


                            <label class="control-label">Loại chương trình:</label><br/>
                            <div>
                                <div class="form-group col-md-6">

                                    <input class="form-check-input" type="radio" id="giamgia_sp" name="loai"
                                           value="giamgia_sp"
                                           onclick="showGiamGiaSanPham()" checked>
                                    <label for="giamgia_sp">Giảm giá sản phẩm</label>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-check-input" type="radio" id="giamgia_hd" name="loai"
                                           value="giamgia_hd"
                                           onclick="showGiamGiaHoaDon()">
                                    <label for="giamgia_hd">Giảm giá hóa đơn</label>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-group col-md-5">
                            <div id="giamgia_sanpham" style="display: none;">
                                <div class="form-group col-md-6">
                                    <label for="tigiam" class="control-label">Phần trăm giảm <span class="text-danger">(*)</span>
                                        :</label>
                                    <input class="form-control" type="text" id="tigiam" name="tigiam">
                                    <span id="errorPhanTramGiamSP" class="text-danger"></span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="form-group  col-md-3">--%>
                                    <div>
                                        <label class="control-label" for="ngaybd">Ngày bắt đầu:</label>
                                        <input class="form-control" type="date" id="ngaybd" name="ngaybd">
                                        <%--                            </div>--%>
                                        <%--                            <div class="form-group col-md-3">--%>
                                        <label class="control-label" for="ngaykt">Ngày kết thúc:</label>
                                        <input class="form-control" type="date" id="ngaykt" name="ngaykt">
                                    </div>
                                </div>
                            </div>
                            <div id="giamgia_hoadon" style="display: none;">
                                <div class="form-group col-md-6">
                                    <label for="soLuongMuaTT" class="control-label">Số lượng mua tối thiểu:<span
                                            class="text-danger">(*)</span> :</label>
                                    <input type="text" class="form-control" id="soLuongMuaTT" name="soLuongMuaTT">
                                    <label for="donGiaMuaTT" class="control-label">Đơn giá mua tối thiểu:<span
                                            class="text-danger">(*)</span> :</label>
                                    <input type="text" class="form-control" id="donGiaMuaTT" name="donGiaMuaTT">
                                    <label for="tigiam_hd" class="control-label">Phần trăm giảm <span
                                            class="text-danger">(*)</span> :</label>
                                    <input type="text" class="form-control" id="tigiam_hd" name="tigiam_hd">
                                    <span id="errorPhanTramGiamHD" class="text-danger"></span>
                                    <div>
                                        <label for="ngaybd_hd" class="control-label">Ngày bắt đầu:</label>
                                        <input type="date" id="ngaybd_hd" name="ngaybd_hd" class="form-control">
                                        <%--                            </div>--%>
                                        <%--                            <div class="form-group col-md-3">--%>
                                        <label for="ngaykt_hd" class="control-label">Ngày kết thúc:</label>
                                        <input type="date" id="ngaykt_hd" name="ngaykt_hd" class="form-control">
                                    </div>
                                    <%--                            </div>--%>
                                    <%--                            <div class="form-group col-md-3">--%>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-group col-md-12">
                        <button class="btn btn-save" type="submit">Lưu lại</button>
                        <%--                        <button class="btn btn-save" formaction="/admin/${nhanVien.maNhanVien}/add-ma-giam-gia" type="submit">Lưu lại</button>--%>
                        <a class="btn btn-cancel" href="/admin/${nhanVien.maNhanVien}/quan-li-ma-giam-gia-san-pham">Hủy
                            bỏ</a>
                        </div>

                    </form>
                </div>


            </div>
        </div>
    </div>
</main>

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

    function AddConfirm(event) {
        event.preventDefault();



        var form = document.getElementById("form-add");
        var formData = new FormData(form);
        // Your form field validations
        var ten = document.getElementById("ten").value;
        var ngayBatDau = new Date(form.querySelector("#ngaybd").value);
        var ngayKetThuc = new Date(form.querySelector("#ngaykt").value);
        var ngaybd = document.getElementById("ngaybd").value;
        var ngaykt = document.getElementById("ngaykt").value;
        var ngayBatDau1 = new Date(form.querySelector("#ngaybd_hd").value);
        var ngayKetThuc1 = new Date(form.querySelector("#ngaykt_hd").value);
        var ngaybd_hd = document.getElementById("ngaybd_hd").value;
        var ngaykt_hd = document.getElementById("ngaykt_hd").value;
        var tigiam = document.getElementById("tigiam").value;
        var soLuongMuaTT = document.getElementById("soLuongMuaTT").value;
        var donGiaMuaTT = document.getElementById("donGiaMuaTT").value;
        var tigiam_hd = document.getElementById("tigiam_hd").value;

        // Add more fields as needed

        if (ten.trim() === "") {
            swal("Lỗi!", "Vui lòng nhập tên mã giảm giá.", "error");
            return;
        }
        // Check if the start date is before the end date
        if (document.getElementById('giamgia_sanpham').style.display === 'block') {
            // Check if the start date is before the end date
            if (ngayBatDau > ngayKetThuc) {
                swal("Lỗi", "Ngày bắt đầu phải trước ngày kết thúc.", "error");
                return; // Stop further execution
            }


            if(!tigiam||!ngaybd||!ngaykt){
                swal("Lỗi!", "Vui lòng điền đầy đủ thông tin.", "error");
                return;
            }
            if (tigiam <= 0) {
                swal("Lỗi", "Phần trăm giảm không hợp lệ.", "error");
                return; // Stop further execution
            }

            if (tigiam >= 100) {
                swal("Lỗi", "Phần trăm giảm không hợp lệ.", "error");
                return; // Stop further execution
            }
            // Check if numeric fields are valid numbers
            if (isNaN(tigiam)) {
                swal("Lỗi!", "Vui lòng nhập giá trị số hợp lệ cho các trường số.", "error");
                return;
            }
        }
        if (document.getElementById('giamgia_hoadon').style.display === 'block') {
            if(!tigiam_hd||!soLuongMuaTT||!donGiaMuaTT||!ngaybd_hd ||!ngaykt_hd){
            swal("Lỗi!", "Vui lòng điền đầy đủ thông tin.", "error");
            return;
        }
            // Check if numeric fields are valid numbers
            if (isNaN(tigiam_hd) || isNaN(soLuongMuaTT) || isNaN(donGiaMuaTT)) {
                swal("Lỗi!", "Vui lòng nhập giá trị số hợp lệ cho các trường số.", "error");
                return;
            }
            if (ngayBatDau1 > ngayKetThuc1) {
                swal("Lỗi", "Ngày bắt đầu phải trước ngày kết thúc.", "error");
                return; // Stop further execution
            }
            if(tigiam_hd <= 0||soLuongMuaTT <= 0||donGiaMuaTT <=0){
                swal("Lỗi!", "Thông tin điền không hợp lệ.", "error");
                return;
            }

            if(tigiam_hd >= 100){
                swal("Lỗi!", "Phần trăm giảm giá không hợp lệ.", "error");
                return;
            }

        }
        // Add more field validations as needed
        swal({
            title: "Cảnh báo",
            text: "Bạn có muốn thêm mã giảm giá này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willUpdate) => {
            if (willUpdate) {
                // Prevent the default form submission behavior
                event.preventDefault();

                fetch('/admin/${nhanVien.maNhanVien}/add-ma-giam-gia', {
                    method: 'POST',
                    body: formData
                })
                    .then(response => {
                        if (response.ok) {
                            swal("Thêm thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/' + ${nhanVien.maNhanVien} +'/ma-giam-gia/add_view';
                            }, 2000);
                        } else {
                            swal("Thêm không thành công!", {
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
    function showGiamGiaSanPham() {
        document.getElementById("giamgia_sanpham").style.display = "block";
        document.getElementById("giamgia_hoadon").style.display = "none";
    }

    function showGiamGiaHoaDon() {
        document.getElementById("giamgia_sanpham").style.display = "none";
        document.getElementById("giamgia_hoadon").style.display = "block";
    }

    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra radio button ban đầu được chọn
        var selectedRadio = document.querySelector('input[name="loai"]:checked');

        // Nếu radio button được chọn là "giamgia_sp", hiển thị phần tử "giamgia_sanpham"
        if (selectedRadio && selectedRadio.value === 'giamgia_sp') {
            showGiamGiaSanPham();
        }

        // Nếu radio button được chọn là "giamgia_hd", hiển thị phần tử "giamgia_hoadon"
        if (selectedRadio && selectedRadio.value === 'giamgia_hd') {
            showGiamGiaHoaDon();
        }
    });
</script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>