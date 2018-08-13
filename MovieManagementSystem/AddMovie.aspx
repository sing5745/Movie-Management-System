<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMovie.aspx.cs" Inherits="MovieManagementSystem.AddMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <title>Add Book</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
  
    
      
        <div class="text-center">
            <h1>Add Movie</h1>
       </div>
   
    
    <nav class="navbar navbar-expand-sm bg-dark">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="home.html">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Operations">Update/Delete</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ShowData">View</a>
        </li
        <li class="nav-item">
          <a class="nav-link" href="Searched">Search</a>
        </li>
      </ul>
    </nav>
    <div class="container-fluid">
        <form class="form-horizontal" id="form2" runat="server">
        <div class="form-group" >
          <label for="title">Title:</label>
          <input type="text" runat="server" class="form-control" id="title" /> 
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorMovie" runat="server" ErrorMessage="Please provide movie name" ControlToValidate="title" Display="Dynamic" ForeColor="#CC3300">

          </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
          <label for="url">Video url:</label>
          <input type="url" runat="server" class="form-control" id="url" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid youtube url?" ForeColor="#CC3300" ControlToValidate="url" Display="Dynamic" ValidationExpression="^(?:https?\:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v\=))([\w-]{10,12})(?:$|\&amp;|\?\#).*"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
          <label for="rating">Rating:</label>
          <select class="form-control" runat="server" id="rating" name="rating" >
                    <option>1</option>
         		    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
          </select>
        </div>
        <div class="form-group">
          <label for="genre">Select Genre:</label>
          <select class="form-control" runat="server" id="genre" name="genre">
                    <option>Comedy</option>
         		    <option>Kids</option>
                    <option>Drama</option>
                    <option>Action</option>
                    <option>Documentary</option>
                    <option>Romantic</option>
                    <option>Sci-Fi</option>
                   <option>Travel</option>
                     <option>Horror</option>
          </select>
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorGenre" runat="server" ErrorMessage="Please choose genre" ControlToValidate="genre" Display="Dynamic" ForeColor="#CC3300">

          </asp:RequiredFieldValidator>
        </div>
            <div class="form-group">
                 <label for="date">Release Date:</label>
                    <input type='date'  runat="server" id="releasedate" class="form-control" />
            </div>
        
            <asp:Button ID="btnAddMovie" runat="server" Text="Add Movie" CssClass="btn btn-success" OnClick="btnAddMovie_Click" />
    </form>
    </div>

    
     
</body>
    <script>
$(document).ready(function(){
    
        $("#myModal").modal();
   
});
</script>
</html>


