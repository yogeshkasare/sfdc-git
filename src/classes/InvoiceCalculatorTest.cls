@isTest
public class InvoiceCalculatorTest {
    @isTest
    static void testCalculateTotal() {
        Decimal result = InvoiceCalculator.calculateTotal(100, 0.18);
        System.assertEquals(118, result, 'Total should include tax');
    }

    @isTest
    static void testNullValues() {
        Boolean exceptionThrown = false;
        try {
            InvoiceCalculator.calculateTotal(null, 0.18);
        } catch (Exception e) {
            exceptionThrown = true;
        }
        System.assertEquals(true, exceptionThrown, 'Exception should be thrown for null values');
    }
}