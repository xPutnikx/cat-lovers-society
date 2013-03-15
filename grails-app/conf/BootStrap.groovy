import test.society.User

class BootStrap {

    def init = { servletContext ->
        User user = User.findByNickName("admin")
        if (user==null){
            user = new User(firstName: "admin",lastName: "admin",email: "xputnikx@gmail.com",login: "admin",password: "admin",isActive: true,status: "admin",nickName: "admin")
            user.save(flush: true)
        }
    }
    def destroy = {
    }
}
