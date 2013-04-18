<%@ page import="atq.app.Reponse" %>



<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'commentaire', 'error')} required">
	<label for="commentaire">
		<g:message code="reponse.commentaire.label" default="Commentaire" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="commentaire" name="commentaire.id" from="${atq.app.Commentaire.list()}" optionKey="id" required="" value="${reponseInstance?.commentaire?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'etudiant', 'error')} required">
	<label for="etudiant">
		<g:message code="reponse.etudiant.label" default="Etudiant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="etudiant" name="etudiant.id" from="${atq.app.Etudiant.list()}" optionKey="id" required="" value="${reponseInstance?.etudiant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="reponse.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${atq.app.Question.list()}" optionKey="id" required="" value="${reponseInstance?.question?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'reponsePropose', 'error')} required">
	<label for="reponsePropose">
		<g:message code="reponse.reponsePropose.label" default="Reponse Propose" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reponsePropose" name="reponsePropose.id" from="${atq.app.ReponsePropose.list()}" optionKey="id" required="" value="${reponseInstance?.reponsePropose?.id}" class="many-to-one"/>
</div>

