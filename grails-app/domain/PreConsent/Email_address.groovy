package PreConsent

class Email_address {

    static belongsTo = [contactDetails: Contact_details]
    static constraints = {
        contactDetails()
        emailAddress()
    }

    String emailAddress

    String toString(){
        return "${emailAddress}"
    }
}
