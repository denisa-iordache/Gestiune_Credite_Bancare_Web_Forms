<%@ Page Title="Contracte de credit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contracte.aspx.cs" Inherits="Proiect_BDI.Contracte" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .rm-margin {
            margin-left: 0 !important;
            margin-right: 0 !important;
        }
    </style>
    <style>
        body {
            margin-left: 50px;
            margin-right: 50px;
        }

        .container {
            justify-content: center;
        }
    </style>
    <h2><%: Title %></h2>
    <div class="container">
        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,IdClient,IdAngajat" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCommand="GridView1_RowCommand" ShowFooter="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="IdAngajat" HeaderText="IdAngajat" SortExpression="IdAngajat" Visible="False" />
            <asp:BoundField DataField="IdClient" HeaderText="IdClient" SortExpression="IdClient" Visible="False" />
            <asp:TemplateField HeaderText="Tip" SortExpression="Tip">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Tip") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="200px">
                        <asp:ListItem>Credit imobiliar</asp:ListItem>
                        <asp:ListItem>Credit de nevoi persoanale</asp:ListItem>
                        <asp:ListItem>Leasing auto</asp:ListItem>
                        <asp:ListItem>Credit pentru studii</asp:ListItem>
                        <asp:ListItem>Credit auto</asp:ListItem>
                    </asp:RadioButtonList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Tip") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data semnarii" SortExpression="DataSemnarii">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DataSemnarii") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DataSemnarii", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data scadenta" SortExpression="DataScadenta">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DataScadenta") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DataScadenta", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valoare" SortExpression="Valoare">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Valoare") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbValoare" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Valoare") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Numar rate" SortExpression="NrRate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NrRate") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbNrRate" runat="server" Visible="False"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("NrRate") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rata dobanzii" SortExpression="RataDobanzii">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("RataDobanzii") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbRata" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("RataDobanzii") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Angajat" SortExpression="Column1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Column1") %>' ReadOnly="True"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Column1" DataValueField="Column1" Width="125px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BANCAConnectionString %>" SelectCommand="select replace(concat(Nume, Prenume),'  ','') from angajati"></asp:SqlDataSource>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Column1") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Client" SortExpression="Column2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Column2") %>' ReadOnly="True"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Column1" DataValueField="Column1" Width="150px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BANCAConnectionString %>" SelectCommand="select replace(concat(Nume, Prenume), '  ', '') from clienti"></asp:SqlDataSource>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Column2") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:TemplateField>
                <FooterTemplate>
                    <asp:Button ID="btnAdauga" runat="server" CommandName="ADD" CssClass="btn btn-primary btn-sm" Text="Adauga" />
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
        </Columns>
            <HeaderStyle BorderStyle="Solid" BackColor="WhiteSmoke"/>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BANCAConnectionString %>" SelectCommand="SELECT c.[Id], [Tip], [DataSemnarii], [DataScadenta], [Valoare], [NrRate], [RataDobanzii], [IdAngajat], [IdClient], replace(CONCAT(a.[Nume], a.[Prenume]),'  ', ''), replace(CONCAT(cl.[Nume], cl.[Prenume]),'  ', '') FROM [Contracte] c, [Angajati] a, [Clienti] cl WHERE a.[Id]=c.[IdAngajat] AND cl.[Id]=c.[IdClient]" DeleteCommand="DELETE FROM Contracte WHERE (Id = @Id)" UpdateCommand="UPDATE Contracte SET Tip= @Tip, 
DataSemnarii = convert(datetime,@DataSemnarii,105), 
DataScadenta= convert(datetime,@DataScadenta,105), 
Valoare = @Valoare, 
NrRate= @NrRate,
RataDobanzii= @RataDobanzii, 
IdAngajat= @IdAngajat, 
IdClient=@IdClient
WHERE (Id = @Id)">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Tip" />
                <asp:Parameter Name="DataSemnarii" />
                <asp:Parameter Name="DataScadenta" />
                <asp:Parameter Name="Valoare" />
                <asp:Parameter Name="NrRate" />
                <asp:Parameter Name="RataDobanzii" />
                <asp:Parameter Name="Id" />
                <asp:Parameter Name="IdAngajat" />
                <asp:Parameter Name="IdClient" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
