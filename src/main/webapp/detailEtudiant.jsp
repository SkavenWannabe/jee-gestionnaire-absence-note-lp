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
        <li>
            Supprimer l'étudiant grâce au button sous le tableau d'informations.
        </li>
    </ul>
</article>

<table class="p-4">
    <caption class="border-b border-slate-700 m-2 text-xl">Détail étudiant</caption>
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

<div class="mt-4">
    <a href=""
       class="border-2 border-slate-800 p-2 hover:text-white hover:bg-slate-800 hover:cursor-pointer">
        Editer
    </a>

    <button class="border-2 border-slate-800 p-2 ml-16 hover:text-white hover:bg-slate-800 hover:cursor-pointer" type="button" data-modal-toggle="deleteModal">
        Supprimer
    </button>
</div>

<!-- Main modal -->
<div id="deleteModal" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
    <div class="relative px-4 w-full max-w-2xl h-full md:h-auto">

        <div class="relative bg-white rounded-lg shadow">

            <div class="flex justify-between items-start p-5 rounded-t bg-slate-700 text-white">
                <h3 class="text-xl font-semibold lg:text-2xl">
                    Confirmation
                </h3>
                <button type="button" class="text-white bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="deleteModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </button>
            </div>

            <div class="p-6 space-y-6">
                <p class="text-base leading-relaxed text-black">
                    Voulez-vous vraiment supprimer cet étudiant ?
                </p>
            </div>

            <div class="flex items-center p-6 space-x-2 rounded-b bg-slate-700 text-white justify-between">
                <a class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
                    href="<%=application.getContextPath()%>/do<%=application.getInitParameter("servletDeleteEtudiant")%>?id=<%=etudiant.getId()%>">
                    Supprimer
                </a>
                <button data-modal-toggle="deleteModal" type="button" class="bg-slate-700 hover:bg-gray-100 focus:ring-4 focus:ring-gray-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-slate-700 focus:z-10">Annuler</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"/>