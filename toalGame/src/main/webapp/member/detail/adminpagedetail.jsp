<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<div class="adminpageMain">
	<h1>관리자 페이지</h1>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:mariadb://127.0.0.1:3306/TotalGame";
		String db_id = "root";
		String db_pw = "iotiot";
		
		String sql = "select * from member";
		
		try{
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
	%>
	<table>
		<tr>
			<th>no</th>
			<th>id</th>
			<th>pass</th>
			<th>name</th>
			<th>email</th>
			<th>phone</th>
			<th>address</th>
			<th>admin</th>
		</tr>	
		
		<%
			while(rs.next()){
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String nickname = rs.getString("nickname");
				boolean admin = rs.getBoolean("admin");
		%>
			<tr>
				<th><%= no %></th>
				<th><%= id %></th>
				<th><%= password %></th>
				<th><%= name %></th>
				<th><%= email %></th>
				<th><%= phone %></th>
				<th><%= nickname %></th>
				<th><%= admin %></th>
			</tr>	
		<%
			}
				
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
	</table>
</div>