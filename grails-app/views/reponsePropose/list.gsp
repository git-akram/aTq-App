
<%@ page import="atq.app.ReponsePropose" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reponsePropose.label', default: 'ReponsePropose')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reponsePropose" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reponsePropose" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="intitule" title="${message(code: 'reponsePropose.intitule.label', default: 'Intitule')}" />
					
						<th><g:message code="reponsePropose.question.label" default="Question" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reponseProposeInstanceList}" status="i" var="reponseProposeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reponseProposeInstance.id}">${fieldValue(bean: reponseProposeInstance, field: "intitule")}</g:link></td>
					
						<td>${fieldValue(bean: reponseProposeInstance, field: "question")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reponseProposeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
