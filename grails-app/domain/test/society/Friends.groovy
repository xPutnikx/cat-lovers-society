package test.society

class Friends {

    User friend
    boolean isBlocked

    static constraints = {
    }
    public Friends(User friend,boolean isBlocked){
        this.friend = friend
        this.isBlocked = isBlocked
    }

    def getIsBlocked(){
        this.isBlocked
    }

    def getIsActive(Friends friends){
        if(!friends.isBlocked){
            return friends
        }
        return null
    }
}
