<%@ page import="atq.app.Etudiant" %>



<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="etudiant.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${etudiantInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="etudiant.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${etudiantInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="etudiant.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${etudiantInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="etudiant.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${etudiantInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="etudiant.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${etudiantInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="etudiant.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${etudiantInstance?.isAdmin}" />
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'formation', 'error')} required">
	<label for="formation">
		<g:message code="etudiant.formation.label" default="Formation" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="formation" required="" value="${etudiantInstance?.formation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'cours', 'error')} ">
	<label for="cours">
		<g:message code="etudiant.cours.label" default="Cours" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${etudiantInstance?.cours?}" var="c">
    <li><g:link controller="inscriptionAuCours" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="inscriptionAuCours" action="create" params="['etudiant.id': etudiantInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours')])}</g:link>
</li>
</ul>

</div>

