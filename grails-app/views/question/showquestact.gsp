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
		<div class="conteneur" align="center">
			<g:render template="/Etudiant/menu"></g:render>
			<g:if test="${questionCourante!=null}">
				<g:form action="addReponse" style="padding-left:200px;" params="${[idQuestion:questionCourante.id, idEtudiant:session.userId]}">
					<div style="width:220px;">
						<label>${questionCourante.contenu}</label><br>		
						<g:each in="${questionCourante.reponsePropose}" status="j" var="reponseInstance">		
							<g:radio name="choix" value="${reponseInstance.id}" checked="false"/>${reponseInstance.intitule}<br>			
						</g:each>
						<input type="submit" value="envoyer"/>
					</div>
				</g:form>
			</g:if>
		</div>
	</body>
</html>