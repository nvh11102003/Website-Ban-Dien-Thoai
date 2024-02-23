<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
    <title></title>
</head>

<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="text-center">Mật khẩu mới của bạn đã được gửi qua Email</h1>
            <h2 class="text-center">Cảm ơn</h2>
            <form>
                <div class="text-center mb-3">
                    <svg width="64px" height="64px" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"
                         fill="#000000">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                            <defs>
                                <style>
                                    .cls-1 {
                                        fill: #699f4c;
                                        fill-rule: evenodd;
                                    }
                                </style>
                            </defs>
                            <path class="cls-1"
                                  d="M800,510a30,30,0,1,1,30-30A30,30,0,0,1,800,510Zm-16.986-23.235a3.484,3.484,0,0,1,0-4.9l1.766-1.756a3.185,3.185,0,0,1,4.574.051l3.12,3.237a1.592,1.592,0,0,0,2.311,0l15.9-16.39a3.187,3.187,0,0,1,4.6-.027L817,468.714a3.482,3.482,0,0,1,0,4.846l-21.109,21.451a3.185,3.185,0,0,1-4.552.03Z"
                                  id="check" transform="translate(-770 -450)"></path>
                        </g>
                    </svg>
                </div>

                <%--                    <div class="mb-3 text-center">--%>
                <%--                        <a href="/update-hoa-don/${makhachhang}" class="btn btn-primary"> Về trang chủ</a>--%>
                <%--                    </div>--%>
                <div class="mb-3 text-center">
                    <a href="/loginView" class="btn btn-primary"> Về trang chủ</a>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    setTimeout(function (){
        window.location.href="/loginView";
    },2000)
</script>

<!-- end body -->


<!-- start footer -->

</body>

</html>