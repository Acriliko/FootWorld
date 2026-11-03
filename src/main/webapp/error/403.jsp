<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" session="false" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accesso negato - FootWorld</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/fragments.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/error.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="/error/errorNav.jspf" %>

<main class="error-main">
    <section class="error-box">
        <h1 class="error-code">403</h1>
        <h2 class="error-title">Accesso negato</h2>
        <p class="error-text">
            Non hai i permessi necessari per visualizzare questa pagina.
            Se pensi che si tratti di un errore, accedi con un altro account.
        </p>
        <div class="error-actions">
            <a class="error-link" href="<%= request.getContextPath() %>/common/home.jsp">Torna alla home</a>
            <a class="error-link secondary" href="<%= request.getContextPath() %>/common/login.jsp">Vai al login</a>
        </div>
    </section>
</main>

<%@ include file="/error/errorFooter.jspf" %>

</body>
</html>
