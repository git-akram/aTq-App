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
						<div class="fieldContain required"><label>Login</label><g:textField required="" name="login"/></div>
						<div class="fieldContain required"><label>Password</label><g:passwordField required="" name="password"/></div>
						<label>&nbsp;</label><g:submitButton name="connexion" value="connexion"/>	
					</g:form>
			</fieldset>
		</div>
	</body>
</html>