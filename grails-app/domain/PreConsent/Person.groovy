package PreConsent

class Person {

    static hasMany = [contactDetails : Contact_details, interactions : Interaction]
    static belongsTo = [Interaction]
    static constraints = {
        nhsNumber(nullable: true)
        mrnNumber(nullable: true)
        dateOfBirth(nullable: true)
        surname()
        forenames(nullable: true)
        disease()
        isProband(nullable: true)
        gelIdentifier(nullable: true)
        familyIdentifier(nullable: true)
        guardianOfProband(nullable: true)
        sequencingTarget(nullable: true)
    }

    String nhsNumber
    String mrnNumber
    Date dateOfBirth
    String surname
    String forenames
    DiseaseClass disease
    boolean isProband = Boolean.TRUE
    boolean sequencingTarget = Boolean.TRUE
    String gelIdentifier
    String familyIdentifier
    boolean guardianOfProband = Boolean.TRUE

    String toString(){
        def proband
        if(isProband){
            proband = "Yes"
        }else{
            proband = "No"
        }
        if (familyIdentifier){
            return "${surname}, ${nhsNumber}, ${mrnNumber}, Proband: ${proband}, Family Identifier: ${familyIdentifier}"
        }else {
            return "${surname}, ${nhsNumber}, ${mrnNumber}"
        }
    }
}
