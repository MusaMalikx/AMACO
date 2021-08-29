<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="P_AMACO.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         body {
            background-color: #f8f5f1;
            text-align:center;
        }

        #Navigation {
            background-color: #fdfaf6;
            padding-top: 0%;
            margin: 0%;
        }

        .navbar {
            padding: 0px;
        }

        .navbar-brand {
            font-family: 'Lobster', cursive;
            font-size: 30px;
            padding-right: 20px;
            font-weight: 600;
        }

        .nav-item a {
            font-family: 'Lato', sans-serif;
            font-size: 15px;
            margin-right: 14px;
        }
        .carts{
            background-color: #a9f1df;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid" style="margin:30px 0px;">
    <div class="float-md-start"  style="padding-left:20px;">
        <asp:LinkButton ID="btnaddproduct" class="btn btn-outline-primary" runat="server" visible="false" OnClick="btnaddproduct_Click">Add Product</asp:LinkButton><br />
        <asp:LinkButton ID="btnproducts_view" class="btn btn-outline-primary" runat="server" visible="false" PostBackUrl="~/Report.aspx" style="margin-top:15px;">View Products</asp:LinkButton>
        <asp:LinkButton ID="btntrackorder" class="btn btn-outline-primary" runat="server" visible="false" PostBackUrl="~/TrackOrder.aspx" style="margin-top:15px;">Track Order</asp:LinkButton>
    </div>

    <div id="success_c" runat="server" visible="false" class="alert alert-success" role="alert" style="margin: 0px 20%">
            <div style="text-align: center;">
                <p style="margin: 0px;"><i class="fas fa-check-circle" style="margin:0px 5px;"></i><strong>Successful</strong> in Customer Login</p>
            </div>
        </div>
        <div id="success_s" runat="server" visible="false" class="alert alert-success" role="alert" style="margin: 0px 20%">
            <div style="text-align: center;">
                <p style="margin: 0px;"><i class="fas fa-check-circle" style="margin:0px 5px;"></i><strong>Successful</strong> in Shop Owner Login</p>
            </div>
        </div>
        </div>
    <div class="float-md-end"  style="padding-right:20px;">
        <asp:LinkButton ID="LinkButton1" class="btn btn-outline-danger" runat="server" OnClick="LinkButton1_Click">Log out</asp:LinkButton>
    </div>
    <div style="margin:40px;">
        <img style="height:250px;width:250px;" src="Images/login.png" />
    </div>
    <div style="margin-bottom:40px;">
        <asp:Label runat="server"  id="usercheck" >Login Successfully :)</asp:Label>
    </div>

</asp:Content>
