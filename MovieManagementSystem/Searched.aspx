<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Searched.aspx.cs" Inherits="MovieManagementSystem.Searched" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
          .checked {
            color: orange;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
           
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" SelectCommand="SELECT [name] FROM [Movie]"></asp:SqlDataSource>
            <div class="container-fluid">
                <p class="btn btn-primary">Choose the movie</p> <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="dropdown btn btn-secondary dropdown-toggle">
            </asp:DropDownList>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="171px" Width="856px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Visible="False">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="name" HeaderText="Movie" SortExpression="name" />
                        <asp:BoundField DataField="url" HeaderText="URL" SortExpression="url" />
                        <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                        <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                        <asp:BoundField DataField="release_date" HeaderText="Release" SortExpression="release_date" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" SelectCommand="SELECT * FROM [Movie] WHERE ([name] = @name)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="name" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <br />
                <br />
                <br />
                <p class="btn btn-primary">Choose the Rating</p>
                <asp:DropDownList ID="RatingDropdown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RatingDropdown_SelectedIndexChanged" CssClass="dropdown btn btn-secondary dropdown-toggle">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSourceRating" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Movie] WHERE ([rating] = @rating)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RatingDropdown" Name="rating" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSourceRating" ForeColor="Black" GridLines="Vertical" Width="708px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="name" HeaderText="Movie" SortExpression="name" />
                        <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" Visible="False" />
                        <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                        <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                        <asp:BoundField DataField="release_date" HeaderText="release_date" SortExpression="release_date" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
              </div>
            </div>
    </form>
</body>
</html>
