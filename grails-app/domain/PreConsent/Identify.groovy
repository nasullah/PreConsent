package PreConsent

class Identify extends Interaction{

    static constraints = {
        clinician()
        date()
        mode()
        notes(nullable: true)
        method()
    }

    IdentificationMethod method
}
