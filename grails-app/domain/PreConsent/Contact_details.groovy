package PreConsent

class Contact_details {

    static hasMany = [emailAddress : Email_address, telephoneNumber : Telephone_number]
    static belongsTo = [person : Person]
    static constraints = {
        person()
        address()
        postalCode()
        fromDate()
        to_date(nullable: true)
    }

    String address
    String postalCode
    Date fromDate
    Date to_date

    String toString(){
        return "${address}, ${postalCode}"
    }
}
