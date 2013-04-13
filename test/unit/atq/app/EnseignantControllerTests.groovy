package atq.app



import org.junit.*
import grails.test.mixin.*

@TestFor(EnseignantController)
@Mock(Enseignant)
class EnseignantControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/enseignant/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.enseignantInstanceList.size() == 0
        assert model.enseignantInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.enseignantInstance != null
    }

    void testSave() {
        controller.save()

        assert model.enseignantInstance != null
        assert view == '/enseignant/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/enseignant/show/1'
        assert controller.flash.message != null
        assert Enseignant.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/enseignant/list'

        populateValidParams(params)
        def enseignant = new Enseignant(params)

        assert enseignant.save() != null

        params.id = enseignant.id

        def model = controller.show()

        assert model.enseignantInstance == enseignant
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/enseignant/list'

        populateValidParams(params)
        def enseignant = new Enseignant(params)

        assert enseignant.save() != null

        params.id = enseignant.id

        def model = controller.edit()

        assert model.enseignantInstance == enseignant
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/enseignant/list'

        response.reset()

        populateValidParams(params)
        def enseignant = new Enseignant(params)

        assert enseignant.save() != null

        // test invalid parameters in update
        params.id = enseignant.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/enseignant/edit"
        assert model.enseignantInstance != null

        enseignant.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/enseignant/show/$enseignant.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        enseignant.clearErrors()

        populateValidParams(params)
        params.id = enseignant.id
        params.version = -1
        controller.update()

        assert view == "/enseignant/edit"
        assert model.enseignantInstance != null
        assert model.enseignantInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/enseignant/list'

        response.reset()

        populateValidParams(params)
        def enseignant = new Enseignant(params)

        assert enseignant.save() != null
        assert Enseignant.count() == 1

        params.id = enseignant.id

        controller.delete()

        assert Enseignant.count() == 0
        assert Enseignant.get(enseignant.id) == null
        assert response.redirectedUrl == '/enseignant/list'
    }
}
