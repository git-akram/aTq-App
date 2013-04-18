package atq.app

import org.springframework.dao.DataIntegrityViolationException

class ReponseProposeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reponseProposeInstanceList: ReponsePropose.list(params), reponseProposeInstanceTotal: ReponsePropose.count()]
    }

    def create() {
        [reponseProposeInstance: new ReponsePropose(params)]
    }

    def save() {
        def reponseProposeInstance = new ReponsePropose(params)
        if (!reponseProposeInstance.save(flush: true)) {
            render(view: "create", model: [reponseProposeInstance: reponseProposeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), reponseProposeInstance.id])
        redirect(action: "show", id: reponseProposeInstance.id)
    }

    def show(Long id) {
        def reponseProposeInstance = ReponsePropose.get(id)
        if (!reponseProposeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), id])
            redirect(action: "list")
            return
        }

        [reponseProposeInstance: reponseProposeInstance]
    }

    def edit(Long id) {
        def reponseProposeInstance = ReponsePropose.get(id)
        if (!reponseProposeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), id])
            redirect(action: "list")
            return
        }

        [reponseProposeInstance: reponseProposeInstance]
    }

    def update(Long id, Long version) {
        def reponseProposeInstance = ReponsePropose.get(id)
        if (!reponseProposeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reponseProposeInstance.version > version) {
                reponseProposeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reponsePropose.label', default: 'ReponsePropose')] as Object[],
                          "Another user has updated this ReponsePropose while you were editing")
                render(view: "edit", model: [reponseProposeInstance: reponseProposeInstance])
                return
            }
        }

        reponseProposeInstance.properties = params

        if (!reponseProposeInstance.save(flush: true)) {
            render(view: "edit", model: [reponseProposeInstance: reponseProposeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), reponseProposeInstance.id])
        redirect(action: "show", id: reponseProposeInstance.id)
    }

    def delete(Long id) {
        def reponseProposeInstance = ReponsePropose.get(id)
        if (!reponseProposeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), id])
            redirect(action: "list")
            return
        }

        try {
            reponseProposeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reponsePropose.label', default: 'ReponsePropose'), id])
            redirect(action: "show", id: id)
        }
    }
}
