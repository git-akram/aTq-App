package atq.app

class Departement {
	String nom
	static hasMany = [enseignant:Enseignant]

    static constraints = {
		nom blank:false
    }
}
