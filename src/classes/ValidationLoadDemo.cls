public class ValidationLoadDemo {

    public static Integer performWork(Integer iterations) {
        Integer result = 0;

        for (Integer i = 0; i < iterations; i++) {
            String input = 'Validation-' + i;

            Blob digest = Crypto.generateDigest(
                'SHA-256',
                Blob.valueOf(input)
            );

            result += EncodingUtil.convertToHex(digest).length();
        }

        return result;
    }
}