<%@ Page Title="Editează client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Proiect_BDI.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .spaced input[type="radio"]
{
   margin-right: 5px;
}
    </style>
    <h2 id="Raspuns" runat="server" visible="false">Clientul</h2>
    <h2>
        <asp:HyperLink ID="HyperLink1" Visible="false" runat="server" NavigateUrl='~/Clienti.aspx'>Către pagina clienților</asp:HyperLink></h2>

    <asp:Table ID="Table1" runat="server" Width="372px" CssClass="table table-hover table-responsive" HorizontalAlign="Center">
        <asp:TableRow Visible="False">
            <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False">ID</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbID" runat="server" Enabled="False" ReadOnly="True" Visible="False"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label2" runat="server" Text="Label">Nume</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbNume" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Introduceti minim 3 caractere!" ControlToValidate="tbNume" ValidationExpression="[\s\S]{3,50}"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label3" runat="server" Text="Label">Prenume</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbPrenume" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Introduceti minim 3 caractere!"  ControlToValidate="tbPrenume" ValidationExpression="[\s\S]{3,50}"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text="Label">Telefon</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbTelefon" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Un număr de telefon valid are 10 cifre!" ControlToValidate="tbTelefon" ValidationExpression="\d{1,10}"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Label">Email</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Emailul trebuie să fie de forma exemplu@exemplu.com!" ControlToValidate="tbEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label6" runat="server" Text="Label">Data nasterii</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbDataNastere" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Data nașterii trebuie să fie de forma dd.mm.yyyy!" ControlToValidate="tbDataNastere" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[.](0[1-9]|1[012])[.](19|20)[0-9]{2}$"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label7" runat="server" Text="Label">CNP</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbCNP" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="CNP-ul trebuie să fie format din 13 cifre!" ControlToValidate="tbCNP" ValidationExpression="\d{13,13}"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow Visible="false">
            <asp:TableCell>
                <asp:Label ID="Label8" runat="server" Text="Label" Visible="False">Varsta</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbVarsta" runat="server" Visible="False"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label9" runat="server" Text="Label">Venit net</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbVenit" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label10" runat="server" Text="Label">Sex</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Vertical" CssClass="spaced">
                    <asp:ListItem>M</asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Introduceti minim 5 caractere" ControlToValidate="tbNume" ValidationExpression="[\s\S]{5,50}"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label11" runat="server" Text="Label">Stare civila</asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Vertical" CssClass="spaced">
                    <asp:ListItem>NC</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Introduceti minim 5 caractere" ControlToValidate="tbNume" ValidationExpression="[\s\S]{5,50}"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><asp:Button ID="Button1" runat="server" Text="Salveaza" OnClick="Button1_Click" CssClass="btn btn-success btn-lg" HorizontalAlign="Center"/></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
