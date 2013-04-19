
<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Nouvelle question</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="conteneur">
			<g:render template="/Enseignant/menu"></g:render>
			<fieldset class="form">
				<div class="message">${flash.message}</div>
				<g:form action="saveCommentaire" id="${id}" params="${[idQuestion:params.idQuestion , idReponse:params.idReponse]}">
					<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'intitule', 'error')} required">
						<label for="intitule">
							<g:message code="commentaire.intitule.label" default="Intitule" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="intitule" required="" value=""/>
					</div>
					<br/>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'Ajouter', default: 'Ajouter')}" />
					</fieldset>
				</g:form>	
			</fieldset>
		</div>
	</body>
</html>