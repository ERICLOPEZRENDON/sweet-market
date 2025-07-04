<%@ page import="Procesos_Base_de_Datos.PersonaDao" %>
<%@ page import="Procesos_Base_de_Datos.Persona" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <div id="message">
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                PersonaDao personaDao = new PersonaDao();
                Connection conexion = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    conexion = personaDao.getEnlace();
                    String sql = "SELECT p.* FROM persona p "+
                                 "WHERE p.correo_elec = ?";
                    stmt = conexion.prepareStatement(sql);
                    stmt.setString(1, email);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String storedPassword = rs.getString("contrasena");
                        if (password.equals(storedPassword)) {
                            HttpSession userSession = request.getSession(); 
                            userSession.setAttribute("user_id", rs.getInt("id_persona"));
                            userSession.setAttribute("user_name", rs.getString("nombre"));
                            userSession.setAttribute("user_email", email);                     
                            response.sendRedirect("bienvenida.jsp");
                        } else {
                            out.println("<p style='color: red;'>Error: Contraseña incorrecta.</p>");
                            response.setHeader("Refresh", "1; URL=inicio.html"); // Redirigir después de 1 segundo
                        }
                    } else {
                        out.println("<p style='color: red;'>Error: Usuario no encontrado.</p>");
                        response.setHeader("Refresh", "1; URL=inicio.html"); // Redirigir después de 1 segundo
                    }
                } catch (SQLException e) {
                    out.println("<p style='color: red;'>Error en la conexión a la base de datos: " + e.getMessage() + "</p>");
                    response.setHeader("Refresh", "1; URL=inicio.html"); // Redirigir después de 1 segundo
                    e.printStackTrace();
                } finally {
                    if (rs != null) {
                        try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                    if (stmt != null) {
                        try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                    if (conexion != null) {
                        try { conexion.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            }
        %>
    </div>
</body>
</html>
