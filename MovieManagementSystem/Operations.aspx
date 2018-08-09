<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Operations.aspx.cs" Inherits="MovieManagementSystem.TestWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Operations</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
      <div class="text-center">
            <h1>Update/Delete Movie</h1>
       </div>
   
    
    <nav class="navbar navbar-expand-sm bg-dark">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="home.html">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ShowData">View</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="AddMovie">Add</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Searched">Search</a>
        </li>
      </ul>
    </nav>
    <br /><br />
    <div class="container-fluid">
         <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataMovies" CssClass="table table-striped" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="name" HeaderText="Movie" SortExpression="name" />
                    <asp:BoundField DataField="url" HeaderText="URL" SortExpression="url" />
                    <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                    <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                    <asp:BoundField DataField="release_date" HeaderText="Release" SortExpression="release_date" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataMovies" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" DeleteCommand="DELETE FROM [Movie] WHERE [Id] = @original_Id AND [name] = @original_name AND [url] = @original_url AND (([genre] = @original_genre) OR ([genre] IS NULL AND @original_genre IS NULL)) AND (([rating] = @original_rating) OR ([rating] IS NULL AND @original_rating IS NULL)) AND (([release_date] = @original_release_date) OR ([release_date] IS NULL AND @original_release_date IS NULL))" InsertCommand="INSERT INTO [Movie] ([name], [url], [genre], [rating], [release_date]) VALUES (@name, @url, @genre, @rating, @release_date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Movie]" UpdateCommand="UPDATE [Movie] SET [name] = @name, [url] = @url, [genre] = @genre, [rating] = @rating, [release_date] = @release_date WHERE [Id] = @original_Id AND [name] = @original_name AND [url] = @original_url AND (([genre] = @original_genre) OR ([genre] IS NULL AND @original_genre IS NULL)) AND (([rating] = @original_rating) OR ([rating] IS NULL AND @original_rating IS NULL)) AND (([release_date] = @original_release_date) OR ([release_date] IS NULL AND @original_release_date IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_url" Type="String" />
                    <asp:Parameter Name="original_genre" Type="String" />
                    <asp:Parameter Name="original_rating" Type="String" />
                    <asp:Parameter Name="original_release_date" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="genre" Type="String" />
                    <asp:Parameter Name="rating" Type="String" />
                    <asp:Parameter Name="release_date" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="genre" Type="String" />
                    <asp:Parameter Name="rating" Type="String" />
                    <asp:Parameter Name="release_date" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_url" Type="String" />
                    <asp:Parameter Name="original_genre" Type="String" />
                    <asp:Parameter Name="original_rating" Type="String" />
                    <asp:Parameter Name="original_release_date" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    </div>
   
</body>
</html>
