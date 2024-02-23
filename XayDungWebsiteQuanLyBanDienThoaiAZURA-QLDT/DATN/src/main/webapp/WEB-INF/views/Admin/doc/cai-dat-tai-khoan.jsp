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

    .input-group {
        display: flex;
        align-items: center; /* Canh giữa theo chiều dọc */
    }

    .input-group-append {
        cursor: pointer;
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
            <li class="breadcrumb-item"><a href="#">Cài đặt tài khoản</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">

            <div class="tile">
                <div class="tile-body">
                    <form class="row">
                        <div class="form-group col-md-4">
                            <label class="control-label">Tên</label>
                            <input class="form-control" type="text" id="ten" name="ten" required value="${nhanVien.ten}"
                                   readonly>
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số điện thoại</label>
                            <input class="form-control" id="sdt-nv" type="text" required value="${nhanVien.sdt}"
                                   readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Địa chỉ email</label>
                            <input class="form-control" id="email" type="text" required value="${nhanVien.email}"
                                   readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Ngày sinh</label>
                            <input class="form-control" id="ngaySinh" type="date" required value="${nhanVien.ngaySinh}"
                                   readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Số CCCD</label>
                            <input class="form-control" id="cccd" type="text" required value="${nhanVien.cccd}"
                                   readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Mật khẩu</label>
                            <div class="input-group">
                                <input class="form-control" type="password" required id="passwordField113" minlength="6" value="${nhanVien.matKhau}">
                                <div class="input-group-append">
                                    <span class="input-group-text toggle-password"
                                          onclick="togglePassword('passwordField113', 'toggleIcon113')">
                                        <i class="fas fa-eye" id="toggleIcon113"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <a class="btn btn-edit btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><b><i
                        class="fas fa-folder-plus"></i> Đổi mật khẩu</b></a>
            </div>
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
                <form >
                    <div class="row">
                        <div class="form-group  col-md-12">
                          <span class="thong-tin-thanh-toan">
                            <h5>Đổi mật khẩu</h5>
                          </span>
                        </div>

                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập mật khẩu hiện tại <span
                                    style="color: red;">*</span></label>
                            <div class="input-group">
                                <input class="form-control" type="password" required id="passwordField" minlength="6">
                                <div class="input-group-append">
                                    <span class="input-group-text toggle-password"
                                          onclick="togglePassword('passwordField', 'toggleIcon1')">
                                        <i class="fas fa-eye" id="toggleIcon1"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <span id="passwordCheckCu" style="color: red;"></span>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mật khẩu mới <span style="color: red;">*</span></label>
                            <div class="input-group">
                                <input class="form-control" type="password" required id="matKhau" minlength="6">
                                <div class="input-group-append">
                                    <span class="input-group-text toggle-password"
                                          onclick="togglePassword('matKhau', 'toggleIcon12')">
                                        <i class="fas fa-eye" id="toggleIcon12"></i>
                                    </span>
                                </div>
                            </div>
                            <span id="passwordDuplicateCu" style="color: red;"></span>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập lại mật khẩu mới <span
                                    style="color: red;">*</span></label>
                            <div class="input-group">
                                <input class="form-control" type="password" id="confirmPassword" name="confirmMatKhau"
                                       minlength="6">
                                <div class="input-group-append">
                                    <span class="input-group-text toggle-password"
                                          onclick="togglePassword('confirmPassword', 'toggleIcon123')">
                                        <i class="fas fa-eye" id="toggleIcon123"></i>
                                    </span>
                                </div>
                            </div>
                            <span id="passwordMismatchAlert" style="color: red;"></span>
                        </div>
                    </div>
                    <BR>
                    <button class="btn btn-save" type="button" onclick="return validatePasswordMatch(${nhanVien.matKhau}, ${nhanVien.maNhanVien})">Lưu lại</button>
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                    <BR>
                </form>
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
    function togglePassword(fieldId, iconId) {
        var passwordField = document.getElementById(fieldId);
        var toggleIcon = document.getElementById(iconId);

        if (passwordField.type === "password") {
            passwordField.type = "text";
            toggleIcon.classList.remove("fa-eye");
            toggleIcon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            toggleIcon.classList.remove("fa-eye-slash");
            toggleIcon.classList.add("fa-eye");
        }
    }

    function validatePasswordMatch(passwordCu, id) {
        var passCu = parseInt(document.getElementById('passwordField').value);
        var password = document.getElementById('matKhau').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
        var alertSpan = document.getElementById('passwordMismatchAlert');
        var alertSpanCheckCu = document.getElementById('passwordCheckCu');
        var alertPasswordDuplicateCu = document.getElementById('passwordDuplicateCu');

        if(password === passCu){
            alertPasswordDuplicateCu.textContent = 'Mật khẩu mới không được trùng với mật khẩu cũ!';
            return false;
        }
        if (passCu !== passwordCu) {
            alertSpanCheckCu.textContent = 'Mật khẩu không đúng!';
            return false;
        }else {
            if (password !== confirmPassword) {
                alertSpan.textContent = 'Mật khẩu không khớp! Vui lòng nhập lại.';
                return false;
            }
            $.ajax({
                type: 'PUT',
                url: '/admin/nhan-vien/update-password/' + id,
                data: {matKhau: password},
                success: function (response) {
                    swal("Sửa thành công!", {
                        icon: "success",
                    });
                    setTimeout(() => {
                        window.location.href = '/admin/'+${nhanVien.maNhanVien}+'/cai-dat';
                    }, 1000);
                },
                error: function (error) {
                    swal("Sửa không thành công!", {
                        icon: "error",
                    });
                    return false;
                }
            });
        }
    }
</script>
</html>