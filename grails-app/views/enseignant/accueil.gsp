<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Accueil</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="conteneur">
			<table border="1">
			<tr><th>Cours</th><th>Description</th></tr>		
				<g:each in="${listInscriptions}" status="i" var="inscriptionInstance">
					<tr>
					<td><g:link action="listQuestion" id="${inscriptionInstance.cours.id}">${fieldValue(bean: inscriptionInstance.cours, field: "libelle")}</g:link></td>
					<td>${fieldValue(bean: inscriptionInstance.cours, field: "description")}</td>
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>