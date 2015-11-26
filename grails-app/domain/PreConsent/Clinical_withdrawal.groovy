package PreConsent

class Clinical_withdrawal extends Interaction {

    static constraints = {
        clinician()
        date()
        mode()
        notes(widget: 'textarea', nullable: true)
        reason()
    }

    RejectionReason reason

    String toString(){
        return "Clinical Withdrawal- ${date?.format('dd-MM-yyyy')}, ${mode}"
    }
}
