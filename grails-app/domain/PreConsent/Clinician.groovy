package PreConsent

class Clinician {

    static hasMany = [interactions : Interaction]
    static constraints = {
        forenames()
        surname()
        department()
    }

    String forenames
    String surname
    String department

    String toString(){
        return "${forenames} ${surname}, ${department}"
    }
}
