<%@ Page Title="Home" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="P_AMACO.index1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<meta charset="utf-8" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Lobster&family=Montserrat&family=Original+Surfer&family=Pacifico&family=Sacramento&family=Ubuntu+Mono&display=swap" rel="stylesheet" />
    <script src="js/bootstrap.min.js"></script>--%>
    <style>
        /* font-family: 'Lato', sans-serif;
        font-family: 'Lobster', cursive;
        font-family: 'Montserrat', sans-serif;
        font-family: 'Original Surfer', cursive;
        font-family: 'Pacifico', cursive;
        font-family: 'Sacramento', cursive;
        font-family: 'Ubuntu Mono', monospace; */

        body {
            background-color: #edffec;
        }

        #Navigation {
            background-color: #e84545;
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

        .cart:hover {
            color: #fea82f;
        }

        .carts{
            background-color: #eec4c4;
        }

        /* ----------------------------------------TITLE----------------------------------------- */
        #CompanyDescription {
            text-align: center;
            background-color: #d3e0dc;
            /* padding-right: 100px; */
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .AMAImage img {
            width: 100px;
            height: 150px;
            color: black;
        }

        .AMA {
            margin-top: 1%;
        }

            .AMA h1 {
                font-family: 'Ubuntu Mono', monospace;
            }

        p {
            font-family: 'Montserrat', sans-serif;
        }

        /* -------------------------------------------------- */
        #cards {
            Margin: 20px;
            text-align: center;
            padding: 70px 150px
        }

        .container h1 {
            font-family: 'Original Surfer', cursive;
            font-size: 50px;
            font-style: normal;
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

            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
            }

        .card-img-top {
            height: 200px;
        }

        .product_btn {
            padding-top: 20px;
        }

            .product_btn a {
                color: black;
                border-color: black;
            }

       /* #footer {
            color: white;
            background-color: #393e46;
            padding-top: 20px;
            padding-bottom: 20px;
        }*/

        @media (max-width: 575px) {

            body {
                text-align: center;
            }

            .AMA {
                padding-top: 0px;
            }

            .AMAImage {
                padding-top: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- ---------------------------------------Company Name Motto Start----------------------------------------- -->
    <div id="CompanyDescription" style="text-align: center;">
        <div class="container-fluid">
            <%--<div class="row">--%>
            <div class="AMAImage">
                <img src="./Images/logo.png" alt="AMACO Logo" />
            </div>
            <div class="AMA">
                <h1>AMACO</h1>
                <p>The Place where you can find materials for construction or renovation of home</p>
            </div>
            <%--</div>--%>
        </div>
    </div>
    <!-- ---------------------------------------Company Name Motto End------------------------------------------- -->
    <!-- -----------------------------------------Cards Start---------------------------------------------------- -->
    <div id="cards">
        <div class="container">

            <h1>Featured Products</h1>

            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="./Images/cement.jpg" alt="Card image cap" />
                        <div class="card-body">
                            <h5 class="card-title">Cement</h5>
                            <p class="card-text">
                                A substance used for construction that sets, hardens, and adheres to other materials to bind them together.
                            </p>
                            <div class="d-grid gap-2">
                                <asp:LinkButton ID="LinkButton2" class="btn btn-expand btn-success" runat="server"><i class="fas fa-cart-plus"></i> Add to Cart</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="./Images/bricks.jpg" alt="Card image cap" />
                        <div class="card-body">
                            <h5 class="card-title">Bricks</h5>
                            <p class="card-text">
                                A type of block used to build walls, pavements and other elements in masonry construction.
                            </p>
                            <div class="d-grid gap-2">
                                <asp:LinkButton ID="LinkButton3" class="btn btn-expand btn-success" runat="server"><i class="fas fa-cart-plus"></i> Add to Cart</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="./Images/wood.jpeg" alt="Card image cap" />
                        <div class="card-body">
                            <h5 class="card-title">Wood</h5>
                            <p class="card-text">
                                 It is an organic material – a natural composite of cellulose fibers that are strong in tension and embedded in a matrix of lignin that resists compression.
                            </p>
                            <div class="d-grid gap-2">
                                <asp:LinkButton ID="LinkButton4" class="btn btn-expand btn-success" runat="server"><i class="fas fa-cart-plus"></i> Add to Cart</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product_btn">
                <asp:HyperLink ID="HyperLink1" class="btn btn-outline-warning" runat="server" NavigateUrl="~/products.aspx"><i class="fas fa-arrow-right" style="padding-right:10px;"></i>All Products</asp:HyperLink>
            </div>
        </div>
    </div>
    <!-- ------------------------------------------Cards End----------------------------------------------------- -->

</asp:Content>
