@IsTest
private class DemoOpportunityActionsTest {

    @IsTest
    static void testCalculateDiscount() {

        Decimal result =
            DemoOpportunityActions.calculateDiscount(1000, 10);

        System.assertEquals(100, result);
    }
}