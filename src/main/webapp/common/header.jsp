<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <title><%=application.getInitParameter("title")%></title>
</head>
<body>
    <header class="bg-slate-800 text-white p-4">
        <nav>
            <ul class="flex">
                <li>
                    <a href="<%= application.getContextPath()%><%=application.getInitParameter("urlAccueil")%>"
                        class="px-4 py-2 hover:text-slate-800 hover:bg-white">
                        Accueil
                    </a>
                </li>
                <li>
                    <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletListeEtudiants")%>"
                       class="px-4 py-2 hover:text-slate-800 hover:bg-white">
                        Etudiants
                    </a>
                </li>
                <li>
                    <a href="<%= application.getContextPath()%>/do<%=application.getInitParameter("servletListeGroupes")%>"
                       class="px-4 py-2 hover:text-slate-800 hover:bg-white">
                        Groupes
                    </a>
                </li>
            </ul>
        </nav>
    </header>
<main class="p-8">