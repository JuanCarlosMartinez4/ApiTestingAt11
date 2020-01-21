package bankocr;

import org.junit.Assert;
import org.junit.Test;

import java.io.File;

public class FileScannerTest {
    File file = new File("src/main/java/files/123456789.txt");
    FileScanner fileScanner = new FileScanner();

    @Test
    public void verify_ifFileExist_true() {
        boolean exists = file.exists();
        Assert.assertTrue(exists);
    }

    @Test
    public void scanFile_fileNumbers123456789_123456789() {
        String filePath = "src/main/java/files/123456789.txt";
        String actual = fileScanner.scanFile(filePath);
        String expected = "123456789";
        Assert.assertEquals(expected, actual);
    }

    @Test
    public void scanFile_fileNumbers000000000_000000000() {
        String filePath = "src/main/java/files/000000000.txt";
        String actual = fileScanner.scanFile(filePath);
        String expected = "000000000";
        Assert.assertEquals(expected, actual);
    }

    @Test
    public void scanFile_fileNumbers111111111_111111111() {
        String filePath = "src/main/java/files/111111111.txt";
        String actual = fileScanner.scanFile(filePath);
        String expected = "111111111";
        Assert.assertEquals(expected, actual);
    }
}