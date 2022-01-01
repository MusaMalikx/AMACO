<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="P_AMACO.addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            text-align: center;
            background-color: #f8f5f1;
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

    <div class="container">
        <div class="form-horizontal" style="margin: 50px 0px;">

            <br />
            <br />
            <h1 style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; padding-bottom: 30px;">Add Product</h1>

            <%--<div class ="form-group">
               <asp:Label ID="Label1" runat="server" CssClass ="col-md-2 control-label" Text="Product Name"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtProductName" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
               <asp:Label ID ="l1" runat="server" CssClass="text-danger"></asp:Label>
           </div>--%>
            <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                <asp:TextBox ID="txtProductName" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                <label for="txtProductName">Product Name</label>
                <asp:Label ID="l1" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <%-- <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="l2" runat="server" CssClass="text-danger"></asp:Label>
            </div>--%>

            <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                <asp:TextBox ID="txtPrice" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                <label for="txtPrice">Price</label>
                <asp:Label ID="l2" runat="server" CssClass="text-danger"></asp:Label>
            </div>


            <%--<div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtcat" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="l3" runat="server" CssClass="text-danger"></asp:Label>
            </div>--%>
            <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                <asp:TextBox ID="txtcat" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                <label for="txtcat">Category</label>
                <asp:Label ID="l3" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <%--<div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Size"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtsize" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="l4" runat="server" CssClass="text-danger"></asp:Label>
            </div>--%>
            <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                <asp:TextBox ID="txtsize" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                <label for="txtsize">Size</label>
                <asp:Label ID="l4" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <%--<div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="l5" runat="server" CssClass="text-danger"></asp:Label>
            </div>--%>

            <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                <asp:TextBox ID="txtDescription" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                <label for="txtDescription">Description</label>
                <asp:Label ID="l5" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <%--<div class="form-group">
                <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="Quantity"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtquantity" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                <asp:Label ID="l6" runat="server" CssClass="text-danger"></asp:Label>
            </div>--%>

            <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                <asp:TextBox ID="txtquantity" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                <label for="txtquantity">Quantity</label>
                <asp:Label ID="l6" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <%--<div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                
                    <asp:FileUpload ID="fuImg01" CssClass="form-control" runat="server" />
                
            </div>--%>

            <div class="row" style="margin-bottom: 10px; margin: 10px 25%;">
                <div class="col-md-3">
                    <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="Upload Image"></asp:Label>
                </div>
                <div class="col-md-6" style="margin-left: 25%;">
                    <asp:FileUpload ID="fuImg01" CssClass="form-control" runat="server" />
                </div>
            </div>

            <%-- <div class="form-group">
                <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg02" CssClass="form-control" runat="server" />
                </div>
            </div>--%>

            <div class="row" style="margin-bottom: 10px; margin: 10px 25%;">
                <div class="col-md-3">
                    <asp:Label ID="Label8" runat="server" CssClass="control-label" Text="Upload Image"></asp:Label>
                </div>
                <div class="col-md-6" style="margin-left: 25%;">
                    <asp:FileUpload ID="fuImg02" CssClass="form-control" runat="server" />
                </div>
            </div>

            <%--<div class="form-group">
                <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg03" CssClass="form-control" runat="server" />
                </div>
            </div>--%>

            <div class="row" style="margin-bottom: 10px; margin: 10px 25%;">
                <div class="col-md-3">
                    <asp:Label ID="Label9" runat="server" CssClass="control-label" Text="Upload Image"></asp:Label>
                </div>
                <div class="col-md-6" style="margin-left: 25%;">
                    <asp:FileUpload ID="fuImg03" CssClass="form-control" runat="server" />
                </div>
            </div>


            <div class="form-group">
                <%--<asp:Label ID="Label12" runat="server" CssClass ="col-md-2 control-label" Text="Available"></asp:Label>--%>
                <asp:CheckBox ID="chavail" runat="server" Style="color: blue;" Text="Available" />
            </div>

            <div class="form-group" style="margin-top:20px;">
                <asp:LinkButton ID="btnAdd" CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click"><i class="fab fa-think-peaks" style="padding-right:10px;"></i>ADD Product</asp:LinkButton>
                <%--<asp:Button ID="btnAdd" CssClass="btn btn-success " runat="server" Text="ADD Product" OnClick="btnAdd_Click" />--%>
                <asp:Label ID="l7" runat="server" CssClass="text-success"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
