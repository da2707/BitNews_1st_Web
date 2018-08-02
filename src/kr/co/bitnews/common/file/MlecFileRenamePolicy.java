package kr.co.bitnews.common.file;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MlecFileRenamePolicy implements FileRenamePolicy {
	
	public static void main(String[] args) {
		File f = new File("c:/java-lec/upload/test.txt");
		// f.getParent(); - c:/java-lec/upload
		// f.getName() - test.txt
		
		// c:/java-lec/upload/test.txt
		// c:/java-lec/upload/alkjcvoieno224vcew.txt
		
	}
	
	@Override
	public File rename(File file) {
		String parent = file.getParent();
		String name = file.getName();
		// 원본 파일의 확장자
		String ext = "";
		// name이 aaa.txt 인 경우
		
		// index는  3이 된다.
 		int index = name.lastIndexOf(".");
 		
		// 확장자가 있는 경우( index -1이 아닌 경우 )
		if (index != -1) {
			// ext는 .txt 가 된다.
			ext = name.substring(index);
		}
		
		// 고유한 파일 이름을 생성하기
		String uName = UUID.randomUUID().toString();
		return new File(parent, uName + ext);
	}
}	








