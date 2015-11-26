package PreConsent

class Engage extends Interaction{

    static constraints = {
        clinician()
        date()
        mode()
        notes(nullable: true)
        approachLetter(nullable: true)
    }

    String approachLetter

    String toString(){
        return "Engage- ${date?.format('dd-MM-yyyy')}, ${mode}"
    }
}
