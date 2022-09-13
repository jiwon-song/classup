package lim;


import java.util.HashMap;
import java.util.List;

public interface CalendarService {
	public List<CalendarVO> calendarList(String teacher_id);		// 스케줄 조회
	
	int calendar_insert(HashMap<String, String> map);	// 일정 추가
	
	int calendar_delete(HashMap<String, String> map);	// 일정 삭제
}
