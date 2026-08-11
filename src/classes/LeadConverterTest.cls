@isTest
public class LeadConverterTest {
    @isTest
    static void testConvertLeadToContact() {
        Lead l = new Lead(FirstName='Test', LastName='Lead', Company='DemoCo', Status='Open - Not Contacted');
        insert l;

        Test.startTest();
        Contact c = LeadConverter.convertLeadToContact(l.Id);
        Test.stopTest();

        System.assertNotEquals(null, c.Id, 'Contact should be created from Lead conversion');
        System.assertEquals('Lead', c.LastName, 'LastName should match original Lead');
    }
}