
<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Commenter</title>
	<style type="text/css">
		
	</style>
	
	</head>
	<body>
		<div class="conteneur">
			<g:render template="/Enseignant/menu"></g:render>
			<fieldset class="form">
				<div class="message">${flash.message}</div>
				<g:form class="formular" action="saveCommentaire" id="${id}" params="${[idQuestion:params.idQuestion , idReponse:params.idReponse]}">
						<label for="intitule">
							<g:message code="commentaire.intitule.label" default="Intitule" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="intitule" required="" value=""/>
					<br/>
					<g:submitButton name="create" value="Ajouter" />
				</g:form>	
			</fieldset>
		</div>
	</body>
</html>