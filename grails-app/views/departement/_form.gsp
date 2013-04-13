<%@ page import="atq.app.Departement" %>



<div class="fieldcontain ${hasErrors(bean: departementInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="departement.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${departementInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departementInstance, field: 'enseignant', 'error')} ">
	<label for="enseignant">
		<g:message code="departement.enseignant.label" default="Enseignant" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departementInstance?.enseignant?}" var="e">
    <li><g:link controller="enseignant" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="enseignant" action="create" params="['departement.id': departementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'enseignant.label', default: 'Enseignant')])}</g:link>
</li>
</ul>

</div>

