<!-- Création d'un objet de type etudiant -->
<jsp:useBean id="etudiant" class="uga.carminav.carminavgestionnaireabsencenote.Etudiant" scope="request"/>

<div>
    <p><jsp:getProperty property="id" name="etudiant"/></p>
    <p><jsp:getProperty property="prenom" name="etudiant"/></p>
    <p><jsp:getProperty property="nom" name="etudiant"/></p>
</div>
