package test.society

class MessageItemController {

    def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def create() {
        [messageItemInstance: new MessageItem(params)]
    }

    def save() {
        def messageItemInstance = new MessageItem(params)
        User userFrom = User.findByNickName(params.from)
        userFrom?.messageItem?.add(messageItemInstance)
        userFrom.save()
        User userTo = User.findByNickName(params.to)
        userTo?.messageItem?.add(messageItemInstance)
        userTo.save()
        messageItemInstance.save(flush: true)
        if (!messageItemInstance.save(flush: true)) {
            render(view: "create", model: [messageItemInstance: messageItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'messageItem.label', default: 'Messages'), messageItemInstance.id])
        redirect(action: "show", id: messageItemInstance.id)
    }
}
