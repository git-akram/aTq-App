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
				<g:each in="${listDeCours}" status="i" var="coursInstance">
					<tr>
					<td><g:link action="menu" id="${coursInstance.id}">${fieldValue(bean: coursInstance, field: "libelle")}</g:link></td>
					<td>${fieldValue(bean: coursInstance, field: "description")}</td>
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>