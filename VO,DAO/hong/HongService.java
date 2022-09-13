package hong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HongService {
	
	@Autowired private HongDAO dao;

	// 반목록 가져오기
	public List<ClassListVO> class_list(String teacher_id) {
		return dao.class_list(teacher_id);		
	}

	// 테스트 목록 가져오기
	public List<TestVO> test_list(int class_id, String teacher_id) {	
		return dao.test_list(class_id, teacher_id);
	}

	// 테스트 추가하기
	public void test_insert(TestVO vo) {
		dao.test_insert(vo);		
	}

	// 테스트 삭제하기
	public void test_delete(int test_id) {
		dao.test_delete(test_id);
		
	}

	public void test_update(TestVO vo) {
		dao.test_update(vo);
	}

	public List<TestDetailVO> test_detail(int test_id) {
		return dao.test_detail(test_id);
	}

	public List<HongStudentListVO> student_list(int class_id) {
		return dao.student_list(class_id);
	}

	public List<HongStudentListVO> student_all_list(String teacher_id) {
		return dao.student_all_list(teacher_id);
	}

	public void check_insert(HongCheckinVO vo) {
		dao.check_insert(vo);
	}

	public void check_delete(String checkcard_num) {
		dao.check_delete(checkcard_num);
	}

	// 카드번호에 대한 오늘 출결 결과 검색
	public HongCheckinVO check_count(String checkcard_num) {
		return dao.check_count(checkcard_num);
	}

	// 입실처리
	public void checkin(String checkcard_num) {
		dao.checkin(checkcard_num);		
	}

	// 퇴실처리
	public void checkout(String checkcard_num) {
		dao.checkout(checkcard_num);
	}

	public List<HongCheckinVO> check_list(String teacher_id) {
		return dao.check_list(teacher_id);
	}

	public void checkin_delete(int checkin_num) {
		dao.checkin_delete(checkin_num);
	}

	public TestVO test_id(int test_id) {
		return dao.test_id(test_id);
	}

	// 출석카드 정보가 DB에 있는지 확인
	public HongCheckinVO doublecheck(String checkcard_num) {
		return dao.doublecheck(checkcard_num);
	}

	public void test_detail_update(TestDetailVO dvo) {
		dao.test_detail_update(dvo);
	}

	public int test_count(TestDetailVO dvo) {
		return dao.test_count(dvo);
	}

	public void test_detail_insert(TestDetailVO dvo) {
		dao.test_detail_insert(dvo);
	}

	public List<ScheduleListVO> schedule_list(String teacher_id) {
		return dao.schedule_list(teacher_id);
	}

	
	

}
