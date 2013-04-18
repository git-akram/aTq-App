<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Nouvelle question</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<fieldset class="form">
			<div class="message">${flash.message}</div>
			<g:form action="affectReponse" id="${id }" params="${[idCours:id , idEnseignant:session.userId]}">
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'contenu', 'error')} required">
						<label for="contenu">
							<g:message code="question.contenu.label" default="Libelle" />
							<span class="required-indicator">*</span>
						</label>
						<g:textArea name="contenu" required="" value="${questionInstance?.contenu}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'aPoser', 'error')} ">
						<label for="aPoser">
							<g:message code="question.aPoser.label" default="Déclencher" />
							
						</label>
						<g:select name="aPoser" from="${[true,false]}" required="" value="" />
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'contenu', 'error')} required">
						<label for="contenu">
							<g:message code="Réponse A" default="Réponse A" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="reponseA" required="" value=""/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'contenu', 'error')} required">
						<label for="contenu">
							<g:message code="Réponse B" default="Réponse B" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="reponseB" required="" value=""/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'contenu', 'error')}">
						<label for="contenu">
							<g:message code="Réponse C" default="Réponse C" />
							<span class="required-indicator"></span>
						</label>
						<g:textField name="reponseC" value=""/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'contenu', 'error')}">
						<label for="contenu">
							<g:message code="Réponse D" default="Réponse D" />
							<span class="required-indicator"></span>
						</label>
						<g:textField name="reponseD" value=""/>
					</div>
					<br>
					<fieldset class="buttons">
						<g:submitButton name="Suivant" value="${message(code: 'Enregistrer', default: 'Enregistrer')}" />
					</fieldset>
			</g:form>	
		</fieldset>
	</body>
</html>