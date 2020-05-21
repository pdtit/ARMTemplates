<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="healthcheck.aspx.cs" Inherits="WebApplication1.healthcheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: xx-large;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: large;
        }
        .auto-style6 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
        }
        .auto-style7 {
            font-size: xx-small;
        }
        .auto-style8 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
            color: #0066FF;
        }
    </style>
</head>
<body id="pagebody" runat="server" OnPreRender="PageBody_PreRender">
    <form id="form1" runat="server">
        <div class="auto-style4">
            <span class="auto-style2">
            <br />
            </span><span class="auto-style6"><strong> Traffic Manager Web App</strong></span><span class="auto-style1"><br class="auto-style7" />
            </span><span class="auto-style8">Health Check Page</span><br class="auto-style1" />
            <br />
            <br class="auto-style1" />
            <asp:Label ID="Label1" runat="server" Text="Label" OnPreRender="Label1_PreRender" CssClass="auto-style3"></asp:Label>
            <br class="auto-style3" />
            <br />
            <br class="auto-style3" />
            <span class="auto-style5">HTTP Status Code:</span><br class="auto-style1" />
            <asp:DropDownList ID="DropDownList1" runat="server" OnPreRender="DropDownList1_PreRender" CssClass="auto-style1">
                <asp:ListItem Selected="True" Value="200">200 - Healthy</asp:ListItem>
                <asp:ListItem Value="201">201 - Degraded</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" CssClass="auto-style1" />
            <br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/" style="font-size: large; font-family: Arial, Helvetica, sans-serif">Go to home page</asp:HyperLink>
            <br />
            <br />
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/007FFFLearning-logo.png" />
        </div>
    </form>
</body>
</html>
