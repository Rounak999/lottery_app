<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Token Generator</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Token Generator</h2>
        
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String url = "jdbc:postgresql://lottery_db:5432/lottery";
                String dbUsername = "postgres";
                String dbPassword = "rounak";
                
                String username = request.getParameter("username");
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
                
                // Generate random token
                long seed = new Date().getTime();
                Random random = new Random(seed);
                int randomNumber = random.nextInt(1000000000);
                
                // Store or update the token in the database
                String updateSql = "INSERT INTO tokens.token (username, tokenvalue) VALUES (?, ?) " +
                                   "ON CONFLICT (username) DO UPDATE SET tokenvalue = ?";
                PreparedStatement pst = con.prepareStatement(updateSql);
                pst.setString(1, username);
                pst.setInt(2, randomNumber);
                pst.setInt(3, randomNumber);
                pst.executeUpdate();
                
                out.println("<div class='message'> 9 digits numeric token has been generated and saved for " + username + ". </div>");
            }
        %>
    </div>
</body>
</html>
