<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/header.jsp"/>
<jsp:useBean id="etudiant" type="uga.carminav.carminavgestionnaireabsencenote.data.Etudiant" scope="request"></jsp:useBean>
<h1 class="text-2xl border-b-2 border-slate-800">Fiche étudiant</h1>
<article class="border border-slate-800 rounded m-4 p-4">
    <h2 class="text-xl">Bienvenue !</h2>
    <p>Bienvenue sur la fiche d'un étudiant</p>
    <p>Ici vous pouvez :</p>
    <ul class="ml-8 list-disc">
        <li>
            <p>Consulter les données liés à l'étudiants sélectionner précédament.</p>
        </li>
    </ul>
</article>

<table class="p-4">
    <caption class="border-b border-slate-700 m-2 text-xl"><%=etudiant.getPrenom()%> <%=etudiant.getNom()%></caption>
    <tr>
        <td class="border border-slate-700 p-2 text-right">Groupe : </td>
        <td class="border border-slate-700 p-2"><%=etudiant.getGroupe().getNom()%></td>
    </tr>
    <tr>
        <td class="border border-slate-700 p-2 text-right">Moyenne :</td>
        <td class="border border-slate-700 p-2"><%=etudiant.getMoyenne()%></td>
    </tr>
    <tr>
        <td class="border border-slate-700 p-2  text-right">Nombre d'absence : </td>
        <td class="border border-slate-700 p-2"><%=etudiant.getNbAbsences()%></td>
    </tr>
</table>
<jsp:include page="common/footer.jsp"/>