<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="P_AMACO.ProductView" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #F29191;
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
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif
        }
        .Star {
            background-image: url(images/stars/Star.gif);
            height: 35px;
            width: 35px;
            background-repeat: no-repeat;
        }

        .WaitingStar {
            background-image: url(images/stars/WaitingStar.gif);
            height: 35px;
            width: 35px;
           background-repeat: no-repeat;
        }

        .FilledStar {
            background-image: url(images/stars/FilledStar.gif);
            height: 35px;
            width: 35px;
            background-repeat: no-repeat;
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
    <div class="container" style="padding-top:50px; padding-bottom:50px;">

                <h1>Product View</h1>
            <!--- Success Alert --->
                        <div id="divSuccess" runat="server" class="alert alert-success alert-dismissible">
                            <strong>Success! </strong>Item successfully added to cart. <a href="Cart.aspx">View Cart</a>
                        </div>
        <div id="diverror" runat="server" class="alert alert-danger alert-dismissible" >
                            <strong>UNSUCCESSFUL! Stock Not available </strong>
                        </div>

                <div class="row">

              <div class="col-md-7">
                <div id="ImageIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#ImageIndicators" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#ImageIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#ImageIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <!--Work to do -->
                            <asp:repeater ID="rptrImage" runat="server">
                                  <ItemTemplate>
                                    <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
                                      <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.jpg'">     
                                    </div>
                                  </ItemTemplate>
                            </asp:repeater>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#ImageIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true" ></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#ImageIndicators"  data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
                    <asp:Repeater id="rptrProductDetails" runat="server">
                        <ItemTemplate>
                                <div class="col-md-5" style="text-align:left; margin-top:20px;">
                                     <h1 style="font-family: 'Pacifico', cursive;color:#04009A;"><%# Eval("PName") %> </h1><br />
                                     <h5 style="display:inline;">Price</h5>
                                     <p style="margin-left:10px;display:inline;">RS.<%# Eval("PPrice","{0:c}") %></p>
                                    <br />
                                    <h5 style="display:inline;">Category</h5>
                                    <p style="margin-left:10px;display:inline;"><%# Eval("Pcategory") %> </p>
                                    <br /> 
                                    <h5 style="display:inline;">Description</h5>
                                    <p style="margin-left:10px;display:inline;"><%# Eval("PDescription") %> </p>
                                    <br /> 
                                    <h5 style="display:inline;">Rating</h5>
                                    <p id="rate" runat="server" style="margin-left:10px;display:inline;"><%# Eval("PDescription") %> </p>
                                    <%--<span id="star1" style="font-size:50px;color:yellow;">&#9733;</span>
                                     <span id="star2" style="font-size:50px;color:yellow;">&#9733;</span>
                                     <span id="star3" style="font-size:50px;color:yellow;">&#9733;</span>
                                     <span id="star4" style="font-size:50px;color:yellow;">&#9733;</span>
                                     <span id="star5" style="font-size:50px;color:yellow;">&#9733;</span>--%>
                                    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>
                                   <ajaxToolkit:Rating ID="Rating1" BehaviorID="RatingRate1" runat="server" AutoPostBack="true"
                                    StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                    FilledStarCssClass="FilledStar" OnClick="Rating1_Click" MaxRating="5" CurrentRating="0" Visible="true">
                                     </ajaxToolkit:Rating>
                              
                                     <br />
                                    <asp:Label ID="lbresult" runat="server" Text=""></asp:Label>
                                      <br />                                    
                                    <div class="d-grid gap-2">
                                        <asp:LinkButton ID="btnAddtoCart" class="btn btn-expand btn-success" runat="server" OnClick="btnAddtoCart_Click"><i class="fas fa-cart-plus"></i> Add to Cart</asp:LinkButton>
                                    </div>
                                 </div>
                        </ItemTemplate>
                    </asp:Repeater>

                  <%-- <div class="col-md-3">
                                <div class="card" style="width: 290px;">
                                    <asp:Image ID="Pimage2" class="card-img-top" runat="server" src="./Images/cement.jpg" alt="Card image cap"  Visible ="True" />        
                                </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card" style="width: 290px;margin-left:30px;">
                                <asp:Image ID="Pimage3" class="card-img-top" runat="server" Visible ="True" src="./Images/cement.jpg" alt="Card image cap"/>
                                </div>
                        </div>--%>
                    </div>
        </div>
</asp:Content>

