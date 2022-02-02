<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/header.jsp"/>
<jsp:useBean id="etudiant" type="uga.carminav.carminavgestionnaireabsencenote.data.Etudiant" scope="request"/>
<h1 class="text-2xl border-b-2 border-slate-800">Fiche étudiant <%=etudiant.getPrenom()%> <%=etudiant.getNom()%></h1>
<article class="border border-slate-800 rounded m-4 p-4">
    <p>Ici vous pouvez :</p>
    <ul class="ml-8 list-disc">
        <li>
            <p>Consulter les données liées à l'étudiants sélectionner précédemment.</p>
        </li>
        <li>
            en cliquant sur le groupe, vous pouvez accéder à la fiche du groupe correspondant.
        </li>
    </ul>
</article>

<table class="p-4">
    <caption class="border-b border-slate-700 m-2 text-xl">détail étudiant</caption>
    <tr class="hover:text-white hover:bg-slate-800 hover:cursor-pointer">
        <td class="border-2 border-slate-800 text-right">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailGroupe")%>?id=<%=etudiant.getGroupe().getId()%>"
               class="w-full h-full block p-2">
                Groupe :
            </a>
        </td>
        <td class="border-2 border-slate-800 text-center">
            <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletDetailGroupe")%>?id=<%=etudiant.getGroupe().getId()%>"
               class="w-full h-full block p-2">
                <%=etudiant.getGroupe().getNom()%>
            </a>
        </td>
    </tr>
    <tr>
        <td class="border-2 border-slate-800 p-2 text-right">Moyenne :</td>
        <td class="border-2 border-slate-800 p-2"><%=etudiant.getMoyenne()%></td>
    </tr>
    <tr>
        <td class="border-2 border-slate-800 p-2  text-right">Nombre d'absence : </td>
        <td class="border-2 border-slate-800 p-2"><%=etudiant.getNbAbsences()%></td>
    </tr>
</table>
<jsp:include page="common/footer.jsp"/>