package hong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class HongDAO {

	@Autowired @Qualifier("bteam") private SqlSession sql;

	public List<ClassListVO> class_list(String teacher_id) {
		return sql.selectList("hong.mapper.classlist", teacher_id);
	}

	public List<TestVO> test_list(int class_id, String teacher_id) {
		if(class_id==0) {
			return sql.selectList("hong.mapper.testlistall", teacher_id);						
		}else {
			return sql.selectList("hong.mapper.testlist", class_id);			
		}
			
	}

	// 테스트 추가하기
	public void test_insert(TestVO vo) {
		sql.insert("hong.mapper.testinsert", vo);
	}

	public void test_delete(int test_id) {
		sql.delete("hong.mapper.testdelete", test_id);		
	}


	public void test_update(TestVO vo) {
		sql.update("hong.mapper.testupdate", vo);
		
	}

	public List<TestDetailVO> test_detail(int test_id) {
		return sql.selectList("hong.mapper.testdetail", test_id);		
	}

	public List<HongStudentListVO> student_list(int class_id) {
		return sql.selectList("hong.mapper.studentlist", class_id);
	}

	public List<HongStudentListVO> student_all_list(String teacher_id) {
		return sql.selectList("hong.mapper.studentalllist", teacher_id);
	}

	// 출결카드 등록하기
	public void check_insert(HongCheckinVO vo) {
		sql.update("hong.mapper.checkinsert", vo);		
	}

	public void check_delete(String checkcard_num) {
		sql.update("hong.mapper.checkdelete",checkcard_num);
	}

	public HongCheckinVO check_count(String checkcard_num) {
		return sql.selectOne("hong.mapper.checkcount", checkcard_num);
	}

	// 출석하기
	public void checkin(String checkcard_num) {
		sql.insert("hong.mapper.checkin",checkcard_num);
	}

	public void checkout(String checkcard_num) {
		sql.update("hong.mapper.checkout", checkcard_num);
	}

	public List<HongCheckinVO> check_list(String teacher_id) {
		return sql.selectList("hong.mapper.check_list", teacher_id);
	}

	public void checkin_delete(int checkin_num) {
		sql.delete("hong.mapper.checkin_delete", checkin_num);
	}

	public TestVO test_id(int test_id) {
		return sql.selectOne("hong.mapper.test_id", test_id);
	}

	public HongCheckinVO doublecheck(String checkcard_num) {
		return sql.selectOne("hong.mapper.doublecheck",checkcard_num);
	}

	public void test_detail_update(TestDetailVO dvo) {
		sql.update("hong.mapper.test_detail_update", dvo);
	}

	public int test_count(TestDetailVO dvo) {
		return sql.selectOne("hong.mapper.test_count",dvo);
	}

	public void test_detail_insert(TestDetailVO dvo) {
		sql.insert("hong.mapper.test_detail_insert", dvo);
	}

	public List<ScheduleListVO> schedule_list(String teacher_id) {
		return sql.selectList("hong.mapper.schedule_list", teacher_id);
	}

}
