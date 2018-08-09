<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowData.aspx.cs" Inherits="MovieManagementSystem.ShowData" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Data</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* Remove the navbar's default rounded borders and increase the bottom margin */
        .navbar {
            margin-bottom: 50px;
            border-radius: 0;
        }

        /* Remove the jumbotron's default bottom margin */
        .jumbotron {
            margin-bottom: 0;
        }

        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }

        .checked {
            color: orange;
        }

        .test{
            text-align: center;
        }

        .left{
            text-align: left;
        }
    </style>
</head>
<body>

    <div class="jumbotron">
        <div class="container text-center">
            <h1>Moviezzz</h1>
        </div>
    </div>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="home.html">Home</a></li>
                    <li><a href="AddMovie">Add</a></li>
                    <li><a href="Operations">Update/Delete</a></li>
                    <li><a href="Searched">Search</a></li>
                    
                </ul>

            </div>
        </div>
    </nav>

    <form id="form2" runat="server">
         <div class="container">
        <div class="row">
           <% 
               
               foreach(var item in GetMovies())
               {
                   Response.Write("<div class=\"col-sm-4\">\n" +
"                <div class=\"panel panel-danger\">\n" +
"                    <div class=\"panel-heading\">" + item.Name + "</div>\n" +
"                    <div class=\"panel-body\"><img src=\"" + item.Url + "\"class=\"img-responsive\" style=\"width:100%\" alt=\"Image\"></div><div class=\"panel-footer\"><p class='test'>Genre: " + item.Genre +"</p><p class='test'>Rating: " );

                   for (int i = 0; i < item.Rating; i++)
                   {
                       Response.Write(
                   "                        <span class=\"fa fa-star checked\"></span>\n");
                   }

                   for (int i = 0; i < 5 - item.Rating; i++)
                   {
                       Response.Write(
                   "                        <span class=\"fa fa-star \"></span>\n");
                   }

                   Response.Write("\n" +
                   "               </p><p class='test'>Release Date: " + item.Date +"</p></div> </div>\n" +
                   "            </div>");
               }
               %>
  
        </div>
    </div><br><br>

   
   

    <footer class="container-fluid text-center">
        <div class="form-inline">
            Get Deals:
            <input runat="server" type="email" id="email" class="form-control" size="50" placeholder="Email Address">
            <asp:Button class="btn btn-danger" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click1" />
        </div>
    </footer>
     </form>

</body>
</html>
