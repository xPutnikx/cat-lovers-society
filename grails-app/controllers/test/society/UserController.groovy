package test.society

import sun.swing.BakedArrayList

class UserController {

    def scaffold = true

    def list(Integer max) {
        if(PermissionService.hasUserPermission(session.user) || PermissionService.hasAdminPermission(session.user)){
            params.max = Math.min(max ?: 10, 100)
            [userInstanceList: User.list(params), userInstanceTotal: User.count()]
        }else {
                redirect(action:"home")
        }
    }

    def friends(Integer max){
        if(PermissionService.hasUserPermission(session.user) || PermissionService.hasAdminPermission(session.user)){
            User user = session.user
            params.max = Math.min(max ?: 10, 100)
            List<User> friends= new ArrayList<User>()
            friends = user.friends.each {
                if(!it.isBlocked){
                    return it.friend
                }
                return null
            }
            friends=friends*.friend
            [friendsList: friends, friendsTotal: friends.size()]
        }else {
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
        if(user && user.isActive){
            session.user = user
            flash.message = "Hello ${((User) user).login}!"
            redirect(controller:"user", action:"home")
        }else if(user == null){
            flash.message = "Sorry, ${params.login}. Please try again."
            redirect(action:"login")
        }else{
            flash.message = "Sorry, ${params.login}.Your Account isnt active. Please check your email and activate account."
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
        mainSender(userInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }
    def logout = {
        flash.message = "goodbye ${session.user.login}"
        session.user=null
        redirect(controller:"user", action:"home")
    }

    def mainSender(User userInstance){
        try {
            sendMail {
                to     "${userInstance.email}"
                subject "Registration Confirmation"
                html    g.render(template:'/email/registrationConfirmation', model:[user:userInstance])
            }
            flash.message = "Confirmation email sent to ${userInstance.email}"
            userInstance.isActive=true
            userInstance.save(flush: true)
        } catch(Exception e) {
            log.error "Problem sending email $e.message", e
            flash.message = "Confirmation email NOT sent"
        }
    }



}
