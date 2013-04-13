package atq.app

class Enseignant extends Utilisateur{
	String titre
	static belongsTo = [departement:Departement]
	static hasMany = [question:Question]
	
	public boolean isEnseignant(){
		return true;
	}
	
	public boolean isEtudiant(){
		return false;
	}

    static constraints = {
		titre blank:false , inList:['Dotorant','Intervenant','Enseignant','Enseignant-Chercheur']
    }
}
