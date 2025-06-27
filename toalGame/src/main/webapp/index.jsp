<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Total Game</title>
		<script src="Https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href="css/index.css?after">
		<script type="text/javascript" src="js/indexJs.js?after"></script>
	</head>
	<body>
		
		<div class="wrap">
			<div class="header">
				<div class="headerMenu">
					<img alt="" src="images/icon_menu.png" class="subMenuButton">
					<div class="mainMenu">
						<ul>
							<li><a href="http://localhost:8080/toalGame/">Total Game</a></li>
							<li><a href="http://localhost:8080/toalGame/member/gamelink.jsp">게임 링크</a></li>
							<li><a href="http://localhost:8080/toalGame/member/favorites.jsp">즐겨찾기</a></li>
							<li><a href="http://localhost:8080/toalGame/member/community.jsp">게시판</a></li>
						</ul>	
					</div>
					<div class="loginMenu">
						<ul>
							<%
								if(session.getAttribute("login") == null){
							%>
								<li class="login"><a href="http://localhost:8080/toalGame/member/login.jsp">로그인</a></li>
								<li class="signUp"><a href="http://localhost:8080/toalGame/member/signUp.jsp">회원 가입</a></li>
							
							<%
								}else{
							%>
								<li class="myMenuButton"><img alt="" src="images/basicImage.png" class="basicImage">
							<%
								}
							%>
								<div class="myMenu">
									<ul>
										<li><a href="http://localhost:8080/toalGame/member/mypage.jsp">마이페이지</a></li>
										<%
										if(session.getAttribute("grade") == "관리자"){
										%>
										<li><a href="http://localhost:8080/toalGame/admin/adminpage.jsp">관리자 페이지</a></li>
										<%
											}
										%>
										<li><a href="http://localhost:8080/toalGame/member/logout.jsp">로그아웃</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="mainDetail">
				<jsp:include page="member/detail/signupdetail.jsp"></jsp:include>
				<jsp:include page="member/detail/adminpagedetail.jsp"></jsp:include>
				<jsp:include page="member/detail/logindetail.jsp"></jsp:include>
				<jsp:include page="member/detail/mypagedetail.jsp"></jsp:include>
				<jsp:include page="member/detail/gamelinkdetail.jsp"></jsp:include>
				<jsp:include page="member/detail/favoritesdetail.jsp"></jsp:include>
				<jsp:include page="member/detail/gamedetail.jsp"></jsp:include>
				<jsp:include page="member/detail/communitydetail.jsp"></jsp:include>
			</div>	
		</div>
		<div class="footer">
			<div class="footerDetail">
			</div>
		</div>
		<div class="subMenu">
			<div class="subMenuDetail">
				<h1>최근한 게임</h1>
				<ul>
					<li>게임
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
					</li>
					<li>게임 링크
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
					</li>
				</ul>
			</div>
</div>
	</body>
</html>