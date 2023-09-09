<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_DashBoard.aspx.cs" Inherits="Admin_DashBoard_HTML_CSS_Javascript.Admin_DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Style.css" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Arvo&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Play&display=swap');

        .MastTo {
            width: 530px;
            height: 400px;
            border: 0px solid;
            margin: 5px;
            padding: 5px;
            display: inline-block;
            vertical-align: top;            
        }

        .CustTo {
            width: 530px;
            height: 400px;
            border: 0px solid;
            margin: 5px;
            padding: 5px;
            display: inline-block;
            vertical-align: top;            
        }

        .tblock {
            width: 325px;
            height: 225px;
            margin: 5px;
            padding: 5px;
            display: inline-block;
            vertical-align: top;
            background-color: goldenrod;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .oblock {
            width: 325px;
            height: 225px;
            margin: 5px;
            padding: 5px;
            display: inline-block;
            vertical-align: top;
            background-color: goldenrod;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .animated-image-container {
            background-image: url(Images/Gandhar_Radiant_Image.PNG);
            width: 400px;
            height: 225px;
            display: inline-block;
            vertical-align: top;
            background-repeat: no-repeat;
            animation: pulse 2s infinite;
            background-size: cover;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.1);
            }
        }

        .masterlabel {
            margin: 0px 0px 0px 26px;
            color: #000000;
            font-family: 'Times New Roman';
        }

        .toAmount {
            color: darkblue;
            font-size: 35px;
            text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;
        }

        .toOverdue {
            color: darkred;
            font-size: 35px;
            text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;
        }

        .bounce {
            width: 100%;
            margin: 2rem auto;
            display: inline-flex;
            justify-content: center;
            -webkit-box-reflect: below -20px linear-gradient(transparent, #211e1e2e);
        }

            .bounce span {
                display: inline-flex;
                color: #c7f4ff;
                font-family: "Play", sans-serif;
                animation: bounce 1s infinite;
            }

        @keyframes bounce {
            0%, 50%, 100% {
                transform: translateY(0);
            }

            25% {
                transform: translateY(-20px);
            }
        }

        .wrapper.nine {
            font-family: "Play", sans-serif;
        }

        .rotate span {
            animation: rotate 2s infinite;
        }

        @keyframes rotate {
            0%, 75% {
                transform: rotateY(360deg);
            }
        }

        .nine span:nth-of-type(1) {
            animation-delay: 0.2s;
        }

        .nine span:nth-of-type(2) {
            animation-delay: 0.4s;
        }

        .nine span:nth-of-type(3) {
            animation-delay: 0.6s;
        }

        .nine span:nth-of-type(4) {
            animation-delay: 0.8s;
        }

        .nine span:nth-of-type(5) {
            animation-delay: 1s;
        }

        .nine span:nth-of-type(6) {
            animation-delay: 1.2s;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mySidenav" class="sidenav">
            <p class="logo">
                <span>
                    <img src="Images/GandharPic.PNG" style="border-radius: 25%; width: 180px;" /></span>
            </p>
            <a href="#" class="icon-a"><i class="fa fa-dashboard icons"></i>&nbsp;&nbsp;Dashboard</a>
            <a href="#" class="icon-a"><i class="fa fa-user icons"></i>&nbsp;&nbsp;Account</a>
            <a href="#" class="icon-a"><i class="fa fa-users icons"></i>&nbsp;&nbsp;Customers</a>
            <a href="MasterData.aspx" class="icon-a"><i class="fa fa-users icons"></i>&nbsp;&nbsp;Masters</a>
            <a href="#" class="icon-a"><i class="fa fa-shopping-bag icons"></i>&nbsp;&nbsp;Orders</a>
            <a href="#" class="icon-a"><i class="fa fa-list-alt icons"></i>&nbsp;&nbsp;Inventory</a>
            <a href="#" class="icon-a"><i class="fa fa-tasks icons"></i>&nbsp;&nbsp;Tasks</a>
        </div>

        <div id="main">
            <div class="head">
                <div class="col-div-6">
                    <span style="font-size: 30px; cursor: pointer; color: white;" class="nav">&#9776;Dashboard</span>
                    <span style="font-size: 30px; cursor: pointer; color: white;" class="nav2">&#9776;Dashboard</span>
                </div>
                <div class="col-div-6">
                    <div class="profile">
                        <img src="Images/Samir_Sir_Pic.PNG" class="pro-img" />
                        <p>Samir Tapde <span>Managing Director</span></p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="col-div-3">
                <div class="box">
                    <a href="TotalMasterData_Page.aspx">
                        <p>
                            <asp:Label ID="lblTotalMaster" runat="server"></asp:Label><br />
                            <span>TOTAL MASTER</span>
                        </p>
                        <i class="fa fa-users box-icon"></i>
                    </a>
                </div>
            </div>

            <div class="col-div-3">
                <div class="box1">
                    <a href="TotalCustomerData_Page.aspx">
                        <p>
                            <asp:Label ID="lblTotalCustomers" runat="server"></asp:Label><br />
                            <span>TOTAL CUSTOMERS</span>
                        </p>
                        <i class="fa fa-list box-icon"></i>
                    </a>
                </div>
            </div>

            <div class="col-div-3">
                <div class="box2">
                    <p>
                        <asp:Label ID="lblOrders" runat="server" Text="679"></asp:Label><br />
                        <span>ORDERS</span>
                    </p>
                    <i class="fa fa-shopping-bag box-icon"></i>
                </div>
            </div>

            <div class="col-div-3">
                <div class="box3">
                    <p>
                        <asp:Label ID="lblTasks" runat="server" Text="67"></asp:Label><br />
                        <span>TASKS</span>
                    </p>
                    <i class="fa fa-tasks box-icon"></i>
                </div>
            </div>
            <div class="clearfix"></div>
            <br />
            <br />

            <div class="col-div-8">
                <div class="box-8">
                    <div class="content-box">
                        <div id="chartContainer">
                            <div class="chart">
                                <div class="setlabel">
                                    <div class="tblock">
                                        <div class="bounce"><b><span style="color: darkblue; font-size: 40px; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;">Total OutStanding</span></b></div>
                                        <br />
                                        <br />
                                        <div class="wrapper nine">
                                            <div class="rotate">
                                                <span>
                                                    <asp:Label ID="lblTotalAmount" runat="server" CssClass="toAmount" /><span style="color: darkblue; font-size: 35px; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;">M</span></span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="animated-image-container">
                                    </div>
                                    <div class="oblock">
                                        <div class="bounce"><b><span style="color: darkred; font-size: 40px; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;">Total <br />OverDue</span></b></div>
                                        <br />
                                        <br />
                                        <div class="wrapper nine">
                                            <div class="rotate">
                                                <span>
                                                    <asp:Label ID="lblOverDue" runat="server" CssClass="toOverdue" /><span style="color: darkred; font-size: 35px; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;">M</span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bothchart">
                                    <div class="MastTo">
                                        <b>
                                            <asp:Label ID="lblMaster" runat="server" Text="Master Sales Code Wise 0/s above 1 Crore" CssClass="masterlabel"></asp:Label></b>
                                        <asp:Chart BackColor="#cac618" ID="MasterDataChart" runat="server" Height="400px" Width="530px" PaletteCustomColors="18, 35, 158; 214, 69, 80" Palette="None">
                                            <Legends>
                                                <asp:Legend BackColor="#cac618" Alignment="Near" Docking="Top" IsTextAutoFit="False" Name="Sum of OUTAMT"
                                                    LegendStyle="Row" />
                                                <asp:Legend Alignment="Near" Docking="Top" IsTextAutoFit="False" Name="Sum of Overdue"
                                                    LegendStyle="Row" />
                                            </Legends>
                                            <Series>
                                                <asp:Series Name="Sum of OUTAMT" XValueMember="Master_Sales_Code" YValueMembers="OutStanding_Amount" ChartType="StackedBar" IsXValueIndexed="True" />
                                                <asp:Series Name="Sum of Overdue" XValueMember="Master_Sales_Code" YValueMembers="OverDue" ChartType="StackedBar" IsXValueIndexed="True" />
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea BackColor="#cac618" />
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                    <div class="CustTo">
                                        <b>
                                            <asp:Label ID="lblCustomer" runat="server" Text="Customer Name Wise 0/s above 1 Crore" CssClass="masterlabel"></asp:Label></b>
                                        <asp:Chart BackColor="#cac618" ID="CustomerDataChart" runat="server" Height="400px" Width="530px" PaletteCustomColors="18, 35, 158; 214, 69, 80" Palette="None">
                                            <Legends>
                                                <asp:Legend BackColor="#cac618" Alignment="Near" Docking="Top" IsTextAutoFit="False" Name="Sum of OUTAMT"
                                                    LegendStyle="Row" />
                                                <asp:Legend Alignment="Near" Docking="Top" IsTextAutoFit="False" Name="Sum of Overdue"
                                                    LegendStyle="Row" />
                                            </Legends>
                                            <Series>
                                                <asp:Series Name="Sum of OUTAMT" XValueMember="Customer_Name" YValueMembers="OutStanding_Amount" ChartType="StackedBar" IsXValueIndexed="True" />
                                                <asp:Series Name="Sum of Overdue" XValueMember="Customer_Name" YValueMembers="OverDue" ChartType="StackedBar" IsXValueIndexed="True" />
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea BackColor="#cac618" />
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                            </div>

                        </div>
                         <script>
                            const barChartMovePage = <%= ConfigurationManager.AppSettings["BarChartMovePage"] %>;
                            const chartContainer = document.getElementById('chartContainer');
                            const charts = chartContainer.getElementsByClassName('chart');

                            let currentIndex = 0;

                            function showCharts() {
                                if (currentIndex < charts.length) {
                                    chartContainer.style.display = 'block';
                                    charts[currentIndex].style.display = 'block';

                                    setTimeout(() => {
                                        //charts[currentIndex].style.display = 'none';
                                        currentIndex++;
                                        showCharts();
                                    }, barChartMovePage);
                                } else {
                                    currentIndex = 0;
                                    setTimeout(() => {
                                        window.location.href = 'MasterData.aspx';
                                    }, barChartMovePage);
                                }
                            }
                            // Initial call
                            showCharts();
                        </script>
                    </div>
                </div>
            </div>
            <div class="col-div-4">
                <div class="box-4">
                    <div class="content-box">
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(".nav").click(function () {
                $("#mySidenav").css('width', '40px');
                $("#main").css('margin-left', '40px');
                $(".logo").css('visibility', 'hidden');
                $(".logo span").css('visibility', 'visible');
                $(".logo span").css('margin-left', '-10px');
                $(".icon-a").css('visibility', 'hidden');
                $(".icons").css('visibility', 'visible');
                $(".icons").css('margin-left', '-8px');
                $(".nav").css('display', 'none');
                $(".nav2").css('display', 'block');
            });

            $(".nav2").click(function () {
                $("#mySidenav").css('width', '200px');
                $("#main").css('margin-left', '200px');
                $(".logo").css('visibility', 'visible');
                $(".logo span").css('visibility', 'visible');
                $(".logo").css('margin-left', '5px');
                $(".logo span").css('margin-left', '5px');
                $(".icon-a").css('visibility', 'visible');
                $(".icons").css('visibility', 'visible');
                $(".nav").css('display', 'block');
                $(".nav2").css('display', 'none');
            });
        </script>
    </form>
</body>
</html>
