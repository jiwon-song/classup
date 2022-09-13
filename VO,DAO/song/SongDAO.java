package song;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class SongDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;

	public List<ClassVO> class_list(String teacher_id) {
		return sql.selectList("song.mapper.classlist", teacher_id);
	}

	public List<StudentListVO> student_list(int class_id) {
		return sql.selectList("song.mapper.studentlist", class_id);
	}

	public StudentListVO stu_detail(String student_id) {
		return sql.selectOne("song.mapper.studetail", student_id);
	}

	//학생한명 과제정보
	public List<SongHomeworkVO> stu_hw_detail(String student_id) {
		return sql.selectList("song.mapper.stuhwdetail", student_id);
	}

	//학생삭제
	public void student_delete(String student_id) {
		sql.delete("song.mapper.studentdelete", student_id);
		
	}

	//학생정보 수정
	public void student_update(StudentListVO vo) {
		sql.update("song.mapper.studentupdate", vo);
		
	}
	
	//학생한명 테스트정보
	public List<SongTestVO> stu_test_detail(String student_id) {
		return sql.selectList("song.mapper.stutestdetail", student_id);
	}

	//클래스 수정
	public void class_update(ClassVO vo) {
		sql.update("song.mapper.classupdate", vo);
	}

	//클래스 삭제
	public void class_delete(int class_id) {
		sql.delete("song.mapper.classdelete", class_id);
	}

	//클래스 추가
	public void class_insert(ClassVO vo) {
		sql.insert("song.mapper.classinsert", vo);
	}

	public List<SongCheckinVO> stu_check_detail(String student_id) {
		return sql.selectList("song.mapper.stucheckdetail", student_id);
	}
	
	
}
