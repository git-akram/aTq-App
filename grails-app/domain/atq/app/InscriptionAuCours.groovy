package atq.app

class InscriptionAuCours {
	Utilisateur utilisateur
	Cours cours

    static constraints = {
		utilisateur nullable:false
		cours nullable:false
    }
}
