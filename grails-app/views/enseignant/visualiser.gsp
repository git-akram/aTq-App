<%@ page import="atq.app.ReponsePropose" %>
<html>
	<head>
	<meta name="layout" content="main"/>
	<title>Visualiser les réponses</title>
	<style type="text/css">
		
	</style>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        ${"var data = google.visualization.arrayToDataTable(["}
        ${ "['Choix', 'Nombre de reponses']"+stat}
         ${"]);" }
        
        var options = {
          title: '${question.contenu}'
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
	
	</head>
	<body>
		<div class="conteneur">
			<g:render template="menu"></g:render>
			<g:if test="${question!=null }">
				
				<div id="chart_div" style="width: 900px; height: 500px;"></div>
				
				<table border="1">
					<tr><th>Etudiant</th><th>Reponse</th><th>Actions</th></tr>
					<g:each in="${listReponse}" status="i" var="reponseInstance">
						<tr>
							<td>${reponseInstance.etudiant.nom+" "+reponseInstance.etudiant.prenom}</td>
							<td>${reponseInstance.reponsePropose.intitule}</td>
							<td>
								<g:link controller="Commentaire" action="newCommentaire" id="${id }" params="[idReponse:reponseInstance.id , idQuestion:question.id]">Commenter</g:link>
							</td>
						</tr>
					</g:each>
				</table>
			</g:if>
		</div>
	</body>
</html>