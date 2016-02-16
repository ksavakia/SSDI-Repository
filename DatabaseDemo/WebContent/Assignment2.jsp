<html>
<head>
<%@ page import="java.sql.*" %>
<%-- page import="com.mysql.jdbc.Driver" --%>
<%
// mysql driver
String driver = "com.mysql.jdbc.Driver";
//out.println(driver);
// the "url" to our DB, the last part is the name of the DB
String url = "jdbc:mysql://localhost:3306/";
String name = "root";
String pass = "0104";
%>
<title>Testing Database Connection</title>
</head>
<body>
<p align=center > Welcome </p> 
<%
try
{
// Test the DB connection by making an empty table
String tableStr = "select * from Company.Employee";

Class.forName("com.mysql.jdbc.Driver").newInstance();

// initialize the Connection, with our DB info ...
String database="Company";
Connection con = DriverManager.getConnection( url+database, name, pass );

Statement stat = con.createStatement();
ResultSet rs= stat.executeQuery( tableStr );
%>
<%
%><table align=center border=4>
<tr>
    <th>Employee ID</th>
    <th>First Name</th>
      <th>Last Name</th>
    
 </tr>
 <%
while(rs.next())
{
    %>
   
   
    <tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
   
    </tr>
   
    <%
   
}
 %>
 </table><%


%>
<%
// close connection
con.close();
}

catch (SQLException sqle)
{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }

catch(ClassNotFoundException cnfe)
{ out.println("<p> Error opening JDBC, cause:</p> <b>" + cnfe + "</b>"); }

%>
</body>
</html>