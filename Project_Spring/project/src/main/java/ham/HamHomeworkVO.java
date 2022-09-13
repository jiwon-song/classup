package ham;

public class HamHomeworkVO {
	private String homework_name, homework_date, class_name;
	private int homework_id, class_id, count, total, max;
	private double avg;
	
	
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
	public String getHomework_date() {
		return homework_date;
	}
	public void setHomework_date(String homework_date) {
		this.homework_date = homework_date;
	}
	public int getHomework_id() {
		return homework_id;
	}
	public void setHomework_id(int homework_id) {
		this.homework_id = homework_id;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	

}
