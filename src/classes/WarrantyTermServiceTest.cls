@IsTest
private class WarrantyTermServiceTest {

    /**
     * Returns the first active value configured for a picklist field.
     */
    private static String getFirstActivePicklistValue(
        Schema.SObjectField fieldReference
    ) {
        for (
            Schema.PicklistEntry picklistEntry :
            fieldReference.getDescribe().getPicklistValues()
        ) {
            if (picklistEntry.isActive()) {
                return picklistEntry.getValue();
            }
        }

        return null;
    }

    @IsTest
    static void testCreateAndRetrieveWarrantyTerm() {
        String effectiveStartDateValue =
            getFirstActivePicklistValue(
                WarrantyTerm__c.EffectiveStartDate__c
            );

        String migrationStatusValue =
            getFirstActivePicklistValue(
                WarrantyTerm__c.Migration_Status__c
            );

        Test.startTest();

        Id warrantyTermId =
            WarrantyTermService.createWarrantyTerm(
                'Test Warranty Term',
                effectiveStartDateValue,
                migrationStatusValue
            );

        WarrantyTerm__c warrantyTerm =
            WarrantyTermService.getWarrantyTerm(warrantyTermId);

        Test.stopTest();

        System.assertNotEquals(
            null,
            warrantyTerm.Id,
            'The Warranty Term record should be created.'
        );

        System.assertEquals(
            effectiveStartDateValue,
            warrantyTerm.EffectiveStartDate__c,
            'The Effective Start Date value should match.'
        );

        System.assertEquals(
            migrationStatusValue,
            warrantyTerm.Migration_Status__c,
            'The Migration Status value should match.'
        );
    }

    @IsTest
    static void testUpdateMigrationStatus() {
        List<Schema.PicklistEntry> migrationStatusValues =
            WarrantyTerm__c.Migration_Status__c
                .getDescribe()
                .getPicklistValues();

        String initialStatus;
        String updatedStatus;

        for (Schema.PicklistEntry entry : migrationStatusValues) {
            if (!entry.isActive()) {
                continue;
            }

            if (initialStatus == null) {
                initialStatus = entry.getValue();
            } else if (updatedStatus == null) {
                updatedStatus = entry.getValue();
                break;
            }
        }

        // If only one active value exists, use it for both operations.
        if (updatedStatus == null) {
            updatedStatus = initialStatus;
        }

        Id warrantyTermId =
            WarrantyTermService.createWarrantyTerm(
                'Warranty Term Update Test',
                getFirstActivePicklistValue(
                    WarrantyTerm__c.EffectiveStartDate__c
                ),
                initialStatus
            );

        Test.startTest();

        WarrantyTermService.updateMigrationStatus(
            warrantyTermId,
            updatedStatus
        );

        Test.stopTest();

        WarrantyTerm__c updatedWarrantyTerm = [
            SELECT Id, Migration_Status__c
            FROM WarrantyTerm__c
            WHERE Id = :warrantyTermId
            LIMIT 1
        ];

        System.assertEquals(
            updatedStatus,
            updatedWarrantyTerm.Migration_Status__c,
            'The Migration Status should be updated.'
        );
    }

    @IsTest
    static void testGetWarrantyTermWithNullId() {
        Boolean exceptionThrown = false;

        Test.startTest();

        try {
            WarrantyTermService.getWarrantyTerm(null);
        } catch (IllegalArgumentException exceptionRecord) {
            exceptionThrown = true;
        }

        Test.stopTest();

        System.assertEquals(
            true,
            exceptionThrown,
            'An exception should be thrown when the record ID is null.'
        );
    }
}