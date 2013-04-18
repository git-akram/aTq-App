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
			<g:form action="affectReponse" id="${id }">
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'contenu', 'error')} required">
						<label for="contenu">
							<g:message code="question.contenu.label" default="Libelle" />
							<span class="required-indicator">*</span>
						</label>
						<g:textArea name="contenu" required="" value="${questionInstance?.contenu}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'dateCreation', 'error')} required">
						<label for="dateCreation">
							<g:message code="question.dateCreation.label" default="Date Creation" />
							<span class="required-indicator">*</span>
						</label>
						<g:datePicker name="dateCreation" precision="day" value=""  />
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'aPoser', 'error')} ">
						<label for="aPoser">
							<g:message code="question.aPoser.label" default="Déclencher" />
							
						</label>
						<g:select name="aPoser" from="${[true,false]}" required="" value="" />
					</div>

					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'cours', 'error')} required">
						<label for="cours">
							<g:message code="question.cours.label" default="&nbsp;" />
							<span class="required-indicator"></span>
						</label>
						<g:select id="cours" name="cours.id" from="${atq.app.Cours.get(id)}" optionKey="id" required="" value="" class="many-to-one"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enseignant', 'error')} required">
						<label for="enseignant">
							<g:message code="question.enseignant.label" default="&nbsp;" />
							<span class="required-indicator"></span>
						</label>
						<g:select id="enseignant" name="enseignant.id" from="${atq.app.Enseignant.get(session.userId)}" optionKey="id" required="" value="" class="many-to-one"/>
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
						<g:submitButton name="Suivant" value="${message(code: 'Ajouter un choix', default: 'Ajouter un choix')}" />
					</fieldset>
			</g:form>	
		</fieldset>
	</body>
</html>