<%@ Page Title="" Language="C#" MasterPageFile="~/AMACO.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="P_AMACO.Contact" %>
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
            <h1 style="font-family: 'Ubuntu Mono', monospace;">GET IN TOUCH</h1>

            <div style="margin:50px 30%;">
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox2" runat="server" type="text" class="form-control" placeholder="text" ></asp:TextBox>
                    <%--<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">--%>
                    <label for="TextBox2">Name</label>
                </div>
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox3" runat="server" type="Email" class="form-control" TextMode="Email" placeholder="name@example.com"></asp:TextBox>
                    <%--<input type="password" class="form-control" id="floatingPassword" placeholder="Password">--%>
                    <label for="TextBox3">Email Address</label>
                </div>
                
                <div class="form-floating" style="margin-bottom:10px;">
                    <asp:TextBox ID="TextBox4" runat="server" class="form-control" TextMode="MultiLine" placeholder="Message" style="height:110px;"></asp:TextBox>
                    <label for="TextBox3">Message</label>
                </div>
                <div>
                    <asp:LinkButton ID="LinkButton2" class="w-50 btn btn-info" runat="server" style="border:1px solid black; color:black;"><i class="fas fa-share-square"></i> Send</asp:LinkButton>
                </div>
                
            </div>

        </div>
        <!-- -->
</asp:Content>
