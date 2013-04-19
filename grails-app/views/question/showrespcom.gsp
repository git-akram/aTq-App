<%@ page import="atq.app.InscriptionAuCours" %>
<%@ page import="atq.app.Utilisateur" %>
<%@ page import="atq.app.Reponse" %>
<%@ page import="atq.app.Commentaire" %>

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
			<tr><th>reponse</th><th>Commentaire</th></tr>	
				<g:each in="${listQuestions}" status="i" var="questionInstance">
					<tr>
					
					

								
									
									<td>${Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword)).reponsePropose.intitule}</td>
									<g:if test="${Commentaire.findByReponse(Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword)))!=null }">
									<td>${Commentaire.findByReponse(Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword))).intitule}</td>
									</g:if>
									
					
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>