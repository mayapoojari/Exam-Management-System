<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<style>
/* Basic Reset */
body, h2, table, input, button {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}

.sidebar {
    background-color: #3b5998;
    /* Add other styles for your sidebar */
}

.content-area {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.panel {
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    margin-bottom: 20px;
    width: 90%;
}

.panel .title {
    font-size: 24px;
    margin-bottom: 20px;
}

.form-style-6 input[type="text"],
.form-style-6 input[type="submit"] {
    width: 230px;
    padding: 5px;
    margin: 10px 0;
}

.form-style-6 input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
}

.form-style-6 label {
    display: block;
    margin: 10px 0;
}

#one-column-emphasis {
    width: 100%;
    margin-top: 20px;
    border-collapse: collapse;
}

#one-column-emphasis th,
#one-column-emphasis td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.delete-btn {
    color: #fff;
    background-color: #e74c3c;
    padding: 3px 6px;
    font-size: 14px;
    text-decoration: none;
    border-radius: 3px;
    cursor: pointer;
}

.delete-btn:hover {
    background-color: #c0392b;
}
</style>


<!-- SIDEBAR -->
			<div class="sidebar" style="background-color:#3b5998">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a class="active" href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
					</div>
				</div>
			</div>
 <!-- CONTENT AREA -->
<div class="content-area">
    <!-- PANEL FOR ADDING NEW COURSE -->
    <div class="panel form-style-6" style="max-width: 450px; margin-bottom: 20px;">
       <div class="title">
           Add New Course
        </div>
        <form action="controller.jsp" style="text-align: center;">
            <br>
            <label>Course Name</label>
            <input type="text" name="coursename" class="text" placeholder="Course Name" style="width: 230px;"><br>
            <label>Total Marks</label>
            <input type="text" name="totalmarks" class="text" placeholder="Total Marks" style="width: 230px;"><br>
            <label>Exam Time</label>
            <input type="text" name="time" class="text" placeholder="MM" style="width: 230px;"><br>
            <input type="hidden" name="page" value="courses">
            <input type="hidden" name="operation" value="addnew">
            <input type="submit" class="form-button" value="Add" name="submit">
        </form>
    </div>

    <!-- PANEL FOR LISTING ALL COURSES -->
    <div class="panel" style="max-width: 800px;">
        <div class="title">
           All Courses
        </div>
        <table id="one-column-emphasis" style="width: 100%; margin-top: 20px;">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">Courses</th>    
                    <th scope="col">T.Marks</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    ArrayList list = pDAO.getAllCourses();
                    for(int i = 0; i < list.size(); i = i + 2) {
                %>
                <tr>
                    <td><%=list.get(i)%></td>
                    <td><%=list.get(i+1)%></td>
                    <td>
                        <a href="controller.jsp?page=courses&operation=del&cname=<%=list.get(i)%>" 
                            onclick="return confirm('Are you sure you want to delete this ?');" class="del">
                            <div class="delete-btn" style="font-size: 17px; padding: 3px">X</div>
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>