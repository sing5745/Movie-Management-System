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
    public partial class ShowData : System.Web.UI.Page
    {
        List<Movie> movies = new List<Movie>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Movie> GetMovies()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDBConnectionString"].ConnectionString))
            {
                conn.Open();
                string query = "select * from Movie";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Movie m = new Movie { Name = rdr[1].ToString(),  Url = rdr[2].ToString(), Genre = rdr[3].ToString(), Rating = Convert.ToInt32(rdr[4]), Date = rdr[5].ToString() };

                    movies.Add(m);
                    //m.Name = rdr[2].ToString();
                }
                conn.Close();

                

            }
            return movies;
        }

       

        protected void Button1_Click1(object sender, EventArgs e)
        {
            var fromAddress = new MailAddress("infomoviemanagement@gmail.com", "Movie Management");
            var toAddress = new MailAddress(email.Value);
            const string fromPassword = "Moviesystem";
            const string subject = "Signing Up";
            const string body = "Thanks for signing Up. Will get you notify.";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thank You for signing up')", true);
        }
    }
}