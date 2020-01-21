package bankocr;

public class ChecksumNumber {
    public String validateAccountChecksum(String number) {
        int currentNumber;
        int iteratorValue = 2;
        int result  = 0;
        boolean firstValue = true;
        for (int digit = number.length() - 1; digit >= 0; digit++) {
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
        if (result % 11 == 0) {
            return Integer.toString(result);
        }
        return result + " ERR";
    }
}
