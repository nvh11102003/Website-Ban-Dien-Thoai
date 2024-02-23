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
    <link rel="icon" type="image/png" href="../../../../../assets/img/logo/AZURA.png">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
</head>

<div class="app-sidebar__user">
    <img class="app-sidebar__user-avatar" src="../../../../../assets/img/admin/admin.jpg" width="50px"
                                    alt="User Image">
    <div>
        <p class="app-sidebar__user-name"><b>${nhanVien.ten}</b></p>
        <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
    </div>
</div>
<hr>

<!-- Essential javascripts for application to work-->
<script src="../../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
<script src="../../../../../assetsAdmin/js/popper.min.js"></script>
<script src="../../../../../assetsAdmin/js/bootstrap.min.js"></script>
<script src="../../../../../assetsAdmin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../../../../assetsAdmin/js/plugins/pace.min.js"></script>
