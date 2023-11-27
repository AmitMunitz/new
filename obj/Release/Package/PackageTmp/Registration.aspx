<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="End_Project.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        //password.endsWith(firstName)
        //password.startsWith(firstName)
        //password.includes(firstName)
        function checkPassword() {
            var password1 = document.getElementById("password").value;
            var password2 = document.getElementById("Confirm-password").value;

            if (password1 == password2) {
                document.getElementById('Confirm-password').style.backgroundColor = "lightgreen";
                document.getElementById('password').style.backgroundColor = "lightgreen";
            }
            else {
                document.getElementById('Confirm-password').style.backgroundColor = "mistyrose";
                document.getElementById('password').style.backgroundColor = "mistyrose";

            }
        }
        function validateEmail() {
            var emailInput = document.getElementById("email");
            var email = emailInput.value;

            var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        

            if (pattern.test(email)) {
                emailInput.style.backgroundColor = "lightgreen";
            } else {
                emailInput.style.backgroundColor = "mistyrose";
            }
        }

        function validateIsraeliID(idNumber) {
            // Remove non-digit characters
            idNumber = idNumber.replace(/\D/g, '');

            // Check length
            if (idNumber.length !== 9) {
                return false;
            }

            // Calculate the checksum
            var sum = 0;
            for (var i = 0; i < 9; i++) {
                var digit = parseInt(idNumber.charAt(i), 10);
                if (i % 2 === 0) {
                    digit *= 1;
                } else {
                    digit *= 2;
                    if (digit > 9) {
                        digit -= 9;
                    }
                }
                sum += digit;
            }

            // Check if the checksum is divisible by 10
            return sum % 10 === 0;
        }
        function checkID() {
            var id = document.getElementById('id');
            var idVal = document.getElementById('id').value;
            validateIsraeliID(idVal) ? id.style.backgroundColor = "lightgreen" : id.style.backgroundColor = "mistyrose";


        }
        function validateForm() {
            var password1 = document.getElementById("password").value;
            var password2 = document.getElementById("Confirm-password").value;
            var email = document.getElementById("email").value;
            var id = document.getElementById('id').value;
            var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return password1 == password2 && pattern.test(email) && validateIsraeliID(id);
        }


        $(document).ready(function () {
            $('input[name="show_password"]:checkbox').click(function () {
                if ($(this).is(':checked')) {
                    $('input[name="password"]').attr('type', 'text');
                    $('input[name="Confirm-password"]').attr('type', 'text');
                } else {
                    $('input[name="password"]').attr('type', 'password');
                    $('input[name="Confirm-password"]').attr('type', 'password');
                }
            });
        });

    </script>
    <style>

        label,input,g,option,select{
        font-size:30px;
        font-family:Aharoni;
        }
        input[type=text], input[type=password] {
        border: none;
        border-bottom: 1px solid black;
        font-size:30px;
        font-family:Aharoni;
        }
        input[type=radio] {
        font-size:30px;
        font-family:Aharoni;
        height:40px;
        width:40px;    
        transform: scale(1);
        transition: transform 0.3s ease-in-out;

        }
        input[type="radio"]:hover {
        transform: scale(1.5);
        } 
        input[type=checkbox] {
        font-size:30px;
        font-family:Aharoni;
        height:40px;
        width:40px;    
        transform: scale(1);
        transition: transform 0.3s ease-in-out;

        }
        input[type="checkbox"]:hover {
        transform: scale(1.3);
        }

        form {
        width: 1000px;
        margin: 0 auto;
        padding: 40px;
        background-color: #f2f2f2;
        border-radius: 5px;
        font-size: 24px;
        }
        input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 20px 40px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 24px;
        float: right;
        }

    </style>
</head>
<body style="background-color: #423B3A";>
    <center>
        <span id="errorMsg" runat="server" visible="false" style="font-size: 51px; color: red;">Username already exists. Please choose a different username.</span>
    </center>
   <form id="form1" runat="server" onsubmit="return validateForm()"  >
        <table>
            <tr>
                <td>
                    <label for="fname">first-name</label>
                    <input type="text" id="fname" name="fname" required="required" />
                </td>
            </tr>
            <tr>


            </tr>
            <tr>
                <td>
                    <label for="lname">last-name</label>
                    <input type="text" id="lname" name="lname" required="required" />
                </td>
            </tr>
            <tr>


            </tr>
            <tr>
                <td>
                    <label for="uname">user-name</label>
                    <input type="text" id ="uname" name="uname" required="required" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="birthday">birthday-date</label>
                    <input type="date" id="birthday" name="birthday" required="required" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="address">address</label>
                    <input type="text" id="address" name="address" required="required" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="address">id</label>
                    <input type="number" id="id" name="id" required="required" onblur="checkID()" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="email">email</label>
                    <input type="text" id="email" name="email" onkeyup="validateEmail()" required="required" /></td>
            </tr>
            <tr>
                <td>
                    <label for="gender">gender:</label>
                    <br />
                    <input type="radio" id="male" name="gender" value="male" required="required" /><g>male</g>
                    <br />
                    <input type="radio" id="female" name="gender" value="female" required="required" /><g>female</g>
                    <br />
                    <input type="radio" id="other" name="gender" value="other" required="required" /><g>other</g>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="color">What team do you support</label>
                    <select name="color" id="color" required="required">
                        <option value="Black">Manchester United</option>
                        <option value="White">any other team</option>
                    </select>

                </td>
            </tr>
            <tr>
                <td>
                    <label for="password">password</label>
                    <input type="password" id="password" name="password" onkeyup="checkPassword()" required="required"/>

                </td>
            </tr>    
            <tr>
                <td>
                   <label for="Confirm-password">Confirm-password</label>
                   <input type="password" id="Confirm-password" name="Confirm-password" onkeyup="checkPassword()"/>

                </td>
            </tr>
            <tr>
                <td>
                    <label>Show/hide Password</label>
                    <input type="checkbox" name="show_password"/>
                </td>
                    
            </tr>
            <tr>
                <td>
                    <input type="submit" id="save" name="save" value="submit"/>
               </td>
            </tr>

        </table>
    </form>
</body>
</html>