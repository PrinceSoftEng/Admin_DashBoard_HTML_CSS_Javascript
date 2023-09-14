<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterData.aspx.cs" Inherits="Admin_DashBoard_HTML_CSS_Javascript.MasterData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        /*Assing CSS stop thead table color-profile GridView*/
        table {
            border-collapse: collapse;
            width:100%;
        }
            table th {
                color: white;
                background-color: orangered;
                padding:5px;
                z-index: 1;
                top: 37px;
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

        /*CSS form Blink color-profile Particular row */
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
        .typewriter {
            justify-content: center;
            color: whitesmoke;
            text-align: center;
            position:sticky;
            top: 0;
            letter-spacing: .15em;
            z-index:1;
            white-space: nowrap;
            background-color: #e5533e;
            padding: 12px;
            display: flex;
            overflow: hidden;
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
