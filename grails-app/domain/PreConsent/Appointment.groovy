package PreConsent

/**
 * Appointment
 * A domain class describes the data object and it's mapping to the database
 */
class Appointment extends Interaction {

	static	hasMany		= [type : Type, location: String]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    static constraints = {
        status()
        startTime()
        endTime()
    }
    AppointmentStatus status
    String startTime
    String endTime
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${status}";
	}
}
