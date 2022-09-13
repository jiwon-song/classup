package ham;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hong.ClassListVO;
import hong.TestVO;

@Service
public class HamService {
	
	@Autowired private HamDAO dao;
	
	public List<HamHomeworkVO> homework_list(int class_id, String teacher_id) {
		return dao.homework_list(class_id, teacher_id);
	}

	public void homework_insert(HamHomeworkVO vo) {
		dao.homework_insert(vo);
	}

	public void homework_delete(int homework_id) {
		dao.homework_delete(homework_id);
	}

	public void homework_update(HamHomeworkVO vo) {
		dao.homework_updeat(vo);
		
	}

	public List<ClassListVO> class_list(String teacher_id) {
		return dao.class_list(teacher_id);
	}

	public List<HomeworkDetailVO> homework_detail(int homework_id) {
		return dao.homework_detail(homework_id);
	}

	public HamHomeworkVO homework_id(int homework_id) {
		return dao.homework_id(homework_id);
	}

	public int homework_count(HomeworkDetailVO dvo) {
		return dao.homework_count(dvo);
	}

	public void homework_detail_update(HomeworkDetailVO dvo) {
		dao.homework_detail_update(dvo);
	}

	public void homework_detail_insert(HomeworkDetailVO dvo) {
		dao.homework_detail_insert(dvo);
		
	}
	public List<HamCheckVO> check_list( HamCheckVO cvo){
		return dao.check_list(cvo);
	}

	public String class_name(int class_id) {
		return dao.class_name(class_id);
	}
}
