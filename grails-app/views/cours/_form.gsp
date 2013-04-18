<%@ page import="atq.app.Cours" %>



<div class="fieldcontain ${hasErrors(bean: coursInstance, field: 'libelle', 'error')} required">
	<label for="libelle">
		<g:message code="cours.libelle.label" default="Libelle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="libelle" required="" value="${coursInstance?.libelle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coursInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="cours.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${coursInstance?.description}"/>
</div>

