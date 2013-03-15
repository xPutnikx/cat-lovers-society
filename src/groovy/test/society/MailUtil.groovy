package test.society

/**
 * User: v.hudnitsky
 * Date: 15.03.13
 * Time: 21:44
 */
class MailUtil {
    MailUtil() {
    }

    public void mainSender(User userInstance){
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
