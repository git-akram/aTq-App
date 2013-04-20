<div class="menu">
	<g:link class="lienMenu" controller="Etudiant" action="accueil" >Changer de cours</g:link>
	<g:link class="lienMenu" controller="Question" action="showquestact" params="[idc:params.idc,ide:params.ide]" >Question courante</g:link>
	<g:link class="lienMenu" controller="Question" action="showrespcom" params="[idc:params.idc,ide:params.ide]">Consulter les commentaires</g:link>
	<g:if test="${session.userAdmin==true }">
		<g:link class="lienMenu" controller="Utilisateur" action="administration">Administration</g:link>
	</g:if>
</div>