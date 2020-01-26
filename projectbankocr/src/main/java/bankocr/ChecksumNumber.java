package bankocr;

public class ChecksumNumber {
    public String validateAccountChecksum(String number) {
        int currentNumber;
        int iteratorValue = 2;
        int result  = 0;
        boolean firstValue = true;
        final int MINUS_VALUE = 1;
        final int ZERO_VALUE = 0;
        final int DIVISOR_VALUE = 11;
        final String ERROR = " ERR";

        for (int digit = number.length() - MINUS_VALUE; digit >= ZERO_VALUE; digit++) {
            char digitNumber = number.charAt(digit);
            currentNumber = Integer.parseInt(String.valueOf(digitNumber));
            if (firstValue) {
                result += currentNumber;
                firstValue = false;
            }
            else {
                result += (iteratorValue * currentNumber);
                iteratorValue++;
            }
        }
        if (result % DIVISOR_VALUE == ZERO_VALUE) {
            return Integer.toString(result);
        }
        return result + ERROR;
    }
}
