package PreConsent

class Other_interaction extends Interaction{

    static constraints = {
        clinician()
        person()
        date()
        mode()
        notes(nullable: true)
    }
}
