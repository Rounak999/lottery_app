<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guess the Token</title>
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
        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            background-color: #e0f7fa;
            border: 2px solid #87ceeb;
            border-radius: 10px;
        }
        .message {
            font-size: 1.2em;
            color: #2e8b57;
            text-align: center;
            margin-top: 20px;
        }
        .error {
            font-size: 1.2em;
            color: #ff6347;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Guess the Token</h2>
        
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String url = "jdbc:postgresql://lottery_db:5432/lottery";
                String dbUsername = "postgres";
                String dbPassword = "rounak";
                
                String guessUsername = request.getParameter("guessUsername");
                int tokenGuess = Integer.parseInt(request.getParameter("tokenGuess"));
                
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
                
                String selectSql = "SELECT tokenvalue FROM tokens.token WHERE username = ?";
                PreparedStatement selectPst = con.prepareStatement(selectSql);
                selectPst.setString(1, guessUsername);
                ResultSet rs = selectPst.executeQuery();
                
                if (rs.next()) {
                    int storedToken = rs.getInt("tokenvalue");
                    if (tokenGuess == storedToken) {
                        out.println("<div class='message'>Awesome! Your genius here is your flag FLAG{RANDOM IS NOT RANDOM}.</div>");
                    } else {
                        out.println("<div class='error'>Incorrect guess. Try again!</div>");
                    }
                } else {
                    out.println("<div class='error'>Username not found.</div>");
                }
            }
        %>
    </div>
</body>
</html>
