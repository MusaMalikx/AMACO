<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="SignUpShopKeeper.aspx.cs" Inherits="P_AMACO.SignUpShopKeeper" %>
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
    <!-- -->
        <div style="text-align:center;margin:60px 0;">

            <div style="margin:50px 30%;background:rgba(255, 0, 0, 0.1);padding: 40px 30px;border-radius:30px; ">
                <i class="fad fa-user-plus fa-6x" style="padding:40px;border-radius:100%;"></i>
                <h1 style="font-family: 'Ubuntu Mono', monospace;margin-bottom:40px;">Shop Owner SignUP</h1> 
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="text" ></asp:TextBox>
                    <label for="TextBox2">Shop Owner Name</label>
                    <div id="P2" runat="server" style="color:red;"></div>
                </div>
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" TextMode="Email" placeholder="name@example.com"></asp:TextBox>
                    <label for="TextBox3">Email Address</label>
                    <div id="P3" runat="server" style="color:red;"></div>
                </div>
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox4" runat="server" class="form-control" TextMode="number" placeholder="text"></asp:TextBox>
                    <label for="TextBox4">Phone Number</label>
                    <div id="P4" runat="server" style="color:red;"></div>
                </div>
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox8" runat="server" class="form-control" TextMode="number" placeholder="text"></asp:TextBox>
                    <label for="TextBox8">CNIC Number</label>
                    <div id="P8" runat="server" style="color:red;"></div>
                </div>
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Home Address"></asp:TextBox>
                    <label for="TextBox5">Shop Address</label> 
                    <div id="P5" runat="server" style="color:red;"></div>
                </div>
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox6" runat="server" class="form-control" TextMode="Password" placeholder="passcode"></asp:TextBox>
                    <label for="TextBox6">Password</label>
                    <div id="P6" runat="server" style="color:red;"></div>
                </div>
  
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox9" runat="server" class="form-control" placeholder="text" ></asp:TextBox>
                    <label for="TextBox9">Shop Name</label>
                    <div id="P9" runat="server" style="color:red;"></div>
                </div>

                <div>
                    <asp:LinkButton ID="LinkButton2" class="w-50 btn btn-info" runat="server" style="border:1px solid black; color:black;" OnClick="LinkButton2_Click"><i class="fas fa-plus-circle"></i> Create Account</asp:LinkButton>
                </div>
                
            </div>

        </div>
        <!-- -->
</asp:Content>
