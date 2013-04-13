<%@ page import="atq.app.Commentaire" %>



<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'intitule', 'error')} required">
	<label for="intitule">
		<g:message code="commentaire.intitule.label" default="Intitule" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="intitule" required="" value="${commentaireInstance?.intitule}"/>
</div>

