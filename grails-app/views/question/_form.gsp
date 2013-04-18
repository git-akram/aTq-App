<%@ page import="atq.app.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'contenu', 'error')} required">
	<label for="contenu">
		<g:message code="question.contenu.label" default="Contenu" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contenu" required="" value="${questionInstance?.contenu}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'dateCreation', 'error')} required">
	<label for="dateCreation">
		<g:message code="question.dateCreation.label" default="Date Creation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateCreation" precision="day"  value="${questionInstance?.dateCreation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'aPoser', 'error')} ">
	<label for="aPoser">
		<g:message code="question.aPoser.label" default="A Poser" />
		
	</label>
	<g:checkBox name="aPoser" value="${questionInstance?.aPoser}" />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'cours', 'error')} required">
	<label for="cours">
		<g:message code="question.cours.label" default="Cours" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cours" name="cours.id" from="${atq.app.Cours.list()}" optionKey="id" required="" value="${questionInstance?.cours?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enseignant', 'error')} required">
	<label for="enseignant">
		<g:message code="question.enseignant.label" default="Enseignant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseignant" name="enseignant.id" from="${atq.app.Enseignant.list()}" optionKey="id" required="" value="${questionInstance?.enseignant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'reponse', 'error')} ">
	<label for="reponse">
		<g:message code="question.reponse.label" default="Reponse" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.reponse?}" var="r">
    <li><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponse" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponse.label', default: 'Reponse')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'reponsePropose', 'error')} ">
	<label for="reponsePropose">
		<g:message code="question.reponsePropose.label" default="Reponse Propose" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.reponsePropose?}" var="r">
    <li><g:link controller="reponsePropose" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponsePropose" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose')])}</g:link>
</li>
</ul>

</div>

