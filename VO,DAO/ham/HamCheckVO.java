package ham;

public class HamCheckVO {
	private String student_id, student_name, class_name, checkin_date, checkin_hour, checkout_hour, parent_phone;
	private int checkin_num, class_id;
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	
	public String getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}
	public int getCheckin_num() {
		return checkin_num;
	}
	public void setCheckin_num(int checkin_num) {
		this.checkin_num = checkin_num;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getCheckin_hour() {
		return checkin_hour;
	}
	public void setCheckin_hour(String checkin_hour) {
		this.checkin_hour = checkin_hour;
	}
	public String getCheckout_hour() {
		return checkout_hour;
	}
	public void setCheckout_hour(String checkout_hour) {
		this.checkout_hour = checkout_hour;
	}
	public String getParent_phone() {
		return parent_phone;
	}
	public void setParent_phone(String parent_phone) {
		this.parent_phone = parent_phone;
	}
	
	
	

}
