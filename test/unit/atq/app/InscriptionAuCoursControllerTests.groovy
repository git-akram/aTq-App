package atq.app



import org.junit.*
import grails.test.mixin.*

@TestFor(InscriptionAuCoursController)
@Mock(InscriptionAuCours)
class InscriptionAuCoursControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inscriptionAuCours/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inscriptionAuCoursInstanceList.size() == 0
        assert model.inscriptionAuCoursInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inscriptionAuCoursInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inscriptionAuCoursInstance != null
        assert view == '/inscriptionAuCours/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inscriptionAuCours/show/1'
        assert controller.flash.message != null
        assert InscriptionAuCours.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inscriptionAuCours/list'

        populateValidParams(params)
        def inscriptionAuCours = new InscriptionAuCours(params)

        assert inscriptionAuCours.save() != null

        params.id = inscriptionAuCours.id

        def model = controller.show()

        assert model.inscriptionAuCoursInstance == inscriptionAuCours
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inscriptionAuCours/list'

        populateValidParams(params)
        def inscriptionAuCours = new InscriptionAuCours(params)

        assert inscriptionAuCours.save() != null

        params.id = inscriptionAuCours.id

        def model = controller.edit()

        assert model.inscriptionAuCoursInstance == inscriptionAuCours
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inscriptionAuCours/list'

        response.reset()

        populateValidParams(params)
        def inscriptionAuCours = new InscriptionAuCours(params)

        assert inscriptionAuCours.save() != null

        // test invalid parameters in update
        params.id = inscriptionAuCours.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inscriptionAuCours/edit"
        assert model.inscriptionAuCoursInstance != null

        inscriptionAuCours.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inscriptionAuCours/show/$inscriptionAuCours.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inscriptionAuCours.clearErrors()

        populateValidParams(params)
        params.id = inscriptionAuCours.id
        params.version = -1
        controller.update()

        assert view == "/inscriptionAuCours/edit"
        assert model.inscriptionAuCoursInstance != null
        assert model.inscriptionAuCoursInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inscriptionAuCours/list'

        response.reset()

        populateValidParams(params)
        def inscriptionAuCours = new InscriptionAuCours(params)

        assert inscriptionAuCours.save() != null
        assert InscriptionAuCours.count() == 1

        params.id = inscriptionAuCours.id

        controller.delete()

        assert InscriptionAuCours.count() == 0
        assert InscriptionAuCours.get(inscriptionAuCours.id) == null
        assert response.redirectedUrl == '/inscriptionAuCours/list'
    }
}
