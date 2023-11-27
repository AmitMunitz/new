<%@ Page Title="" Language="C#" MasterPageFile="~/sql.Master" AutoEventWireup="true" CodeBehind="Sort.aspx.cs" Inherits="End_Project.Sort" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <% if (Session["Admin"] != null && (bool)Session["Admin"]){ %>
                <br />
                <br />
                <br />
                <br />
        <center>
                <div id="display1Div" runat="server"></div>
        </center>
                <table style="position: fixed; right:40%; bottom: 35%;">
                    <tr>
                        <td>
                            <label for="sort">Sort By:</label>
                            <select name="sort" id="sort" required="required">
                            <option value="FirstName">FirstName</option>
                            <option value="LastName">LastName</option>
                            <option value="Username">UserName</option>
                            <option value="PLA">PLA</option>
                            <option value="Email">Email</option>
                            <option value="Color">Color</option>
                            <option value="Address">Address</option>
                            <option value="ID">ID</option>
                            <option value="Gender">Gender</option>
                            <option value="Birthday">BirthDay</option>
                            <option value="Admin">Admin</option>
                            </select>
                        </td> 
                        <td>
                            <label for="sort">Sort By:</label>
                            <select name="AscOrDesc" id="AscOrDesc" required="required">
                            <option value="asc">Ascending</option>
                            <option value="desc">Descending</option>
                            </select>

                        </td>   
                        <td style="color:rgb(84 135 191);"><input style="background-color:lightblue" type="submit" value="sortby" name="sortby" id="sortby"/></td>
                    </tr>  
                </table>
    <% } %>


    <% else { %>
           <p style="position: fixed; right:12%; bottom: 80%; font-size: 65px; color: coral;">Sorry, you do not have admin privileges to access this section.</p>
    <% } %> 

</asp:Content>
