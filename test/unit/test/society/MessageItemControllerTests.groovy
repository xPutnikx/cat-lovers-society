package test.society

import grails.test.mixin.*

@TestFor(MessageItemController)
@Mock(MessageItem)
class MessageItemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/messageItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.messageItemInstanceList.size() == 0
        assert model.messageItemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.messageItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.messageItemInstance != null
        assert view == '/messageItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/messageItem/show/1'
        assert controller.flash.message != null
        assert MessageItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/messageItem/list'

        populateValidParams(params)
        def messageItem = new MessageItem(params)

        assert messageItem.save() != null

        params.id = messageItem.id

        def model = controller.show()

        assert model.messageItemInstance == messageItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/messageItem/list'

        populateValidParams(params)
        def messageItem = new MessageItem(params)

        assert messageItem.save() != null

        params.id = messageItem.id

        def model = controller.edit()

        assert model.messageItemInstance == messageItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/messageItem/list'

        response.reset()

        populateValidParams(params)
        def messageItem = new MessageItem(params)

        assert messageItem.save() != null

        // test invalid parameters in update
        params.id = messageItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/messageItem/edit"
        assert model.messageItemInstance != null

        messageItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/messageItem/show/$messageItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        messageItem.clearErrors()

        populateValidParams(params)
        params.id = messageItem.id
        params.version = -1
        controller.update()

        assert view == "/messageItem/edit"
        assert model.messageItemInstance != null
        assert model.messageItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/messageItem/list'

        response.reset()

        populateValidParams(params)
        def messageItem = new MessageItem(params)

        assert messageItem.save() != null
        assert MessageItem.count() == 1

        params.id = messageItem.id

        controller.delete()

        assert MessageItem.count() == 0
        assert MessageItem.get(messageItem.id) == null
        assert response.redirectedUrl == '/messageItem/list'
    }
}
