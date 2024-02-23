<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Thêm nhân viên | Quản trị Admin</title>
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
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="icon" type="image/png" href="../../../../../assets/img/logo/AZURA.png">

    <script>

        function readURL(input, thumbimage) {
            if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#thumbimage").attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            } else { // Sử dụng cho IE
                $("#thumbimage").attr('src', input.value);

            }
            $("#thumbimage").show();
            $('.filename').text($("#uploadfile").val());
            $('.Choicefile').css('background', '#14142B');
            $('.Choicefile').css('cursor', 'default');
            $(".removeimg").show();
            $(".Choicefile").unbind('click');

        }

        $(document).ready(function () {
            $(".Choicefile").bind('click', function () {
                $("#uploadfile").click();

            });
            $(".removeimg").click(function () {
                $("#thumbimage").attr('src', '').hide();
                $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                $(".removeimg").hide();
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();
                });
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'pointer');
                $(".filename").text("");
            });
        })
    </script>
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
            <li class="breadcrumb-item">Danh sách nhân viên</li>
            <li class="breadcrumb-item"><a href="#">Thêm nhân viên</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">

            <div class="tile">

                <h3 class="tile-title">Tạo mới nhân viên</h3>
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><b><i
                                    class="fas fa-folder-plus"></i> Tạo chức vụ mới</b></a>
                        </div>
                    </div>
                    <form class="row">
                        <div class="form-group col-md-4">
                            <label class="control-label">ID nhân viên</label>
                            <input class="form-control" type="text" name="maNV" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Tên *</label>
                            <input class="form-control" type="text" id="ten" name="ten" required>
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số điện thoại *</label>
                            <input class="form-control" id="sdt-nv" type="text" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Địa chỉ email *</label>
                            <input class="form-control" id="email" type="email" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Địa chỉ *</label>
                            <input class="form-control" id="dia-chi" type="text" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">CCCD *</label>
                            <input class="form-control" id="cccd" type="number" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Ngày Sinh *</label>
                            <input class="form-control" id="ngaySinh" type="date" required>
                        </div>
                        <div class="form-group  col-md-3">
                            <label for="chucvu" class="control-label">Chức vụ *</label>
                            <select class="form-control" id="chucvu">
                                <c:forEach items="${listChucVu}" var="chucVu">
                                    <c:if test="${chucVu.tenChucVu != 'Khách Hàng'}">
                                        <option value="${chucVu.maChucVu}">${chucVu.tenChucVu}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-12">
                            <div class="row">
                                <div class="col-2">
                                    <button class="btn btn-save" type="button" onclick="saveNhanVien()"> Lưu lại
                                    </button>
                                </div>
                                <div class="col-2">
                                    <a class="btn btn-cancel" href="/admin/${nhanVien.maNhanVien}/quan-li-nhan-vien">Hủy
                                        bỏ</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>

</main>


<!--
MODAL
-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Tạo chức vụ mới</h5>
              </span>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Nhập tên chức vụ mới</label>
                        <input class="form-control" type="text" required>
                    </div>
                </div>
                <BR>
                <button class="btn btn-save" type="button">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
<script src="../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
<script src="../../../../assetsAdmin/js/popper.min.js"></script>
<script src="../../../../assetsAdmin/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="../../../../assetsAdmin/js/main.js"></script>
<script>
    function saveNhanVien() {

        let ten = document.getElementById("ten").value;
        let email = document.getElementById("email").value;
        let diaChi = document.getElementById("dia-chi").value;
        let sdt = document.getElementById("sdt-nv").value;
        let chucVu = document.getElementById("chucvu").value;
        let cccd = document.getElementById("cccd").value;
        // let ngaySinh = new Date($("#ngaySinh").value); // Convert to Date object
        // Validation checks
        let ngaySinh = document.getElementById("ngaySinh").value;
        if (!ten.trim() || !email || !diaChi || !sdt || !cccd || !ngaySinh) {
            swal("Lỗi!", "Vui lòng điền đầy đủ thông tin.", "error");
            return;
        }

        // Validate phone number
        if (!/^\d{10}$/.test(sdt)) {
            swal("Lỗi!", "Số điện thoại không hợp lệ.", "error");
            return;
        }

        // Validate email
        // Validate email format and domain
        if (!/^\S+@fpt\.edu\.vn$/.test(email) && !/^\S+@gmail\.com$/.test(email)) {
            swal("Lỗi!", "Email không hợp lệ. Vui lòng sử dụng địa chỉ @fpt.edu.vn hoặc @gmail.com.", "error");
            return;
        }


        // Validate Ngày Sinh and CCCD (Căn Cước Công Dân) here
// Validate CCCD (Citizen Identity Card Number) length
        if (cccd.length !== 12 || isNaN(cccd)) {
            swal("Lỗi!", "CCCD phải chứa đúng 12 chữ số.", "error");
            return;
        }

        let currentDate = new Date(); // Current date
        let enteredDate = new Date(ngaySinh); // Convert input date to Date object
        // Compare birthdate with the current date
        if (enteredDate > currentDate) {
            swal("Lỗi!", "Ngày sinh không thể là ngày trong tương lai.", "error");
            return;
        }


        // Confirmation dialog
        swal({
            title: "Xác nhận",
            text: "Bạn có muốn thêm nhân viên này?",
            icon: "info",
            buttons: ["Hủy bỏ", "Đồng ý"],
            dangerMode: false,
        }).then((willAdd) => {
            if (willAdd) {
                // Proceed with fetch request if user confirms
                let nhanVien = {
                    ten: ten,
                    email: email,
                    sdt: sdt,
                    diaChi: diaChi,
                    maChucVu: chucVu,
                    trangThai: 1,
                    cccd: cccd,
                    ngaySinh: ngaySinh
                }

                fetch("/admin/nhan-vien/them", {
                    method: "POST",
                    body: JSON.stringify({
                        ten: ten,
                        email: email,
                        sdt: sdt,
                        diaChi: diaChi,
                        maChucVu: chucVu,
                        trangThai: 1,
                        cccd: cccd,
                        ngaySinh: ngaySinh
                    }),
                    headers: {
                        "Content-type": "application/json; charset=UTF-8"
                    }
                })
                    .then((res) => {
                        if (res.ok) {
                            // Success - Display success message
                            swal("Thành công!", "Nhân viên đã được thêm thành công.", "success")
                                .then(() => {
                                    // Redirect to the employee management page
                                    window.location.href = '/admin/${nhanVien.maNhanVien}/quan-li-nhan-vien';
                                });
                        } else {
                            // Handle other response statuses if needed
                            swal("Lỗi!", "Đã xảy ra lỗi khi thêm nhân viên.", "error");
                        }
                    })
                    .catch((error) => {
                        // Handle fetch error
                        console.error("Error:", error);
                        swal("Lỗi!", "Đã xảy ra lỗi khi thêm nhân viên.", "error");
                    });
            }
        });
    }

</script>
</html>