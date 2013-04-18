<%@ page import="atq.app.InscriptionAuCours" %>
<%@ page import="atq.app.Cours" %>
<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Question Courante</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil" align="center">
			<table align="center">
			<tr><td>reponse</td><td>Commentaire</td></tr>	
				<g:each in="${listQuestion}" status="i" var="questionInstance">
					<tr>
					
					
							<g:each in="${Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword))}" status="j" var="reponseInstance">
								
									
									<td>${(reponseInstance.reponsePropose).intitule}</td>
									<td>${(reponseInstance.commentaire).intitule}</td>
									
							
							</g:each>
					
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>