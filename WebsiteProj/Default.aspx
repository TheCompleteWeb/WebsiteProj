<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             Enter name : <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredNameValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Must Enter Name"></asp:RequiredFieldValidator>
             <br />
             Enter email : <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Must enter email"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Must Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             <br />
             Enter date : <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredDateValidator" runat="server" ControlToValidate="txtDate" ErrorMessage="Enter date!"></asp:RequiredFieldValidator>
             <br />
             <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
             <asp:Button ID="btnCalender" runat="server" Text="Submit" />
             <br />
        </div>
       
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
       
    </form>
</body>
</html>
