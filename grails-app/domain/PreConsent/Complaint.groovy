package PreConsent

class Complaint extends Other_interaction{

    static constraints = {
        clinician()
        date()
        mode()
        notes(widget: 'textarea', nullable: true)
        complaintSummary(widget: 'textarea')
        resolutionNotes(widget: 'textarea')
        complaintStatus()
    }

    String complaintSummary
    String resolutionNotes
    ComplaintStatus complaintStatus

    String toString(){
        return "Complaint- ${date?.format('dd-MM-yyyy')}, ${mode}"
    }
}
