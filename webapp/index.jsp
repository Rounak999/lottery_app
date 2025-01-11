<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            padding: 20px;
        }
        h2 {
            color: #4682b4;
            text-align: center;
        }
        h3 {
            color: #4169e1;
        }
        form {
            margin-bottom: 20px;
            padding: 15px;
            border: 2px solid #87ceeb;
            border-radius: 10px;
            background-color: #e0f7fa;
            width: 50%;
            margin: 0 auto;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4682b4;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #4169e1;
        }
    </style>
</head>
<body>
    <h2>Welcome to the L0TTERY Generator and Guessing Game!</h2>
    
    <h3><center>GENERATE A  L0TTERY TOKEN</center></h3>
    <form method="post" action="token.jsp">
        Username: <input type="text" name="username" required><br><br>
        <input type="submit" value="Generate Token">
    </form>
    
    <h3><center>GUESS  THE L0TTERY TOKEN TO WIN THE FLAG</center></h3>
    <form method="post" action="guess.jsp">
        Username: <input type="text" name="guessUsername" required><br>
        Guess: <input type="text" name="tokenGuess" required><br><br>
        <input type="submit" value="Submit ">
    </form>
</body>
</html>
