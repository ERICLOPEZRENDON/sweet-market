<%@ page import="Procesos_Base_de_Datos.PersonaDao" %>
<%@ page import="Procesos_Base_de_Datos.Persona" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Datos</title>
    <link rel="shortcut icon" href="logos/Logo_mh.png"/>
    <link rel="stylesheet" href="estilos/actualizar.css">
    <script>
        function validarFormulario() {
            var contrasena = document.getElementById("contrasena").value;
            var confirmarContrasena = document.getElementById("confirmar_contrasena").value;

            if (contrasena !== confirmarContrasena) {
                alert("Las contraseñas no coinciden. Por favor, verifica e intenta de nuevo.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <header>
        <h1>Actualizar Información</h1>
    </header>
    
        <%
            HttpSession userSession = request.getSession();
            int userId = (int) userSession.getAttribute("user_id");
            PersonaDao personaDao = new PersonaDao();
            Persona persona = personaDao.buscarPorID(userId);
        %>
        <form action="ActualizarDatosServlet" method="post" onsubmit="return validarFormulario();">
            <input type="hidden" name="id_persona" value="<%= persona.getId_persona() %>">
            <div class="campo">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<%= persona.getNombre() %>" required>
            </div>
            <div class="campo">
                <label for="ap_paterno">Apellido Paterno:</label>
                <input type="text" id="ap_paterno" name="ap_paterno" value="<%= persona.getAp_paterno() %>" required>
            </div>
            <div class="campo">
                <label for="ap_materno">Apellido Materno:</label>
                <input type="text" id="ap_materno" name="ap_materno" value="<%= persona.getAp_materno() %>" required>
            </div>
            <div class="campo">
                <label for="fecha_nac">Fecha de Nacimiento:</label>
                <input type="date" id="fecha_nac" name="fecha_nac" value="<%= persona.getFecha_nacimiento() %>" required>
            </div>
            <div class="campo">
                <label for="calle">Calle:</label>
                <input type="text" id="calle" name="calle" value="<%= persona.getCalle() %>" required>
            </div>
            <div class="campo">
                <label for="colonia">Colonia:</label>
                <input type="text" id="colonia" name="colonia" value="<%= persona.getColonia() %>" required>
            </div>
            <div class="campo">
                <label for="municipio">Municipio:</label>
                <input type="text" id="municipio" name="municipio" value="<%= persona.getMunicipio() %>" required>
            </div>
            <div class="campo">
                <label for="codigo_postal">Código Postal:</label>
                <input type="number" id="codigo_postal" name="codigo_postal" value="<%= persona.getCodigo_postal() %>" required>
            </div>
            <div class="campo">
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" value="<%= persona.getTelefono() %>" required>
            </div>
            <div class="campo">
                <label for="correo">Correo Electrónico:</label>
                <input type="email" id="correo" name="correo" value="<%= persona.getCorreo() %>" required>
            </div>
            <div class="campo">
                <label for="contrasena">Nueva Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena">
            </div>
            <div class="campo">
                <label for="confirmar_contrasena">Confirmar Contraseña:</label>
                <input type="password" id="confirmar_contrasena" name="confirmar_contrasena">
            </div>
            <div class="campo">
                <button type="submit">Actualizar</button>
                </form>
            </div>
            <div><a href="inicio.html" > <button type="button">Cerrar Sesion</button></a></div>
        
    
            
    <footer>
        <p>&copy; 2024 Sweet Market - Todos los derechos reservados</p>
    </footer>
</body>
</html>
