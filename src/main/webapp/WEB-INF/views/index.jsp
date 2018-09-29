<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<jsp:include page="/WEB-INF/views/include/base-include.jsp">
	<jsp:param name="include" value="base,layer,layui,jqgrid,app" />
</jsp:include>

<title>qcz - 初始化框架</title>

<style type="text/css">
* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

html {
	background-size: 100% 100%;
	background-repeat: no-repeat;
	height: 100%;
}

body {
	height: 100%;
}

.content {
	width: 100%;
	height: 88%;
}

/* .jquery-accordion-menu {
	width: 18%;
	height: 100%;
	overflow-y: auto;
	background: #414956;
} */

/* .filterinput {
	background-color: rgba(249, 244, 244, 0);
	border-radius: 15px;
	width: 90%;
	height: 30px;
	border: thin solid #FFF;
	text-indent: 0.5em;
	font-weight: bold;
	color: #FFF;
} */

#demo-list a {
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
	text-decoration: none;
}

.loginInfo a {
	text-decoration: none;
}

#demo-list {
	top: 60px;
}

.header {
	width: 100%;
	height: 60px;
	min-width: 10%;
	background: #23262E;
	color: white;
}

.iframe {
	width: 88%;
	height: 97%;
	margin-left: 11%;
}

.title {
	width: 241px;
	font-size: 30px;
	padding: 5px;
	height: 100%;
}

.title img {
	width: 100%;
	height: 100%;
}

.loginInfo {
	position: absolute;
	top: -1px;
	right: 30px;
}

.current-site {
	height: 4.5%;
	width: 89%;
	margin-left: 11%;
	padding: 5px 0 5px 10px;
}
</style>
</head>
<body>
	<div class="header layui-header">
		<div class="title"><img src="${ctxStatic }/common/images/logo6.png"></div>
		<div class="loginInfo">
			<ul class="layui-nav">
				<li class="layui-nav-item"><a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">${currentUser.userName}</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">修改信息</a>
						</dd>
						<dd>
							<a href="exit" class="exitUser">退出</a>
						</dd>
					</dl>
				</li>
			</ul>
			<!-- <ul class="nav nav-pills">
				<li><a href="#"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span><br> <span>用户：管理员</span>
				</a></li>
				<li><a href="exit" class="exitUser"> <span class="glyphicon glyphicon-off" aria-hidden="true"></span><br> <span>退出</span>
				</a></li>
			</ul> -->
		</div>
	</div>
	<div class="content">
		<div id="demo-list" class="layui-side layui-bg-black">
			<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
				<c:forEach items="${menuTrees }" var="itemOne">
					<c:choose>
						<c:when test="${itemOne.hasChild }">
							<li class="layui-nav-item layui-nav-itemed">
								<a href="javascript:;"><i class="${itemOne.icon }"></i>&nbsp;&nbsp;${itemOne.name } </a>
								<dl class="layui-nav-child">
									<c:forEach items="${itemOne.childrens }" var="itemTwo">
										<c:choose>
											<c:when test="${itemTwo.hasChild }">
												<li class="layui-nav-item layui-nav-itemed">
													<a href="javascript:;"><i class="${itemTwo.icon }"></i>&nbsp;&nbsp;${itemTwo.name } </a>
													<dl class="layui-nav-child">
														<c:forEach items="${itemTwo.childrens }" var="itemThree">
															<dd class="J_menuItem" data-title="${itemOne.name} > ${itemTwo.name} > ${itemThree.name}"><a href="${ctx}${itemThree.url }"><i class="${itemThree.icon }"></i>&nbsp;&nbsp;${itemThree.name } </a></dd>
														</c:forEach>
													</dl>
												</li>
											</c:when>
											<c:otherwise>
												<dd class="J_menuItem" data-title="${itemOne.name} > ${itemTwo.name}"><a href="${ctx}${itemTwo.url }"><i class="${itemTwo.icon }"></i>&nbsp;&nbsp;${itemTwo.name } </a></dd>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</dl>
							</li>
						</c:when>
						<c:otherwise>
							<li class="layui-nav-item J_menuItem" data-title="${itemOne.name}"><a href="${ctx}${itemOne.url }"><i class="${itemOne.icon }"></i>&nbsp;&nbsp;${itemOne.name } </a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="current-site">当前位置：<span id="site" class="text-danger"></span></div>
		<hr style="margin: 0;">
		<div class="iframe">
			<iframe id="J_iframe" height="100%" width="100%" frameborder="0" seamless=""></iframe>
		</div>
	</div>

	<script type="text/javascript">
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				$("#site").text(elem.attr("data-title"));
			});
		});

		$(function() {
			//菜单点击
			$(".J_menuItem").on('click', function() {
				var url = $(this).find("a").attr('href');
				$("#J_iframe").attr('src', url);
				return false;
			});
		});
	</script>
</body>
</html>
