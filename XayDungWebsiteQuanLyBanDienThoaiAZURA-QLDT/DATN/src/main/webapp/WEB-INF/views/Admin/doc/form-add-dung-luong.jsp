<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Thêm dung lượng | Quản trị Admin</title>
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
            }
            else { // Sử dụng cho IE
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

    <div class="row">
        <div class="col-md-12">

            <div class="tile">
                <h3 class="tile-title">Tạo mới dung lượng</h3>
                <div class="tile-body">
                    <form class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label">Tên dung lượng</label>
                            <input class="form-control" type="text" id="ten" name="ten" required>
                        </div>
                    </form>
                </div>
                <div>
                    <button class="btn btn-save" type="button" onclick="saveDungLuong()">Lưu lại</button>
                    <a class="btn btn-cancel" href="/admin/${nhanVien.maNhanVien}/quan-li-dung-luong">Hủy bỏ</a>
                </div>
            </div>
        </div>
    </div>
</main>



<jsp:include page="template/footer.jsp"></jsp:include>
</body>
<script src="../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
<script src="../../../../assetsAdmin/js/popper.min.js"></script>
<script src="../../../../assetsAdmin/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="../../../../assetsAdmin/js/main.js"></script>
<script>
    function saveDungLuong() {
        var ten = document.getElementById("ten").value;

        // Check if ten is empty
        if (ten.trim() === "") {
            // Show an error message using SweetAlert
            swal("Lỗi!", "Vui lòng nhập tên dung lượng.", "error");
            return; // Stop the function execution if ten is empty
        }

        // Ask for confirmation before proceeding
        swal({
            title: "Xác nhận",
            text: "Bạn có muốn thêm dung lượng không?",
            icon: "warning",
            buttons: ["Hủy", "Đồng ý"],
            dangerMode: true,
        })
            .then((willAdd) => {
                // Check if ten is empty
                var ten = document.getElementById("ten").value;
                if (willAdd && ten.trim() === "") {
                    // Show an error message using SweetAlert
                    swal("Lỗi!", "Vui lòng nhập tên dung lượng.", "error");
                    return; // Stop the function execution if ten is empty
                }

                if (willAdd) {
                    // User clicked "Đồng ý"
                    let dl = {
                        tenDungLuong: ten,
                        trangThai: 1,
                    };

                    fetch("/dung-luong/them", {
                        method: "POST",
                        body: JSON.stringify(dl),
                        headers: {
                            "Content-type": "application/json; charset=UTF-8",
                        },
                    })
                        .then((res) => res.text())
                        .then((response) => {
                            if (response === "Success") {
                                // Thành công - Hiển thị SweetAlert
                                swal("Thành công!", "Dung lượng đã được thêm thành công.", "success")
                                    .then(() => {
                                        // Sau khi người dùng đóng SweetAlert, chuyển hướng đến trang quản lý dung lượng
                                        window.location.href = '/admin/${nhanVien.maNhanVien}/quan-li-dung-luong';
                                    });
                            } else {
                                swal("Lỗi!", response, "error");
                            }
                        })
                        .catch((error) => {
                            console.error("Error:", error);
                            swal("Lỗi!", "Đã xảy ra lỗi khi thêm dung lượng.", "error");
                        });
                } else {
                    // User clicked "Hủy"
                    swal("Hủy bỏ", "Bạn đã hủy thêm dung lượng.", "info");
                }
            });
    }
</script>
</html>