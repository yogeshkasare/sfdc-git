@IsTest
private class ValidationLoadTest01 {

    @IsTest
    static void validationWorkload() {
        Integer result = ValidationLoadDemo.performWork(5000);
        System.assert(result > 0);
    }
}