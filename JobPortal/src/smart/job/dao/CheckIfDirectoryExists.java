package smart.job.dao;
import java.io.File;

public class CheckIfDirectoryExists {
    public static void folderName(String host)  {
		String directoryPath = "/var/www/html/";
		File file = new File(directoryPath);

		if (file.isDirectory()) {
			System.out.println("File is a Directory");
		} else {
			System.out.println("Directory doesn't exist!!");
		}

    }

}
