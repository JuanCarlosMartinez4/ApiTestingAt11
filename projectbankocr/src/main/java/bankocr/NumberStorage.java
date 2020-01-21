package bankocr;

public class NumberStorage {
    private String zero =   " _ " +
                            "| |" +
                            "|_|";
    private String one =    "   " +
                            "  |" +
                            "  |";
    private String two =   " _ " +
                            " _|" +
                            "|_ ";
    private String three =  " _ " +
                            " _|" +
                            " _|";
    private String four =   "   " +
                            "|_|" +
                            "  |";
    private String five =   " _ " +
                            "|_ " +
                            " _|";
    private String six =    " _ " +
                            "|_ " +
                            "|_|";
    private String seven =  " _ " +
                            "  |" +
                            "  |";
    private String eight =  " _ " +
                            "|_|" +
                            "|_|";
    private String nine =   " _ " +
                            "|_|" +
                            " _|";
    public char verifyNumber(String stringNumber) {
        if (stringNumber.equals(zero)) {
            return '0';
        }

        if (stringNumber.equals(one)) {
            return '1';
        }

        if (stringNumber.equals(two)) {
            return '2';
        }

        if (stringNumber.equals(three)) {
            return '3';
        }

        if (stringNumber.equals(four)) {
            return '4';
        }

        if (stringNumber.equals(five)) {
            return '5';
        }

        if (stringNumber.equals(six)) {
            return '6';
        }

        if (stringNumber.equals(seven)) {
            return '7';
        }

        if (stringNumber.equals(eight)) {
            return '8';
        }

        if (stringNumber.equals(nine)) {
            return '9';
        } else {
            return '?';
        }
    }
}
