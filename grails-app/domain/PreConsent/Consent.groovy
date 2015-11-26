package PreConsent

class Consent extends Interaction{

    static constraints = {
        clinician()
        date()
        mode()
        notes(widget: 'textarea', nullable: true)
        consentVersion()
        incidentalFindings()
        versionInformationSheet()
    }

    ConsentVersion consentVersion
    boolean incidentalFindings = Boolean.FALSE
    VersionInformationSheet versionInformationSheet

    String toString(){
        return "Consent- ${date?.format('dd-MM-yyyy')}, ${mode}"
    }
}
