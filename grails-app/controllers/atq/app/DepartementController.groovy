package atq.app

import org.springframework.dao.DataIntegrityViolationException

class DepartementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [departementInstanceList: Departement.list(params), departementInstanceTotal: Departement.count()]
    }

    def create() {
        [departementInstance: new Departement(params)]
    }

    def save() {
        def departementInstance = new Departement(params)
        if (!departementInstance.save(flush: true)) {
            render(view: "create", model: [departementInstance: departementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'departement.label', default: 'Departement'), departementInstance.id])
        redirect(action: "show", id: departementInstance.id)
    }

    def show(Long id) {
        def departementInstance = Departement.get(id)
        if (!departementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departement.label', default: 'Departement'), id])
            redirect(action: "list")
            return
        }

        [departementInstance: departementInstance]
    }

    def edit(Long id) {
        def departementInstance = Departement.get(id)
        if (!departementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departement.label', default: 'Departement'), id])
            redirect(action: "list")
            return
        }

        [departementInstance: departementInstance]
    }

    def update(Long id, Long version) {
        def departementInstance = Departement.get(id)
        if (!departementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departement.label', default: 'Departement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (departementInstance.version > version) {
                departementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'departement.label', default: 'Departement')] as Object[],
                          "Another user has updated this Departement while you were editing")
                render(view: "edit", model: [departementInstance: departementInstance])
                return
            }
        }

        departementInstance.properties = params

        if (!departementInstance.save(flush: true)) {
            render(view: "edit", model: [departementInstance: departementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'departement.label', default: 'Departement'), departementInstance.id])
        redirect(action: "show", id: departementInstance.id)
    }

    def delete(Long id) {
        def departementInstance = Departement.get(id)
        if (!departementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departement.label', default: 'Departement'), id])
            redirect(action: "list")
            return
        }

        try {
            departementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'departement.label', default: 'Departement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'departement.label', default: 'Departement'), id])
            redirect(action: "show", id: id)
        }
    }
}
