public class TestObjectService {

    public static void incrementAttempt(Id recordId) {

        TEST_OBJECT__c obj = [
            SELECT Id, Attempt_Count__c
            FROM TEST_OBJECT__c
            WHERE Id = :recordId
        ];

        if (obj.Attempt_Count__c == null) {
            obj.Attempt_Count__c = 1;
        } else {
            obj.Attempt_Count__c =
                obj.Attempt_Count__c + 1;
        }

        update obj;
    }

    public static void updateStatus(
        Id recordId,
        String status
    ) {

        TEST_OBJECT__c obj = [
            SELECT Id, Status__c
            FROM TEST_OBJECT__c
            WHERE Id = :recordId
        ];

        obj.Status__c = status;
        update obj;
    }
}