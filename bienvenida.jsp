<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Usuario - Sweet Market</title>
    <link rel="shortcut icon" href="logos/Logo_mh.png"/>
    <link rel="stylesheet" href="estilos/usuario.css">
</head>
<body>
    <header class="header-panel">
        <div class="logo">
            <h1>SWEET MARKET</h1>
        </div>
        <nav>
            <ul>
                <li><a href="inicio.html">Cerrar Sesión</a></li>
            </ul>
        </nav>
    </header>

   
            <h2>Bienvenid@ 
                <%
                     HttpSession userSession = request.getSession(); 
                    String userName = (String) userSession.getAttribute("user_name");
                    out.print(userName);
                %>
            </h2>
            

        <main class="contenido-panel">
            <div class="resumen-perfil">
                <h2>Tu Información</h2>
                <div class="info">
                    <p><strong>Nombre:</strong> <%= userSession.getAttribute("user_name") %></p>
                    <p><strong>Email:</strong> <%= userSession.getAttribute("user_email") %></p>
                </div>
                    <a href="perfil.jsp"><button class="btn-modificar">Modificar Información</button></a>
            </div>

           
        </main>
    </section>

    <footer class="footer-panel">
        <p>&copy; 2024 Sweet Market - Todos los derechos reservados</p>
    </footer>
</body>
</html>