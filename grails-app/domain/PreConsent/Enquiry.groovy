package PreConsent

class Enquiry extends Other_interaction{

    static constraints = {
        clinician()
        date()
        mode()
        notes(widget: 'textarea', nullable: true)
    }

    String toString(){
        return "Enquiry- ${date?.format('dd-MM-yyyy')}, ${mode}"
    }
}
