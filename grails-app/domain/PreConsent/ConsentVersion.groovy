package PreConsent

/**
 * ConsentVersion
 * A domain class describes the data object and it's mapping to the database
 */
class ConsentVersion {

    static constraints = {
        consentVersionName()
    }

    String consentVersionName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${consentVersionName}";
	}
}
