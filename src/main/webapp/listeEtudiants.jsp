<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="common/header.jsp"/>
<h1 class="text-2xl border-b-2 border-slate-800">Liste des étudiants</h1>
<%@page import="uga.carminav.carminavgestionnaireabsencenote.Etudiant"%>
<%@page import="uga.carminav.carminavgestionnaireabsencenote.GestionFactory"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
<article class="border border-slate-800 rounded m-4 p-4">
    <p>Ici vous pouvez :</p>
    <ul class="ml-8 list-disc">
        <li>
            <p>Consulter la liste des étudiants.</p>
        </li>
        <li>
            <p>En cliquant sur une ligne correspondante à un étudiant, vous serez redirigé vers les détails de cet étudiant</p>
        </li>
    </ul>
</article>

<table class="table-fixed border-collapse m-4">
    <thead>
        <tr>
            <th class="border-2 border-slate-800 p-2">id</th>
            <th class="border-2 border-slate-800 p-2">nom</th>
            <th class="border-2 border-slate-800 p-2">prenom</th>
        </tr>
    </thead>
    <tbody>
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
    </tbody>
</table>
<jsp:include page="common/footer.jsp"/>