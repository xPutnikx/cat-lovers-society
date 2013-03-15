package test.society

import grails.test.mixin.*

@TestFor(FriendsController)
@Mock(Friends)
class FriendsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/friends/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.friendsInstanceList.size() == 0
        assert model.friendsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.friendsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.friendsInstance != null
        assert view == '/friends/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/friends/show/1'
        assert controller.flash.message != null
        assert Friends.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/friends/list'

        populateValidParams(params)
        def friends = new Friends(params)

        assert friends.save() != null

        params.id = friends.id

        def model = controller.show()

        assert model.friendsInstance == friends
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/friends/list'

        populateValidParams(params)
        def friends = new Friends(params)

        assert friends.save() != null

        params.id = friends.id

        def model = controller.edit()

        assert model.friendsInstance == friends
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/friends/list'

        response.reset()

        populateValidParams(params)
        def friends = new Friends(params)

        assert friends.save() != null

        // test invalid parameters in update
        params.id = friends.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/friends/edit"
        assert model.friendsInstance != null

        friends.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/friends/show/$friends.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        friends.clearErrors()

        populateValidParams(params)
        params.id = friends.id
        params.version = -1
        controller.update()

        assert view == "/friends/edit"
        assert model.friendsInstance != null
        assert model.friendsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/friends/list'

        response.reset()

        populateValidParams(params)
        def friends = new Friends(params)

        assert friends.save() != null
        assert Friends.count() == 1

        params.id = friends.id

        controller.delete()

        assert Friends.count() == 0
        assert Friends.get(friends.id) == null
        assert response.redirectedUrl == '/friends/list'
    }
}
