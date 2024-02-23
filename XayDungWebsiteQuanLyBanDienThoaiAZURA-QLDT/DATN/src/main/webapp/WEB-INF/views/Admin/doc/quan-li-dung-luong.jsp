<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách dung lượng | Quản trị Admin</title>
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
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách dung lượng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">

                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="/admin/${nhanVien.maNhanVien}/add/quan-li-dung-luong"
                               title="Thêm"><i class="fas fa-plus"></i>
                                Tạo mới dung lượng</a>
                        </div>
                    </div>
                </div>
                <div id="divPrint">
                    <h5>Danh sách dung lượng</h5>
                    <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0"
                           border="0"
                           id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>ID dung lượng</th>
                            <th>Tên dung lượng</th>
                            <th>Trạng thái</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${dl}" var="dl">
                            <tr>
                                <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                <td>${dl.maDungLuong}</td>
                                <td>${dl.tenDungLuong}</td>
                                <td><span
                                        class='${dl.trangThai == 1 ? 'badge bg-success' : ' badge bg-danger'}'>${dl.trangThai == 1 ? "Hoạt động" : "Ngừng hoạt động" }</span>
                                </td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                            onclick="return deleteRow(${dl.maDungLuong})"><i
                                            class="fas fa-trash-alt"></i>
                                    </button>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            data-toggle="modal" data-target="#ModalDL"
                                            onclick="editDungLuongModal(this)">
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
    </div>
</main>

<!--
MODAL
-->
<div class="modal fade" id="ModalDL" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chỉnh sửa thông tin dung lượng</h5>
              </span>
                    </div>
                </div>
                <form class="row" id="form-update">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label">Mã Dung Lượng</label>
                            <input class="form-control" type="text" required id="maDungLuong" value="maDungLuong"
                                   name="maDungLuong" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Tên dung lượng</label>
                            <input class="form-control" id="tenDungLuong" type="text" value="tenDungLuong "
                                   name="tenDungLuong">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="trangThai" class="control-label">Trạng thái</label>
                            <select class="form-control" name="trangThai" id="trangThai">
                                <option value="">-- Chọn trạng thái --</option>
                                <option value="1">Hoạt động</option>
                                <option value="0">Ngừng hoạt động</option>

                            </select>
                        </div>
                        <div class="form-group col-md-12" style="align-content: center; margin: auto">
                            <button class="btn btn-save" type="button" onclick="return updateConfirm()">Lưu lại</button>
                            <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                        </div>
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
</script>
<script>

    function deleteRow(maDungLuong) {
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn xóa dung lượng này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willDelete) => {
            if (willDelete) {
                fetch('/dung-luong/sua/' + maDungLuong, {
                    method: 'PUT'
                })
                    .then(response => {
                        if (response.ok) {
                            swal("Xóa thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/' + ${nhanVien.maNhanVien} +'/quan-li-dung-luong';
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
        var maDungLuong = document.getElementById("maDungLuong").value;
        var tenDungLuong = document.getElementById("tenDungLuong").value;
        var trangThai = document.getElementById("trangThai").value;


        // Check if required fields are filled
        if (!maDungLuong || !tenDungLuong || !trangThai) {
            swal("Lỗi!", "Vui lòng điền đầy đủ thông tin.", "error");
            return;
        }

        var form = document.getElementById("form-update");
        var formData = new FormData(form);

        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn là muốn sửa sản phẩm này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willUpdate) => {
            if (willUpdate) {
                fetch('/dung-luong/sua1', {
                    method: 'PUT',
                    body: formData
                })
                    .then((res) => res.text())
                    .then(response => {
                        if (response === "Success") {
                            swal("Sửa thành công!", {
                                icon: "success",
                            });
                            setTimeout(() => {
                                window.location.href = '/admin/' + ${nhanVien.maNhanVien} +'/quan-li-dung-luong';
                            }, 2000);
                        } else {
                            swal(response, {
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


    function editDungLuongModal(button) {
        var row = button.closest("tr");
        var maDungLuong = row.cells[1].innerText;
        var tenDungLuong = row.cells[2].innerText;
        var trangThai = row.cells[3].innerText;

        document.getElementById("maDungLuong").value = maDungLuong;
        document.getElementById("tenDungLuong").value = tenDungLuong;

        var trangThaiSelected = document.getElementById("trangThai");
        for (var i = 0; i < trangThaiSelected.options.length; i++) {
            var option = trangThaiSelected.options[i];
            if (option.text === trangThai) {
                option.selected = true;
                break;
            }
        }
        // var selectElementNSX = document.getElementById("nhaSanXuat");
        // for (var i = 0; i < selectElementNSX.options.length; i++) {
        //   var option = selectElementNSX.options[i];
        //   if (option.text === nhaSanXuat) {
        //     option.selected = true;
        //     break;
        //   }
        // }
        // Mở modal
        // Mở modal
        $('#ModalDL').modal('show');
    }

    <%--function saveDungLuong() {--%>
    <%--    let maDungLuong = document.getElementById("maDungLuong").value;--%>
    <%--    let tenDungLuong = document.getElementById("tenDungLuong").value;--%>
    <%--    let DungLuong = {--%>
    <%--        maDungLuong: maDungLuong,--%>
    <%--        tenDungLuong: tenDungLuong,--%>
    <%--        trangThai: 1--%>
    <%--    }--%>

    <%--    fetch("/admin/" + ${nhanVien.maNhanVien} +" /nhan-vien/sua", {--%>
    <%--        method: "PUT",--%>
    <%--        body: JSON.stringify(DungLuong),--%>
    <%--        headers: {--%>
    <%--            "Content-type": "application/json; charset=UTF-8"--%>
    <%--        }--%>
    <%--    }).then((res) => window.location.href = '/admin/quan-li-dung-luong');--%>
    <%--}--%>


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

    //In dữ liệu
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });

    //Modal
    $("#show-emp").on("click", function () {
        $("#ModalUP").modal({backdrop: false, keyboard: false})
    });
</script>
<script type="text/javascript">
    $("#pdfBtn").on("click", function () {
        var divContents = $("#divPrint").html();
        var printWindow = window.open('', '', 'height=400,width=800');
        printWindow.document.write('<html><head><title></title>');
        printWindow.document.write('</head><body >');
        printWindow.document.write(divContents);
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.print();
    });

    //export excel
    $(document).ready(function () {
        $("#exportExcel").click(function (e) {
            e.preventDefault();

            // Gọi API để tải xuống Excel
            fetch('/admin/nhan-vien/download-result', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(), // Sử dụng dữ liệu từ đối tượng request
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.blob();
                })
                .then(blob => {
                    // Tạo đường dẫn URL từ Blob và tải xuống file
                    var link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.download = "template_export_nhan_vien.xls";
                    link.click();
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>