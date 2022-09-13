package lim;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Autowired private CalendarDAO dao;
	
	@Override
	public List<CalendarVO> calendarList(String teacher_id) {
		return dao.calendarList(teacher_id);
	}

	@Override
	public int calendar_insert(HashMap<String, String> map) {
		return dao.calendar_insert(map);
	}

	@Override
	public int calendar_delete(HashMap<String, String> map) {
		return dao.calendar_delete(map);
	}

}
