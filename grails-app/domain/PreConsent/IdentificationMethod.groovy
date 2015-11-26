package PreConsent

/**
 * IdentificationMethod
 * A domain class describes the data object and it's mapping to the database
 */
class IdentificationMethod {

    static constraints = {
        identificationMethodName()
    }

    String identificationMethodName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${identificationMethodName}";
	}
}
