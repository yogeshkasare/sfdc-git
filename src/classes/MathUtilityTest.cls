@isTest
public class MathUtilityTest {
    @isTest
    static void testAddNumbers() {
        Integer sum = MathUtility.addNumbers(5, 7);
        System.assertEquals(12, sum, 'Addition should return correct sum');
    }
}