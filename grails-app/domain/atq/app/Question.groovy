package atq.app

class Question {
	String contenu
	Date dateCreation
	boolean aPoser
	static hasOne = [enseignant:Enseignant]
	static belongsTo = [cours:Cours]
	static hasMany = [reponse:Reponse , reponsePropose:ReponsePropose]
	
	
    static constraints = {
		contenu blank:false
		dateCreation blank:false
    }
}
