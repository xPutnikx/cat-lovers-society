package test.society
/**
 * User: v.hudnitsky
 * Date: 12.03.13
 * Time: 1:23
 */
public class PermissionService {

    def static hasAdminPermission(User user){
        if (user!=null){
            if (user.isActive && user.status.equals("admin")){
                return true
            }
        }
        return false
    }

    def static hasUserPermission(User user){
        if (user!=null){
            if (user.isActive && user.status.equals("user")){
                return true
            }
        }
        return false
    }

    def static hasAnonimusPermission(User user){
        if (user!=null){
            if (!user.isActive){
                return true
            }
        }
        return false
    }

    def static hasBlocked(User user){
        if (user!=null){
            if (user.status.equals("blocked")){
                return true
            }

        }
        return false
    }

}
