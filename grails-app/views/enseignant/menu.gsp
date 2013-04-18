<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Menu</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil">
			<g:link controller="Question" action="create" id="${id }">Nouvelle question</g:link>
			<g:link action="declencher" id="${id }">Déclencher/clôturer une question</g:link>
			<g:link action="visualiser" id="${id }">Visualiser les réponses</g:link>	
		</div>
	</body>
</html>