public class LeadConverter {
    public static Contact convertLeadToContact(Id leadId) {
        Lead l = [SELECT Id, FirstName, LastName, Company FROM Lead WHERE Id = :leadId LIMIT 1];
        if (l.IsConverted) {
            throw new AuraHandledException('Lead is already converted.');
        }
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(l.Id);
        lc.setDoNotCreateOpportunity(true);
        lc.setConvertedStatus('Closed - Converted');
        Database.LeadConvertResult result = Database.convertLead(lc);
        if (result.isSuccess()) {
            return [SELECT Id, FirstName, LastName FROM Contact WHERE Id = :result.getContactId()];
        }
        return null;
    }
}