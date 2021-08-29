<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="P_AMACO.cart" %>
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
        #cart {
            Margin: 20px;
            text-align: center;
            padding: 70px 150px;
        }

        .container h1 {
            font-family: 'Ubuntu Mono', monospace;
            font-size: 50px;
            padding-bottom: 70px;
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
            padding:8px 0;
            height:150px;
        }

            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
            }

        p {
            font-family: 'Montserrat', sans-serif;
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
    <!-- -----------------------------------------Cards Start---------------------------------------------------- -->
        <div id="cart">
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
             <div class="container">
                <h1>Cart Details</h1>
                    <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn"  type="button" onclick="btnCart2_ServerClick">
                       Total Cart <span id="CartBadge" runat="server" class="badge">0</span>
                    </button>
                    <h4 class="proNameViewCart" runat="server" id="h4NoItems"></h4>
                    
                            <div class="row">
                              <asp:Repeater ID="RptrCartProducts" onitemcommand="RptrCartProducts_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="row">
                                                <div class="col-md-2" style="padding-top: 70px;">
                                                     <asp:Button ID="btnRemoveCart" CommandArgument='<%#Eval("CartID") %>' CommandName="RemoveThisCart" CssClass="btn btn-outline-danger" runat="server" Text="Remove" />                
                                                </div>
                                                <div class="col-md-4">
                                                    <a href="ProductView.aspx?PID=<%# Eval("PID") %>" target="_blank">
                                                        <img class="card-img-top" src="Images/productimages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.jpg'" />
                                                    </a>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="card-body">
                                                        <h5 class="card-title"><%# Eval("PName") %></h5>                             
                                                            <div>
                                                                <label class="card-header-tabs card-text">Price: </label>
                                                                <span  runat="server" id="price1">&nbsp<%# Eval("PPrice","{0:0.00}") %></span></div>                                 
                                                            <div>
                                                                <label class="card-header-tabs card-text">QTY: </label>
                                                                <span runat="server" id="qty1">&nbsp<%# Eval("Qty") %></span></div>
                                                        <br />
                                                        <span class="card-footer" id="subtotal1" >SubTotal: Rs. <%# Eval("SubSAmount","{0:0.00}") %></span>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </ItemTemplate>
                              </asp:Repeater>
                           </div>

                          <%--<div class="col-md-3" runat="server" id="divAmountSect">--%>
                                   <%-- <div>
                                        <h5 class=" proNameViewCart">Price Details</h5>
                                                <div>
                                                    <label class=" ">Total</label>
                                                    <span class="pull-right priceGray" runat="server" id="spanCartTotal"></span>
                                                </div>
                                                <div>
                                                    <label class=" ">Cart Discount</label>
                                                    <span class="pull-right priceGreen" runat="server" id="spanDiscount"></span>
                                                </div>
                                       </div>
                                        <div>
                                            <div class="cartTotal">
                                                <label>Cart Total</label>
                                                <span class="pull-right " runat="server" id="spanTotal"></span>
                                            </div>
                                        </div>--%>
                 <div runat="server" id="divAmountSect">
                 <div style="border-bottom: 1px solid #eaeaec; padding-top: 50px;">
                        <h5 class="text-primary">PRICE DETAILS</h5>
                        <div class="text-secondary" style="display:inline">
                            <label>Cart Total</label>
                            <span id="spanCartTotal" runat="server" style="color:#053742;padding-right:30px;"></span>
                        </div>
                        <div class="text-secondary" style="display:inline">
                            <label>Cart Discount</label>
                            <span id="spanDiscount" runat="server" style="color:#053742;padding-right:30px;"></span>
                        </div>
                        <div style="display:inline">
                            <label>Total</label>
                            <span id="spanTotal" runat="server" style="color:#053742;padding-right:30px;"></span>
                        </div>
                    </div>
                                </div>

                        <div style="margin-top: 50px;">
                            <%--<asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>--%>
                            <asp:LinkButton ID="btncheckout" class="btn btn-info" Style="border-color: black;" runat="server"  OnClick="btncheckout_Click"><i class="fas fa-shopping-basket" style="margin-right:10px;"></i>Procced To checkout</asp:LinkButton>
                        </div>

                 </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- ------------------------------------------Cards End----------------------------------------------------- -->
</asp:Content>
