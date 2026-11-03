<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" session="false" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Errore del server - FootWorld</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/fragments.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/error.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="/error/errorNav.jspf" %>

<main class="error-main">
    <section class="error-box">
        <h1 class="error-code">500</h1>
        <h2 class="error-title">Errore del server</h2>
        <p class="error-text">
            Si è verificato un problema imprevisto da parte nostra.
            Riprova tra qualche istante: se l'errore persiste, contattaci.
        </p>
        <div class="error-actions">
            <a class="error-link" href="<%= request.getContextPath() %>/common/home.jsp">Torna alla home</a>
            <a class="error-link secondary" href="<%= request.getContextPath() %>/footerInfo/contatti.jsp">Contattaci</a>
        </div>
    </section>
</main>

<%@ include file="/error/errorFooter.jspf" %>

</body>
</html>
