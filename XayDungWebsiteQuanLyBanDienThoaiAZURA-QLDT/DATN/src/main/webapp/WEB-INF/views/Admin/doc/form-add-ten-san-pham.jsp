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
            <li class="breadcrumb-item"><a href="#">Thêm tên sản phẩm</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới tên sản phẩm</h3>
                <div class="tile-body">
                    <form class="row" id="form-add" onsubmit="AddConfirm(event)" enctype="multipart/form-data">
                        <div class="form-group col-md-3">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" name="tenSanPham">
                        </div>
                       <div class="form-group col-md-3">
                            <label class="control-label">Dung lượng pin(mAh)</label>
                            <input class="form-control" type="number" name="dungLuongPin">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Màn hình</label>
                            <input class="form-control" type="text" name="manHinh">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Hệ điều hành</label>
                            <input class="form-control" type="text" name="heDieuHanh">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Ram</label>
                            <input class="form-control" type="text" name="ram">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Camera Trước</label>
                            <input class="form-control" type="text" name="cameratruoc">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Camera Sau</label>
                            <input class="form-control" type="text" name="camerasau">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Sim</label>
                            <input class="form-control" type="text" name="sim">
                        </div>
                        <button class="btn btn-save" type="submit">Lưu lại</button>
                        <a class="btn btn-cancel" href="/admin/${nhanVien.maNhanVien}/quan-li-san-pham">Hủy bỏ</a>
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
                fetch('/admin/chi-tiet-san-pham/addSanPham', {
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