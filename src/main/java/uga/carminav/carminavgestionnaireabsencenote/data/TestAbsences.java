package fr.iut2.ProjetJPA.data;


import uga.carminav.carminavgestionnaireabsencenote.data.*;

public class TestAbsences {

    /**
     * @param args
     */
    public static void main(String[] args) {

        //
        GestionFactory.open();

        // Initialisation
        // Creation des groupes
        Groupe MIAM = GroupeDAO.create("MIAM");
        Groupe SIMO = GroupeDAO.create("SIMO");
        Groupe MESSI = GroupeDAO.create("MESSI");

        // Initialisation
        // Creation des étudiants
        Etudiant FBM = EtudiantDAO.create("Francis", "Brunet-Manquat", MIAM, 20);
        int idFBM = FBM.getId();
        EtudiantDAO.create("Philippe", "Martin", MIAM, 19);
        EtudiantDAO.create("Mario", "Cortes-Cornax", MIAM, 12);
        EtudiantDAO.create("Françoise", "Coat", SIMO, 12);
        EtudiantDAO.create("Laurent", "Bonnaud", MESSI, 12);
        EtudiantDAO.create("Sébastien", "Bourdon", MESSI, 12);
        Etudiant MG = EtudiantDAO.create("Mathieu", "Gatumel", SIMO, 12);

        // Retrouver un etudiant par son id
        Etudiant etudiant_TMP = EtudiantDAO.retrieveById(idFBM);

        // Modification : ajout d'absences
        etudiant_TMP.setNbAbsences(6);
        EtudiantDAO.update(etudiant_TMP);
        // ou
        EtudiantDAO.addAbsences(idFBM, 4);

        // Suppression d'un étudiant
        EtudiantDAO.remove(MG);
        //EtudiantDAO.remove(MG.getId());

        // Liste des groupes
        System.out.println("Liste des groupes :");
        for (Groupe groupe : GroupeDAO.getAll()) {
            System.out.println(groupe.getId() + " : " + groupe.getNom() + " (" + groupe.getEtudiants().size() + " étudiant(s))");
        }

        // Liste des étudiants
        System.out.println("\nListe des étudiants :");
        for (Etudiant etu : EtudiantDAO.getAll()) {
            System.out.println(etu.getId() + " : " + etu.getPrenom() + " " + etu.getNom() + " " + etu.getGroupe().getNom() + " " + etu.getNbAbsences());
        }


        // Liste des étudiants par groupe
        for (Groupe groupe : GroupeDAO.getAll()) {

            System.out.println("\nListe des étudiants " + groupe.getNom() + " :");
            for (Etudiant etu : groupe.getEtudiants()) {
                System.out.println(etu.getId() + " : " + etu.getPrenom() + " " + etu.getNom() + " " + etu.getGroupe().getNom() + " " + etu.getNbAbsences());
            }
        }

        // Liste des étudiants ayant des absences
        System.out.println("\nListe des étudiants ayant des absences :");
        for (Etudiant etu : EtudiantDAO.getAllByAbsences()) {
            System.out.println(etu.getId() + " : " + etu.getPrenom() + " " + etu.getNom() + " " + etu.getGroupe().getNom() + " " + etu.getNbAbsences());
        }

        // Remove un groupe avec les étudiants associés
        GroupeDAO.remove(SIMO);

        // Remove entities
        EtudiantDAO.removeAll();
        GroupeDAO.removeAll();

        //
        GestionFactory.close();
    }

}
