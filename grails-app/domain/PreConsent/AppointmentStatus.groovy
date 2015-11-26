package PreConsent

/**
 * AppointmentStatus
 * A domain class describes the data object and it's mapping to the database
 */
class AppointmentStatus {

    static mapping = {
    }

    static constraints = {
        appointmentStatusName()
    }

    String appointmentStatusName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${appointmentStatusName}";
	}
}
