<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Déclencher/clôturer une question</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil">
		<table border="1">
			<tr><th>Date de création</th><th>Question</th><th>Actions</th></tr>
			<g:each in="${questionList}" status="i" var="questionInstance">
				<tr>
					<td>${questionInstance.dateCreation}</td>
					<td><g:link>${questionInstance.contenu}</g:link></td>
					<td>
						<g:if test="${questionInstance.aPoser == false }">
							<g:link controller ="Question" action="declencher" id="${questionInstance.id}" params="[idCours:id]">Déclencher</g:link>
						</g:if>
						<g:if test="${questionInstance.aPoser == true }">
							<g:link controller ="Question" action="cloturer" id="${questionInstance.id}" params="[idCours:id]">Clôturer</g:link>
						</g:if>
					</td>
				</tr>
			</g:each>
		</table>			
		</div>
	</body>
</html>