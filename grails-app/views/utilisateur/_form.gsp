<%@ page import="atq.app.Utilisateur" %>



<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="utilisateur.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${utilisateurInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="utilisateur.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${utilisateurInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="utilisateur.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${utilisateurInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="utilisateur.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${utilisateurInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="utilisateur.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${utilisateurInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="utilisateur.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${utilisateurInstance?.isAdmin}" />
</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'cours', 'error')} ">
	<label for="cours">
		<g:message code="utilisateur.cours.label" default="Cours" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${utilisateurInstance?.cours?}" var="c">
    <li><g:link controller="inscriptionAuCours" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="inscriptionAuCours" action="create" params="['utilisateur.id': utilisateurInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours')])}</g:link>
</li>
</ul>

</div>

