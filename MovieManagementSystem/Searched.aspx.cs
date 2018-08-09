using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieManagementSystem
{
    public partial class Searched : System.Web.UI.Page
    {



        List<Movie> moviesList = new List<Movie>();
        public void SetList(List<Movie> m)
        {
            this.moviesList = m;
        }

        public List<Movie> GetList()
        {
            return this.moviesList;
        }

        public List<Movie> MoviesList
        {
            get { return movieList; }
            set { movieList = value; }
        }

        List<Movie> movieList = new List<Movie>();

        List<Movie> AllMovie = new List<Movie>();
        List<Movie> m = new List<Movie>();
        protected void Page_Load(object sender, EventArgs e)
        {


        }

      



        protected void BtnSearch_Click(object sender, EventArgs e)
        {
           
                //List<Movie> m2 = new List<Movie>();
                /*
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MovieDBConnectionString"].ConnectionString))
                {
                    conn.Open();
                    
                    SqlDataAdapter sd = new SqlDataAdapter("Select * from Movie where name='" + "3 Idiots" + "'", conn);
                    DataTable st = new DataTable();
                    sd.Fill(st);
                    gd.DataSource = st;
                    gd.DataBind();
                    gd.Visible = true;

                   conn.Close();
                }
                */
           







            Response.Redirect("Searched");
            }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void RatingDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Visible = true;
        }
    }
    }
