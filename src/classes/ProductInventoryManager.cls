public class ProductInventoryManager {

    public static Boolean isStockAvailable(Integer availableQty, Integer requestedQty) {

        if(availableQty >= requestedQty) {
            return true;
        }

        return false;
    }
}