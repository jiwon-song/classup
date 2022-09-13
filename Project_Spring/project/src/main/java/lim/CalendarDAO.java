package lim;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO implements CalendarService {
	@Autowired private SqlSession sql;
	@Override
	public List<CalendarVO> calendarList(String teacher_id) {
		return sql.selectList("calendar.calendarList", teacher_id);
	}

	@Override
	public int calendar_insert(HashMap<String, String> map) {
		return sql.insert("calendar.insert", map);
	}

	@Override
	public int calendar_delete(HashMap<String, String> map) {
		return sql.delete("calendar.delete", map);
	}

}
