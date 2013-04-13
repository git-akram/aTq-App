
<%@ page import="atq.app.Etudiant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'etudiant.label', default: 'Etudiant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-etudiant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-etudiant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list etudiant">
			
				<g:if test="${etudiantInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="etudiant.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${etudiantInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etudiantInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="etudiant.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${etudiantInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etudiantInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="etudiant.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${etudiantInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etudiantInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="etudiant.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${etudiantInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etudiantInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="etudiant.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${etudiantInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etudiantInstance?.isAdmin}">
				<li class="fieldcontain">
					<span id="isAdmin-label" class="property-label"><g:message code="etudiant.isAdmin.label" default="Is Admin" /></span>
					
						<span class="property-value" aria-labelledby="isAdmin-label"><g:formatBoolean boolean="${etudiantInstance?.isAdmin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${etudiantInstance?.formation}">
				<li class="fieldcontain">
					<span id="formation-label" class="property-label"><g:message code="etudiant.formation.label" default="Formation" /></span>
					
						<span class="property-value" aria-labelledby="formation-label"><g:fieldValue bean="${etudiantInstance}" field="formation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etudiantInstance?.cours}">
				<li class="fieldcontain">
					<span id="cours-label" class="property-label"><g:message code="etudiant.cours.label" default="Cours" /></span>
					
						<g:each in="${etudiantInstance.cours}" var="c">
						<span class="property-value" aria-labelledby="cours-label"><g:link controller="cours" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${etudiantInstance?.id}" />
					<g:link class="edit" action="edit" id="${etudiantInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
