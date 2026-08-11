public class InvoiceCalculator {
    public static Decimal calculateTotal(Decimal amount, Decimal taxRate) {
        if (amount == null || taxRate == null) {
            throw new IllegalArgumentException('Amount and taxRate cannot be null');
        }
        return amount + (amount * taxRate); //comment
    }
}
