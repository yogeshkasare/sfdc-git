public class DemoOpportunityActions {

    public static Decimal calculateDiscount(Decimal amount, Decimal percentage) {
        if (amount == null || percentage == null) {
            return 0;
        }

        return amount * percentage / 100;
    }

    public static String getOpportunityStatus(Boolean isClosed) {
        return isClosed ? 'Closed' : 'Open';
    }
}