<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
	<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<%
String ctx = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alta</title>
    <link rel="stylesheet" href="<%=ctx%>/js/jquery-ui-1.9.0.custom/css/smoothness/jquery-ui-1.9.0.custom.min.css" />
    <script src="<%=ctx%>/js/jquery-ui-1.9.0.custom/js/jquery-1.8.2.js"></script>
    <script src="<%=ctx%>/js/jquery-ui-1.9.0.custom/js/jquery-ui-1.9.0.custom.min.js"></script>
        <script src="<%=ctx%>/js/jquery-ui-1.9.0.custom/ui/i18n/jquery.ui.datepicker-es.js"></script>
<script>
$(function(){

	$( "#birthDate" ).datepicker($.datepicker.regional['es']);

	$("#personType").change(function(){
		console.log($(this).val());
		if($(this).val() == 'I'){
			ocultarEnMoral();
		}else{
			mostrarEnPersona();
			}	
	})
	
  $("select#state").change(function(){
    $.getJSON("getCitiesByState.action",{idstate: $(this).val(), ajax: 'true'}, function(j){
      var options = '';
      alert(j.length);
      for (var i = 0; i < j.length; i++) {
        options += '<option value="' + j[i].id + '">' + j[i].name + '</option>';
      }
      $("select#city").html(options);
    })
  })
})
function ocultarEnMoral(){

	$('#lblfamilyName').hide();
	$('#familyName').hide();

	$('#lbllastName').hide();
	$('#lastName').hide();
	
	$('#lblbirthDate').hide();
	$('#birthDate').hide();
}

function mostrarEnPersona(){

	$('#lblfamilyName').show();
	$('#familyName').show();

	$('#lbllastName').show();
	$('#lastName').show();
	
	$('#lblbirthDate').show();
	$('#birthDate').show();
}
</script>
</head>
<body>
<p>* Requeridos</p>
<div>
	<s:form action="altaCliente">
	<table>
	<tr>
	<s:textfield name="cliente.nombre" label="Nombre"/>
	</tr>
	<tr>
	<s:textfield name="cliente.correo" label="Correo"/>
	</tr>
		<tr>
	<s:password name="cliente.contrasenia" label="Contraseña"/>
	</tr>
	<tr>
	<s:select list="personType" id="personType" label="Tipo de persona" name="cliente.personType.id"/>
	</tr>
	<tr>
		<td><s:label for="familyName" id="lblfamilyName" value="Apellido paterno:" theme="simple"/></td>
		<td><s:textfield  name="cliente.apellidoPaterno" id="familyName" theme="simple"/></td>
	</tr>

	<tr>
		<td><s:label for="lastName" value="Apellido materno:" id="lbllastName" theme="simple"/></td>
		<td><s:textfield name="cliente.apellidoMaterno" id="lastName" theme="simple"/></td>
	</tr>
	
	<tr>
		<td><s:label for="birthDate" id="lblbirthDate" value="Fecha de nacimiento:" theme="simple"/></td>
		<td><s:textfield name="cliente.birthDate" id="birthDate" theme="simple"/></td>
	</tr>
	<tr>
		<s:select id="state" list="states" label="Estados" name="idstate"/>
	</tr>
		<tr>
				<s:select id="city" list="cities" label="Ciudades" name="address.city.id"/>	
	</tr>
	<tr>
		<s:textfield name="address.streetAndNumber" label="Calle y Número"/>
	</tr>
	<tr>
		<s:textfield name="address.suburb" label="Colonia"/>
	</tr>
	<tr>
		<s:textfield name="address.zipCode" label="Codigo postal"/>
	</tr>
	<tr><s:submit value="Aceptar"/></tr>
	</table>
	</s:form>
</div>
</body>
</html>