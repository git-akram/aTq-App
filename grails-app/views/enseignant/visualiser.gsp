<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Visualiser les réponses</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil">
			<g:if test="${question!=null }">
				<div>Question Posée : ${question.contenu }</div>
				<div>Nombre de choix totale: ${choixTotal }</div>
				<div>Nombre de réponses totale : ${repTotal }</div>
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
			</g:if>
		</div>
	</body>
</html>