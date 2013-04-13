<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Accueil</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="accueil">
			<table align="center">
			<tr><td>Cours</td><td>Enseignants</td></tr>		
				<g:each in="${listDeCours}" status="i" var="coursInstance">
					<tr>
					<td>${fieldValue(bean: coursInstance, field: "libelle")}</td>
					<td>
						<g:if test="${coursInstance.utilisateurs=null}">
							<g:each in="${coursInstance.utilisateurs}" status="j" var="enseignantInstance">
								<g:if test="${enseignantInstance.isEnseignant()}">
									<g:link action="menu" idCours="${coursInstance.id}" idEnseignant="${enseignantInstance.id}">
									${fieldValue(bean: enseignantInstance, field: "nom")}&nbsp;
									${fieldValue(bean: enseignantInstance, field: "prenom")}
									</g:link><br>
								</g:if>
							</g:each>
						</g:if>
					</td>
					</tr>		
				</g:each>
			</table>	
		</div>
	</body>
</html>