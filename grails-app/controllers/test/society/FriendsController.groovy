package test.society

import org.springframework.dao.DataIntegrityViolationException

class FriendsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [friendsInstanceList: Friends.list(params), friendsInstanceTotal: Friends.count()]
    }

    def create() {
        [friendsInstance: new Friends(params)]
    }

    def save() {
        def friendsInstance = new Friends(params)
        if (!friendsInstance.save(flush: true)) {
            render(view: "create", model: [friendsInstance: friendsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'friends.label', default: 'Friends'), friendsInstance.id])
        redirect(action: "show", id: friendsInstance.id)
    }

    def show(Long id) {
        def friendsInstance = Friends.get(id)
        if (!friendsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friends.label', default: 'Friends'), id])
            redirect(action: "list")
            return
        }

        [friendsInstance: friendsInstance]
    }

    def edit(Long id) {
        def friendsInstance = Friends.get(id)
        if (!friendsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friends.label', default: 'Friends'), id])
            redirect(action: "list")
            return
        }

        [friendsInstance: friendsInstance]
    }

    def update(Long id, Long version) {
        def friendsInstance = Friends.get(id)
        if (!friendsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friends.label', default: 'Friends'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (friendsInstance.version > version) {
                friendsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'friends.label', default: 'Friends')] as Object[],
                        "Another user has updated this Friends while you were editing")
                render(view: "edit", model: [friendsInstance: friendsInstance])
                return
            }
        }

        friendsInstance.properties = params

        if (!friendsInstance.save(flush: true)) {
            render(view: "edit", model: [friendsInstance: friendsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'friends.label', default: 'Friends'), friendsInstance.id])
        redirect(action: "show", id: friendsInstance.id)
    }

    def delete(Long id) {
        def friendsInstance = Friends.get(id)
        if (!friendsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friends.label', default: 'Friends'), id])
            redirect(action: "list")
            return
        }

        try {
            friendsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'friends.label', default: 'Friends'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'friends.label', default: 'Friends'), id])
            redirect(action: "show", id: id)
        }
    }

    def addFriend (Long id){
        User friend = User.findById(id)
        if(friend){
            User currentUser = session.user
            currentUser.addFriend(friend)
            currentUser.save(flush: true)
        }

    }
}
