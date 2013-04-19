package atq.app

class Reponse {
	static belongsTo = [question:Question,etudiant:Etudiant,reponsePropose:ReponsePropose]

    static constraints = {
    }
}
