package uga.carminav.carminavgestionnaireabsencenote.controleur;

import uga.carminav.carminavgestionnaireabsencenote.data.Etudiant;
import uga.carminav.carminavgestionnaireabsencenote.data.EtudiantDAO;
import uga.carminav.carminavgestionnaireabsencenote.data.GestionFactory;
import uga.carminav.carminavgestionnaireabsencenote.data.Groupe;
import uga.carminav.carminavgestionnaireabsencenote.data.GroupeDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
public class Controleur extends HttpServlet {

    // URL
    private String urlAccueil;
    private String urlListeEtudiants;
    private String urlDetailEtudiants;


    // ACTION
    private String m_doListeEtudiants;
    private String m_doDetailEtudiant;

    // INIT
    public void init() throws ServletException {
        urlAccueil = getInitParameter("urlAccueil");
        urlListeEtudiants = getInitParameter("urlListeEtudiants");
        urlDetailEtudiants = getInitParameter("urlDetailEtudiant");

        m_doListeEtudiants = getInitParameter("servletListeEtudiant");
        m_doDetailEtudiant = getInitParameter("servletDetailEtudiant");

        // Création de la factory permettant la création d'EntityManager
        // (gestion des transactions)
        GestionFactory.open();

        ///// INITIALISATION DE LA BD
        // Normalement l'initialisation se fait directement dans la base de données
        if ((GroupeDAO.getAll().size() == 0) && (EtudiantDAO.getAll().size() == 0)) {

            // Creation des groupes
            Groupe MIAM = GroupeDAO.create("miam");
            Groupe SIMO = GroupeDAO.create("SIMO");
            Groupe MESSI = GroupeDAO.create("MESSI");

            // Creation des étudiants
            EtudiantDAO.create("Francis", "Brunet-Manquat", MIAM, 20);
            EtudiantDAO.create("Philippe", "Martin", MIAM, 19);
            EtudiantDAO.create("Mario", "Cortes-Cornax", MIAM, 12);
            EtudiantDAO.create("Françoise", "Coat", SIMO, 12);
            EtudiantDAO.create("Laurent", "Bonnaud", MESSI, 12);
            EtudiantDAO.create("Sébastien", "Bourdon", MESSI, 12);
            EtudiantDAO.create("Mathieu", "Gatumel", SIMO, 12);
        }
    }

    // POST
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // on passe la main au GET
        doGet(request, response);
    }

    // GET
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        // On récupère la méthode d'envoi de la requête
        String methode = request.getMethod().toLowerCase();

        // On récupère l'action à exécuter
        String pathInfo = request.getPathInfo();
        if (pathInfo == null)
            pathInfo = "/index";


        // Exécution action
        if (methode.equals("get") && pathInfo.equals(m_doListeEtudiants)) {
            doListeEtudiants(request, response);
        } else if(methode.equals("get") && pathInfo.equals(m_doDetailEtudiant)) {
            doDetail(request, response);
        } else {
            doAccueil(request, response);
        }
    }

    //
    private void doDetail(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        Etudiant etudiant = EtudiantDAO.retrieveById(Integer.parseInt(request.getParameter("id")));

        request.setAttribute("etudiant", etudiant);
        loadJSP(urlDetailEtudiants, request, response);
    }

    //
    private void doAccueil(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException, IOException {
        includeJSP(urlAccueil, request, response);
    }

    private void doListeEtudiants(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les étudiants
        List<Etudiant> etudiants = EtudiantDAO.getAll();

        // Ajouter les étudiants à la requête pour affichage
        request.setAttribute("etudiants", etudiants);

        loadJSP(urlListeEtudiants, request, response);
    }


    /**
     * Charge la JSP indiquée en paramètre
     *
     * @param url
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void includeJSP(String url, HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {

//		L'interface RequestDispatcher permet de transférer le contrôle à une autre servlet
//		Deux méthodes possibles :
//		- forward() : donne le contrôle à une autre servlet. Annule le flux de sortie de la servlet courante
//		- include() : inclus dynamiquement une autre servlet
//			+ le contrôle est donné à une autre servlet puis revient à la servlet courante (sorte d'appel de fonction). 
//			+ Le flux de sortie n'est pas supprimé et les deux se cumulent

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.include(request, response);
    }

    public void loadJSP(String url, HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {

//		L'interface RequestDispatcher permet de transférer le contrôle à une autre servlet
//		Deux méthodes possibles :
//		- forward() : donne le contrôle à une autre servlet. Annule le flux de sortie de la servlet courante
//		- include() : inclus dynamiquement une autre servlet
//			+ le contrôle est donné à une autre servlet puis revient à la servlet courante (sorte d'appel de fonction).
//			+ Le flux de sortie n'est pas supprimé et les deux se cumulent

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
