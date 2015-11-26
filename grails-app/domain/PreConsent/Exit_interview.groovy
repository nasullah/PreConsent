package PreConsent

class Exit_interview extends Interaction{

    static constraints = {
        clinician()
        date()
        mode()
        notes(widget: 'textarea', nullable: true)
    }

    String toString(){
        return "Exit Interview- ${date?.format('dd-MM-yyyy')}, ${mode}"
    }
}
