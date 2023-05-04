using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class Angajati : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ADD")
            {
                string nume = ((TextBox)GridView1.FooterRow.FindControl("tbNume")).Text;
                string prenume = ((TextBox)GridView1.FooterRow.FindControl("tbPrenume")).Text;
                string telefon = ((TextBox)GridView1.FooterRow.FindControl("tbTelefon")).Text;
                string email = ((TextBox)GridView1.FooterRow.FindControl("tbEmail")).Text;

                string connectionString = ConfigurationManager.ConnectionStrings["BANCAConnectionString"].ConnectionString;

                string query = @"INSERT into angajati(nume, prenume, telefon, email) VALUES (@nume, @prenume, @telefon, @email)";

                SqlConnection conexiuneaInsert = new SqlConnection(connectionString);

                SqlCommand comandaInsert = new SqlCommand(query, conexiuneaInsert);

                comandaInsert.Parameters.AddWithValue("@nume", nume);
                comandaInsert.Parameters.AddWithValue("@prenume", prenume);
                comandaInsert.Parameters.AddWithValue("@telefon", telefon);
                comandaInsert.Parameters.AddWithValue("@email", email);

                conexiuneaInsert.Open();

                comandaInsert.ExecuteNonQuery();

                conexiuneaInsert.Close();

                GridView1.DataBind();
            }
        }
    }
}