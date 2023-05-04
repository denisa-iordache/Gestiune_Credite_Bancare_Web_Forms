<%@ Page Title="Angajații băncii" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Angajati.aspx.cs" Inherits="Proiect_BDI.Angajati" %>

<script language="C#" runat="server">
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow linie in GridView1.Rows)
        {
            if (linie.RowIndex == GridView1.SelectedIndex)
            {
                linie.BackColor = System.Drawing.ColorTranslator.FromHtml("#5bc0de");
            }
            else
            {
                linie.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
            }
        }
    }
</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="container">
        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCommand="GridView1_RowCommand" ShowFooter="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="Nume" SortExpression="Nume">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nume") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbNume" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Introduceti minim 3 caractere!" ControlToValidate="tbNume" ValidationExpression="[\s\S]{3,50}"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nume") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prenume" SortExpression="Prenume">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Prenume") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbPrenume" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Introduceti minim 3 caractere!"  ControlToValidate="tbPrenume" ValidationExpression="[\s\S]{3,50}"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Prenume") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telefon" SortExpression="Telefon">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Telefon") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbTelefon" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Un număr de telefon valid are 10 cifre!" ControlToValidate="tbTelefon" ValidationExpression="\d{1,10}"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Telefon") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Emailul trebuie să fie de forma exemplu@exemplu.com!" ControlToValidate="tbEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:TemplateField>
                    <FooterTemplate>
                        <asp:Button ID="btnAdauga" runat="server" CommandName="ADD" Text="Adauga" CssClass="btn btn-primary btn-sm" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BorderStyle="Solid" BackColor="WhiteSmoke" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BANCAConnectionString %>" SelectCommand="SELECT * FROM [Angajati] ORDER BY [Nume]" DeleteCommand="DELETE FROM Angajati WHERE (Id=@Id)" UpdateCommand="UPDATE Angajati SET Nume= @Nume, Prenume = @Prenume, Telefon = @Telefon, Email = @Email WHERE (Id = @Id)">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nume" />
                <asp:Parameter Name="Prenume" />
                <asp:Parameter Name="Telefon" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Id" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
