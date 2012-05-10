package mx.com.kinder



import org.junit.*
import grails.test.mixin.*

@TestFor(TutorController)
@Mock(Tutor)
class TutorControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tutor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tutorInstanceList.size() == 0
        assert model.tutorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tutorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tutorInstance != null
        assert view == '/tutor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tutor/show/1'
        assert controller.flash.message != null
        assert Tutor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tutor/list'


        populateValidParams(params)
        def tutor = new Tutor(params)

        assert tutor.save() != null

        params.id = tutor.id

        def model = controller.show()

        assert model.tutorInstance == tutor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tutor/list'


        populateValidParams(params)
        def tutor = new Tutor(params)

        assert tutor.save() != null

        params.id = tutor.id

        def model = controller.edit()

        assert model.tutorInstance == tutor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tutor/list'

        response.reset()


        populateValidParams(params)
        def tutor = new Tutor(params)

        assert tutor.save() != null

        // test invalid parameters in update
        params.id = tutor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tutor/edit"
        assert model.tutorInstance != null

        tutor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tutor/show/$tutor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tutor.clearErrors()

        populateValidParams(params)
        params.id = tutor.id
        params.version = -1
        controller.update()

        assert view == "/tutor/edit"
        assert model.tutorInstance != null
        assert model.tutorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tutor/list'

        response.reset()

        populateValidParams(params)
        def tutor = new Tutor(params)

        assert tutor.save() != null
        assert Tutor.count() == 1

        params.id = tutor.id

        controller.delete()

        assert Tutor.count() == 0
        assert Tutor.get(tutor.id) == null
        assert response.redirectedUrl == '/tutor/list'
    }
}
