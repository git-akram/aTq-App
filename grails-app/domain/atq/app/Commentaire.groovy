package atq.app

class Commentaire {
	String intitule
	static belongsTo=[reponse:Reponse]

    static constraints = {
		intitule blank:false
    }
}
