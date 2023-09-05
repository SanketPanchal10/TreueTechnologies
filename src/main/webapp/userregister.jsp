<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PARKING SYSTEM</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        position: relative;
    }
    body::before {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0.5;
        width: 100%;
        height: 100%;
        background: url("https://img.freepik.com/free-vector/parking-isometric-elements-set_1284-15686.jpg?w=740&t=st=1693846239~exp=1693846839~hmac=64dc2f69cbadb1e717a9c00fdce0e842b7233dca4085ac3f7ee850ab39634efa");
        background-position: center;
    }

    nav {
        position: fixed;
        padding: 5px;
        z-index: 1;
        background-color: rgba(255, 255, 255, 0.8);
       /*  left: 0; */
        top: 0;
    }

    nav a img {
        width: 167px;
    }

    div {
        width: 300px;
        margin: 0 auto;
        padding: 30px;
        background-color: black;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        position: fixed; /* Change to absolute positioning */
        opacity: 0; /* Initially hide the form */
        transition: opacity 0.3s;
    }
body:hover div {
        opacity: 1;
    }
    label {
        display: block;
        margin-bottom: 10px;
        color: #fff;
    }

    input[type="text"],
    input[type="tel"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid red;
        border-radius: 5px;
    }

    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid red;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: red;
        color: #fff;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 10px;
    }

    input[type="submit"]:hover {
        background-color: darkred;
    }
</style>
</head>
<body>
<nav>
    <a href="index.html"><img src="https://images.squarespace-cdn.com/content/v1/56f2edfd7c65e4c74445b357/1459118570912-95HKA8S4Y4X4HR64PCRO/PS_LOGO-5975.png" alt="logo"></a>
</nav>
<div>
    <form action="registerlink" method="get">
        <label>Enter Name</label>
        <input type="text" name="name" required>
        <label>Enter Contact Number</label>
        <input type="tel" name="phone" required>
        <label>Enter UserName</label>
        <input type="text" name="user" required>
        <label>Enter Password</label>
        <input type="password" name="pass" required>
        <br><br><br>
        <center><input type="submit" value="REGISTER"></center>
    </form>
    
    <div id="thankYouMessage" style="display: none;">
        Thank you for registering.
        <a href="index.html">Go back to the homepage</a>
    </div>
</div>
<script>
document.getElementById("registrationForm").addEventListener("submit", function (e) {
    e.preventDefault(); // Prevent the form from submitting normally

    // Hide the form and show the thank you message
    document.getElementById("registrationForm").style.display = "none";
    document.getElementById("thankYouMessage").style.display = "block";

    // You can add additional code here to handle form submission via AJAX if needed
});
</script>
</body>
</html>
