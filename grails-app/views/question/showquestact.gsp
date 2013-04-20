<%@ page import="atq.app.InscriptionAuCours" %>
<%@ page import="atq.app.Cours" %>
<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Consulter les commentaire</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="conteneur">
			<g:render template="/Etudiant/menu"></g:render>
			<g:if test="${questionCourante!=null}">
				<g:form class="formular" action="addReponse" style="padding-left:200px;" params="${[idQuestion:questionCourante.id, idEtudiant:session.userId]}">
						<h3>${questionCourante.contenu}</h3><br>		
						<g:each in="${questionCourante.reponsePropose}" status="j" var="reponseInstance">
							<label>${reponseInstance.intitule}</label>		
							<g:radio name="choix" value="${reponseInstance.id}" checked="false" style="float:left;margin-right:3px;"/><br><br>			
						</g:each>
						<g:submitButton name="envoyer" value="envoyer"/>
				</g:form>
			</g:if>
		</div>
	</body>
</html>