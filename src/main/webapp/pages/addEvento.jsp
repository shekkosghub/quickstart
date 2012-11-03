<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
	<s:form action="addEvento">
	<table>
<tr>
<td>	<s:textfield name="evento.cliente.id"/></td>
</tr>	


	<tr>
	<td><s:label label="Titulo"/></td><td><s:textfield name="evento.titulo"/></td>
	</tr>
	<tr>
		<td><s:label label="Descricpcion"/></td><td><s:textfield name="evento.descripcion"/></td>
	</tr>
	</table>
	<s:submit value="Aceptar"/>
	</s:form>
</div>
</body>
</html>