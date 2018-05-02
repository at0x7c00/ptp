package test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class PicProcessor {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader(new File("F:\\temp\\sql.txt")));
		
		String line = null;
		
		while((line = br.readLine())!=null){
			String[] att = line.split(",");
			String name = att[5];
			String origin = att[6];
			name = name.replace("'", "");
			name = name.replace(" ", "");
			origin = origin.replace("'", "");
			origin = origin.replace(" ", "");
			System.out.println(name + "_" + origin);
			File file = new File("F:\\temp\\uploads_zlwhgc\\" + name);
			if(!file.exists()){
				System.out.println(" not existed");
				continue;
			}
			file.renameTo(new File("F:\\temp\\uploads\\" + name + "_" + origin));
		}
		
		br.close();
	}
}
