
<%@ page import="atq.app.Enseignant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enseignant.label', default: 'Enseignant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-enseignant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-enseignant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list enseignant">
			
				<g:if test="${enseignantInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="enseignant.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${enseignantInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="enseignant.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${enseignantInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="enseignant.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${enseignantInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="enseignant.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${enseignantInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="enseignant.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${enseignantInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.isAdmin}">
				<li class="fieldcontain">
					<span id="isAdmin-label" class="property-label"><g:message code="enseignant.isAdmin.label" default="Is Admin" /></span>
					
						<span class="property-value" aria-labelledby="isAdmin-label"><g:formatBoolean boolean="${enseignantInstance?.isAdmin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.titre}">
				<li class="fieldcontain">
					<span id="titre-label" class="property-label"><g:message code="enseignant.titre.label" default="Titre" /></span>
					
						<span class="property-value" aria-labelledby="titre-label"><g:fieldValue bean="${enseignantInstance}" field="titre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.cours}">
				<li class="fieldcontain">
					<span id="cours-label" class="property-label"><g:message code="enseignant.cours.label" default="Cours" /></span>
					
						<g:each in="${enseignantInstance.cours}" var="c">
						<span class="property-value" aria-labelledby="cours-label"><g:link controller="inscriptionAuCours" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.departement}">
				<li class="fieldcontain">
					<span id="departement-label" class="property-label"><g:message code="enseignant.departement.label" default="Departement" /></span>
					
						<span class="property-value" aria-labelledby="departement-label"><g:link controller="departement" action="show" id="${enseignantInstance?.departement?.id}">${enseignantInstance?.departement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="enseignant.question.label" default="Question" /></span>
					
						<g:each in="${enseignantInstance.question}" var="q">
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${enseignantInstance?.id}" />
					<g:link class="edit" action="edit" id="${enseignantInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
