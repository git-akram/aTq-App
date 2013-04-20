<%@ page import="atq.app.InscriptionAuCours" %>
<%@ page import="atq.app.Utilisateur" %>
<%@ page import="atq.app.Reponse" %>
<%@ page import="atq.app.Commentaire" %>

<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Voir les commentaires</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="conteneur">
			<g:render template="/Etudiant/menu"></g:render>
			<table border="1">
			<tr><th>Question</th><th>reponse</th><th>Commentaire</th></tr>	
				<g:each in="${listQuestions}" status="i" var="questionInstance">
					<tr>
						<g:if test="${Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword))!=null}">
							<td>${ questionInstance.contenu}</td>
							<td>${Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword)).reponsePropose.intitule}</td>
						</g:if>
						<g:if test="${Commentaire.findByReponse(Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword)))!=null }">
							<td>${Commentaire.findByReponse(Reponse.findByQuestionAndEtudiant(questionInstance,Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword))).intitule}</td>
						</g:if>
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>