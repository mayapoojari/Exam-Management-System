<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="style-backend.css">
</head>
<body>
    <div class="top-area">
        <center><h2>Admin Panel</h2></center> 
        <a href="controller.jsp?page=logout" class="download_windows chrome purple last" style="float: right; background:#3b5998; color:white">Logout</a>
    </div>

    <%
        if(session.getAttribute("userStatus") != null) {
            if(session.getAttribute("userStatus").equals("1")) {
                // pgpart = pagepart, accounts=1, courses=2, questions=3 and profile is default
                String pagePart = request.getParameter("pgprt");
                if ("1".equals(pagePart)) {
                    %><jsp:include page="accounts.jsp"/><%
                } else if ("2".equals(pagePart)) {
                    %><jsp:include page="courses.jsp"/><%
                } else if ("3".equals(pagePart)) {
                    %><jsp:include page="questions.jsp"/><%
                } else if ("4".equals(pagePart)) { // if( 4 == 4 )
                    %><jsp:include page="showall.jsp"/><%
                } else {
                    %><jsp:include page="profile.jsp"/><%
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>
