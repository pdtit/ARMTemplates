<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
            font-weight: bold;
            text-align: center;
        }
        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: large;
            text-align: center;
        }
        </style>
</head>
<body style="background-color: #FFFFFF">
    <form id="form1" runat="server">
        <p class="auto-style1" style="margin-left: 20px; margin-top: 40px">
            Welcome to the Traffic Manager Web App</p>
        <p class="auto-style2" style="margin-left: 20px; margin-top: 40px">
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Label" OnPreRender="Label1_PreRender" style="font-size: x-large"></asp:Label>
        </p>
        <p class="auto-style2" style="margin-left: 20px; margin-top: 40px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/healthcheck.aspx">Go to health check page</asp:HyperLink>
        </p>
        <p class="auto-style2" style="margin-left: 20px; margin-top: 40px">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/007fffLearning.jpg" />
        </p>
    </form>
</body>
</html>
