<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Visualiser les réponses</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil">
			<div>${question.contenu }</div>
			<table border="1">
				<tr><th>Etudiant</th><th>Reponse</th><th>Actions</th></tr>
				<g:each in="${listReponse}" status="i" var="reponseInstance">
					<tr>
						<td>${reponseInstance.etudiant.nom+" "+reponseInstance.etudiant.prenom}</td>
						<td>${reponseInstance.reponsePropose.intitule}</td>
						<td>
							
						</td>
					</tr>
				</g:each>
			</table>
		</div>
	</body>
</html>