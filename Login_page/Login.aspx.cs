using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Data.SqlClient;

namespace Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=P2023-PC000114\\SQLEXPRESS;Database= CMS;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("Select * from Users where username=@username and password=@password", con);
            cmd.Parameters.AddWithValue("@username", TextUsername.Text);
            cmd.Parameters.AddWithValue("@password", TextPassword.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");
            if (ds.Tables["Users"].Rows.Count == 0)
            {
                Response.Write("Invalid user");
            }
            else
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}