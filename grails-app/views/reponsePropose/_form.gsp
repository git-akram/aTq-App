<%@ page import="atq.app.ReponsePropose" %>



<div class="fieldcontain ${hasErrors(bean: reponseProposeInstance, field: 'intitule', 'error')} required">
	<label for="intitule">
		<g:message code="reponsePropose.intitule.label" default="Intitule" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="intitule" required="" value="${reponseProposeInstance?.intitule}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseProposeInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="reponsePropose.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${atq.app.Question.list()}" optionKey="id" required="" value="${reponseProposeInstance?.question?.id}" class="many-to-one"/>
</div>

