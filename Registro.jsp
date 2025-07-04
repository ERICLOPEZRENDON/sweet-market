<%@ page import="Procesos_Base_de_Datos.Persona" %>
<%@ page import="Procesos_Base_de_Datos.PersonaDao" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("nombre");
    String apPaterno = request.getParameter("ap_paterno");
    String apMaterno = request.getParameter("ap_materno");
    String fechaNacimientoStr = request.getParameter("fecha_nac");
    String calle = request.getParameter("calle");
    String colonia = request.getParameter("colonia");
    String municipio = request.getParameter("municipio");
    int codigoPostal = Integer.parseInt(request.getParameter("codigo_postal"));
    long telefono = Long.parseLong(request.getParameter("telefono"));
    String correo = request.getParameter("correo");
    String contrasena = request.getParameter("contrasena");
    String confirmarContrasena = request.getParameter("confirmar_contrasena");

    // Validar que las contraseñas coinciden
    if (!contrasena.equals(confirmarContrasena)) {
        out.println("<h3>Error: Las contraseñas no coinciden. Por favor, intenta nuevamente.</h3>");
        return;
    }

    // Convertir la fecha de nacimiento a tipo Date
    java.sql.Date fechaNacimiento = java.sql.Date.valueOf(fechaNacimientoStr);

    // Crear el objeto Persona
    Persona persona = new Persona();
    persona.setNombre(nombre);
    persona.setAp_paterno(apPaterno);
    persona.setAp_materno(apMaterno);
    persona.setFecha_nacimiento(fechaNacimiento);
    persona.setCalle(calle);
    persona.setColonia(colonia);
    persona.setMunicipio(municipio);
    persona.setCodigo_postal(codigoPostal);
    persona.setTelefono(telefono);
    persona.setCorreo(correo);
    persona.setContrasena(contrasena);

    // Insertar la persona en la base de datos
    PersonaDao personaDao = new PersonaDao();
    int idPersona = personaDao.alta(persona);

    
        // Mostrar el resultado
            // Crear la sesión y agregar los atributos
            HttpSession userSession = request.getSession();
            userSession.setAttribute("persona", persona);
            userSession.setAttribute("user_id", idPersona);
            userSession.setAttribute("user_name", nombre);
            userSession.setAttribute("user_email", correo);

            out.println("<h3>Registro exitoso. </h3>");
            out.println("<script type='text/javascript'>");
            out.println("setTimeout(function() { window.location.href = 'bienvenida.jsp'; }, 1000);");
            out.println("</script>");
        
%>
