<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Panel de Control</title>
    </head>
    <body>
        <table border="1" cellpadding="2" cellspacing="2" align="center" width="1100" height="800">
            <tr>
                <td height="30" colspan="2">
                    <%@include file="../templates/headerPanelClient.jsp"%>
                </td>
            </tr>
            <tr>
                <td height="250" width="14%">
                    <%@include file="../templates/menuPanelClient.jsp"%>
                </td>
                <td width="350">
                    <p>body</p>
                </td>
            </tr>
            <tr>
                <td height="30" colspan="2">
                    <%@include file="../templates/footerPanelClient.jsp"%>
                </td>
            </tr>
        </table>
    </body>
</html>
