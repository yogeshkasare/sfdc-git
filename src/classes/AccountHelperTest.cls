@isTest
private class AccountHelperTest {
    @isTest static void testCreateAccount() {
        Account acc = AccountHelper.createAccount('Test Account');
        System.assertNotEquals(null, acc.Id, 'Account should be inserted');
        System.assertEquals('Test Account', acc.Name);
    }
}