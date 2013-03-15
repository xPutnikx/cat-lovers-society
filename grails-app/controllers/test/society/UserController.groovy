package test.society

class UserController {

    def scaffold = true

    def list(Integer max) {
        if(PermissionService.hasAdminPermission(session.user)){
            params.max = Math.min(max ?: 10, 100)
            [userInstanceList: User.list(params), userInstanceTotal: User.count()]
        }else if (PermissionService.hasUserPermission(session.user)){
                redirect(action:"permissionDenied")
        }else{
            redirect(action:"home")
        }
    }

    def permissionDenied = {}

    def login = {}

    def home = {
        def userInstance = null
        if(session.user!=null){
            userInstance = session.user
            flash.message = "Hello ${((User) userInstance).login}!"
            redirect(action: "show/${((User) userInstance).id}")
        }else{
            flash.message="Welcome to Cat Lovers Society"
        }
        [userInstance: userInstance]
    }

    def authenticate = {
        def user = User.findByLoginAndPassword(params.login, params.password)
        if(user){
            session.user = user
            flash.message = "Hello ${((User) user).login}!"
            redirect(controller:"user", action:"home")
        }else{
            flash.message = "Sorry, ${params.login}. Please try again."
            redirect(action:"login")
        }
    }
    def registration = {
        [userInstance: new User(params)]
    }
    def saveUser(){
        def userInstance = new User(params)
        userInstance.setStatus("user")
        userInstance.setIsActive(false)
        userInstance.save(flush: true)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }
        def mailUtil = new MailUtil()
        mailUtil.mainSender(userInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }
    def logout = {
        flash.message = "goodbye ${session.user.login}"
        session.user=null
        redirect(controller:"user", action:"home")
    }

    def addFriend = {
        id = params
    }



}
