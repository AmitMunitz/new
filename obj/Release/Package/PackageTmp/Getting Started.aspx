<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Getting Started.aspx.cs" Inherits="End_Project.Getting_Started" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">

	<h1>Introduction to Chess</h1>
	<div class="rules">
		<h2>Objective</h2>
		<g>The objective of the game is to checkmate the opponent's king. This happens when the king is in a position to be captured (in check) and there is no way to remove it from attack on the next move.</g>
		<h2>Starting Position</h2>
		<g>The game is played on a square board of 64 squares, arranged in an 8x8 grid. Each player starts with 16 pieces: one king, one queen, two rooks, two knights, two bishops, and eight pawns. The pieces are placed in the same positions on each player's side of the board, as shown in the diagram below.</g>
		<ul>
			<li>The rooks are placed in the corners of the board.</li>
			<li>The knights are placed next to the rooks.</li>
			<li>The bishops are placed next to the knights.</li>
			<li>The queen is placed on the square of her color(ido schwartz wrote the word "color" so i think he should have at least half of my grade)</li>
			<li>The king is placed on the square opposite to his color</li>
			</ul>
		</div>
</asp:Content>
