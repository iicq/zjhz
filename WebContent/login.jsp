<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>资金互助 登陆</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>欢迎您来到资金互助！</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="author" content="GaoXiang" />
<!-- <link href="/tools/bootstrap/css/bootstrap.min.css" 		rel="stylesheet">
<link href="/oa/css/login.css"	 										rel="stylesheet"> -->
<link href="/tools/bootstrap/css/bootstrap.min.css" 		rel="stylesheet">
<link href="/oa/css/style-login-saagood.css"	 				rel="stylesheet">
<link href="/oa/css/demo-login.css"	 								rel="stylesheet">
<link href="/image/favicon.ico"  										rel="shortcut icon"/>

<script src="/tools/js/jquery-1.11.1.js">								</script>
 <script src="/tools/bootstrap/js/bootstrap.min.js">			</script> 
<script src="/tools/bootbox/bootbox.min.js">					</script>
<script src="/tools/js/tools.js">											</script>
<script src="/tools/js/md5.js">											</script>


<script>
	/**
	 * 验证用户是否登录
	 */
	var nowAccountPowerLogin = "${session.account.power}";
	if(nowAccountPowerLogin == "1"){
		window.location.href="/oa/index.jsp";
	}else if(nowAccountPowerLogin == "0"){
		window.location.href="/web/index.jsp";
	}
	
	//绑定回车事件
	$(document).keydown(function(event){
    	if(event.keyCode==13){
    		subm();
    	}
    });
	
	//页面加载完成后使用户名框获取焦点
	$(document).ready(function(){
		//$("input[name='data.username']")[0].focus();
		$("input[name='verify']")[0].focus();
		getVerifyCode();
	}); 
	
	
	//提交、验证 方法
	function subm(){
		var param = tools.formParams("form");
		
        if(param["data.username"] == null || param["data.username"].replace(/\s/g,"") == ""){
        	tools.tip("请输入用户名！");
        	return;
        }
        if(param["data.password"] == null || param["data.password"].replace(/\s/g,"") == ""){
        	tools.tip("请输入密码！");
        	return;
        }
        param["data.password"] = hex_md5(param["data.password"]);
		$.post("/oa/login_login",param,function(data1){
			
			var data = $.parseJSON(data1);
			 
			if(data.success){
				window.location.href="/oa/index.jsp";
				/* if(data.data == 1){
					window.location.href="/oa/index.jsp";
				}else{
				    window.location.href="/web/index.jsp";  
				} */
			}else{
				var _case = {1:"服务器拒绝登陆！",2:"用户名或密码错误！",3:"验证码错误！"};
				tools.adminErrorTip(_case,data.code); 
				getVerifyCode();
			}
		});
	}
	
	//获取验证码图片
	function getVerifyCode(){
		var img = $("#verify");
		tools.loadAction("/oa/getVerifyCode_login", {"verify":new Date().getTime()}, function(data){
			img.attr("src","data:image/gif;base64,"+data	);
		});
	}
	
	function tipToGet(){
		tools.tip("<div style=\"color: black;\">请联系后台为您开通服务：<br><br>电话：400-0531-833    <br><br>QQ：71132637</div>");
	}
	
	function showintro(){
		tools.tip($("#saagoodIntro").html());

	}
</script>


</head>
<body>

   <!--  <div id="form" class="container" align="center">

        <input class="form-control uname" name="data.username"  type="text"  placeholder="你的账号" value="">
        <input class="form-control pwd" name="data.password" type="password" placeholder="密码" value="">
        <input class="form-control verify" name="verify" type="text" placeholder="验证码">
		<img class="vCode" alt="验证码" id="verify" onclick="getVerifyCode();" src="/image/defaultVerify.gif">
        <button style="margin-top: 25px; width:280px;" class="btn btn-lg btn-primary btn-block" onclick="subm();">登录</button>
    </div> -->
    <div id="saagoodIntro" style="display: none;">
    	<div style="color: black;">
    		<h3>专业与责任</h3><br>
    		◆  商品+专业=品牌<br>
			资金互助为客户培养、提升、建设一个健康而知名的品牌<br>
			特别责任是：为品牌做有效的广告，为客户建设一流的媒体<br>
			实行媒体质量监督评测和每年巡查机制，<br>
			确保所建设广告媒体安全及正常使用。后续服务到位。<br><br>
			◆  创作部核心竞争力就是要有创新的思想，给予品牌以鲜明<br>
			个性与活力，用客户认可的作品与客户交流是有价值的，也是唯一的。<br><br>
			◆  资金互助源于专业。为客户提供更有价值的服务。<br>
    	</div>
    </div>
     <div class="container" style="margin-top: 10%;">
			<div align="center">
				<img src="image/" width="300" height="80" alt=""/>
			</div>
			<form  id="form" class="form-2" style="width: 300px;height: 360px;">
				<div align="center">
					<input type="text" name="data.username" placeholder="用户名" style="width: 260px;margin-top: 10px;height: 40px;font-size:19px;">
					<input type="password" name="data.password" placeholder="密码" style="width: 260px;margin-top: 10px;height: 40px;font-size:19px;" >
					<input type="text" name="verify" placeholder="验证码" style="width: 170px;float: left;margin-left: 5px;margin-top: 5px;font-size:19px;height: 40px;">
					<img style="margin-top: 5px;float: left;margin-left: 10px;height: 40px;width: 80px;" class="vCode" alt="验证码"  id="verify" onclick="getVerifyCode();" src="/image/defaultVerify.gif">
				</div>
			    <p class="clearfix" style="padding-left:5px;"> 
					<a href="#" class="log-twitter" style="margin-top: 13px;width: 260px;border-radius:20px;" onclick="subm();">登  录</a>    
			    </p>
                <h1 ></h1>
               	<div style="width:100%; font-size:16px; color:#303030; font-family:'Microsoft YaHei'; text-align: center;">
               		 没有资金互助账号？
               	</div>
                <p class="clearfix" style="padding-left:5px; padding-top:15px;"> 
					<a href="#" class="log-twitter2" onclick="tipToGet();" style="width: 260px;border-radius:20px;">获取账号</a>    
			 	</p>
			</form>
        </div>
        <div  class="visible-desktop"  style="height:30px; color: #696969; font-size:17px; font-family:'Microsoft YaHei'; margin:0 auto;" align="center" >  
         <div>版权：2014 ziJinHuZhu | <a href="javascript:showintro();">资金互助官网</a>  </div>
         <div style="margin-top: 10px;">电话：400-0531-833  | QQ：71132637 </div>
         </div>
        
    
</body>
</html>