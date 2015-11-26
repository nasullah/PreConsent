package PreConsent

/**
 * ContactMode
 * A domain class describes the data object and it's mapping to the database
 */
class ContactMode {

    static constraints = {
        contactModeName()
    }

    String contactModeName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${contactModeName}";
	}
}
