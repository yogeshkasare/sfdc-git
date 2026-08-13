public class ContactNotifier {
    public static void sendWelcomeEmail(Id contactId) {
        Contact con = [SELECT Id, Email FROM Contact WHERE Id = :contactId LIMIT 1];
        if (con.Email != null) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] { con.Email });
            mail.setSubject('Welcome to Salesforce');
            mail.setPlainTextBody('Hello ' + con.Id + ', welcome aboard!');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}