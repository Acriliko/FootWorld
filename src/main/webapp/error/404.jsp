<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" session="false" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina non trovata - FootWorld</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/fragments.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/error.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="/error/errorNav.jspf" %>

<main class="error-main">
    <section class="error-box">
        <h1 class="error-code">404</h1>
        <h2 class="error-title">Pagina non trovata</h2>
        <p class="error-text">
            Sembra che questa pagina sia finita fuori campo. L'indirizzo che hai inserito non esiste
            oppure è stato spostato.
        </p>
        <div class="error-actions">
            <a class="error-link" href="<%= request.getContextPath() %>/common/home.jsp">Torna alla home</a>
            <a class="error-link secondary" href="<%= request.getContextPath() %>/categorie/scarpe.jsp">Sfoglia i prodotti</a>
        </div>
    </section>
</main>

<%@ include file="/error/errorFooter.jspf" %>

</body>
</html>
