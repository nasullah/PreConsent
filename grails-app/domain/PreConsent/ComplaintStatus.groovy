package PreConsent

/**
 * ComplaintStatus
 * A domain class describes the data object and it's mapping to the database
 */
class ComplaintStatus {

    static constraints = {
        complaintStatusName()
    }

    String complaintStatusName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${complaintStatusName}";
	}
}
