<%@ page import="atq.app.InscriptionAuCours" %>



<div class="fieldcontain ${hasErrors(bean: inscriptionAuCoursInstance, field: 'utilisateur', 'error')} required">
	<label for="utilisateur">
		<g:message code="inscriptionAuCours.utilisateur.label" default="Utilisateur" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="utilisateur" name="utilisateur.id" from="${atq.app.Utilisateur.list()}" optionKey="id" required="" value="${inscriptionAuCoursInstance?.utilisateur?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inscriptionAuCoursInstance, field: 'cours', 'error')} required">
	<label for="cours">
		<g:message code="inscriptionAuCours.cours.label" default="Cours" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cours" name="cours.id" from="${atq.app.Cours.list()}" optionKey="id" required="" value="${inscriptionAuCoursInstance?.cours?.id}" class="many-to-one"/>
</div>

