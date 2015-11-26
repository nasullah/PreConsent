package PreConsent

class Patient_withdraw extends Interaction {

    static constraints = {
        clinician()
        date()
        mode()
        notes(widget: 'textarea', nullable: true)
        consentForInterview()
        okWithScience(nullable: true)
        reason()
    }

    boolean consentForInterview
    Boolean okWithScience = Boolean.FALSE
    String reason

    String toString(){
        return "Patient Withdraw- ${date?.format('dd-MM-yyyy')}, ${mode}"
    }
}
