<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<div class="mypageMain">
	<ul>
		<li>내 정보</li>
		<li>즐겨찾기 설정</li>
		<li>최근게임 설정</li>
	</ul>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:mariadb://127.0.0.1:3306/TotalGame";
		String db_id = "root";
		String db_pw = "iotiot";
		
		int getNo = 0;
		if(session.getAttribute("login") != null){
			getNo = (int) session.getAttribute("login");
		}else{
	%>
		<script>
			if(window.location.pathname == "/toalGame/member/mypage.jsp"){
				alert("잘못된 접근입니다");
				location.href = "http://localhost:8080/toalGame/";
			}
		</script>
	<%
		}
		
		String sql = "select * from member where no='"+ getNo +"';";
		
		try{
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);

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
				<div>
					<div>
						<div><div><a><%= id %></a></div></div>
						<div><div><a><%= password %></a></div></div>
						<div><div><a><%= nickname %></a></div></div>
					</div>
					<div>
						<div><div><a><%= name %></a></div></div>
						<div><div><a><%= email %></a></div></div>
						<div><div><a><%= phone %></a></div></div>
					</div>
					<a type="button">정보 수정</a>
				</div>
				<form method="get" action="noLook/singuppage.jsp">
					<div>
						<h1>회원정보 수정</h1>
						<div>
							<div><div><input type="text" name="id" value="<%= id %>"></div></div>
							<div><div><input type="password" name="pw"value="<%= password %>"></div></div>
							<div><div><input type="text" name="ni" value="<%= nickname %>"></div></div>
						</div>
						<div>
							<div><div><input type="text" name="nm" value="<%= name %>"></div></div>
							<div><div><input type="text" name="em" value="<%= email %>"></div></div>
							<div><div><input type="text" name="ph" value="<%= phone %>"></div></div>
						</div>
					</div>
					<input type="submit" value="수정">
				</form>
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
	
	
</div>