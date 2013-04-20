<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'glyphicons-halflings.png')}">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'glyphicons-halflings-white.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'enseignant.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'formular.css')}" type="text/css">
		<!--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">-->
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="header">
			<div style="float:left;padding-top:3px;">
				<img src="${resource(dir: 'images', file: 'logo.png')}"/>
			</div>
			<div style="float:right;padding:4px;">
				<g:if test="${session.userLogin==null}">
					<g:link controller="Utilisateur" action="login">Connexion</g:link>
				</g:if>
				<g:if test="${session.userLogin!=null}">
					Logged as ${session.userName}&nbsp;|&nbsp;
					<g:link controller="Utilisateur" action="logout">Deconnexion</g:link>
				</g:if>
			</div>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"><h3>aTq-App</h3></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
