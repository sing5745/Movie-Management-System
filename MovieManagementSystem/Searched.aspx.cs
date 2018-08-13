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

       
        protected void Page_Load(object sender, EventArgs e)
        {


        }

      



        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void RatingDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Visible = true;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
    }
