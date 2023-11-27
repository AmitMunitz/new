<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="End_Project.Entrance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .button{
            display: block;
            width: 300px;
            height: 100px;
            margin: 20px auto;
            padding: 20px 40px;
            font-size: 44px;
            font-weight:bold;
            font-family:Aharoni;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 120px;
            cursor: pointer;
            transform: scale(1);
            transition: transform 0.2s;
        }

        .button:hover {
            transform: scale(1.1);
        }

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body style="background-color:lightgoldenrodyellow">
    <form id="form1" runat="server">
        <div class="center">
            <a class="button" href="Registration.aspx">Registration</a>
            <a class="button" href="LogIn.aspx">Log In</a>
            <a class="button" href="Home.aspx">Guest</a>
        </div>
    </form>
</body>
</html>
