<%@ Page Title="Statistici contracte" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Grafic.aspx.cs" Inherits="Proiect_BDI.Grafic" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div style="margin-top:35px">
    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control center-block" ForeColor="Black" Font-Bold="False">
        <asp:ListItem>-- Alege ce vrei să afișezi pe grafic --</asp:ListItem>
        <asp:ListItem>Valoarea medie a creditelor in functie de tipul de credit si sex</asp:ListItem>
        <asp:ListItem>Suma tuturor creditelor pentru fiecare client</asp:ListItem>
    </asp:DropDownList>
        </div>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/undraw_Data_report_re_p4so.png" CssClass="center-block"/>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Visible="False" Width="1000px" Height="600px" Palette="Berry" CssClass="center-block">
        <series>
            <asp:Series ChartType="StackedColumn" Name="Series1" XValueMember="x" YValueMembers="y">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BANCAConnectionString %>" SelectCommand="SELECT concat('Sex ',cl.sex, ', ', c.tip) as x, avg(valoare) as y FROM [Contracte] c, [Clienti] cl WHERE cl.[Id]=c.[IdClient] group by cl.sex, c.tip"></asp:SqlDataSource>
    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Visible="False" Width="1000px" Height="600px" Palette="EarthTones" CssClass="center-block" >
        <series>
            <asp:Series Name="Series1" XValueMember="nume" YValueMembers="total_Credite">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BANCAConnectionString %>" SelectCommand="SELECT replace(CONCAT(cl.Nume, cl.Prenume),'  ','') as nume, sum(valoare) as total_Credite FROM [Contracte] c, [Clienti] cl WHERE cl.[Id]=c.[IdClient] group by cl.nume, cl.prenume"></asp:SqlDataSource>
</asp:Content>
