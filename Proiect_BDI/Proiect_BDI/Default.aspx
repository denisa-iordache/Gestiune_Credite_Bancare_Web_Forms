<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Proiect_BDI._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1 style="color: #3B71CA">Credite bancare</h1>
        <p class="lead">
            Aplicația permite gestionarea creditelor bancare la nivelul unei bănci.
        </p>
        <div class="div1">
            <asp:Image ID="Image1" runat="server" Height="500px" ImageUrl="~/Images/undraw_Online_payments_re_y8f2.png" Width="100%" />
        </div>
        <style>
            .div1 {
                margin-bottom: 14px;
            }

            .jumbotron {
                background-color: lightyellow;
                border-radius: 35px;
                border: 2px solid #3B71CA;
                padding: 20px;
            }
        </style>
        <a href="https://github.com/denisa-iordache" class="btn btn-lg btn-info center-block">Către site-ul băncii</a>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2 style="color: #3B71CA">Pagina angajați bancă</h2>
            <p>
                în această pagină pot fi vizualizate informații despre angajații băncii. Aceștia sunt de fapt angajații care pot oferi asistență clienților în alegerea unui credit potrivit nevoilor lor și, ulterior, prezintă contractului de credit pentru semnare.
            </p>
        </div>
        <div class="col-md-4">
            <h2 style="color: #3B71CA">Pagina clienți bancă</h2>
            <p>
                Informațiile despre clienții băncii care au semnat contractele de credit pot fi vizualizate în această pagină.
            </p>
        </div>
        <div class="col-md-4">
            <h2 style="color: #3B71CA">Pagina contracte de credit</h2>
            <p>
                Pentru vizualizarea informațiilor despre creditele clienților se poate consulta această pagină.
            </p>
        </div>
    </div>

</asp:Content>
