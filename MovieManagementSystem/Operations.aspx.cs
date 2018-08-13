using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieManagementSystem
{
    public partial class TestWebForm : System.Web.UI.Page
    {
        string[] genres = { "HORROR", "COMEDY", "DRAMA", "KIDS", "DOCUMENTARY", "TRAVEL", "SCI-FI", "POETRY", "ACTION" };
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string url = ((TextBox)(row.Cells[3].Controls[0])).Text;


            Regex regex = new Regex(@"^(?:https?\:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v\=))([\w-]{10,12})(?:$|\&|\?\#).*");
            Match match = regex.Match(url);

            if (!match.Success)
            {
                e.Cancel = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + "Please add valid url" + "')", true);
            }

            string movie = ((TextBox)(row.Cells[2].Controls[0])).Text;

            if (movie.Equals(""))
            {
                e.Cancel = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + "Please add the movie name" + "')", true);
            }

            int rat;
            //int rating = ((TextBox)(row.Cells[4].Controls[0])).Text;

            bool result = Int32.TryParse(((TextBox)(row.Cells[5].Controls[0])).Text, out rat);

            if (!(result == true && rat >= 1 && rat <= 5))
            {
                e.Cancel = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + "Please enter valid rating" + "')", true);
            }

            string genre = ((TextBox)(row.Cells[4].Controls[0])).Text;

           

            int pos = Array.IndexOf(genres, genre.ToUpper());
            if (!(pos > -1))
            {
                e.Cancel = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + "Please enter valid genre" + "')", true);
            }

            






        }
    }
}