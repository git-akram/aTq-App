package atq.app

class Reponse {
	static belongsTo = [question:Question,etudiant:Etudiant,commentaire:Commentaire,reponsePropose:ReponsePropose]

    static constraints = {
    }
}
