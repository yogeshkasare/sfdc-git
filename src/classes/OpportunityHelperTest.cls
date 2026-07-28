@isTest
private class OpportunityHelperTest {
    @isTest static void testCreateOpportunity() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Opportunity opp = OpportunityHelper.createOpportunity('Test Opportunity', acc.Id);
        System.assertNotEquals(null, opp.Id, 'Opportunity should be inserted');
        System.assertEquals(acc.Id, opp.AccountId);
    }
}