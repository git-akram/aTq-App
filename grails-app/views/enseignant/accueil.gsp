<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Accueil</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil">
			<table align="center">
			<tr><td>Cours</td><td>Description</td></tr>		
				<g:each in="${listInscriptions}" status="i" var="inscriptionInstance">
					<tr>
					<td><g:link action="menu" id="${inscriptionInstance.cours.id}">${fieldValue(bean: inscriptionInstance.cours, field: "libelle")}</g:link></td>
					<td>${fieldValue(bean: inscriptionInstance.cours, field: "description")}</td>
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>