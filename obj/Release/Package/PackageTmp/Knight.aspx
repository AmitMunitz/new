<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Knight.aspx.cs" Inherits="End_Project.WebForm1" %>
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
					<div class="rook">&#9822</div>
				<% } %>
				<% else
                    { %>
					<div class="rook">&#9816;</div>
				<% }
                    }%>
			<%else {%> <div class="rook">&#9816;</div><%}  %>
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
        let rookPosition = 57;

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
            const dx = Math.abs(x - currentX);
            const dy = Math.abs(y - currentY);

            if ((dx == 1 && dy == 2) || (dx == 2 && dy == 1)) {
                rook.style.top = `${y * 150}px`;
                rook.style.left = `${x * 150}px`;
                rookPosition = index;
            }
        }

        for (let i = 0; i < squares.length; i++)
            squares[i].addEventListener('click', moveRook);

    </script>
</asp:Content>
