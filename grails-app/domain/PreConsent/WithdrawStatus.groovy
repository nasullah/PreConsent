package PreConsent

/**
 * WithdrawStatus
 * A domain class describes the data object and it's mapping to the database
 */
class WithdrawStatus {

    static constraints = {
        withdrawStatusName()
    }

    String withdrawStatusName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${withdrawStatusName}";
	}
}
