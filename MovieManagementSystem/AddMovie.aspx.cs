using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieManagementSystem
{
    public partial class AddMovie : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddMovie_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDBConnectionString"].ConnectionString);
            cmd = new SqlCommand("Insert into movie values(@name,@url,@genre,@rating,@release_date)", conn);
            conn.Open();

            //cmd.Parameters.AddWithValue();
            cmd.Parameters.AddWithValue("@name", title.Value);
            cmd.Parameters.AddWithValue("@url", url.Value);
            cmd.Parameters.AddWithValue("@genre", genre.Value);
            cmd.Parameters.AddWithValue("@rating", int.Parse(rating.Value));
            cmd.Parameters.AddWithValue("@release_date", releasedate.Value);

            cmd.ExecuteNonQuery();
            conn.Close();

           

            Response.Redirect("ShowData.aspx");

           


        }
    }
}