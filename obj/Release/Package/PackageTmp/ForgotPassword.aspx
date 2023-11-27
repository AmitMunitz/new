<%@ Page Title="" Language="C#" MasterPageFile="~/sql.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="End_Project.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <br /><br /><br /><br /><br /><br /><br />
        <center>
    <span runat="server" id="errorMsg" style="font-size: 51px; color: red;" visible="false">Either the username or email is incorrect. Please try again.</span>
    <div id="display1Div" runat="server"></div>
        </center>

            <table style="color:cadetblue; position: fixed; right:44%; bottom: 65%;">
        <tr>
            <td>
                User name -
                <input type="text" name="un" id="un"/>

            </td>

        </tr>    
        <tr>

                <td>
                Email -
                <input type="text" name="email" id="email"/>

            </td>

          </tr>
          <tr>
            <td>
                New Password -
                <input type="password" name="pa" id="pa"/>

            </td>
                    
        </tr>
        <tr>
            <td>
                <input type="submit" name="sub" id="sub" value="submit"  />
            
            </td>   
        </tr>
       
        
    </table>
</asp:Content>
