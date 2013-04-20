<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Login</title>
	
	</head>
	<body>
		<div class="conteneur">
			<div class="message">${flash.message}</div>
			<fieldset class="form">
					<g:form action="verify" style="padding-left:200px;">
						<div style="width:220px;">
						<label>Login</label><input type="text" name="login"/>
						<label>Password</label><input type="password" name="password"/>
						<label>&nbsp;</label><input type="submit" value="connexion"/>
						</div>
					</g:form>
			</fieldset>
		</div>
	</body>
</html>