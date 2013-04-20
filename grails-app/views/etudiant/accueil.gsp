<%@ page import="atq.app.InscriptionAuCours" %>
<%@ page import="atq.app.Cours" %>
<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Accueil</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
	<div class="message">${flash.message}</div>
		<div class="conteneur">
			<table border="1">
			<tr><th>Cours</th><th>Enseignants</th></tr>	
				<g:each in="${listInscriptions}" status="i" var="coursInstance">
					<tr>
					<td>${fieldValue(bean: coursInstance.cours, field: "libelle")}</td>
					<td>
							<g:each in="${InscriptionAuCours.findAllByCours(coursInstance.cours).utilisateur}" status="j" var="enseignantInstance">
								<g:if test="${enseignantInstance.isEnseignant()}">

									<g:link controller="Question" action="showquestact" params="[idc:coursInstance.cours.id,ide:enseignantInstance.id]">

									${fieldValue(bean: enseignantInstance, field: "nom")}&nbsp;
									${fieldValue(bean: enseignantInstance, field: "prenom")}
									</g:link><br>
								</g:if>
							</g:each>
					</td>
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>