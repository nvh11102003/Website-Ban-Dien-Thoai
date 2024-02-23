<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang Quản Trị </title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../../../../assetsAdmin/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <style>
        .hidden {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out;
        }
        .visible {
            max-height: 1000px;
            transition: max-height 0.3s ease-in;
        }
    </style>
    <style>
        .app-menu__item12 {
            background: rgb(50, 205, 250);
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            border-radius: .375rem;
            margin-bottom: 10px;
            padding: 15px 15px;
            font-size: 1.08em;
            border-left: 0px;
            box-shadow: none;
            -webkit-transition: border-left-color 0.3s ease, background-color 0.3s ease;
            -o-transition: border-left-color 0.3s ease, background-color 0.3s ease;
            transition: border-left-color 0.3s ease, background-color 0.3s ease;
            color: white;
            border: 1px solid transparent;
            /* border-bottom: 1px solid #ddd; */
        }

        .app-menu__item12.active, .app-menu__item12:hover, .app-menu__item12:focus {
            background: #c6defd;
            text-decoration: none;
            color: rgb(22 22 72);
            box-shadow: none;
            border: 1px solid rgb(22 22 72);
        }
        .sidebar-mini.sidenav-toggled .app-menu__item12 {
            overflow: hidden;
            width: 50px;
        }

        .sidebar-mini.sidenav-toggled .app-menu__item12:hover .app-menu__label {
            opacity: 1;
        }
        .sidebar-mini.sidenav-toggled .app-menu__item12:hover + .treeview-menu {
            visibility: visible;
        }
        .li.ul.nav-item::marker{
            color: rgb(50, 205, 250);
        }
    </style>
    <style>
        .app-menu__item123 {
            background: rgb(50, 205, 250);
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            border-radius: .375rem;
            margin-bottom: 10px;
            padding: 15px 15px;
            font-size: 1.08em;
            border-left: 0px;
            box-shadow: none;
            -webkit-transition: border-left-color 0.3s ease, background-color 0.3s ease;
            -o-transition: border-left-color 0.3s ease, background-color 0.3s ease;
            transition: border-left-color 0.3s ease, background-color 0.3s ease;
            color: white;
            border: 1px solid transparent;
            /* border-bottom: 1px solid #ddd; */
        }

        .app-menu__item123.active, .app-menu__item123:hover, .app-menu__item123:focus {
            background: #c6defd;
            text-decoration: none;
            color: rgb(22 22 72);
            box-shadow: none;
            border: 1px solid rgb(22 22 72);
        }
        .sidebar-mini.sidenav-toggled .app-menu__item123 {
            overflow: hidden;
            width: 50px;
        }

        .sidebar-mini.sidenav-toggled .app-menu__item123:hover .app-menu__label {
            opacity: 1;
        }
        .sidebar-mini.sidenav-toggled .app-menu__item123:hover + .treeview-menu {
            visibility: visible;
        }
        .li.ul.nav-item::marker{
            color: rgb(50, 205, 250);
        }
    </style>
</head>
<script>
    function toggleSubMenu() {
        var submenu = document.getElementById('submenu');
        submenu.classList.toggle('visible');
    }
</script>
<script>
    function toggleSubMenu1() {
        var submenu1 = document.getElementById('submenu1');
        submenu1.classList.toggle('visible');
    }
</script>
<hr>
<ul class="app-menu">
    <li><a class="app-menu__item haha" href="/admin/${nhanVien.maNhanVien}/pos_banHang"><i
            class='app-menu__icon bx bx-cart-alt' id="banHang"></i>
        <span class="app-menu__label">POS Bán Hàng</span></a></li>
    <!-- <li><a class="app-menu__item " href="index.html"><i class='app-menu__icon bx bx-tachometer'></i><span
    class="app-menu__label">Bảng điều khiển</span></a></li> -->
    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/quan-li-nhan-vien" id="nhanVien"><i
            class='app-menu__icon bx bx-id-card'></i>
        <span class="app-menu__label">Quản lý nhân viên</span></a></li>
    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/quan-li-khach-hang" id="khachHang"><i
            class='app-menu__icon bx bx-user-voice'></i><span
            class="app-menu__label">Quản lý khách hàng</span></a></li>

    <li onclick="toggleSubMenu()">
        <a class="app-menu__item12"><i
                class='app-menu__icon bx bx-calendar-check'></i><span
                class="app-menu__label">Quản lý danh mục</span></a>
        <ul id="submenu"  class="app-menu hidden">
            <li class="nav-item" ><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/quan-li-nsx" id="sanPham1"><i
                    class='app-menu__icon'></i><span class="app-menu__label">Quản lý nhà sản xuất</span></a>
            </li>

            <li class="nav-item"><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/quan-li-mau-sac" id="mauSac"><i
                    class='app-menu__icon'></i><span class="app-menu__label">Quản lý màu sắc</span></a>
            </li>

            <li class="nav-item"><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/quan-li-dung-luong" id="sanPham3"><i
                    class='app-menu__icon'></i><span class="app-menu__label">Quản lý dung lượng</span></a>
            </li>

            <li class="nav-item"><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/quan-li-chip" id="sanPham4"><i
                    class='app-menu__icon'></i><span class="app-menu__label">Quản lý chip</span></a>
            </li>
        </ul>
    </li>

    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/quan-li-san-pham" id="sanPham"><i
            class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Quản lý chi tiết sản
            phẩm</span></a>
    </li>
    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/quan-li-ten-san-pham" id="tenSanPham"><i
            class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Quản lý sản
            phẩm</span></a>
    </li>
    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/quan-li-hoa-don" id="hoaDon"><i
            class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý hóa đơn</span></a></li>
    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/san-pham-bao-hanh" id="sanPhamBaoHanh"><i
            class='app-menu__icon bx bx-key'></i><span class="app-menu__label">Quản lý Sản phẩm bảo hành</span></a>
    </li>
    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/thong-ke" id="thongKe"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">
                        Thống kê</span></a>
    </li>
    <li onclick="toggleSubMenu1()">
        <a class="app-menu__item123"><i
                class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Quản lý giảm giá</span></a>
        <ul id="submenu1"  class="app-menu hidden">
            <li class="nav-item"><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/ma-giam-gia/add_view" ><i
                    class='app-menu__icon'></i><span class="app-menu__label">Thêm mã giảm giá</span></a>
            </li>
            <li class="nav-item"><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/add-giam-gia-cho-SP" ><i
                    class='app-menu__icon'></i><span class="app-menu__label">Gán mã giảm giá</span></a>
            </li>
            <li><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/quan-li-ma-giam-gia-san-pham" ><i
                    class='app-menu__icon'></i><span class="app-menu__label">Giảm giá sản phẩm</span></a>
            </li>

            <li><a class="app-menu__item bx bx-purchase-tag-alt" href="/admin/${nhanVien.maNhanVien}/quan-li-ma-giam-gia-hoa-don" ><i
                    class='app-menu__icon'></i><span class="app-menu__label">Giảm giá hóa đơn</span></a>
            </li>
        </ul>
    </li>
    <li><a class="app-menu__item" href="/admin/${nhanVien.maNhanVien}/cai-dat"><i class='app-menu__icon bx bx-cog'></i><span
            class="app-menu__label">Cài đặt tài khoản</span></a></li>
</ul>

<!-- Essential javascripts for application to work-->
<script src="../../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
<script src="../../../../../assetsAdmin/js/popper.min.js"></script>
<script src="../../../../../assetsAdmin/js/bootstrap.min.js"></script>
<script src="../../../../../assetsAdmin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../../../../assetsAdmin/js/plugins/pace.min.js"></script>
