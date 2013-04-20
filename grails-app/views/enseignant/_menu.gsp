<div class="menu">
	<g:link class="lienMenu" controller="Enseignant" action="accueil">Choisir un autre cours</g:link>
	<g:link class="lienMenu" controller="Question" action="newQuestion" id="${id}">Nouvelle question</g:link>
	<g:link class="lienMenu" controller="Enseignant" action="listQuestion" id="${id }">Déclencher/clôturer une question</g:link>
	<g:if test="${session.userAdmin==true }">
		<g:link class="lienMenu" controller="Utilisateur" action="administration">Administration</g:link>
	</g:if>
</div>