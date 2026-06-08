@isTest
public class WelcomeServiceTest {
    
    @isTest
    static void testGetMessage() {
        // Act
        String result = WelcomeService.getMessage(); //renamed
        
        // Assert
        System.assertEquals('Hello', result, 'Message should return Hello');
    }
}
