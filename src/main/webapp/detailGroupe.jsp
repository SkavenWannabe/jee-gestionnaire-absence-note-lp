<%@ page import="uga.carminav.carminavgestionnaireabsencenote.data.Etudiant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/header.jsp"/>
<jsp:useBean id="groupe" type="uga.carminav.carminavgestionnaireabsencenote.data.Groupe" scope="request"/>
<h1 class="text-2xl border-b-2 border-slate-800">Fiche groupe <%=groupe.getNom()%></h1>
<article class="border border-slate-800 rounded m-4 p-4">
    <p>Ici vous pouvez :</p>
    <ul class="ml-8 list-disc">
        <li>
            <p>Consulter les données liées à un groupe sélectionner précédemment.</p>
        </li>
        <li>
            en cliquant sur un éleve vous pouvez accéder à sa fiche.
        </li>
    </ul>
</article>

<table class="table-fixed border-collapse m-4">
    <caption class="border-b border-slate-700 m-2 text-xl">Etudiants</caption>
    <thead>
    <tr>
        <th class="border-2 border-slate-800 p-2">id</th>
        <th class="border-2 border-slate-800 p-2">nom</th>
        <th class="border-2 border-slate-800 p-2">prenom</th>
        <th class="border-2 border-slate-800 p-2">Moyenne</th>
        <th class="border-2 border-slate-800 p-2">Absences</th>
        <th class="border-2 border-slate-800 p-2">Groupe</th>
    </tr>
    </thead>
    <tbody>
    <% for (Etudiant etudiant : groupe.getEtudiants()) { %>
    <tr class="hover:text-white hover:bg-slate-800 hover:cursor-pointer">
        <td class="border-2 border-slate-800 text-center">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailEtudiant")%>?id=<%=etudiant.getId()%>" class="w-full h-full block p-2">
                <%= etudiant.getId()%>
            </a>
        </td>
        <td class="border-2 border-slate-800">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailEtudiant")%>?id=<%=etudiant.getId()%>" class="w-full h-full block p-2">
                <%= etudiant.getNom()%>
            </a>
        </td>
        <td class="border-2 border-slate-800">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailEtudiant")%>?id=<%=etudiant.getId()%>" class="w-full h-full block p-2">
                <%= etudiant.getPrenom()%>
            </a>
        </td>

        <td class="border-2 border-slate-800">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailEtudiant")%>?id=<%=etudiant.getId()%>" class="w-full h-full block p-2">
                <%= etudiant.getMoyenne()%>
            </a>
        </td>
        <td class="border-2 border-slate-800">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailEtudiant")%>?id=<%=etudiant.getId()%>" class="w-full h-full block p-2">
                <%= etudiant.getNbAbsences()%>
            </a>
        </td>
        <td class="border-2 border-slate-800">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailEtudiant")%>?id=<%=etudiant.getId()%>" class="w-full h-full block p-2">
                <%= etudiant.getGroupe().getNom()%>
            </a>
        </td>
    </tr>

    <%  } %>
    </tbody>
</table>
<jsp:include page="common/footer.jsp"/>