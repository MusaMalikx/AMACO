<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="P_AMACO.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
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

        /* /------------------------------------------Cards-----------------------------------------------/ */
        #cards {
            Margin: 20px;
            text-align: center;
            padding: 70px 150px;
        }

        .container h1 {
            font-family: 'Ubuntu Mono', monospace;
            font-size: 50px;
            padding-bottom: 30px;
        }

        .card {
            border-radius: 4px;
            background: #fff;
            box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
            transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
            /* padding: 14px 80px 18px 36px; */
            cursor: pointer;
            margin: 10px;
        }

        .card-img-top{
            height:200px;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
        }

        .container h1 {
            font-family: 'Montserrat', sans-serif;
            padding-bottom: 30px;
        }

        p {
            font-family: 'Montserrat', sans-serif;
        }

        h3{
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }

        #footer {
            color: white;
            /*background-color: #393e46;*/
            /*padding-top: 20px;
            padding-bottom: 20px;*/
            /*position:absolute;
            width:100%;
            bottom:0;*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ------------------------------------------Cards Start--------------------------------------------------- -->
        <div id="cards">
            <div class="container">

                <h3 style="font-family: 'Ubuntu Mono', monospace;
            font-size: 50px;
            padding-bottom: 30px;">
                    <asp:Label ID="Label1" runat="server" Text="All Products"></asp:Label>
                </h3>
                
                 <%--<div id="divSuccess" runat="server" class="alert alert-success alert-dismissible">
                            <strong>Success! </strong>Item successfully added to cart. <a href="Cart.aspx">View Cart</a>
                        </div>--%>

                <div class="row">
                <asp:repeater ID="rptrProducts" runat="server">
                    <ItemTemplate>

                        <div class="col-md-4">
                            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">
                            <div class="card" style="width: 18rem;">
                                <img class="card-img-top" src="Images/productimages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval ("PName") %></h5>
                                    <p class="card-text ">
                                        <%# Eval ("PDescription") %>
                                        <br />
                                        <%# Eval ("PPrice","{0:0,00}") %> 
                                    </p>
                                    <div class="d-grid gap-2">
                                        <asp:LinkButton ID="btnAddtoCart" class="btn btn-expand btn-success" runat="server"><i class="fas fa-cart-plus"></i> Add to Cart</asp:LinkButton>
                                    </div>
                                </div>
                             </div>
                            </a>
                        </div>
                       </ItemTemplate>
                    </asp:repeater>
                </div>
            </div>
        </div>
        <!-- ------------------------------------------Cards End----------------------------------------------------- -->
</asp:Content>
