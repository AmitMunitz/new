<%@ Page Title="" Language="C#" MasterPageFile="~/sql.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="End_Project.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">
        <% if (Session["Admin"] != null && (bool)Session["Admin"]){ %> 
                <span runat="server" id="errorMsg" style="position:fixed; bottom:80%; right:25%; font-size: 51px; color: red;" visible="false">No username matches the criteria, Please try again.</span>
                <span runat="server" id="errorMsg1" style="position:fixed; bottom:80%; right:13%; font-size: 51px; color: red;" visible="false">Either the username, firstname or lastname is incorrect. Please try again.</span>
                <center>
                <br /><br /><br /><br /><br /><br /><br /><br />
                       <div id="display1Div" runat="server"></div>
                </center>
            <table style="position: fixed; right:25%; bottom: 50%;">
                <tr>     
                    <td style="color:lightcoral;">UName<input type="text" name="Uname"/></td>
                    <td style="color:lightcoral;">FirstName<input type="text" name="firstNameDel"/></td>
                    <td style="color:lightcoral;">LastName<input type="text" name="lastNameDel"/></td>
                    <td style="background-color:lightcoral;"><input type="submit" value="AdvanceSearch" name="AdvanceSearch" /></td>
                </tr>
                <tr>
                    <td style="color:lightcoral;">UserName<input type="text" name="UserNameUpdate" /></td>
                    <td><input type="submit" value="StartWith" name="UpdateField" /></td>
                </tr>
            </table>
        <% } %>
        <% else { %>
               <p style="position: fixed; right:12%; bottom: 80%; font-size: 65px; color: coral;">Sorry, you do not have admin privileges to access this section.</p>
        <% } %> 

</asp:Content>
