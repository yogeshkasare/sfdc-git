@IsTest
private class TestObjectServiceTest {

    @testSetup
    static void setupData() {

        TEST_OBJECT__c obj = new TEST_OBJECT__c(
            Name = 'Test Record',
            Attempt_Count__c = 0,
            Status__c = 'Submitted',
            Submitted_By__c = 'Test User',
            Description__c = 'Demo validation record'
        );

        insert obj;
    }

    @IsTest
    static void incrementAttempt_succeeds() {

        TEST_OBJECT__c obj = [
            SELECT Id, Attempt_Count__c
            FROM TEST_OBJECT__c
            LIMIT 1
        ];

        Test.startTest();

        TestObjectService.incrementAttempt(obj.Id);

        Test.stopTest();

        obj = [
            SELECT Attempt_Count__c
            FROM TEST_OBJECT__c
            WHERE Id = :obj.Id
        ];

        System.assertEquals(
            1,
            obj.Attempt_Count__c
        );
    }

    @IsTest
    static void updateStatus_succeeds() {

        TEST_OBJECT__c obj = [
            SELECT Id
            FROM TEST_OBJECT__c
            LIMIT 1
        ];

        Test.startTest();

        TestObjectService.updateStatus(
            obj.Id,
            'Completed'
        );

        Test.stopTest();

        obj = [
            SELECT Status__c
            FROM TEST_OBJECT__c
            WHERE Id = :obj.Id
        ];

        System.assertEquals(
            'Completed',
            obj.Status__c
        );
    }
}