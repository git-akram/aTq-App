package atq.app

class Cours {
	String libelle
	String description
	static hasmany = [utilisateur:Utilisateur , question:Question]
	
	public List getUtilisateur(){
		return this.utilisateur;
	}
    static constraints = {
		libelle blank:false
		description blank:false
    }
}
