<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Login</title>
	
	</head>
	<body>
		<div class="conteneur">
			<div class="message">${flash.message}</div>
			<fieldset class="form">
					<form class="formular" action="verify" style="padding-left:200px;">
						<div style="width:220px;">
						<label><span>Login</span><input type="text" name="login"/></label>
						<label><span>Password</span><input type="password" name="password"/></label>
						<label><input type="submit" value="connexion"/></label>
						</div>
					</form>
			</fieldset>
		</div>
	</body>
</html>