package atq.app



import org.junit.*
import grails.test.mixin.*

@TestFor(DepartementController)
@Mock(Departement)
class DepartementControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/departement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.departementInstanceList.size() == 0
        assert model.departementInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.departementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.departementInstance != null
        assert view == '/departement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/departement/show/1'
        assert controller.flash.message != null
        assert Departement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/departement/list'

        populateValidParams(params)
        def departement = new Departement(params)

        assert departement.save() != null

        params.id = departement.id

        def model = controller.show()

        assert model.departementInstance == departement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/departement/list'

        populateValidParams(params)
        def departement = new Departement(params)

        assert departement.save() != null

        params.id = departement.id

        def model = controller.edit()

        assert model.departementInstance == departement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/departement/list'

        response.reset()

        populateValidParams(params)
        def departement = new Departement(params)

        assert departement.save() != null

        // test invalid parameters in update
        params.id = departement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/departement/edit"
        assert model.departementInstance != null

        departement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/departement/show/$departement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        departement.clearErrors()

        populateValidParams(params)
        params.id = departement.id
        params.version = -1
        controller.update()

        assert view == "/departement/edit"
        assert model.departementInstance != null
        assert model.departementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/departement/list'

        response.reset()

        populateValidParams(params)
        def departement = new Departement(params)

        assert departement.save() != null
        assert Departement.count() == 1

        params.id = departement.id

        controller.delete()

        assert Departement.count() == 0
        assert Departement.get(departement.id) == null
        assert response.redirectedUrl == '/departement/list'
    }
}
