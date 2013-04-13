
<%@ page import="atq.app.InscriptionAuCours" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inscriptionAuCours" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inscriptionAuCours" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="inscriptionAuCours.utilisateur.label" default="Utilisateur" /></th>
					
						<th><g:message code="inscriptionAuCours.cours.label" default="Cours" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inscriptionAuCoursInstanceList}" status="i" var="inscriptionAuCoursInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inscriptionAuCoursInstance.id}">${fieldValue(bean: inscriptionAuCoursInstance, field: "utilisateur")}</g:link></td>
					
						<td>${fieldValue(bean: inscriptionAuCoursInstance, field: "cours")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inscriptionAuCoursInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
