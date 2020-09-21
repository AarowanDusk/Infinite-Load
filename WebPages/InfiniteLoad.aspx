<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfiniteLoad.aspx.cs" Inherits="InfiniteLoad.InfiniteLoad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link href="../Contents/fontawesome-free-5.14.0-web/css/all.css" rel="stylesheet" />
    <script src="../Contents/JQuery/jquery-3.5.1.js"></script>
    <script src="../Contents/fontawesome-free-5.14.0-web/js/all.js"></script>
    <script>
        var recCount = 0;
        function InfiniteScroll() {
            $('#divPostsLoader').html('<i class="fas fa-circle-notch fa-spin"></i>');
                //send a query to server side to present new content
                $.ajax({
                    type: "POST",
                    url: "InfiniteLoad.aspx/getData",
                    data: "{recCount :" + recCount +"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data != "") {
                            $('#divLoadData').append(data.d);
                        }
                        $('#divPostsLoader').empty();
                    }
                });
            recCount = recCount+10;
         };
    </script>
    <script>
        $(document).ready(function () {
            InfiniteScroll();
        });
        $(window).scroll(function () {
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                InfiniteScroll();
            }
        });
    </script>
</head>
<body>
    <div id="divLoadData">
    </div>
    <div id="divPostsLoader">
    </div>
</body>
</html>
