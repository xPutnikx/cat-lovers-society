package test.society

class User {
    static mapWith="mongo"

    String login
    String password
    String firstName
    String lastName
    String phone
    String email
    String nickName
    String status
    boolean isActive = false

    List<Friends> friends = new ArrayList<Friends>()
    List<MessageItem> messageItem = new ArrayList<MessageItem>()
    List<Photo> photo = new ArrayList<Photo>()
    static embedded = [ 'messageItem' , 'friends' , 'photo']

    static constraints = {
        firstName size: 5..15, blank: false /*unique: true*/
        login size: 5..15, blank: false, unique: true
        lastName size: 5..15, blank: false /*unique: true*/
        password size: 5..15, blank: false
        email email: true, blank: false
        nickName size: 5..15, blank: false
    }
}
