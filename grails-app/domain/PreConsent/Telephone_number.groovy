package PreConsent

class Telephone_number {

    static belongsTo = [contactDetails: Contact_details]
    static constraints = {
        contactDetails()
        telephoneNumber()
    }

    String telephoneNumber

    String toString(){
        return "${telephoneNumber}"
    }
}
