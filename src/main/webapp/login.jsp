<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String ctx = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenido</title>
<script src="<%=ctx%>/js/jquery-ui-1.9.0.custom/js/jquery-1.8.2.js"></script>
<script>
$(function(){
	$('#submit').click(function(evet){
		event.preventDefault();
		console.log("se envia peticion via ajax");
		$.ajax({
			  type: 'POST',
			  url: '<%=ctx%>/auth/login.action',
			  data: $('#loginForm').serialize(),
			  success: function(data){
				  $('#diverror').html(data);
				  }

			});
	})

})


</script>
</head>
<body>
<s:form action="login" namespace="/auth" id="loginForm">
<table>
<tr>
	<s:textfield name="client.correo" label="Correo"/>
</tr>
<tr>
	<s:password name="client.contrasenia" label="Contraseña"/>
</tr>
<tr><td><s:submit id="submit"/></td></tr>
</table>
<table>
<tr><td><div id="diverror"></div></tr>
</table>
</s:form>
</body>
</html>