import atq.app.Commentaire
import atq.app.Cours
import atq.app.Departement
import atq.app.Enseignant
import atq.app.Etudiant
import atq.app.InscriptionAuCours
import atq.app.Question
import atq.app.Reponse
import atq.app.ReponsePropose
import atq.app.Utilisateur

class BootStrap {

    def init = { servletContext ->
		// Ajout des etudiants
		def etudiant1=new Etudiant(
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
		
		def etudiant3=new Etudiant(
							nom: "jalbert",
							prenom: "Mona",
							email: "mona.jalbert@univ-tlse3.com",
							login: "mona01",
							password: "password",
							formation: "M1 Informatique - DL" )
		etudiant3.save()
		
		def etudiant4=new Etudiant(
								nom: "ramond",
								prenom: "philipe",
								email: "philipe.ramond@univ-tlse3.com",
								login: "philipe01",
								password: "password",
								formation: "M1 Informatique - DL" )
		etudiant4.save()
		
		// Ajout des departements
		def departement1=new Departement(nom: "Informatique")
		departement1.save()
		
		def departement2=new Departement(nom: "Mathématique")
		departement2.save()
		
		// Ajout des enseignants
		def enseignant1=new Enseignant(
									nom: "lucas",
									prenom: "thierry",
									email: "thierry.lucas@irit.com",
									login: "thierry01",
									password: "password",
									isAdmin: true,
									titre: "Enseignant",
									departement: departement2)
		enseignant1.save()
		
		def enseignant2=new Enseignant(
									nom: "more",
									prenom: "jean-mark",
									email: "jean-mark.more@irit.com",
									login: "jean-mark01",
									password: "password",
									isAdmin: true,
									titre: "Enseignant-Chercheur",
									departement: departement1)
		enseignant2.save()
		
		def enseignant3=new Enseignant(
									nom: "lons",
									prenom: "thomas",
									email: "thomas.lons@irit.com",
									login: "thomas01",
									password: "password",
									isAdmin: true,
									titre: "Enseignant-Chercheur",
									departement: departement1)
		enseignant3.save()
		
		// Ajout des cours
		def cours1=new Cours(libelle: "Jee", description: "Developpement d'application réparties en Jee")
		cours1.save()
		
		def cours2=new Cours(libelle: "DCLL", description: "Developpement collaboratif et logiciels libres")
		cours2.save()
		
		def cours3=new Cours(libelle: "IAWS", description: "Intéropérabilité Web services")
		cours3.save()
		
		// Inscrire les utilisateurs aux cours
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
		inscription8.save()
		
		def inscription9=new InscriptionAuCours(utilisateur:  enseignant3, cours: cours3)
		inscription9.save()
		
		def inscription10=new InscriptionAuCours(utilisateur:  etudiant2, cours: cours1)
		inscription10.save()
		
		def inscription11=new InscriptionAuCours(utilisateur:  etudiant3, cours: cours1)
		inscription11.save()
		
		def inscription12=new InscriptionAuCours(utilisateur:  etudiant4, cours: cours1)
		inscription12.save()
		
		// Ajout des questions
		
		def question1=new Question(contenu : "Avez-vous compris ?",
								   dateCreation : new Date(),
								   aPoser : true,
								   enseignant: enseignant1,
								   cours: cours1)
		question1.save()
		def choix11 = new ReponsePropose(intitule : "Oui", question : question1)
		choix11.save()
		def choix12 = new ReponsePropose(intitule : "Non", question : question1)
		choix12.save()
		def choix13 = new ReponsePropose(intitule : "Un peu", question : question1)
		choix13.save()
		question1.addToReponsePropose(choix11)
		question1.addToReponsePropose(choix12)
		question1.addToReponsePropose(choix13)
		question1.save()
		
		def question2=new Question(contenu : "Comment trouvez-vous ce cours ?",
									dateCreation : new Date(),
									aPoser : false,
									enseignant: enseignant1,
									cours: cours1)
		question2.save()
		def choix21 = new ReponsePropose(intitule : "Super", question : question2)
		choix21.save()
		def choix22 = new ReponsePropose(intitule : "Nul", question : question2)
		choix22.save()
		def choix23 = new ReponsePropose(intitule : "Pas mal", question : question2)
		choix23.save()
		def choix24 = new ReponsePropose(intitule : "On peut faire mieux", question : question2)
		choix24.save()
		question2.addToReponsePropose(choix21)
		question2.addToReponsePropose(choix22)
		question2.addToReponsePropose(choix23)
		question2.addToReponsePropose(choix24)
		question2.save()
		
		def question3=new Question(contenu : "Avez-vous résussi à terminer la série ?",
									dateCreation : new Date(),
									aPoser : false,
									enseignant: enseignant1,
									cours: cours1)
		question3.save()
		def choix31 = new ReponsePropose(intitule : "Oui", question : question3)
		choix31.save()
		def choix32 = new ReponsePropose(intitule : "Non", question : question3)
		choix32.save()
		def choix33 = new ReponsePropose(intitule : "Seulement un seul exercice", question : question3)
		choix33.save()
		def choix34 = new ReponsePropose(intitule : "Seulement deux exercices", question : question3)
		choix34.save()
		question3.addToReponsePropose(choix31)
		question3.addToReponsePropose(choix32)
		question3.addToReponsePropose(choix33)
		question3.addToReponsePropose(choix34)
		question3.save()
		
		def question4=new Question(contenu : "Avez-vous compris ?",
									dateCreation : new Date(),
									aPoser : false,
									enseignant: enseignant1,
									cours: cours1)
		question4.save()
		def choix41 = new ReponsePropose(intitule : "Oui", question : question4)
		choix41.save()
		def choix42 = new ReponsePropose(intitule : "Non", question : question4)
		choix42.save()
		def choix43 = new ReponsePropose(intitule : "Un peu", question : question4)
		choix43.save()
		question4.addToReponsePropose(choix41)
		question4.addToReponsePropose(choix42)
		question4.addToReponsePropose(choix43)
		question4.save()
		
		// Réponses de l'étudiant 1
		def reponse1=new Reponse(question:question1,etudiant:etudiant1,reponsePropose:choix11)
		reponse1.save()
		
		def com1=new Commentaire(intitule:  "C'est bien", reponse: reponse1)
		com1.save()
		
		def reponse2=new Reponse(question:question2,etudiant:etudiant1,reponsePropose:choix22)
		reponse2.save()
		
		def com2=new Commentaire(intitule:  "C'est noté", reponse: reponse2)
		com2.save()
		
		def reponse3=new Reponse(question:question3,etudiant:etudiant1,reponsePropose:choix32)
		reponse3.save()
		
		// Réponse de l'étudiant 2
		def reponse4=new Reponse(question:question1,etudiant:etudiant2,reponsePropose:choix12)
		reponse4.save()
		
		def com3=new Commentaire(intitule:  "Envoyer moi un mail après pour m'expliquer votre point de vue !", reponse: reponse4)
		com3.save()
		
		def reponse5=new Reponse(question:question2,etudiant:etudiant2,reponsePropose:choix22)
		reponse5.save()
		
		def reponse6=new Reponse(question:question3,etudiant:etudiant2,reponsePropose:choix31)
		reponse6.save()
		
		// Réponse de l'étudiant 3
		def reponse7=new Reponse(question:question1,etudiant:etudiant3,reponsePropose:choix13)
		reponse7.save()
		
		def reponse8=new Reponse(question:question2,etudiant:etudiant3,reponsePropose:choix23)
		reponse8.save()
		
		def reponse9=new Reponse(question:question3,etudiant:etudiant3,reponsePropose:choix31)
		reponse9.save()
		
		// Réponse de l'étudiant 3
		def reponse10=new Reponse(question:question1,etudiant:etudiant4,reponsePropose:choix13)
		reponse10.save()
		
		def reponse11=new Reponse(question:question2,etudiant:etudiant4,reponsePropose:choix24)
		reponse11.save()
		
		def reponse12=new Reponse(question:question3,etudiant:etudiant4,reponsePropose:choix31)
		reponse12.save()
		
		
		
		
		
		

    }
    def destroy = {
    }
}
