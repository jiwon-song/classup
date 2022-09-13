package song;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class SongService{
	
	@Autowired private SongDAO dao;
	
	//학생 목록
	public List<StudentListVO> student_list(int class_id){
		return dao.student_list(class_id);
	}
	
	//클래스 목록
	public List<ClassVO> class_list(String teacher_id){
		return dao.class_list(teacher_id);
	}

	//학생 상제정보
	public StudentListVO stu_detail(String student_id) {
		return dao.stu_detail(student_id);
	}
	
	//학생한명 과제정보
	public List<SongHomeworkVO> stu_hw_detail(String student_id) {
		return dao.stu_hw_detail(student_id);
	}

	//학생 삭제하기
	public void student_delete(String student_id) {
		dao.student_delete(student_id);
	}

	//학생상세정보 수정
	public void student_update(StudentListVO vo) {
		dao.student_update(vo);
		
	}
	
	//학생한명 테스트정보
	public List<SongTestVO> stu_test_detail(String student_id) {
		return dao.stu_test_detail(student_id);
	}

	//클래스 수정
	public void class_update(ClassVO vo) {
		dao.class_update(vo);
	}

	//클래스 삭제
	public void class_delete(int class_id) {
		dao.class_delete(class_id);
		
	}

	//클래스 추가
	public void class_insert(ClassVO vo) {
		dao.class_insert(vo);
	}

	public List<SongCheckinVO> stu_check_detail(String student_id) {
		return dao.stu_check_detail(student_id);
	}


}
