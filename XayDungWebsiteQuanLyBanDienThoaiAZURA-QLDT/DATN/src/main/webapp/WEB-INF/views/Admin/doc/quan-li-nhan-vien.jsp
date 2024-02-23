<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Danh sách nhân viên | Quản trị Admin</title>
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
        <li class="breadcrumb-item active"><a href="#"><b>Danh sách nhân viên</b></a></li>
      </ul>
      <div id="clock"></div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="tile">
          <div class="tile-body">

            <div class="row element-button">
              <div class="col-sm-2">

                <a class="btn btn-add btn-sm" href="/admin/${nhanVien.maNhanVien}/add/quan-li-nhan-vien" title="Thêm"><i class="fas fa-plus"></i>
                  Tạo mới nhân viên</a>
              </div>
              <div class="col-sm-2">
                <a class="btn btn-excel btn-sm" href="" title="In" id="exportExcel"><i class="fas fa-file-excel"></i> Xuất Excel</a>
              </div>
            </div>
            <div id="divPrint">
            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
              id="sampleTable">
              <thead>
                <tr>
                  <th style="display: none"></th>
                  <th>ID nhân viên</th>
                  <th>Tên nhân viên</th>
                  <th>Email</th>
                  <th>Địa chỉ</th>
                  <th>SĐT</th>
                  <th>Ngày sinh</th>
                  <th>CCCD</th>
                  <th>Chức vụ</th>
                  <th>Trạng thái</th>
                  <th>Tính năng</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${nhanVienList}" var="nhanVien">
                <tr>
                  <td style="display: none"></td>
                  <td>${nhanVien.maNhanVien}</td>
                  <td>${nhanVien.ten}</td>
                  <td>${nhanVien.email}</td>
                  <td>${nhanVien.diaChi}</td>
                  <td>${nhanVien.sdt}</td>
                  <td>${nhanVien.ngaySinh}</td>
                  <td>${nhanVien.cccd}</td>
                  <td>${nhanVien.chucVu.tenChucVu}</td>
                  <td><span class='${nhanVien.trangThai == 1 ? 'badge bg-success' : ' badge bg-danger'}'>${nhanVien.trangThai == 1? "Đang làm việc": "Nghỉ việc"}</span></td>
                  <td>
                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                            onclick="return deleteRow(${nhanVien.maNhanVien})"><i
                            class="fas fa-trash-alt"></i>
                    </button>
                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                            data-toggle="modal" data-target="#ModalNVUP" onclick="editNhanVienModal(this)">
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
  <div class="modal fade" id="ModalNVUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
    data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body">
          <div class="row">
            <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thông tin nhân viên cơ bản</h5>
              </span>
            </div>
          </div>
          <form class="row" id="edit-nv">
            <div class="form-group col-md-6">
              <label class="control-label">ID nhân viên</label>
              <input class="form-control" id="maNV" type="text" required value="" disabled>
            </div>
            <div class="form-group col-md-6">
              <label class="control-label">Tên nhân viên *</label>
              <input class="form-control" id="ten" type="text" required value="">
            </div>
            <div class="form-group  col-md-6">
              <label class="control-label">Số điện thoại *</label>
              <input class="form-control" id="sdt-nv" type="text" required value="">
            </div>
            <div class="form-group col-md-6">
              <label class="control-label">Địa chỉ email *</label>
              <input class="form-control" id="email" type="email" required value="">
            </div>
            <div class="form-group col-md-6">
              <label class="control-label">Địa chỉ *</label>
              <input class="form-control" id="dia-chi" type="text" required value="">
            </div>
            <div class="form-group col-md-6">
              <label class="control-label">Ngày sinh *</label>
              <input class="form-control" id="ngaySinh" type="date" required value="">
            </div>
            <div class="form-group col-md-6">
              <label class="control-label">CCCD *</label>
              <input class="form-control" id="cccd" type="number" required value="">
            </div>
<%--            <div class="form-group  col-md-6">--%>
<%--              <label for="chucvu" class="control-label">Chức vụ *</label>--%>
<%--              <select class="form-control" id="chucvu" readonly>--%>
<%--                <c:forEach items="${listChucVu}" var="chucVu">--%>
<%--                  <option value="${chucVu.maChucVu}">${chucVu.tenChucVu}</option>--%>
<%--                </c:forEach>--%>
<%--              </select>--%>
<%--            </div>--%>
            <div class="col-12">
              <div class="row">
                <div class="col-2">
                  <button class="btn btn-save" type="submit">Lưu lại</button>
                </div>
                <div class="col-2">
                  <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                </div>
              </div>
            </div>
          </form>
          <BR>
          <BR>

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
  <script type="text/javascript">$('#sampleTable').DataTable();</script>
  <script>

    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
      $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
      e.stopImmediatePropagation();
    });
    function deleteRow(maNhanVien) {
      swal({
        title: "Cảnh báo",
        text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
        buttons: ["Hủy bỏ", "Đồng ý"],
      }).then((willDelete) => {
        if (willDelete) {
          fetch('/admin/nhan-vien/xoa/' + maNhanVien, {
            method: 'DELETE'
          })
                  .then(response => {
                    if (response.ok) {
                      swal("Xóa thành công!", {
                        icon: "success",
                      });
                      setTimeout(() => {
                        window.location.href = '/admin/${nhanVien.maNhanVien}/quan-li-nhan-vien';
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

    $("#edit-nv").on("submit", saveNhanVien);

    function editNhanVienModal(button) {
      var row = button.closest("tr");
      var maNV = row.cells[1].innerText;
      var ten = row.cells[2].innerText;
      var email = row.cells[3].innerText;
      var diaChi = row.cells[4].innerText;
      var sdt = row.cells[5].innerText;
      var ngaySinh = row.cells[6].innerText;
      var cccd = row.cells[7].innerText;

      document.getElementById("maNV").value = maNV;
      document.getElementById("ten").value = ten;
      document.getElementById("email").value = email;
      document.getElementById("dia-chi").value = diaChi;
      document.getElementById("sdt-nv").value = sdt;
      document.getElementById("ngaySinh").value = ngaySinh;
      document.getElementById("cccd").value = cccd;

      // var selectElementNSX = document.getElementById("nhaSanXuat");
      // for (var i = 0; i < selectElementNSX.options.length; i++) {
      //   var option = selectElementNSX.options[i];
      //   if (option.text === nhaSanXuat) {
      //     option.selected = true;
      //     break;
      //   }
      // }
      // Mở modal
    }

    function saveNhanVien(e) {
      e.preventDefault();
      let maNV = document.getElementById("maNV").value;
      let ten = document.getElementById("ten").value;
      let email = document.getElementById("email").value;
      let diaChi = document.getElementById("dia-chi").value;
      let sdt = document.getElementById("sdt-nv").value;
      let chucVu = $("#chucvu").val();
      let cccd = document.getElementById("cccd").value;
      let ngaySinh = document.getElementById("ngaySinh").value;

      let nhanVien = {
        maNhanVien: maNV,
        ten: ten,
        email: email,
        sdt: sdt,
        diaChi: diaChi,
        maChucVu: chucVu,
        trangThai: 1,
        cccd: cccd,
        ngaySinh: ngaySinh
      }

      fetch("/admin/nhan-vien/sua", {
        method: "PUT",
        body: JSON.stringify(nhanVien),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        }
      }).then((res) => window.location.href = '/admin/${nhanVien.maNhanVien}/quan-li-nhan-vien');
    }


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
    var myApp = new function () {
      this.printTable = function () {
        var tab = document.getElementById('sampleTable');
        var win = window.open('', '', 'height=700,width=700');
        win.document.write(tab.outerHTML);
        win.document.close();
        win.print();
      }
    }

    //Modal
    $("#show-emp").on("click", function () {
      $("#ModalUP").modal({ backdrop: false, keyboard: false })
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
  <jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>