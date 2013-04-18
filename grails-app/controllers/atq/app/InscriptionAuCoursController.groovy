package atq.app

import org.springframework.dao.DataIntegrityViolationException

class InscriptionAuCoursController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inscriptionAuCoursInstanceList: InscriptionAuCours.list(params), inscriptionAuCoursInstanceTotal: InscriptionAuCours.count()]
    }

    def create() {
        [inscriptionAuCoursInstance: new InscriptionAuCours(params)]
    }

    def save() {
        def inscriptionAuCoursInstance = new InscriptionAuCours(params)
        if (!inscriptionAuCoursInstance.save(flush: true)) {
            render(view: "create", model: [inscriptionAuCoursInstance: inscriptionAuCoursInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), inscriptionAuCoursInstance.id])
        redirect(action: "show", id: inscriptionAuCoursInstance.id)
    }

    def show(Long id) {
        def inscriptionAuCoursInstance = InscriptionAuCours.get(id)
        if (!inscriptionAuCoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), id])
            redirect(action: "list")
            return
        }

        [inscriptionAuCoursInstance: inscriptionAuCoursInstance]
    }

    def edit(Long id) {
        def inscriptionAuCoursInstance = InscriptionAuCours.get(id)
        if (!inscriptionAuCoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), id])
            redirect(action: "list")
            return
        }

        [inscriptionAuCoursInstance: inscriptionAuCoursInstance]
    }

    def update(Long id, Long version) {
        def inscriptionAuCoursInstance = InscriptionAuCours.get(id)
        if (!inscriptionAuCoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inscriptionAuCoursInstance.version > version) {
                inscriptionAuCoursInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours')] as Object[],
                          "Another user has updated this InscriptionAuCours while you were editing")
                render(view: "edit", model: [inscriptionAuCoursInstance: inscriptionAuCoursInstance])
                return
            }
        }

        inscriptionAuCoursInstance.properties = params

        if (!inscriptionAuCoursInstance.save(flush: true)) {
            render(view: "edit", model: [inscriptionAuCoursInstance: inscriptionAuCoursInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), inscriptionAuCoursInstance.id])
        redirect(action: "show", id: inscriptionAuCoursInstance.id)
    }

    def delete(Long id) {
        def inscriptionAuCoursInstance = InscriptionAuCours.get(id)
        if (!inscriptionAuCoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), id])
            redirect(action: "list")
            return
        }

        try {
            inscriptionAuCoursInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inscriptionAuCours.label', default: 'InscriptionAuCours'), id])
            redirect(action: "show", id: id)
        }
    }
}
