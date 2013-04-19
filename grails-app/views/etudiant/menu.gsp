<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Menu</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
	
		<div class="accueil">
			<g:link  controller="Question" action="showquestact" params="[idc:params.idCours,ide:params.idEnseignant]" >Question courante</g:link>
			<g:link controller="Question" action="showrespcom" params="[idc:params.idCours,ide:params.idEnseignant]">Consulter les commentaires</g:link>
		</div>
		
	</body>
</html>