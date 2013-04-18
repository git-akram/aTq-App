package atq.app

class Utilisateur {
	String nom
	String prenom
	String email
	String login
	String password
	boolean isAdmin
	static hasMany = [cours:InscriptionAuCours]

    static constraints = {
		nom blank:false
		prenom blank:false
		email blank:false , unique:true , email:true
		login blank:false , unique:true
		password blank:false , minSize:6
		isAdmin blank:false , nullable:false
    }
}
