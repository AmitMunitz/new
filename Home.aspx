<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="End_Project.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">

	<h1>Darwizzy - The Best in World Football</h1>
	<br />
	<br />
	<br />
	<div style="margin-left: 400px;">
	<l>Meet Darwizzy, the undisputed best player in world football!</l><br /><l>
	With unparalleled skills, unmatched dedication,
	and a passion for the game,</l><br />
	<l> Darwizzy is a true legend on the field.</l><br />
	<l> Explore this site to dive into the
    incredible journey of a football maestro!</l>
	</div>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<l style="font-size:60px">Num of reg: <% Response.Write(Application["users"]); %></l>

</asp:Content>
