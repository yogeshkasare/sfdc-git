public with sharing class WarrantyTermService {

    /**
     * Creates a Warranty Term record.
     */
    public static Id createWarrantyTerm(
        String recordName,
        String effectiveStartDate,
        String migrationStatus
    ) {
        WarrantyTerm__c warrantyTerm = new WarrantyTerm__c(
            EffectiveStartDate__c = effectiveStartDate,
            Migration_Status__c = migrationStatus
        );

        // Set Name only when the object uses a text Name field.
        Schema.DescribeFieldResult nameFieldDescribe =
            WarrantyTerm__c.Name.getDescribe();

        if (!nameFieldDescribe.isAutoNumber()) {
            warrantyTerm.Name = recordName;
        }

        insert warrantyTerm;

        return warrantyTerm.Id;
    }

    /**
     * Retrieves a Warranty Term record.
     */
    public static WarrantyTerm__c getWarrantyTerm(Id warrantyTermId) {
        if (warrantyTermId == null) {
            throw new IllegalArgumentException(
                'Warranty Term record ID cannot be null.'
            );
        }

        return [
            SELECT Id,
                   Name,
                   EffectiveStartDate__c,
                   Migration_Status__c,
                   OwnerId,
                   CreatedById,
                   LastModifiedById
            FROM WarrantyTerm__c
            WHERE Id = :warrantyTermId
            LIMIT 1
        ];
    }

    /**
     * Updates the Migration Status field.
     */
    public static void updateMigrationStatus(
        Id warrantyTermId,
        String migrationStatus
    ) {
        if (warrantyTermId == null) {
            throw new IllegalArgumentException(
                'Warranty Term record ID cannot be null.'
            );
        }

        WarrantyTerm__c warrantyTerm = new WarrantyTerm__c(
            Id = warrantyTermId,
            Migration_Status__c = migrationStatus
        );

        update warrantyTerm;
    }
}