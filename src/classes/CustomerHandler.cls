public class CustomerHandler {
    public static Customer createCustomer(String name) {
        if (String.isBlank(name)) {
            throw new IllegalArgumentException('Customer name cannot be blank');
        }

        Customer cust = new Customer(Name = name);
        insert cust;
        return cust;
    }
}
