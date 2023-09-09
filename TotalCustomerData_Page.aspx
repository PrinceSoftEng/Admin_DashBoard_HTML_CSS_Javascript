<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TotalCustomerData_Page.aspx.cs" Inherits="Admin_DashBoard_HTML_CSS_Javascript.TotalCustomerData_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h3 {
            width: 100%;
            padding: 10px;
            background-color: #e5533e;
            position: sticky;
        }
        table {
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
            padding: 5px
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }

        tr:hover {
            background-color: #d0dd7a
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
        <div class="typewriter">
            <h3 align="center">OUTSTANDING MASTER DATA</h3>
        </div>
        <asp:GridView ID="GvCustomerData" runat="server" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField HeaderText="Customer Name" DataField="Customer_Name" />
                <asp:BoundField HeaderText="Customer Code" DataField="Customer_Code" />
                <asp:BoundField HeaderText="OutStanding Amount" DataField="OutStanding_Amount" />
                <asp:BoundField HeaderText="Total OverDue" DataField="Total_OverDue" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
