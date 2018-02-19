<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
            $("#DateBox").click(function () {
                $("#calenddiv").slideDown(500);
            });
            
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id ="main">
             Enter name : <asp:TextBox ID="txtName" runat="server" CssClass ="boxes"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredNameValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Must Enter Name"></asp:RequiredFieldValidator>
             <br />
             Enter email : <asp:TextBox ID="txtEmail" runat="server" CssClass ="boxes"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Must enter email"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Must Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             <br />
            <div id="DateBox"> 
             Enter date : <asp:TextBox ID="txtDate" runat="server" CssClass ="boxes"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredDateValidator" runat="server" ControlToValidate="txtDate" ErrorMessage="Enter date!"></asp:RequiredFieldValidator>
            </div>
            <br />
            
            <div id ="calenddiv" style="display:none">
                  <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </div>


           
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnCalender_Click" />
             <br />
        
       
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="DateAdded" HeaderText="DateAdded" SortExpression="DateAdded" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:personTableConnectionString %>" DeleteCommand="DELETE FROM [PersonTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PersonTable] ([Name], [Email], [DateAdded]) VALUES (@Name, @Email, @DateAdded)" SelectCommand="SELECT [Id], [Name], [Email], [DateAdded] FROM [PersonTable]" UpdateCommand="UPDATE [PersonTable] SET [Name] = @Name, [Email] = @Email, [DateAdded] = @DateAdded WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter DbType="Date" Name="DateAdded" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter DbType="Date" Name="DateAdded" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
       </div>
       
    </form>
</body>
</html>
