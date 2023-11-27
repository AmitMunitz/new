<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="End_Project.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Aharoni;
            background-image: url('../img/homebackground.png');
        }
        
        .container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            background-color: #ffffff;
            padding: 60px; 
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        
        .input-group {
            margin-bottom: 20px; 
        }
        
        .input-group label {
            display: block;
            font-size: 24px; 
            margin-bottom: 10px; 
        }
        
        .input-group input {
            width: 900px; 
            padding: 16px; 
            font-size: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .input-group .forgot-password {
            font-size: 18px; 
            margin-top: 20px;
            display: inline-block;
        }
        
        .input-group .submit-button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 20px 40px; 
            font-size: 24px; 
            cursor: pointer;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <center>
        <span runat="server" id="errorMsg" style="font-size: 51px; color: red;" visible="false">Either the username or password is incorrect. Please try again.</span>
    </center>
    <form id="form1" runat="server">
        <div class="container">
            <div class="input-group">
                <label for="un">Username</label>
                <input type="text" name="un" id="un" required="required" />
            </div>
            
            <div class="input-group">
                <label for="pa">Password</label>
                <input type="password" name="pa" id="pa" required="required" />
            </div>
            
            <div class="input-group">
                <input type="submit" name="sub" id="sub" value="Submit" class="submit-button" />
            </div>
           
            <div class="input-group">
                <a href="ForgotPassword.aspx" class="forgot-password">Forgot Password?</a>
            </div>
            
            <div class="input-group">
                <a href="Menu.aspx" class="forgot-password">Back to Menu</a>
            </div>
        </div>
    </form>
</body>
</html>
