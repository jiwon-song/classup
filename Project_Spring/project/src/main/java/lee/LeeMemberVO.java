package lee;

public class LeeMemberVO {
	private String teacher_id, teacher_pw, email, teacher_phone, teacher_name, salt, salt_pw, social/*N(naver)/K(kakao)*/;


	public String getTeacher_id() {
		return teacher_id;
	}

	
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_pw() {
		return teacher_pw;
	}

	public void setTeacher_pw(String teacher_pw) {
		this.teacher_pw = teacher_pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTeacher_phone() {
		return teacher_phone;
	}

	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getSalt_pw() {
		return salt_pw;
	}

	public void setSalt_pw(String salt_pw) {
		this.salt_pw = salt_pw;
	}

	public String getSocial() {
		return social;
	}

	public void setSocial(String social) {
		this.social = social;
	}
}
