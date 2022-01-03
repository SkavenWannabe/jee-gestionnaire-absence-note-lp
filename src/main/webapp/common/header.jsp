<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav>
        <ul>
            <li>
                <a href="<%= application.getContextPath()%><%=application.getInitParameter("urlAccueil")%>">Accueil</a>
            </li>
            <li>
                <a href="<%= application.getContextPath()%><%=application.getInitParameter("urlListeEtudiants")%>">Etudiants</a>
            </li>
            <li>
                <a href="google.com">Groupes</a>
            </li>
        </ul>
    </nav>
</header>
