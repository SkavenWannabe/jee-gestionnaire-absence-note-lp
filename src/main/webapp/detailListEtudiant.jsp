<!-- Création d'un objet de type etudiant -->
<jsp:useBean id="etudiant" class="uga.carminav.carminavgestionnaireabsencenote.Etudiant" scope="request"/>

<tr class="hover:text-white hover:bg-slate-800 hover:cursor-pointer">
    <td class="border-2 border-slate-800 text-center">
        <a href="detailEtudiant.jsp" class="w-full h-full block p-2">
            <jsp:getProperty property="id" name="etudiant"/>
        </a>
    </td>
    <td class="border-2 border-slate-800">
        <a href="detailEtudiant.jsp" class="w-full h-full block p-2">
            <jsp:getProperty property="prenom" name="etudiant"/>
        </a>
    </td>
    <td class="border-2 border-slate-800">
        <a href="detailEtudiant.jsp" class="w-full h-full block p-2">
            <jsp:getProperty property="nom" name="etudiant"/>
        </a>
    </td>
</tr>
