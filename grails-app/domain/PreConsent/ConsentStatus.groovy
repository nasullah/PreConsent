package PreConsent

/**
 * ConsentStatus
 * A domain class describes the data object and it's mapping to the database
 */
class ConsentStatus {

    static constraints = {
        consentStatusName()
    }

    String consentStatusName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${consentStatusName}";
	}
}
