<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Bishop.aspx.cs" Inherits="End_Project.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <link href="Style/StyleForBoard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <br />

    <div class="container">
        <div class="board">
            <% if (Session["PreferredColor"] != null) { %>
                <% if (Session["PreferredColor"].ToString() == "Black") { %>
                    <div class="rook" name="queen">&#9823;</div>
                <% } else { %>
                    <div class="rook" name="queen">&#9817;</div>
                <% } %>
            <% } else { %>
                <div class="rook" name="queen">&#9817;</div>
            <% } %>

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
        let rookPosition = 48;

        rook.style.top = `${Math.floor(rookPosition / 8) * 150}px`;
        rook.style.left = `${(rookPosition % 8) * 150}px`;
        let count = 0;
        function moveRook(event) {
            const target = event.target;
            const index = Array.from(squares).indexOf(target);

            if (index < 0 || index > 63) return;

            const x = index % 8;
            const y = Math.floor(index / 8);
            const currentX = rookPosition % 8;
            const currentY = Math.floor(rookPosition / 8);

            if ((x === currentX && y - currentY === -1) ||
                (y === currentY && x - currentX === -1) ||
                (currentY === 1 && y === 3 && currentX === x)) {

                rook.style.top = `${y * 150}px`;
                rook.style.left = `${x * 150}px`;
                rookPosition = index;
                count++;

            }
            if (((x === currentX && y - currentY === -2) ||
                (y === currentY && x - currentX === -2) ||
                (currentY === 1 && y === 3 && currentX === x)) && count === 0) {

                rook.style.top = `${y * 150}px`;
                rook.style.left = `${x * 150}px`;
                rookPosition = index;
                count++;
            }
            if (currentY == 1) {
            <% if (Session["PreferredColor"] != null) { %>
                <% if (Session["PreferredColor"].ToString() == "Black") { %>
                document.getElementsByName("queen")[0].innerHTML = "&#9819;";
                <%} else { %>
                    document.getElementsByName("queen")[0].innerHTML = "&#9813;";
                <% } %>
            <% } else { %>
                document.getElementsByName("queen")[0].innerHTML = "&#9813;";
            <%} %>
                const squares = document.querySelectorAll('.square');
                const rook = document.querySelector('.rook');

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

                    if ((Math.abs(x - currentX) == Math.abs(y - currentY)) || x === currentX || y === currentY) {
                        rook.style.top = `${y * 150}px`;
                        rook.style.left = `${x * 150}px`;
                        rookPosition = index;
                    }
                }
                for (let i = 0; i < squares.length; i++)
                    squares[i].addEventListener('click', moveRook);
            }
        }        
        for (let i = 0; i < squares.length; i++)
            squares[i].addEventListener('click', moveRook);
    </script>
</asp:Content>
	