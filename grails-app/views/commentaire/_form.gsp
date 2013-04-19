<%@ page import="atq.app.Commentaire" %>



<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'intitule', 'error')} required">
	<label for="intitule">
		<g:message code="commentaire.intitule.label" default="Intitule" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="intitule" required="" value="${commentaireInstance?.intitule}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'reponse', 'error')} required">
	<label for="reponse">
		<g:message code="commentaire.reponse.label" default="Reponse" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reponse" name="reponse.id" from="${atq.app.Reponse.list()}" optionKey="id" required="" value="${commentaireInstance?.reponse?.id}" class="many-to-one"/>
</div>

