package ham;

public class HomeworkDetailVO {
	private String student_name, class_name, homework_name, student_id, homework_sub_date;
	private int homework_score, homework_id, student_homework_num, class_id;
	public String getStudent_name() {
		return student_name;
	}
	
	public String getHomework_sub_date() {
		return homework_sub_date;
	}

	public void setHomework_sub_date(String homework_sub_date) {
		this.homework_sub_date = homework_sub_date;
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
	public String getHomework_name() {
		return homework_name;
	}
	public void setHomework_name(String homework_name) {
		this.homework_name = homework_name;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public int getHomework_score() {
		return homework_score;
	}
	public void setHomework_score(int homework_score) {
		this.homework_score = homework_score;
	}
	public int getHomework_id() {
		return homework_id;
	}
	public void setHomework_id(int homework_id) {
		this.homework_id = homework_id;
	}
	public int getStudent_homework_num() {
		return student_homework_num;
	}
	public void setStudent_homework_num(int student_homework_num) {
		this.student_homework_num = student_homework_num;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	
	

}
