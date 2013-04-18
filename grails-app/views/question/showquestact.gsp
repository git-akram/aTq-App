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
		<div class="accueil" align="center">
			
				<g:each in="${listQuestion}" status="i" var="questionInstance">
				
					
						<g:if test="${questionInstance.findByAPoser(true)!=null}">

								
									<label>${fieldValue(bean: questionInstance, field: "contenu")}</label>
									<g:each in="${questionInstance.reponsePropose}" status="j" var="reponseInstance">
									
									<g:radio name="${reponseInstance.intitule}" value="${reponseInstance.intitule}"/>
									
							
									</g:each>
									<input type="submit" value="envoyer"/>
					</g:if>
						
				</g:each>
				
		</div>
	</body>
</html>