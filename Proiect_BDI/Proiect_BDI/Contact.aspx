<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Proiect_BDI.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <address>
        <strong>LinkedIn:</strong>   <a href="https://www.linkedin.com/in/denisa-maria-iordache/">linkedin.com/in/denisa-maria-iordache/</a><br />
        <strong>GitHub:</strong> <a href="https://github.com/denisa-iordache">github.com/denisa-iordache</a><br />
        <strong>Site:</strong> <a href="http://univercity4u.com/">univercity4u.com/</a>
    </address>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/undraw_Contact_us_re_4qqt.png"/>
</asp:Content>
