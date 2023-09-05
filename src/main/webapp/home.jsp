<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parking System</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
    background-image: url("https://img.freepik.com/premium-vector/parking-zone-urban-scene-illustration_24911-51016.jpg?w=900");
   /*  background-size: cover;
    background-repeat: no-repeat;
            background-attachment: fixed;
             min-width: 100%;
    		display: flex;
    		flex-direction: column; */
  }

  h1, h2 {
    text-align: center;
    margin-top: 10px;
  }
  .header-tag {
    text-align: left;
  }

  /* Header */
  header {
    background-color: #222;
    color: #fff;
    padding: 10px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  nav ul {
    list-style-type: none;
  }

  nav ul li {
    display: inline;
    margin-right: 20px;
  }

  nav a {
    text-decoration: none;
    color: #fff;
  }

  /* Add spacing and styles to the navbar */
  .navbar {
    background-color: #333;
    overflow: hidden;
    padding: 10px;
    margin-bottom: 20px; /* Add spacing between navbar and content */
  }

  header span {
    font-size: 34px;
  }

  header a {
    float: left;
    display: block;
    color: white;
    text-align: center;
    padding: 10px 50px; /* Adjust padding for better spacing */
    text-decoration: none;
  }

  header a i {
    font-size: 50px; /* Increase the icon size */
    margin-right: 0px; /* Add spacing between icon and text */
  }

  header a:hover {
    background-color: #ddd;
    color: black;
  }
       
  .btn {
    margin: 0 auto;
    background-color: grey;
    border: .2rem solid grey;
    margin-top: 1rem;
    display: inline-block;
    padding: .2rem 1rem;
    font-size: 1.5rem;
    border-radius: .5rem;
    color: white;
    cursor: pointer;
  }
  
  .welcomeuser {
  	text-align: center;
  	color: white;
  }

.welcomeuser i{
color: #FFDD43;
}

  .button {
    padding: 8px 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s;
  }

  .button:hover {
    background-color: #45a049;
  }

  .form-container {
  font-size:30px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px;
    padding: 20px;
    /* background-color: #fff; */
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

.form-container h3{
	color: red;
}

.form-container h2{
	color: green;
}

  .label {
    font-weight: bold;
    margin-right: 10px;
  }

  .input-text {
  align-content:center;
    padding: 10px 80px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  .submit-button {
    padding: 8px 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s;
  }

  .submit-button:hover {
    background-color: #45a049;
  }

  .suggestions {
    display: flex;
    justify-content: center;
    margin-top: 10px;
  }

  .suggestions ul {
    list-style-type: none;
    padding: 0;
  }

  .suggestions li {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    background-color: #fff;
    transition: background-color 0.2s;
  }

  .suggestions li:hover {
    background-color: #f2f2f2;
  }

  .center-text {
    text-align: center;
    margin: 10px;
    font-style: italic;
  }

  /* Header and Footer */
  footer {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
    position: absolute;
    bottom: 0;
    width: 100%;
  }

  /* Center-align the Welcome message */
  .welcomeuser {
    text-align: center;
  }
</style>
</head>
<body>

<%
   String name = (String) request.getAttribute("username");
%>

<header>
  <a href="#"><i class="fas fa-parking"></i><span>arking System</span></a>
  <nav> 
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="aboutus.html">About Us</a></li>
      <li><a href="bookinglink">Your Booking</a></li>
    </ul>
  </nav>

  <form action="logoutlink" class="logout">
    <input type="submit" value="logout" class="btn">
  </form>
</header>

<div class="welcomeuser">
  <br>
  <h1 class="username"><i class="fas fa-star"></i>WELCOME <%= name %><i class="fas fa-star"></i></h1>
</div>

<div class="form-container">
<div>
  <h2>Parking Spot Search</h2>
  
  <center><h3>Search By Location</h3></center>
  <form action="searchlink" method="get">
    <input type="text" name="loc" id="locationInput" class="input-text" onkeyup="showSuggestions()">
    <input type="submit" value="SEARCH" class="submit-button">
  </form>
</div>
</div>
<div class="suggestions" id="suggestions"></div>

<footer>
  &copy; 2023 Parking System. All rights reserved.
</footer>

<script>
  const suggestionsList = [
    "Hadapsar",
    "Magarpatta",
    "Wagholi(BJS)",
    "PuneStation",
    "Ramtekadi"
  ];

  function showSuggestions() {
    const input = document.getElementById("locationInput");
    const userInput = input.value.toLowerCase();
    const suggestionsDiv = document.getElementById("suggestions");
    suggestionsDiv.innerHTML = "";

    if (!userInput) {
      return;
    }

    const matchingSuggestions = suggestionsList.filter(suggestion =>
      suggestion.toLowerCase().includes(userInput)
    );

    if (matchingSuggestions.length === 0) {
      suggestionsDiv.innerHTML = "<p class='center-text'>No suggestions found.</p>";
    } else {
      const suggestionListElement = document.createElement("ul");
      matchingSuggestions.forEach(suggestion => {
        const suggestionItem = document.createElement("li");
        suggestionItem.textContent = suggestion;
        suggestionItem.onclick = () => {
          input.value = suggestion;
          suggestionsDiv.innerHTML = "";
        };
        suggestionListElement.appendChild(suggestionItem);
      });
      suggestionsDiv.appendChild(suggestionListElement);
    }
  }
</script>
</body>
</html>
