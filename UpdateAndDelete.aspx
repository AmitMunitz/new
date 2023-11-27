<%@ Page Title="" Language="C#" MasterPageFile="~/sql.Master" AutoEventWireup="true" CodeBehind="UpdateAndDelete.aspx.cs" Inherits="End_Project.UpdateAndDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">
        <% if (Session["Admin"] != null && (bool)Session["Admin"]){ %> 
                <center>
                    <br /><br /><br /><br /><br /><br /><br />
                    <div id="display1Div" runat="server"></div>
                    <table>
                        <tr>
                            <td>UserName<input type="text" name="UsernameDel"/></td>
                            <td>Password<input type="text" name="PLADel"/></td>
                            <td colspan="2"><input type="submit" value="Delete" name="Delete" /></td>
                        </tr>
                        <tr>
                            <td>UserName<input type="text" name="UserNameUpdate" /></td>
                            <td>
                                <label for="FieldNameUpdate">FieldName</label>
                                <select name="FieldNameUpdate" id="FieldNameUpdate" required="required" style="width:66%;">
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
                                </select>
                            </td>
                            <td>Value<input type="text"  name="ValueUpdate" /></td>
                            <td><input type="submit" value="UpdateField" name="UpdateField" /></td>      
                        </tr>                                                                             
                    </table>
                </center>
        <% } %>       
        <% else { %>
               <p style="position: fixed; right:12%; bottom: 80%; font-size: 65px; color: coral;">Sorry, you do not have admin privileges to access this section.</p>
        <% } %> 
</asp:Content>
