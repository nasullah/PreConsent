package PreConsent

/**
 * DiseaseClass
 * A domain class describes the data object and it's mapping to the database
 */
class DiseaseClass {

    static constraints = {
        diseaseClassName()
    }

    String diseaseClassName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${diseaseClassName}";
	}
}
