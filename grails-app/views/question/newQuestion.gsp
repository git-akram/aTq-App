<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Nouvelle question</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="conteneur">
			<g:render template="/Enseignant/menu"></g:render>
			
				<div class="message">${flash.message}</div>
				<g:form class="formular" action="affectReponse" id="${id }" params="${[idCours:id , idEnseignant:session.userId]}">
						
						
							<label for="contenu">
								<g:message code="question.contenu.label" default="Libelle" />
								<span class="required-indicator">*</span>
							</label>
							<g:textArea name="contenu" required="" value="${questionInstance?.contenu}"/>
						
						
						
							<label for="aPoser">
								<g:message code="question.aPoser.label" default="Déclencher" />
								
							</label>
							<g:select name="aPoser" from="${['Oui','Non']}" required="" value="" />
						
						
						
							<label for="contenu">
								<g:message code="Réponse A" default="Réponse A" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="reponseA" required="" value=""/>
						
						
						
							<label for="contenu">
								<g:message code="Réponse B" default="Réponse B" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="reponseB" required="" value=""/>
						
						
						
							<label for="contenu">
								<g:message code="Réponse C" default="Réponse C" />
								<span class="required-indicator"></span>
							</label>
							<g:textField name="reponseC" value=""/>
						
						
						
							<label for="contenu">
								<g:message code="Réponse D" default="Réponse D" />
								<span class="required-indicator"></span>
							</label>
							<g:textField name="reponseD" value=""/>
						
						<br>
						<g:submitButton name="Suivant" value="Enregistrer" />
				</g:form>	
			
		</div>
	</body>
</html>