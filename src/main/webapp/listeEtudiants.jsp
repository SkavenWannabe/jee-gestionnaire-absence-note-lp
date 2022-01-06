<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="common/header.jsp"/>
<h1>Liste des étudiants</h1>
<%@page import="uga.carminav.carminavgestionnaireabsencenote.Etudiant"%>
<%@page import="uga.carminav.carminavgestionnaireabsencenote.GestionFactory"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>

<%
    GestionFactory gf = new GestionFactory();

    Collection<Etudiant> etudiants = gf.getEtudiants();

    Iterator<Etudiant> iterator = etudiants.iterator();
    while(iterator.hasNext()) {
        Etudiant et = iterator.next();
        String pageDetail = "/do/detailListEtudiant.jsp?" + et.toUrlGet();
%>

<jsp:include page="<%=pageDetail%>"/>

<%  } %>

<jsp:include page="common/footer.jsp"/>