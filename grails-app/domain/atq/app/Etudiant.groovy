package atq.app

class Etudiant extends Utilisateur{
	String formation
	
	public boolean isEtudiant(){
		return true;
	}
	
	public boolean isEnseignant(){
		return false;
	}
	
    static constraints = {
		formation blank:false
    }
}
