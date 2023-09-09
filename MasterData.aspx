<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterData.aspx.cs" Inherits="Admin_DashBoard_HTML_CSS_Javascript.MasterData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        h3 {
            width: 100%;
            padding: 10px;
            background-color: #e5533e;
            position: sticky;
        }
        /*Table Css*/
        table {
            border-collapse: collapse;
        }

            table th {
                color: white;
                background-color: orangered;
                z-index: 1;
                top: 0;
                position: sticky;
            }

        table, th, td {
            border: 1px solid black;
            padding: 5px
        }

        tr:nth-child(even) {
            background-color: #43e5e0;
        }

        tr:hover {
            background-color: #67a6f5;
        }
        /*Scrolable CSS*/
        .gridview-container {
            width: 100%;
            height: 100%;
            position: absolute;
            overflow: auto;
            overflow-x: auto;
            overflow-y: auto;
        }        

        .right-aligned {
            text-align: right;
        }

        @keyframes blinking {
            0%, 100% {
                background-color: red;
                transform: scale(1);
            }

            50% {
                background-color: yellow;
                transform: scale(0.9);
            }
        }

        .blink {
            animation: blinking 3.5s infinite;
        }
        /*Auto typing Lable of Gridview*/
        .typewriter h3 {
            color: whitesmoke;
            overflow: hidden;
            border-right: .15em solid orange;
            white-space: nowrap;
            margin: 0 auto;
            letter-spacing: .15em;
            animation: typing 2.5s steps(30, end), blink-caret 0.1s step-end infinite;
        }

        /* The typing effect */
        @keyframes typing {
            from {
                width: 0
            }

            to {
                width: 100%
            }
        }

        /* The typewriter cursor effect */
        @keyframes blink-caret {
            from, to {
                border-color: transparent;
            }

            50% {
                border-color: orange;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--this is scrollable gridview script--%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function toggleBlink(row) {
                row.classList.toggle('blink');
            };

            $(document).ready(function () {
                function scrollGridView() {
                    var interval = <%= ConfigurationManager.AppSettings["SetInterval"] %>;
                    var pixelsToScroll = <%= ConfigurationManager.AppSettings["SetPixelToScroll"] %>;

                    var gridViewContainer = $(".gridview-container");
                    gridViewContainer.animate({ scrollTop: "+=" + pixelsToScroll + "px" }, interval);

                    setTimeout(scrollGridView, interval);
                }
                setTimeout(scrollGridView, 0);
            });
        </script>
        <div class="typewriter">
            <h3 align="center">OUTSTANDING SALES REPORT</h3>
        </div>

        <div id="gridView">
            <div class="gridview-container">
                <asp:PlaceHolder ID="GridViewPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <%--this is script for go to next Page of Bar Chart--%>
        <script>
            const gridViewItemTimeout = <%= ConfigurationManager.AppSettings["gridViewItemTimeout"] %>;
            const gridView = document.getElementById('gridView');
            const gridItems = gridView.getElementsByClassName('gridview-container');
            let currentIndex = 0;
            function showGridItems() {
                if (currentIndex < gridItems.length) {
                    gridView.style.display = 'block';
                    gridItems[currentIndex].style.display = 'block';

                    setTimeout(() => {
                        //gridItems[currentIndex].style.display = 'none';
                        currentIndex++;
                        showGridItems();
                    }, gridViewItemTimeout);
                } else {
                    currentIndex = 0;
                    setTimeout(() => {
                        window.location.href = 'Admin_DashBoard.aspx';
                    }, gridViewItemTimeout);
                }
            }
            // Initial call
            showGridItems();
        </script>
    </form>
</body>
</html>
