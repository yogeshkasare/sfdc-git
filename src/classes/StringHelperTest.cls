@isTest
public class StringHelperTest {
    @isTest
    static void testIsEmpty() {
        System.assertEquals(true, StringHelper.isEmpty(''), 'Empty string should return true');
        System.assertEquals(false, StringHelper.isEmpty('Hello'), 'Non-empty string should return false');
    }
}