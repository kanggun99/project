$(document).ready(function(){
	/*--------------------header--------------------*/
	$(".subMenuButton").click(function(){
		if($('.subMenu').css('display') == 'none'){  
			$('.subMenu').show();        
		}else{
            $('.subMenu	').hide();        
		}
	})
	
	$(".basicImage").click(function(){
		if($('.myMenuButton').hasClass('ok')){
			$('.myMenuButton').removeClass('ok');
			$('.myMenu').hide();
		}else{
			$('.myMenuButton').addClass('ok');
			$('.myMenu').show(); 
		}
		
	})
	
	if(window.location.pathname != "/toalGame/"){
		$('.basicImage').attr({ src: "../images/basicImage.png"});
		$('.subMenuButton').attr({ src: "../images/icon_menu.png"});
	}
	
	/*--------------------main--------------------*/
	/* 로그인 */
	if(window.location.pathname == "/toalGame/login"){
		if($('.loginMain').css('display') == 'none'){  
			$('.loginMain').show();        
		}else{
            $('.loginMain').hide();        
		}
	};
	
	/* 마이페이지 */
	if(window.location.pathname == "/toalGame/mypage"){
		if($('.mypageMain').css('display') == 'none'){  
			$('.mypageMain').show();        
		}else{
            $('.mypageMain').hide();        
		}
	};
	
	/* 회원가입 */
	if(window.location.pathname == "/toalGame/signup"){
		if($('.signUpMain').css('display') == 'none'){  
			$('.signUpMain').show();        
		}else{
            $('.signUpMain').hide();        
		}
	};
	
	/* 게임링크 */
	if(window.location.pathname == "/toalGame/gamelink"){
		if($('.gamelinkMain').css('display') == 'none'){  
			$('.gamelinkMain').show();        
		}else{
            $('.gamelinkMain').hide();        
		}
	};
	
	/* 즐겨찾기 */
	if(window.location.pathname == "/toalGame/favorites"){
		if($('.favoritesMain').css('display') == 'none'){  
			$('.favoritesMain').show();        
		}else{
            $('.favoritesMain').hide();        
		}
	};
	
	/* 관리자 */
	if(window.location.pathname == "/toalGame/admin/adminpage.jsp"){
		if($('.adminpageMain').css('display') == 'none'){  
			$('.adminpageMain').show();        
		}else{
            $('.adminpageMain').hide();        
		}
	};
	
	/* 메인화면 */
	if(window.location.pathname == "/toalGame/"){
		if($('.gameMain').css('display') == 'none'){  
			$('.gameMain').show();        
		}else{
            $('.gameMain').hide();        
		}
	};
	
	/* 커뮤니티 */
	if(window.location.pathname == "/toalGame/community"){
		if($('.communitydetail').css('display') == 'none'){  
			$('.communitydetail').show();        
		}else{
            $('.communitydetail').hide();        
		}
	};
	
});