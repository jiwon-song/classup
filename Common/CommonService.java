package common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import lee.LeeMemberVO;

@Service
public class CommonService {
	
	public String getTeacherID( HttpSession session ) {
		return  ((LeeMemberVO)session.getAttribute("loginInfo")).getTeacher_id();
	}
	
	
	public Map<String, Object> json_requestAPI(StringBuffer url){
		JSONObject json = new JSONObject( requestAPI(url) );
		json = json.getJSONObject("response");
		json = json.getJSONObject( "body" );
		int count = 0;
		if( json.has("totalCount") ) 
			count= json.getInt("totalCount");
		json = json.getJSONObject( "items" );
		json.put("total", count);
		return json.toMap();
	}
	
	//RestAPI요청
	public String requestAPI(StringBuffer url, String property) {
		String result = null;
		try {
			HttpURLConnection con 
			= (HttpURLConnection)
			new URL(url.toString()).openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", property);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(
						new InputStreamReader(con.getInputStream(), "utf-8"));
			} else {  // 에러 발생
				br = new BufferedReader(
						new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			con.disconnect();
			if(responseCode==200) {
				result = res.toString();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	//RestAPI요청
	public String requestAPI(StringBuffer url) {
		String result = null;
	    try {
	        HttpURLConnection con 
	        	= (HttpURLConnection)
	        		new URL(url.toString()).openConnection();
	        con.setRequestMethod("GET");
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	          br = new BufferedReader(
	        		  new InputStreamReader(con.getInputStream(), "utf-8"));
	        } else {  // 에러 발생
	          br = new BufferedReader(
	        		  new InputStreamReader(con.getErrorStream(), "utf-8"));
	        }
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	          res.append(inputLine);
	        }
	        br.close();
	        con.disconnect();
            result = res.toString();
            if( responseCode!=200 ) {
            	System.out.printf("URL:%s\n",url.toString());
            	System.out.printf("ERROR\n%s\n",result);
            }
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return result;
	}
	
/*	//회원가입축하 이메일전송하기(누구에게 어떤파일을 첨부해서 메일전송)
	public void sendWelcomeJoin(String email
							, String name, String attach) {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		//로그인하기위한 아이디,비번 입력하기
		mail.setAuthentication("관리자이메일아이디", "관리자이메일비번");
		mail.setSSLOnConnect(true); //로그인버튼 클릭하기
		
		try {
			mail.setFrom("관리자이메일주소", "IoT과정 관리자");
			mail.addTo(email, name);
			
			mail.setSubject("SCLASS 회원가입을 축하");
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<p>SCLASS 회원가입을 축하합니다!</p>");	
			msg.append("</body>");
			msg.append("</html>");
			mail.setHtmlMsg(msg.toString());
			
			EmailAttachment file = new EmailAttachment();
			file.setPath(attach); //입교관련 첨부할 파일선택
			mail.attach(file); //파일첨부버튼 클릭
			
			mail.send(); //메일전송버튼 클릭
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	*/
	
	
	//재발급 비밀번호전송하기
	public String resetPassword(String id, String name, String email) {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.naver.com");
		mail.setDebug(true);
		mail.setCharset("utf-8");
		
		mail.setAuthentication("open400", "lcg0116!");
//		mail.setAuthentication("관리자이메일아이디", "해당이메일아이디의비번");
		mail.setSSLOnConnect(true); //로그인버튼클릭하기
		
		String pw = "";
		try {
			//메일송신자
			mail.setFrom("open400@naver.com", "관리자");			
//			mail.setFrom("관리자이메일주소:관리자이메일아이디@naver.com", "관리자");			
			mail.addTo(email, name); //메일수신자
			
			//임시비밀번호로 사용할 랜덤문자열 생성
			pw = UUID.randomUUID().toString();
			pw = pw.substring( pw.lastIndexOf("-")+1 );
			
			mail.setSubject(name + " 비밀번호 재발급"); //제목쓰기
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<h3>임시 비밀번호 발급</h3>");
			msg.append("<p>아이디: ").append(id).append(" 님</p>");
			msg.append("<p>발급된 임시 비밀번호로 로그인후 비밀번호를 변경하세요</p>");
			msg.append("<p><strong>" + pw + "</strong></p>");
			msg.append("</body>");
			msg.append("</html>");			
			mail.setHtmlMsg( msg.toString() ); //내용쓰기
			
			mail.send(); //전송하기버튼 클릭
		}catch(Exception e) {			
		}
		return pw;
	}
	
	//salt를 사용해 비밀번호를 암호화하기
	public String getEncrypt(String pw, String salt) {
		String salt_pw = pw + salt;
		//암호화방식 지정
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update( pw.getBytes() );
			byte[] digest = md.digest();
			StringBuffer sb = new StringBuffer();
			for(byte d : digest) {
				sb.append(String.format("%02x", d));
			}
			salt_pw = sb.toString();
		}catch(Exception e) {			
		}
		return salt_pw;
	}
	
	//비밀번호를 해시 처리하는 단방향 함수의 랜덤데이터만들기
	public String generateSalt() {
		SecureRandom r = new SecureRandom();
		byte[] salt = new byte[24];
		r.nextBytes(salt);
		
		StringBuffer buf = new StringBuffer();
		for(byte s : salt) {
			buf.append(String.format("%02x", s));
		}
		return buf.toString();
	}
	
}
