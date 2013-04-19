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
			
				
				
					
						<g:if test="${questionCourante!=null}">

								<g:form action="verify" style="padding-left:200px;">
									<div style="width:220px;">
									<label>${questionCourante.contenu}</label><br>
									<g:each in="${questionCourante.reponsePropose}" status="j" var="reponseInstance">
									
									<g:radio name="choix" value="${reponseInstance.id}"/>${reponseInstance.intitule}<br>
									
							
									</g:each>
									<input type="submit" value="envoyer"/>
									</div>
									</g:form>
					     </g:if>
					
					
						
			
				
		</div>
	</body>
</html>