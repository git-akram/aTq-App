package atq.app

class ReponsePropose {
	String intitule
	static belongsTo = [question:Question]

    static constraints = {
		intitule blank:false
    }
}
