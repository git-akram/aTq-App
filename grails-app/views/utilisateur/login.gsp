<html>
	<head>
	<meta name="layout" content="main"/>
	<title></title>
	<style type="text/css">
		label{
			float:left;
			width:65px;
		}
	</style>
	
	</head>
	<body>
		<div class="message">${flash.message}</div>
		<g:form action="verify" style="padding-left:200px;">
			<div style="width:220px;">
				<label>Login</label><input type="text" name="login"/>
				<label>Password</label><input type="password" name="password"/>
				<label>&nbsp;</label><input type="submit" value="connexion"/>
			</div>
		</g:form>
	</body>
</html>