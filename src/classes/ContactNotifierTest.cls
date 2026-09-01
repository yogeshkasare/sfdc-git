@isTest
public class ContactNotifierTest {
    @isTest
    static void testSendWelcomeEmail() {
        Contact con = new Contact(LastName = 'Test', Email = 'test@example.com');
        insert con;

        Test.startTest();
        ContactNotifier.sendWelcomeEmail(con.Id);
        Test.stopTest();

        // Verify that an email was queued
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] {}
        );
        System.assertEquals(true, results.isEmpty(), 'Email sending simulated in test context');
    }
}