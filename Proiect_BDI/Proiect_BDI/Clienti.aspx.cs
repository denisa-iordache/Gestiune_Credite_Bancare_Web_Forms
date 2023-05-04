using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class Clienti : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdauga_Click(object sender, EventArgs e)
        {
            string nume = ((TextBox)GridView1.FooterRow.FindControl("tbNume")).Text;
            string prenume = ((TextBox)GridView1.FooterRow.FindControl("tbPrenume")).Text;
            string telefon = ((TextBox)GridView1.FooterRow.FindControl("tbTelefon")).Text;
            string email = ((TextBox)GridView1.FooterRow.FindControl("tbEmail")).Text;
            string dataNasterii = ((TextBox)GridView1.FooterRow.FindControl("tbDataNastere")).Text;
            string CNP = ((TextBox)GridView1.FooterRow.FindControl("tbCNP")).Text;
            //((TextBox)GridView1.FooterRow.FindControl("tbVarsta")).Text = GetAge(dataNasterii).ToString();
            string varsta = ((TextBox)GridView1.FooterRow.FindControl("tbVarsta")).Text;
            string venit = ((TextBox)GridView1.FooterRow.FindControl("tbVenit")).Text;
            string sex = ((RadioButtonList)GridView1.FooterRow.FindControl("RadioButtonList1")).SelectedValue;
            string stareCivila = ((RadioButtonList)GridView1.FooterRow.FindControl("RadioButtonList2")).SelectedValue;

            string connectionString = ConfigurationManager.ConnectionStrings["BANCAConnectionString"].ConnectionString;

            string query = @"INSERT into clienti(nume, prenume, telefon, email, dataNasterii, CNP, varsta, venitNet, sex, stareCivila) 
                             VALUES (@nume, @prenume, @telefon, @email, convert(datetime,@dataNasterii,105), @CNP, @varsta, @venit, @sex, @stareCivila)";

            SqlConnection conexiuneaInsert = new SqlConnection(connectionString);

            SqlCommand comandaInsert = new SqlCommand(query, conexiuneaInsert);

            comandaInsert.Parameters.AddWithValue("@nume", nume);
            comandaInsert.Parameters.AddWithValue("@prenume", prenume);
            comandaInsert.Parameters.AddWithValue("@telefon", telefon);
            comandaInsert.Parameters.AddWithValue("@dataNasterii", dataNasterii);
            comandaInsert.Parameters.AddWithValue("@CNP", CNP);
            comandaInsert.Parameters.AddWithValue("@varsta", varsta);
            comandaInsert.Parameters.AddWithValue("@venit", venit);
            comandaInsert.Parameters.AddWithValue("@sex", sex);
            comandaInsert.Parameters.AddWithValue("@stareCivila", stareCivila);
            comandaInsert.Parameters.AddWithValue("@email", email);

            conexiuneaInsert.Open();

            comandaInsert.ExecuteNonQuery();

            conexiuneaInsert.Close();

            GridView1.DataBind();
        }

        private int GetAge(string dataNasterii)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BANCAConnectionString"].ConnectionString;


            SqlConnection conexiuneaInsert = new SqlConnection(connectionString);

            SqlCommand comandaInsert = new SqlCommand("get_age", conexiuneaInsert);

            comandaInsert.CommandType = System.Data.CommandType.StoredProcedure;

            comandaInsert.Parameters.AddWithValue("@dataNasterii", dataNasterii);
            comandaInsert.Parameters.Add("@year", SqlDbType.Int);
            comandaInsert.Parameters[1].Direction = ParameterDirection.Output;

            conexiuneaInsert.Open();
            comandaInsert.ExecuteScalar();
            int result = (int)comandaInsert.Parameters[1].Value;

            conexiuneaInsert.Close();
            return result;

        }

        protected void tbDataNastere_TextChanged1(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(((TextBox)GridView1.FooterRow.FindControl("tbDataNastere")).Text.Trim()))
            {
                ((TextBox)GridView1.FooterRow.FindControl("tbVarsta")).Text = string.Empty;
                return;
            }
            ((TextBox)GridView1.FooterRow.FindControl("tbVarsta")).Text = GetAge(((TextBox)GridView1.FooterRow.FindControl("tbDataNastere")).Text).ToString();
        }
    }
}