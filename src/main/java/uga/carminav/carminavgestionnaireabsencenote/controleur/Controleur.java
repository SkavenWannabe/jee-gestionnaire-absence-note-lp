package uga.carminav.carminavgestionnaireabsencenote.controleur;

import uga.carminav.carminavgestionnaireabsencenote.Etudiant;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
public class Controleur extends HttpServlet {

    // URL
    private String urlAccueil;
    private String urlListeEtudiants;

    // INIT
    public void init() throws ServletException {
        urlAccueil = getInitParameter("urlAccueil");
        urlListeEtudiants = getInitParameter("urlListeEtudiants");

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
        String id = request.getPathInfo();
        if (id == null) {
            id = "/index";
            System.out.println("id == null");
        }
        System.out.println("GAN : id = " + id);

        // Exécution action
        if (methode.equals("get") && id.equals("/index")) {
            doDetail(request, response);
        } else {
            doAccueil(request, response);
        }
    }

    //
    private void doDetail(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        String temp = request.getParameter("id");
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");

        request.setAttribute("etudiant", new Etudiant(id, nom, prenom));
        loadJSP("/detailListEtudiant.jsp", request, response);
    }

    //
    private void doAccueil(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException, IOException {
        loadJSP(urlAccueil, request, response);
    }

    private void doListeEtudiants(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
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
        rd.include(request, response);
    }


}
