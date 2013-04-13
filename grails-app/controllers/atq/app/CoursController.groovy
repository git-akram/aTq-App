package atq.app

import org.springframework.dao.DataIntegrityViolationException

class CoursController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [coursInstanceList: Cours.list(params), coursInstanceTotal: Cours.count()]
    }

    def create() {
        [coursInstance: new Cours(params)]
    }

    def save() {
        def coursInstance = new Cours(params)
        if (!coursInstance.save(flush: true)) {
            render(view: "create", model: [coursInstance: coursInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cours.label', default: 'Cours'), coursInstance.id])
        redirect(action: "show", id: coursInstance.id)
    }

    def show(Long id) {
        def coursInstance = Cours.get(id)
        if (!coursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cours.label', default: 'Cours'), id])
            redirect(action: "list")
            return
        }

        [coursInstance: coursInstance]
    }

    def edit(Long id) {
        def coursInstance = Cours.get(id)
        if (!coursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cours.label', default: 'Cours'), id])
            redirect(action: "list")
            return
        }

        [coursInstance: coursInstance]
    }

    def update(Long id, Long version) {
        def coursInstance = Cours.get(id)
        if (!coursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cours.label', default: 'Cours'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (coursInstance.version > version) {
                coursInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cours.label', default: 'Cours')] as Object[],
                          "Another user has updated this Cours while you were editing")
                render(view: "edit", model: [coursInstance: coursInstance])
                return
            }
        }

        coursInstance.properties = params

        if (!coursInstance.save(flush: true)) {
            render(view: "edit", model: [coursInstance: coursInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cours.label', default: 'Cours'), coursInstance.id])
        redirect(action: "show", id: coursInstance.id)
    }

    def delete(Long id) {
        def coursInstance = Cours.get(id)
        if (!coursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cours.label', default: 'Cours'), id])
            redirect(action: "list")
            return
        }

        try {
            coursInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cours.label', default: 'Cours'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cours.label', default: 'Cours'), id])
            redirect(action: "show", id: id)
        }
    }
}
