<%@ Page Title="About" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="P_AMACO.About" %>
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
            <div class="container" style="margin:50px;">
                <h1 style="font-family: 'Ubuntu Mono', monospace;text-align:center;">MEET OUR TEAM</h1>

                <div class="row" style="text-align:center; margin-top:60px; margin-bottom:60px;">
                    <div class="col-md-4">
                        <asp:Image ID="Image1" style="width:200px; border-radius:25px; margin-bottom:20px;" runat="server" ImageUrl="~/Images/musa.jpg" />
                        <p>Musa Malik</p>
                    </div>
                    <div class="col-md-4">
                        <asp:Image ID="Image2" style="width:200px; border-radius:25px; margin-bottom:20px;" runat="server" ImageUrl="~/Images/ahmed.jpg" />
                        <p>Ahmed</p>
                    </div>
                    <div class="col-md-4">
                        <asp:Image ID="Image3" style="width:200px; border-radius:25px; margin-bottom:20px;" runat="server" ImageUrl="~/Images/abdullah.jpg" />
                        <p>Abdullah</p>
                    </div>
                </div>

            </div>
        <!-- -->
</asp:Content>
