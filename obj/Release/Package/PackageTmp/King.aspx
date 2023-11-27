<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="King.aspx.cs" Inherits="End_Project.King" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <link href="Style/StyleForBoard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">
	        <br />

	<div class="container">
		<div class="board">
			<%if (Session["PreferredColor"] != null)
                { %>
				<% if (Session["PreferredColor"].ToString() == "Black")
                    { %>
					<div class="rook">&#9818;</div>
				<% } %>
				<% else
                    { %>
					<div class="rook">&#9812;</div>
				<% }
                    }%>
			<%else {%> <div class="rook">&#9813;</div><%}  %>	
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
			<div class="square black"></div>
			<div class="square"></div>
		
	
		</div>
	</div>
		
	<script>
        const squares = document.querySelectorAll('.square');
        const rook = document.querySelector('.rook');
        let rookPosition = 60;

        rook.style.top = `${Math.floor(rookPosition / 8) * 150}px`;
        rook.style.left = `${(rookPosition % 8) * 150}px`;
        function moveRook(event) {
            const target = event.target;
            const index = Array.from(squares).indexOf(target);

            if (index < 0 || index > 63) return;

            const x = index % 8;
            const y = Math.floor(index / 8);
            const currentX = rookPosition % 8;
            const currentY = Math.floor(rookPosition / 8);

			if (
				(Math.abs(x - currentX) <= 1 && Math.abs(y - currentY) <= 1) ||  
				(Math.abs(x - currentX) == 1 && Math.abs(y - currentY) == 1)) {
				rook.style.top = `${y * 150}px`;
                rook.style.left = `${x * 150}px`;
                rookPosition = index;
            }
        }


        for (let i = 0; i < squares.length; i++) 
            squares[i].addEventListener('click', moveRook);
        

    </script>
</asp:Content>
