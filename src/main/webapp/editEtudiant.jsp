<%@ page import="uga.carminav.carminavgestionnaireabsencenote.data.Groupe" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="common/header.jsp"/>
<jsp:useBean id="groupes" type="java.util.List<uga.carminav.carminavgestionnaireabsencenote.data.Groupe>" scope="request"/>
<jsp:useBean id="etudiant" type="uga.carminav.carminavgestionnaireabsencenote.data.Etudiant" scope="request"/>
<h1 class="text-2xl border-b-2 border-slate-800">Edition d'un étudiant</h1>

<article class="border border-slate-800 rounded m-4 p-4">
    <p>Ici vous pouvez :</p>
    <ul class="ml-8 list-disc">
        <li>
            <p>Editer un étudiant.</p>
        </li>
    </ul>
</article>

<form action="<%=application.getContextPath()%>/do<%=application.getInitParameter("servletEditEtudiant")%>" class="m-4 grid grid-cols-5 gap-2 border-2 border-slate-700 p-4 w-6/12" method="get">
    <label for="prenom">Prénom : </label>
    <input id="prenom" name="prenom" placeholder="entrez le prénom" class="col-span-4 border-b border-slate-700" type="text" value="<%=etudiant.getPrenom()%>" required/>
    <label for="nom">Nom : </label>
    <input id="nom" name="nom" placeholder="entrez le nom" class="col-span-4 border-b border-slate-700" type="text" value="<%=etudiant.getNom()%>" required/>
    <label for="moyenne">Moyenne : </label>
    <input id="moyenne" name="moyenne" placeholder="0.0" class="col-span-4 border-b border-slate-700" type="number" step="0.1" min="0.0" max="20.0" value="<%=etudiant.getMoyenne()%>" required/>
    <label for="absence">Absence : </label>
    <input id="absence" name="absence" placeholder="0" class="col-span-4 border-b border-slate-700" type="number" min="0" value="<%=etudiant.getNbAbsences()%>" required/>
    <label for="groupe">Groupe : </label>
    <select id="groupe" name="groupeId" class="col-span-4 border-b border-slate-700" required>
        <%
            for(Groupe groupe : groupes) {
        %>
            <option value="<%=groupe.getId()%>"
                <% if(etudiant.getGroupe().getId() == groupe.getId()) { %>
                       selected
                <%}%>
            ><%=groupe.getNom()%></option>
        <%
            }
        %>
    </select>
    <input name="idEtudiant" type="hidden" id="idEtudiant" value="<%=etudiant.getId()%>">
    <input type="submit" class="border border-slate-700 p-2 hover:bg-slate-700 hover:text-white hover:cursor-pointer" value="valider">
</form>
<jsp:include page="common/footer.jsp"/>