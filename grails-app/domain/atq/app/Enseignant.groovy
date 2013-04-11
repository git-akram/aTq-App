package atq.app

class Enseignant extends Utilisateur{
	String titre
	static belongsTo = [departement:Departement]
	static hasMany = [question:Question]

    static constraints = {
		titre blank:false , inList:['Dotorant','Intervenant','Enseignant','Enseignant-Chercheur']
    }
}
