package atq.app

class Cours {
	String libelle
	String description
	static hasmany = [utilisateur:Utilisateur , question:Question]
	
	
    static constraints = {
		libelle blank:false
		description blank:false
    }
}
