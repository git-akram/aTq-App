package atq.app

import org.springframework.dao.DataIntegrityViolationException

class QuestionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
    }

    def create() {
        [questionInstance: new Question(params)]
    }

    def save() {
        def questionInstance = new Question(params)
        if (!questionInstance.save(flush: true)) {
            render(view: "create", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
    }

    def show(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def edit(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def update(Long id, Long version) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionInstance.version > version) {
                questionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'question.label', default: 'Question')] as Object[],
                          "Another user has updated this Question while you were editing")
                render(view: "edit", model: [questionInstance: questionInstance])
                return
            }
        }

        questionInstance.properties = params

        if (!questionInstance.save(flush: true)) {
            render(view: "edit", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
    }

    def delete(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        try {
            questionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def newQuestion(Long id){
		[id:id]
	}
	
	def affectReponse(Long id){
		[id:id]
		boolean aPoser
		if(params.aPoser=='Oui'){
			aPoser=true
			for (q in Question.list()){
				q.setaPoser(false)
				q.save()
			}
		}
		else if(params.aPoser=='Non'){
			aPoser=false
		}
		def questionInstance=new Question(contenu : params.contenu , 
										  dateCreation : new Date() , 
										  aPoser : aPoser , 
										  cours : Cours.get(params.idCours) , 
										  enseignant : Enseignant.get(params.idEnseignant) )
		
		def reponseA=new ReponsePropose(intitule : params.reponseA)
		reponseA.save()
		questionInstance.addToReponsePropose(reponseA)
		
		def reponseB=new ReponsePropose(intitule : params.reponseB)
		reponseB.save()
		questionInstance.addToReponsePropose(reponseB)
		
		if(params.reponseC != ""){
			def reponseC=new ReponsePropose(intitule : params.reponseC)
			reponseC.save()
			questionInstance.addToReponsePropose(reponseC)
		}
		if(params.reponseD != ""){
			def reponseD=new ReponsePropose(intitule : params.reponseD)
			reponseD.save()
			questionInstance.addToReponsePropose(reponseD)
		}
			
		if(questionInstance.save(flush:true)){
			redirect(controller:'Enseignant' , action:'listQuestion' , id:id)
		}
		else{
			flash.message="An error has occured while creating the question"
			redirect(action:'newQuestion', id:id)
		}
	}
	
	def declencher(Long id){
		for (q in Question.findAllByCoursAndEnseignant(Cours.get(id),Enseignant.get(session.userId))){
			q.setaPoser(false)
			q.save()
		}
			
		def question = Question.get(params.idQuestion)
		
		def questionInstance=new Question(contenu : question.contenu ,
										dateCreation : new Date() ,
										aPoser : true ,
										cours : question.cours ,
										enseignant : question.enseignant )
		
		questionInstance.save()
		redirect(controller:'Enseignant' , action:'listQuestion' , id:id)
	}
	
	def cloturer(Long id){	
		def question = Question.get(params.idQuestion)
		question.setaPoser(false)
		question.save()
		redirect(controller:'Enseignant' , action:'listQuestion' , id:id)
	}
	
	def supprimer(Long id){
		def questionInstance = Question.get(params.idQuestion)
		if (!questionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.idQuestion])
			redirect(controller:'Enseignant' , action:'listQuestion' , id:id)
			return
		}
	
		try {
			questionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.idQuestion])
			redirect(controller:'Enseignant' , action:'listQuestion' , id:id)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.idQuestion])
			redirect(controller:'Enseignant' , action:'listQuestion' , id:id)
		}
	}
}
