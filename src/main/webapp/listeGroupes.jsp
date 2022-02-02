<%@ page import="uga.carminav.carminavgestionnaireabsencenote.data.Etudiant" %>
<%@ page import="uga.carminav.carminavgestionnaireabsencenote.data.Groupe" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="common/header.jsp"/>
<h1 class="text-2xl border-b-2 border-slate-800">Liste des groupes</h1>
<jsp:useBean id="groupes" type="java.util.List<uga.carminav.carminavgestionnaireabsencenote.data.Groupe>" scope="request"/>
<article class="border border-slate-800 rounded m-4 p-4">
    <p>Ici vous pouvez :</p>
    <ul class="ml-8 list-disc">
        <li>
            <p>Consulter la liste des groupes.</p>
        </li>
        <li>
            <p>En cliquant sur une ligne correspondante à un groupe, vous serez redirigés vers les détails de ce groupe</p>
        </li>
    </ul>
</article>

<table class="table-fixed border-collapse m-4">
    <thead>
    <tr>
        <th class="border-2 border-slate-800 p-2">id</th>
        <th class="border-2 border-slate-800 p-2">nom</th>
    </tr>
    </thead>
    <tbody>
    <% for(Groupe groupe : groupes) {%>
        <tr class="hover:text-white hover:bg-slate-800 hover:cursor-pointer">
            <td class="border-2 border-slate-800 text-center">
                <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailGroupe")%>?id=<%=groupe.getId()%>" class="w-full h-full block p-2">
                    <%= groupe.getId()%>
                </a>
            </td>
            <td class="border-2 border-slate-800">
                <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailGroupe")%>?id=<%=groupe.getId()%>" class="w-full h-full block p-2">
                    <%= groupe.getNom()%>
                </a>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>
<jsp:include page="common/footer.jsp"/>