package bankocr;

import java.util.HashMap;
import java.util.Map;

public class NumberStorage {
    private final String ZERO =   " _ " +
                                  "| |" +
                                  "|_|";
    private final String ONE =    "   " +
                                  "  |" +
                                  "  |";
    private final String TWO =   " _ " +
                                 " _|" +
                                 "|_ ";
    private final String THREE =  " _ " +
                                  " _|" +
                                  " _|";
    private final String FOUR =   "   " +
                                  "|_|" +
                                  "  |";
    private final String FIVE =   " _ " +
                                  "|_ " +
                                  " _|";
    private final String SIX =    " _ " +
                                  "|_ " +
                                  "|_|";
    private final String SEVEN =  " _ " +
                                  "  |" +
                                  "  |";
    private final String EIGHT =  " _ " +
                                  "|_|" +
                                  "|_|";
    private final String NINE =   " _ " +
                                  "|_|" +
                                  " _|";
    private final char DEFAULT_VALUE = '?';

    public char verifyNumber(String stringNumber) {
        Map numbersMap = new HashMap<String, Character>();
        numbersMap.put(ZERO, '0');
        numbersMap.put(ONE, '1');
        numbersMap.put(TWO, '2');
        numbersMap.put(THREE, '3');
        numbersMap.put(FOUR, '4');
        numbersMap.put(FIVE, '5');
        numbersMap.put(SIX, '6');
        numbersMap.put(SEVEN, '7');
        numbersMap.put(EIGHT, '8');
        numbersMap.put(NINE, '9');
        char item = (char) numbersMap.getOrDefault(stringNumber, DEFAULT_VALUE);
        return item;
    }
}
