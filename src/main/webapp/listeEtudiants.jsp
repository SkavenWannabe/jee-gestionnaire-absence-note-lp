<%@ page import="uga.carminav.carminavgestionnaireabsencenote.data.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="common/header.jsp"/>
<h1 class="text-2xl border-b-2 border-slate-800">Liste des étudiants</h1>
<jsp:useBean id="etudiants" type="java.util.List<uga.carminav.carminavgestionnaireabsencenote.data.Etudiant>" scope="request"/>
<article class="border border-slate-800 rounded m-4 p-4">
    <p>Ici vous pouvez :</p>
    <ul class="ml-8 list-disc">
        <li>
            <p>Consulter la liste des étudiants.</p>
        </li>
        <li>
            <p>En cliquant sur une ligne correspondante à un étudiant, vous serez redirigés vers les détails de cet étudiant.</p>
        </li>
        <li>
            <p>Il est possible de créer un étudiant grâce au button en bas du tableau.</p>
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
        <% for (Etudiant etudiant : etudiants) { %>
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
            </tr>

        <%  } %>
    </tbody>
</table>

<a href="<%=application.getContextPath()%>/do<%=application.getInitParameter("servletFormCreateEtudiant")%>"
    class="border-2 border-slate-800 p-2 ml-4 hover:text-white hover:bg-slate-800 hover:cursor-pointer">
    Créer un étudiant
</a>
<jsp:include page="common/footer.jsp"/>