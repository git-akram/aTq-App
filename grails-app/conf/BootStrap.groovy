import atq.app.Cours
import atq.app.Departement
import atq.app.Enseignant
import atq.app.Etudiant
import atq.app.InscriptionAuCours
import atq.app.Utilisateur

class BootStrap {

    def init = { servletContext ->
		/*def etudiant1=new Etudiant(
							nom: "dupond",
							prenom: "jack",
							email: "jack.dupond@univ-tlse3.com",
							login: "jack01",
							password: "password",
							formation: "M1 Informatique - DL" )
		etudiant1.save()
		
		def etudiant2=new Etudiant(
							nom: "matieu",
							prenom: "jean",
							email: "jean.mathieu@univ-tlse3.com",
							login: "jean01",
							password: "password",
							formation: "M1 Informatique - IM" )
		etudiant2.save()
		
		def departement1=new Departement(nom: "Informatique")
		departement1.save()
		
		def departement2=new Departement(nom: "Mathématique")
		departement2.save()
		
		def enseignant1=new Enseignant(
									nom: "more",
									prenom: "jean-mark",
									email: "jean-mark.more@irit.com",
									login: "jean-mark01",
									password: "password",
									titre: "Enseignant-Chercheur",
									departement: departement1)
		enseignant1.save()
		
		def enseignant2=new Enseignant(
									nom: "lucas",
									prenom: "thierry",
									email: "thierry.lucas@irit.com",
									login: "thierry01",
									password: "password",
									titre: "Enseignant-Chercheur",
									departement: departement2)
		enseignant2.save()
		
		def cours1=new Cours(libelle: "Jee", description: "Developpement d'application réparties en Jee")
		cours1.save()
		
		def cours2=new Cours(libelle: "DCLL", description: "Developpement collaboratif et logiciels libres")
		cours2.save()
		
		def cours3=new Cours(libelle: "IAWS", description: "Intéropérabilité Web services")
		cours3.save()
		
		def cours4=new Cours(libelle: "AL", description: "Architecture logiciel")
		cours4.save()
		
		def inscription1=new InscriptionAuCours(utilisateur:  enseignant1, cours: cours1)
		inscription1.save()
		
		def inscription2=new InscriptionAuCours(utilisateur:  enseignant2, cours: cours1)
		inscription2.save()
		
		def inscription3=new InscriptionAuCours(utilisateur:  etudiant1, cours: cours1)
		inscription3.save()
		
		def inscription4=new InscriptionAuCours(utilisateur:  enseignant1, cours: cours2)
		inscription4.save()
		
		def inscription5=new InscriptionAuCours(utilisateur:  etudiant1, cours: cours2)
		inscription5.save()
		
		def inscription6=new InscriptionAuCours(utilisateur:  enseignant2, cours: cours3)
		inscription6.save()
		
		def inscription7=new InscriptionAuCours(utilisateur:  etudiant1, cours: cours3)
		inscription7.save()
		
		def inscription8=new InscriptionAuCours(utilisateur:  etudiant2, cours: cours3)
		inscription8.save()*/
		
		
		
    }
    def destroy = {
    }
}
