package atq.app

class Cours {
	String libelle
	String description
	static hasmany = [utilisateurs:InscriptionAuCours , question:Question]
	
	
    static constraints = {
		libelle blank:false
		description blank:false
    }
}
