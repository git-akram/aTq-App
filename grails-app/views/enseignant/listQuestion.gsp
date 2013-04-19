<%@ page import="atq.app.Question" %>
<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Déclencher/clôturer une question</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil">
		<g:render template="menu"></g:render>
		<table border="1">
			<tr><th>Date de création</th><th>Question</th><th>Actions</th></tr>
			<g:each in="${questionList}" status="i" var="questionInstance">
				<tr>
					<td>${questionInstance.dateCreation}</td>
					<td><g:link>${questionInstance.contenu}</g:link></td>
					<td>
						<g:if test="${questionInstance.aPoser == false }">
							<g:link controller="Question" action="declencher" id="${id }" params="[idQuestion:questionInstance.id]">Déclencher</g:link>
						</g:if>
						<g:if test="${questionInstance.aPoser == true }">
							<g:link controller="Question" action="cloturer" id="${id }" params="[idQuestion:questionInstance.id]">Clôturer</g:link>
						</g:if>
						&nbsp;
						<g:link controller="Question" action="supprimer" id="${id }" params="[idQuestion:questionInstance.id]">Supprimer</g:link>
						&nbsp;
						<g:link action="visualiser" id="${id }" params="[idQuestion:questionInstance.id]">Visualiser</g:link>
					</td>
				</tr>
			</g:each>
		</table>			
		</div>
	</body>
</html>