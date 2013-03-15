package test.society

class MessageItem {

    User from
    User to
    String text
    Date time
    Status status

    static constraints = {
        text size: 1..1024
    }
}
