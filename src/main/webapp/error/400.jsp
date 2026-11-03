<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" session="false" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Richiesta non valida - FootWorld</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/fragments.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/error.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="/error/errorNav.jspf" %>

<main class="error-main">
    <section class="error-box">
        <h1 class="error-code">400</h1>
        <h2 class="error-title">Richiesta non valida</h2>
        <p class="error-text">
            I dati inviati non sono corretti o sono incompleti.
            Torna indietro, controlla i campi e riprova.
        </p>
        <div class="error-actions">
            <a class="error-link" href="<%= request.getContextPath() %>/common/home.jsp">Torna alla home</a>
            <a class="error-link secondary" href="<%= request.getContextPath() %>/common/cart.jsp">Vai al carrello</a>
        </div>
    </section>
</main>

<%@ include file="/error/errorFooter.jspf" %>

</body>
</html>
