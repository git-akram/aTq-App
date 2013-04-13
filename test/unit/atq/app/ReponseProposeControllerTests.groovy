package atq.app



import org.junit.*
import grails.test.mixin.*

@TestFor(ReponseProposeController)
@Mock(ReponsePropose)
class ReponseProposeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reponsePropose/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reponseProposeInstanceList.size() == 0
        assert model.reponseProposeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reponseProposeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reponseProposeInstance != null
        assert view == '/reponsePropose/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reponsePropose/show/1'
        assert controller.flash.message != null
        assert ReponsePropose.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reponsePropose/list'

        populateValidParams(params)
        def reponsePropose = new ReponsePropose(params)

        assert reponsePropose.save() != null

        params.id = reponsePropose.id

        def model = controller.show()

        assert model.reponseProposeInstance == reponsePropose
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reponsePropose/list'

        populateValidParams(params)
        def reponsePropose = new ReponsePropose(params)

        assert reponsePropose.save() != null

        params.id = reponsePropose.id

        def model = controller.edit()

        assert model.reponseProposeInstance == reponsePropose
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reponsePropose/list'

        response.reset()

        populateValidParams(params)
        def reponsePropose = new ReponsePropose(params)

        assert reponsePropose.save() != null

        // test invalid parameters in update
        params.id = reponsePropose.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reponsePropose/edit"
        assert model.reponseProposeInstance != null

        reponsePropose.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reponsePropose/show/$reponsePropose.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reponsePropose.clearErrors()

        populateValidParams(params)
        params.id = reponsePropose.id
        params.version = -1
        controller.update()

        assert view == "/reponsePropose/edit"
        assert model.reponseProposeInstance != null
        assert model.reponseProposeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reponsePropose/list'

        response.reset()

        populateValidParams(params)
        def reponsePropose = new ReponsePropose(params)

        assert reponsePropose.save() != null
        assert ReponsePropose.count() == 1

        params.id = reponsePropose.id

        controller.delete()

        assert ReponsePropose.count() == 0
        assert ReponsePropose.get(reponsePropose.id) == null
        assert response.redirectedUrl == '/reponsePropose/list'
    }
}
