<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="P_AMACO.Payment" %>

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

        .carts {
            background-color: #a9f1df;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 50px;">
        <h2 style="color: rgb(36, 16, 110); font-size: 35px; text-align: center; margin: 0 100px 0 100px;">ORDER</h2>
        <div style="border-bottom: 1px solid #eaeaec; padding-top: 50px;">
            <h5 class="text-primary">PRICE DETAILS</h5>
            <div class="text-secondary" style="display: inline">
                <label>Cart Total</label>
                <span id="spanCartTotal" runat="server" style="color: red; padding-right: 30px;"></span>
            </div>
            <div class="text-secondary" style="display: inline">
                <label>Cart Discount</label>
                <span id="spanDiscount" runat="server" style="color: red; padding-right: 30px;"></span>
            </div>
            <div style="display: inline">
                <label>Total</label>
                <span id="spanTotal" runat="server" style="color: red; padding-right: 30px;"></span>
            </div>
        </div>
        <div style="margin: 50px;">
            <asp:HiddenField ID="hdCartAmount" runat="server" />
            <asp:HiddenField ID="hdCartDiscount" runat="server" />
            <asp:HiddenField ID="hdTotalPayed" runat="server" />
            <asp:HiddenField ID="hdPidSizeID" runat="server" />
            <%-- <div class="row" style="padding-top: 20px;">--%>
            <%-- <div class="col-md-9">--%>
            <div>
                <asp:GridView ID="gvProducts" runat="server" CssClass="col-md-12" AutoGenerateColumns="false" Visible="True" CellPadding="6"
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                    <Columns>
                        <asp:BoundField DataField="PID" HeaderText="Product ID" />
                        <asp:BoundField DataField="PName" HeaderText="Product Name" />
                        <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-horizontal">
                <h3 style="margin: 50px;">Delivery Details</h3>

                <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                    <asp:TextBox ID="txtName" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                    <label for="txtName">Name</label>
                    <div id="P1" runat="server" class="text-danger"></div>
                </div>

                <%--<div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                        <div id="P1" runat="server" class="text-danger"></div>
                    </div>--%>

                <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                    <label for="txtAddress">Delivery Address</label>
                    <div id="P2" runat="server" class="text-danger"></div>
                </div>

                <%--<div class="form-group">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Delivery Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        <div id="P2" runat="server" class="text-danger"></div>
                    </div>--%>

                <div class="form-floating" style="margin-bottom: 10px; margin: 10px 25%;">
                    <asp:TextBox ID="txtMobileNumber" CssClass="form-control" placeholder="text" runat="server"></asp:TextBox>
                    <label for="txtMobileNumber">Mobile Number</label>
                    <div id="P3" runat="server" class="text-danger"></div>
                </div>

                <%--<div class="form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                        <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server"></asp:TextBox>
                        <div id="P3" runat="server" class="text-danger"></div>
                    </div>--%>
            </div>

            <%--  </div>--%>

            <%--<div class="col-md-3 float-md-end" id="divPriceDetails" runat="server">
                    
                </div>--%>

            <%--<div class="col-md-9" style="margin:50px 0px;">--%>
            <h3 style="padding: 30px 0px">Payment Mode</h3>

            <%--<div class="page" id="paypal">
                <p>Content of Paypal goes here.</p>
                <asp:Button ID="btnPaypal" CssClass="btn btn-outline-info" runat="server" Text="Pay with PayPal" OnClick="btnPaypal_Click" />
            </div>--%>

            <div class="page" id="cod" style="margin: 20px 0px;">
                <p>Content of Cash on Delivery goes here.</p>
                <asp:LinkButton ID="btncod"  CssClass="btn btn-outline-info" runat="server" OnClick="btncod_Click"><i class="fas fa-wallet" style="margin-right:10px;"></i>Pay with Cash on delivery</asp:LinkButton>
                <%--<asp:Button ID="btncod"  CssClass="btn btn-outline-info" runat="server" Text="Pay with Cash on delivery" OnClick="btncod_Click" />--%>
            </div>

            <%--</div>--%>


            <%--</div>--%>
        </div>
    </div>

</asp:Content>
