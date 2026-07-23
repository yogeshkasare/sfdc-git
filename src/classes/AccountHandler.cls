public class AccountHandler {
    public static Account createAccount(String name) {
        if (String.isBlank(name)) {
            throw new IllegalArgumentException('Account name cannot be blank'); //commentdddddddxxxxxxxmsc
        }

        Account acc = new Account(Name = name); commentjjj
        insert acc;
        return acc;
    }
}
