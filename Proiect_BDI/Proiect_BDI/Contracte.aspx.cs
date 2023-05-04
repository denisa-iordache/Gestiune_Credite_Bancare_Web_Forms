using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class Contracte : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ADD")
            {
                string tip = ((RadioButtonList)GridView1.FooterRow.FindControl("RadioButtonList1")).SelectedValue;
                string dataSemnare = ((Calendar)GridView1.FooterRow.FindControl("Calendar1")).SelectedDate.ToString();
                string dataExpirare = ((Calendar)GridView1.FooterRow.FindControl("Calendar2")).SelectedDate.ToString();
                string valoare = ((TextBox)GridView1.FooterRow.FindControl("tbValoare")).Text;
                ((TextBox)GridView1.FooterRow.FindControl("tbNrRate")).Text = GetMonths(dataSemnare, dataExpirare).ToString();
                string nrRate = ((TextBox)GridView1.FooterRow.FindControl("tbNrRate")).Text;
                string rataDobanzii = ((TextBox)GridView1.FooterRow.FindControl("tbRata")).Text;
                string angajat = ((RadioButtonList)GridView1.FooterRow.FindControl("RadioButtonList3")).SelectedValue;
                string client = ((RadioButtonList)GridView1.FooterRow.FindControl("RadioButtonList2")).SelectedValue;

                AdaugaContractSP(tip, dataSemnare, dataExpirare, valoare, nrRate, rataDobanzii, angajat, client);
            }
        }

        private void AdaugaContractSP(string tip, string dataSemnare, string dataExpirare, string valoare, string nrRate, string rataDobanzii, string angajat, string client)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BANCAConnectionString"].ConnectionString;


            SqlConnection conexiuneaInsert = new SqlConnection(connectionString);

            SqlCommand comandaInsert = new SqlCommand("sp_insert_contracte", conexiuneaInsert);

            comandaInsert.CommandType = System.Data.CommandType.StoredProcedure;

            comandaInsert.Parameters.AddWithValue("@tip", tip);
            comandaInsert.Parameters.AddWithValue("@dataSemnare", dataSemnare);
            comandaInsert.Parameters.AddWithValue("@dataExpirare", dataExpirare);
            comandaInsert.Parameters.AddWithValue("@valoare", valoare);
            comandaInsert.Parameters.AddWithValue("@nrRate", nrRate);
            comandaInsert.Parameters.AddWithValue("@rataDobanzii", rataDobanzii);
            comandaInsert.Parameters.AddWithValue("@angajat", angajat);
            comandaInsert.Parameters.AddWithValue("@client", client);

            conexiuneaInsert.Open();

            comandaInsert.ExecuteNonQuery();

            conexiuneaInsert.Close();

            GridView1.DataBind();

        }

        private int GetMonths(string dataSemnarii, string dataScadenta)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BANCAConnectionString"].ConnectionString;


            SqlConnection conexiuneaInsert = new SqlConnection(connectionString);

            SqlCommand comandaInsert = new SqlCommand("get_months", conexiuneaInsert);

            comandaInsert.CommandType = System.Data.CommandType.StoredProcedure;

            comandaInsert.Parameters.AddWithValue("@dataSemnarii", dataSemnarii);
            comandaInsert.Parameters.AddWithValue("@dataScadenta", dataScadenta);
            comandaInsert.Parameters.Add("@year", SqlDbType.Int);
            comandaInsert.Parameters[2].Direction = ParameterDirection.Output;

            conexiuneaInsert.Open();
            comandaInsert.ExecuteScalar();
            int result = (int)comandaInsert.Parameters[2].Value;

            conexiuneaInsert.Close();
            return result;

        }
    }
}