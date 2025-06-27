<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String password = request.getParameter("pw");
			String name = request.getParameter("nm");
			String email = request.getParameter("em");
			String phone = request.getParameter("ph");
			String nickname = request.getParameter("ni");
			
			Connection conn = null;
			Statement stmt = null;
			
			String url = "jdbc:mariadb://127.0.0.1:3306/totalgame";
			String db_id = "root";
			String db_pw = "iotiot";
			
			String sql = 
					"insert into member(id, password, name, email, phone, nickname) values (";
			sql +="'" + id +"', '" + password + "', '"+ name + "', '"+  email + "', '"+ phone + "', '"+ nickname + "');";
			
			try{
				//연결
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection(url, db_id, db_pw);
				stmt = conn.createStatement();
				stmt.execute(sql);
				
			}catch(Exception e){
				System.out.println("insert.jsp에서 db 접속 중 오류 발생 : " + e);
			}finally{
				try{
					if(stmt != null)stmt.close();
					if(conn != null)conn.close();
				}catch(Exception ex){
					System.out.println("insert.jsp에서 db 접속 해제 오류 발생 : " + ex);
				}
			}
			response.sendRedirect("http://localhost:8080/toalGame/");
		%>
		
	</body>
</html>