<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
		</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String password = request.getParameter("pw");
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String url = "jdbc:mariadb://127.0.0.1:3306/TotalGame";
			String db_id = "root";
			String db_pw = "iotiot";
			
			String sql = "select * from member;";
			try{
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					int no = rs.getInt("no");
					String getId = rs.getString("id");
					String getPass = rs.getString("password");
					boolean admin = rs.getBoolean("admin");
					
					if(id.equals(getId) && password.equals(getPass)){
						session.setAttribute("login", no);
						if(admin == true){
							session.setAttribute("grade", "관리자");							
						}else{
							session.setAttribute("grade", "일반 사용자");	
						}
						out.print(
								"<script>alert("+"'로그인에 성공하셨습니다'"+");"+
								"location.href ="+"'http://localhost:8080/toalGame/';</script>");
						break;
					}
				}
				out.print(
						"<script>alert("+"'로그인에 실패하셨습니다'"+");"+
						"location.href ="+"'http://localhost:8080/toalGame/member/login.jsp';</script>");
			}catch(Exception e){
				System.out.println("member.jsp에서 db접속 중 오류 발생 : " + e);
			}finally{
				try{
					if(rs != null)rs.close();
					if(stmt != null)stmt.close();
					if(conn != null)conn.close();
				}catch(Exception ex){
					System.out.println("member.jsp에서 db접속 해제 중 오류 발생 : " + ex);
				}
			}
		%>
	</body>
</html>