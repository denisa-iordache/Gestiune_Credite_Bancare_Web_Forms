using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class Grafic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                Image1.Visible = true;
                Chart1.Visible = false;
                Chart2.Visible = false;
            }
            else if (DropDownList1.SelectedIndex == 1)
            {
                Image1.Visible = false;
                Chart2.Visible = false;
                Chart1.Visible = true;
            }
            else
            {
                Image1.Visible = false;
                Chart2.Visible = true;
                Chart1.Visible = false;
            }
        }
    }
}