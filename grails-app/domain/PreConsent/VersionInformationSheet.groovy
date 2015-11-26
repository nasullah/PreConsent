package PreConsent

/**
 * VersionInformationSheet
 * A domain class describes the data object and it's mapping to the database
 */
class VersionInformationSheet {

    static constraints = {
        versionInformationSheet()
    }

    String versionInformationSheet
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${versionInformationSheet}";
	}
}
