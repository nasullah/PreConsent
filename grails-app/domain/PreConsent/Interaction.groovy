package PreConsent

class Interaction {

    static belongsTo = [clinician : Clinician]
    static hasMany = [person: Person]
    static constraints = {
        clinician()
        date()
        mode()
        notes(widget: 'textarea', nullable: true)
    }

    Date date
    ContactMode mode
    String notes
}
