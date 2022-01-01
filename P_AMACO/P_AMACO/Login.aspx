<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="P_AMACO.Login" %>

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

        .carts {
            background-color: #a9f1df;
        }

        .container h1 {
            font-family: 'Montserrat', sans-serif;
            padding-bottom: 30px;
        }

        p {
            font-family: 'Montserrat', sans-serif;
        }

        h3 {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif
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
    <div class="container-fluid" style="text-align: center; margin: 60px 0;">

        <div id="unsuccess_c" runat="server" visible="false" class="alert alert-warning" role="alert" style="margin: 0px 20%">
            <div style="text-align: center;">
                <p style="margin: 0px;"><i class="fas fa-exclamation-triangle" style="margin:0px 5px;"></i><strong>UnSuccessful</strong> in Customer Login</p>
            </div>
        </div>
        <div id="unsuccess_s" runat="server" visible="false" class="alert alert-warning" role="alert" style="margin: 0px 20%">
            <div style="text-align: center;">
                <p style="margin: 0px;"><i class="fas fa-exclamation-triangle" style="margin:0px 5px;"></i><strong>UnSuccessful</strong> in Shop Owner Login</p>
            </div>
        </div>
        <div id="unsuccess_l" runat="server" visible="false" class="alert alert-warning" role="alert" style="margin: 0px 20%">
            <div style="text-align: center;">
                <p style="margin: 0px;"><i class="fas fa-exclamation-triangle" style="margin:0px 5px;"></i><strong>UnSuccessful</strong> in Login</p>
            </div>
        </div>
        <%--<div id="unsuccess" runat="server" class="alert alert-danger d-flex align-items-center" role="alert" visible="false">
            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
                <use xlink:href="#exclamation-triangle-fill" />
            </svg>
            <div style="text-align: center;">
                <p style="margin: 0px;"><strong>UnSuccessful</strong> in Customer Login</p>
            </div>
        </div>--%>
        <div style="margin: 50px 30%; background: rgba(255, 0, 0, 0.1); padding: 40px 30px; border-radius: 30px;">
            <i class="fad fa-user fa-6x" style="padding: 40px; border-radius: 100%;"></i>
            <h1 style="font-family: 'Ubuntu Mono', monospace; margin-bottom: 40px;">Account Login</h1>

            <div style="margin-bottom: 25px;">
                <asp:RadioButton ID="RdBtnCus" runat="server" GroupName="Person" Text="Customer" Style="padding-right: 15px;"></asp:RadioButton>
                <asp:RadioButton ID="RdBtnShop" runat="server" GroupName="Person" Text="Shop Owner"></asp:RadioButton>
            </div>

            <div class="form-floating" style="margin-bottom: 10px;">
                <asp:TextBox ID="txtuser" runat="server" class="form-control" placeholder="text"></asp:TextBox>
                <label for="txtuser">Email</label>
            </div>

            <div class="form-floating" style="margin-bottom: 10px;">
                <asp:TextBox ID="txtpass" runat="server" class="form-control" TextMode="Password" placeholder="passcode"></asp:TextBox>
                <label for="txtpass">Password</label>
            </div>
            <%--<div class="checkbox mb-3" >
                    <asp:CheckBox ID="CheckBox1" runat="server" text=" Remember me" />
                </div>--%>
            <div style="margin-top: 30px;">
                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" class="w-50 btn btn-info" runat="server" Style="border: 1px solid black; color: black;"><i class="fas fa-sign-in-alt"></i> Sign IN</asp:LinkButton>
                <div id="success1" runat="server" style="color: forestgreen;" class="text-success"></div>
            </div>

        </div>

    </div>
    <!-- -->
</asp:Content>
