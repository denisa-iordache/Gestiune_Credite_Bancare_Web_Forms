using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Proiect_BDI
{
    public partial class Edit : System.Web.UI.Page
    {
        int idClient;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    idClient = Convert.ToInt32(Request.QueryString["ID"]);
                    tbID.Text = idClient.ToString();

                    string connectionString = ConfigurationManager.ConnectionStrings["BANCAConnectionString"].ConnectionString;

                    SqlConnection conn = new SqlConnection(connectionString);

                    conn.Open();

                    string query = "select * from clienti where id=@id";

                    SqlCommand comanda = new SqlCommand(query, conn);

                    SqlParameter param = new SqlParameter();
                    param.ParameterName = "ID";
                    param.Value = idClient;
                    comanda.Parameters.Add(param);

                    SqlDataReader dr = comanda.ExecuteReader();

                    if (dr.Read())
                    {
                        tbNume.Text = dr["nume"].ToString();
                        tbPrenume.Text = dr["prenume"].ToString();
                        tbTelefon.Text = dr["telefon"].ToString();
                        tbEmail.Text = dr["email"].ToString();
                        tbDataNastere.Text = dr["datanasterii"].ToString();
                        tbCNP.Text = dr["CNP"].ToString();
                        tbVarsta.Text = dr["varsta"].ToString();
                        tbVenit.Text = dr["venitnet"].ToString();
                        RadioButtonList1.SelectedValue = dr["sex"].ToString();
                        RadioButtonList2.SelectedValue = dr["starecivila"].ToString();
                    }


                    conn.Close();
                }
            }
            else
            {
                Raspuns.Visible = true;
                Raspuns.InnerHtml += " cu numele " + tbNume.Text + " " + tbPrenume.Text + " a fost actualizat!";
                HyperLink1.Visible = true;
                Table1.Visible = false;
                Button1.Visible = false;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BANCAConnectionString"].ConnectionString;

            string query = @"UPDATE Clienti SET Nume= @Nume, Prenume = @Prenume, Telefon = @Telefon, Email = @Email, DataNasterii= convert(datetime,@DataNasterii,105), CNP= @CNP, Varsta= @Varsta, VenitNet= @VenitNet, Sex= @Sex, StareCivila= @StareCivila  WHERE (Id = @Id)";


            string nume = tbNume.Text;
            string prenume = tbPrenume.Text;
            string telefon = tbTelefon.Text;
            string email = tbEmail.Text;
            string dataNasterii = tbDataNastere.Text;
            tbVarsta.Text = GetAge(dataNasterii).ToString();
            string CNP = tbCNP.Text;
            string varsta = tbVarsta.Text;
            string venit = tbVenit.Text;
            string sex = RadioButtonList1.SelectedValue;
            string stareCivila = RadioButtonList2.SelectedValue;

            SqlConnection conexiuneaUpdate = new SqlConnection(connectionString);

            SqlCommand comandaUpdate = new SqlCommand(query, conexiuneaUpdate);

            comandaUpdate.Parameters.AddWithValue("@nume", nume);
            comandaUpdate.Parameters.AddWithValue("@prenume", prenume);
            comandaUpdate.Parameters.AddWithValue("@telefon", telefon);
            comandaUpdate.Parameters.AddWithValue("@email", email);
            comandaUpdate.Parameters.AddWithValue("@dataNasterii", dataNasterii);
            comandaUpdate.Parameters.AddWithValue("@CNP", CNP);
            comandaUpdate.Parameters.AddWithValue("@varsta", varsta);
            comandaUpdate.Parameters.AddWithValue("@venitnet", venit);
            comandaUpdate.Parameters.AddWithValue("@sex", sex);
            comandaUpdate.Parameters.AddWithValue("@stareCivila", stareCivila);
            comandaUpdate.Parameters.AddWithValue("@id", tbID.Text);

            conexiuneaUpdate.Open();

            comandaUpdate.ExecuteNonQuery();

            conexiuneaUpdate.Close();
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
    }
}