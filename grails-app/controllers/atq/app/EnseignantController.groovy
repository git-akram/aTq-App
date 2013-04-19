package atq.app

import org.springframework.dao.DataIntegrityViolationException

class EnseignantController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [enseignantInstanceList: Enseignant.list(params), enseignantInstanceTotal: Enseignant.count()]
    }

    def create() {
        [enseignantInstance: new Enseignant(params)]
    }

    def save() {
        def enseignantInstance = new Enseignant(params)
        if (!enseignantInstance.save(flush: true)) {
            render(view: "create", model: [enseignantInstance: enseignantInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), enseignantInstance.id])
        redirect(action: "show", id: enseignantInstance.id)
    }

    def show(Long id) {
        def enseignantInstance = Enseignant.get(id)
        if (!enseignantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), id])
            redirect(action: "list")
            return
        }

        [enseignantInstance: enseignantInstance]
    }

    def edit(Long id) {
        def enseignantInstance = Enseignant.get(id)
        if (!enseignantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), id])
            redirect(action: "list")
            return
        }

        [enseignantInstance: enseignantInstance]
    }

    def update(Long id, Long version) {
        def enseignantInstance = Enseignant.get(id)
        if (!enseignantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (enseignantInstance.version > version) {
                enseignantInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'enseignant.label', default: 'Enseignant')] as Object[],
                          "Another user has updated this Enseignant while you were editing")
                render(view: "edit", model: [enseignantInstance: enseignantInstance])
                return
            }
        }

        enseignantInstance.properties = params

        if (!enseignantInstance.save(flush: true)) {
            render(view: "edit", model: [enseignantInstance: enseignantInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), enseignantInstance.id])
        redirect(action: "show", id: enseignantInstance.id)
    }

    def delete(Long id) {
        def enseignantInstance = Enseignant.get(id)
        if (!enseignantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), id])
            redirect(action: "list")
            return
        }

        try {
            enseignantInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'enseignant.label', default: 'Enseignant'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def accueil={
		if(session.userLogin==null || session.userPassword==null)
			redirect(controller='Utilisateur' , action= 'logout')
		def utilisateur=Utilisateur.findByLoginAndPassword(session.userLogin,session.userPassword)
		[listInscriptions:InscriptionAuCours.findAllByUtilisateur(utilisateur)]
	}
	
	def menu(Long id){
		if(session.userLogin==null || session.userPassword==null)
			redirect(controller='Utilisateur' , action= 'logout')
		[id:id]
	}


	def declencher(Long id){

	}
	def listQuestion(Long id){

		if(session.userLogin==null || session.userPassword==null)
			redirect(controller='Utilisateur' , action= 'logout')
		[id:id , questionList:Question.findAllByEnseignantAndCours(Enseignant.get(session.userId),Cours.get(id)).sort{[it.dateCreation]}]
		
	}
	
	def visualiser(Long id){
		if(session.userLogin==null || session.userPassword==null)
			redirect(controller='Utilisateur' , action= 'logout')
		def question=Question.findByAPoser(true)
		//if(question!=null)
			def listReponse=Reponse.findAllByQuestion(Question.get(question.id))
		[id:id,question:question,listReponse:listReponse]
		
	}
	
}
