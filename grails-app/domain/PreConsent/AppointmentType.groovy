package PreConsent

/**
 * AppointmentType
 * A domain class describes the data object and it's mapping to the database
 */
class AppointmentType {

    static mapping = {
    }

    static constraints = {

        appointmentTypeName()
    }

    String appointmentTypeName

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${appointmentTypeName}";
	}
}
