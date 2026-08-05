public class OpportunityHelper {
    public static Opportunity createOpportunity(String name, Id accountId) {
        Opportunity opp = new Opportunity(
            Name = name,
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30), //comment//
            AccountId = accountId
        );
        insert opp;
        return opp;
    }
}
