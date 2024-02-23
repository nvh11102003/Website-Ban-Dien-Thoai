<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Danh sách màu sắc | Quản trị Admin</title>
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
        <li class="breadcrumb-item active"><a href="#"><b>Danh sách màu sắc</b></a></li>
      </ul>
      <div id="clock"></div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="tile">
          <div class="tile-body">

            <div class="row element-button">
              <div class="col-sm-2">

                <a class="btn btn-add btn-sm" href="/admin/${nhanVien.maNhanVien}/add/quan-li-mau-sac" title="Thêm"><i class="fas fa-plus"></i>
                  Tạo mới màu sắc</a>
              </div>
            </div>
            <div id="divPrint">
            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
              id="sampleTable">
              <thead>
                <tr>
                  <th width="10"><input type="checkbox" id="all"></th>
                  <th>ID màu sắc</th>
                  <th>Tên màu sắc</th>
                  <th>Trạng thái</th>
                  <th>Tính năng</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${listMauSac}" var="mauSac">
                <tr>
                  <td width="10"><input type="checkbox" name="check1" value="1"></td>
                  <td>${mauSac.maMauSac}</td>
                  <td>${mauSac.tenMauSac}</td>
                  <td><span class='${mauSac.trangThai == 1 ? 'badge bg-success' : ' badge bg-danger'}'>${mauSac.trangThai == 1? "Hoạt động": "Ngừng hoạt động"}</span></td>
                  <td>
                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                            onclick="return deleteRow(${mauSac.maMauSac})"><i
                            class="fas fa-trash-alt"></i>
                    </button>
                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                            data-toggle="modal" data-target="#ModalNVUP" onclick="editMauSac(this)">
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
                <h5>Thông tin màu sắc cơ bản</h5>
              </span>
            </div>
          </div>
          <form class="row" id="form-update">
            <div class="form-group col-md-6">
              <label class="control-label">ID màu</label>
              <input class="form-control" id="maMau" name="maMauSac" type="text" required value="" readonly>
            </div>
            <div class="form-group col-md-6">
              <label class="control-label">Tên màu *</label>
              <input class="form-control" id="ten" name="tenMauSac" type="text" required value="">
            </div>
            <div class="form-group col-md-6">
              <label for="trangThai" class="control-label">Trạng thái</label>
              <select class="form-control" name="trangThai" id="trangThai">
                <option value="">-- Chọn trạng thái --</option>
                <option value="1">Hoạt động</option>
                <option value="0">Ngừng hoạt động</option>

              </select>
            </div>
            <div class="col-12">
              <div class="row">
                <div class="col-2">
                  <button class="btn btn-save" type="button" onclick="return updateConfirm()">Lưu lại</button>
                </div>
                <div class="col-2">
                  <a class="btn btn-cancel" href="/admin/${nhanVien.maNhanVien}/quan-li-mau-sac">Hủy bỏ</a>
                </div>
              </div>
            </div>
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
  <script type="text/javascript">$('#sampleTable').DataTable();</script>
  <script>

    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
      $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
      e.stopImmediatePropagation();
    });
    function deleteRow(maMauSac) {
      swal({
        title: "Cảnh báo",
        text: "Bạn có chắc chắn là muốn xóa màu này?",
        buttons: ["Hủy bỏ", "Đồng ý"],
      }).then((willDelete) => {
        if (willDelete) {
          fetch('/mau-sac/xoa/' + maMauSac, {
            method: 'DELETE'
          })
                  .then(response => {
                    if (response.ok) {
                      swal("Xóa thành công!", {
                        icon: "success",
                      });
                      setTimeout(() => {
                        window.location.href = '/admin/${nhanVien.maNhanVien}/quan-li-mau-sac';
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

    function editMauSac(button) {
      var row = button.closest("tr");
      var maMauSac = row.cells[1].innerText;
      var ten = row.cells[2].innerText;
      var trangThai = row.cells[3].innerText;
      document.getElementById("maMau").value = maMauSac;
      document.getElementById("ten").value = ten;
      var trangThaiSelected = document.getElementById("trangThai");
      for (var i = 0; i < trangThaiSelected.options.length; i++) {
        var option = trangThaiSelected.options[i];
        if (option.text === trangThai) {
          option.selected = true;
          break;
        }
      }
    }

    <%--$("#edit-mau").on("submit", saveMauSac)--%>

    <%--function saveMauSac(e) {--%>
    <%--  e.preventDefault();--%>
    <%--  let maMau = document.getElementById("maMau").value;--%>
    <%--  let ten = document.getElementById("ten").value;--%>
    <%--  let trangThai = document.getElementById("trangThai").value;--%>

    <%--  let mauSac = {--%>
    <%--    maMauSac: maMau,--%>
    <%--    tenMauSac: ten,--%>
    <%--    trangThai: trangThai,--%>
    <%--  }--%>

    <%--  fetch("/mau-sac/sua", {--%>
    <%--    method: "PUT",--%>
    <%--    body: JSON.stringify(mauSac),--%>

    <%--    headers: {--%>
    <%--      "Content-type": "application/json; charset=UTF-8"--%>
    <%--    }--%>
    <%--  }).then((res) => window.location.href = '/admin/${nhanVien.maNhanVien}/quan-li-mau-sac');--%>
    <%--}--%>
    function updateConfirm() {

      var mauMau = document.getElementById("maMau").value;
      var ten = document.getElementById("ten").value;
      var trangThai = document.getElementById("trangThai").value;


      // Check if required fields are filled
      if (!mauMau || !ten || !trangThai) {
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
          fetch('/mau-sac/sua', {
            method: 'PUT',
            body: formData,
          })
                  .then((res) => res.text())
                  .then(response => {
                    if (response === "Success") {
                      swal("Sửa thành công!", {
                        icon: "success",
                      });
                      setTimeout(() => {
                        window.location.href = '/admin/' + ${nhanVien.maNhanVien} +'/quan-li-mau-sac';
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