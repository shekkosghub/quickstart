<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entrar</title>
</head>
<body>
<div>
	<s:form action="entrarCliente">
	<table>
	<s:hidden name="cliente.id"/>
	<tr>
	<s:textfield name="cliente.correo" label="Correo"/>
	</tr>
	<tr>
	<s:textfield name="cliente.contrasenia" label="Contrasenia"/>
	</tr>
<!--  	<tr>
	<s:textfield name="cliente.correo" label="Correo"/>
	</tr>
	-->
	<tr><s:submit value="Aceptar"/></tr>
	</table>
	</s:form>
</div>
</body>
</html>