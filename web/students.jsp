<%-- 
    Document   : books
    Created on : 22 Mar, 2022, 1:48:49 AM
    Author     : Gourav
--%>

<%@page import="lms.model.Students"%>
<%@page import="lms.dao.StudentsDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.connection.mysqlConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS | STUDENTS</title>

        <link rel="stylesheet" href="books.css">
        <link rel="stylesheet" href="uniFooter.css">
        <script src="https://kit.fontawesome.com/bbbf36e78d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>

        <div class="gridContainer2">
            <div class="grid2" id="grid1"><a href="addStudents.jsp"><i class="fa-solid fa-book-bookmark"></i><h3> ADD STUDENTS  </h3></a></div>
        </div>

        <div class="searchBar">
            <form action="searchStudents.jsp" >
                Search Students
                <input type="text" name="studentsSearch" placeholder="Search">
                <button type="submit" ><i id="searchBookButton" class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>

        <c:if test="${not empty editSuccess}" >
            <h2><p class="bookAdded">${editSuccess}</p></h2>
            <c:remove var="editSuccess" scope="session" />
        </c:if>
        <c:if test="${not empty editFailed}" >
        <h2> <p class="bookFailed">${editFailed}</p></h2>
            <c:remove var="editFailed" scope="session" />
        </c:if> 

        <table>
            <thead>
                <tr>
                    <th>Enrollment No.</th>
                    <th>Name</th>
                    <th>Programme</th>
                    <th>Semester</th>
                    <th>Batch</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <%                    mysqlConnection con;
                    StudentsDao studentsDao = new StudentsDao();
                    List<Students> showStudents = new ArrayList<>();
                    showStudents = studentsDao.showAllStudents();

                    for (Students students : showStudents) {
                %>
                <tr>
                    <td><%=students.getEnrollment()%></td>
                    <td><%=students.getFirstName()%> <%= students.getLastName()%></td>
                    <td><%=students.getProgramme()%></td>
                    <td><%=students.getSemester()%></td>
                    <td><%=students.getBatch()%></td>
                    <td>
                        <a id="green" href="editStudents.jsp?enroll=<%=students.getEnrollment()%>">Edit</a>
                        <a id="red" href="StudentDelete?enroll=<%=students.getEnrollment()%>">Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>






        <section class="footer">
  <div class="footer-container">
      <div  id="footer1">
          <i class="fa-solid fa-copyright"></i>Copyright 2022 | All rights reserved
      </div>
      <div class="portfolio">
          <a  href="gourav-portfolio.html">curious about developer?</a>
      </div>
      <div class="footer-items" >
          <i class="fa-brands fa-instagram" id="instagram"></i>
          <i class="fa-brands fa-linkedin-in" id="linkedin"></i>
          <i class="fa-brands fa-github" id="github"></i>
          <i class="fa-brands fa-discord" id="discord"></i>
      </div>
  </div>
</section>


    </body>
</html>
