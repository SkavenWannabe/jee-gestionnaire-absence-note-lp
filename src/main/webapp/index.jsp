<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><%=application.getInitParameter("title")%></title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<h1>Accueil</h1>
<%@page import="uga.carminav.carminavgestionnaireabsencenote.Etudiant"%>
<%@page import="uga.carminav.carminavgestionnaireabsencenote.GestionFactory"%>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>

<%
    GestionFactory gf = new GestionFactory();

    Collection<Etudiant> etudiants = gf.getEtudiants();

    Iterator<Etudiant> iterator = etudiants.iterator();
    while(iterator.hasNext()) {
        Etudiant et = iterator.next();
        int id = et.getId();
        String pageDetail = "detail.jsp?id=" + id;
%>

<jsp:include page="<%=pageDetail%>"/>

<%  } %>
</body>
</html>