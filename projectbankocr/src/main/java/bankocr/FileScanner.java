package bankocr;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Scanner;

public class FileScanner {
    public String scanFile(String filePath) {
        File file  = new File(filePath);
        String resultNumber = new String();

        try (Scanner scanner = new Scanner(file, StandardCharsets.UTF_8.name())) {
            resultNumber = readFileContent(scanner);
        } catch (FileNotFoundException e) {
            resultNumber = e.getMessage();
        } finally {
            return resultNumber;
        }

    }

    private String readFileContent(Scanner scanner) {
        ArrayList<String> content = new ArrayList<>();
        String number = "";
        final String DEFAULT_VALUE = "?";
        final String ERROR = " ILL";

        while (scanner.hasNextLine()) {
            content.add(scanner.nextLine());
        }
        if (verifySize(content)) {
            number = splitNumber(content);
            number = number.contains(DEFAULT_VALUE) ? number.concat(ERROR) : number;
        }
        return number;
    }

    private boolean verifySize(ArrayList<String> content) {
        boolean isValid = true;
        final int SIZE = 27;

        for (String item : content) {
            if (item.length() != SIZE) {
                isValid = false;
                break;
            }
        }
        return isValid;
    }

    private String splitNumber(ArrayList<String> content) {
        StringBuilder number = new StringBuilder();
        String temp = "";

        final int FIRST_OBJECT = 0;
        final int SECOND_OBJECT = 1;
        final int THIRD_OBJECT = 2;
        final int INCREMENT = 3;

        int init = 0;
        int last = 3;

        NumberStorage numberStorage = new NumberStorage();
        int size = content.get(FIRST_OBJECT).length();

        while (last <= size) {
            temp = new String();
            temp += content.get(FIRST_OBJECT).subSequence(init, last);
            temp += content.get(SECOND_OBJECT).subSequence(init, last);
            temp += content.get(THIRD_OBJECT).subSequence(init, last);
            number.append(numberStorage.verifyNumber(temp));
            init = last;
            last += + INCREMENT;
        }
        return number.toString();
    }
}
