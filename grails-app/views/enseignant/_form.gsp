<%@ page import="atq.app.Enseignant" %>



<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="enseignant.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${enseignantInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="enseignant.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${enseignantInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="enseignant.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${enseignantInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="enseignant.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${enseignantInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="enseignant.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${enseignantInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="enseignant.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${enseignantInstance?.isAdmin}" />
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'titre', 'error')} required">
	<label for="titre">
		<g:message code="enseignant.titre.label" default="Titre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="titre" from="${enseignantInstance.constraints.titre.inList}" required="" value="${enseignantInstance?.titre}" valueMessagePrefix="enseignant.titre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'cours', 'error')} ">
	<label for="cours">
		<g:message code="enseignant.cours.label" default="Cours" />
		
	</label>
	<g:select name="cours" from="${atq.app.Cours.list()}" multiple="multiple" optionKey="id" size="5" value="${enseignantInstance?.cours*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'departement', 'error')} required">
	<label for="departement">
		<g:message code="enseignant.departement.label" default="Departement" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departement" name="departement.id" from="${atq.app.Departement.list()}" optionKey="id" required="" value="${enseignantInstance?.departement?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="enseignant.question.label" default="Question" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${enseignantInstance?.question?}" var="q">
    <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="question" action="create" params="['enseignant.id': enseignantInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link>
</li>
</ul>

</div>

