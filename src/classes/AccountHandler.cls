public class AccountHandler {
    public static Account createAccount(String name) {
        if (String.isBlank(name)) {
            throw new IllegalArgumentException('Account name cannot be blank'); //comment
        }

        Account acc = new Account(Name = name); comment
        insert acc;
        return acc;
    }
}
