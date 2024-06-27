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

.option-rectangle {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* Creates four columns */
    gap: 5px; /* Spacing between inputs */
    padding: 10px;
    border: 1px solid #ddd; /* Border to create rectangle look */
    background-color: #f9f9f9; /* Light grey background */
    margin-top: 5px;
    box-sizing: border-box; /* Make sure padding and border are included in the total width */
}

.option-rectangle input[type="text"] {
    padding: 5px; /* Padding inside inputs */
    margin-bottom: 0; /* Reset margin bottom */
}

/* Styling adjustments for select and input elements */
.form-style-6 input[type="text"],
.form-style-6 input[type="submit"],
.form-style-6 select {
    width: 100%;
    padding: 5px;
    margin-bottom: 10px;
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
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a class="active" href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
					</div>
				</div>
			</div>

<div class="content-area">
    <!-- PANEL FOR ADDING NEW QUESTIONS -->
<div class="panel form-style-6">   
    <form action="controller.jsp">
        <div class="title">Add New Question</div>
        <table style="width:100%;">
            <tr>
                <td><label for="coursename">Course Name</label></td>
                <td colspan="3">
                    <select id="coursename" name="coursename" class="text">
                        <% 
                            ArrayList list = pDAO.getAllCourses();
                            for(int i = 0; i < list.size(); i = i + 2){
                        %>
                        <option value="<%=list.get(i)%>"><%=list.get(i)%></option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="question">Your Question:</label></td>
                <td colspan="3"><input type="text" id="question" name="question" class="text" placeholder="Type your question here"></td>
            </tr>
            <tr>
                <td><label for="opt1">Option 1:</label></td>
                <td colspan="3"><input type="text" id="opt1" name="opt1" class="text" placeholder="First Option"></td>
            </tr>
            <tr>
                <td><label for="opt2">Option 2:</label></td>
                <td colspan="3"><input type="text" id="opt2" name="opt2" class="text" placeholder="Second Option"></td>
            </tr>
            <tr>
                <td><label for="opt3">Option 3:</label></td>
                <td colspan="3"><input type="text" id="opt3" name="opt3" class="text" placeholder="Third Option"></td>
            </tr>
            <tr>
                <td><label for="opt4">Option 4:</label></td>
                <td colspan="3"><input type="text" id="opt4" name="opt4" class="text" placeholder="Fourth Option"></td>
            </tr>
            <tr>
                <td><label for="correct">Correct Answer</label></td>
                <td colspan="3"><input type="text" id="correct" name="correct" class="text" placeholder="Correct Answer"></td>
            </tr>
            <tr>
                <td colspan="4">
                    <input type="hidden" name="page" value="questions">
                    <input type="hidden" name="operation" value="addnew">
                    <input type="submit" class="form-button" value="Add" name="submit">
                </td>
            </tr>
        </table>
    </form>
</div>
</div>
