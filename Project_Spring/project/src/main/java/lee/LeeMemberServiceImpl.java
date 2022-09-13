package lee;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class LeeMemberServiceImpl implements LeeMemberService {

	@Override
	public boolean member_join(LeeMemberVO vo) {
		return dao.member_join(vo);
	}

	@Autowired private LeeMemberDAO dao;
	
	@Override
	public LeeMemberVO member_login(HashMap<String, String> map) {
		return dao.member_login(map);
	}

	@Override
	public void member_myinfo(LeeMemberVO vo) {
		dao.member_myinfo(vo);
	}

	@Override
	public boolean member_id_check(String id) {
		return dao.member_id_check(id);
	}

	@Override
	public boolean member_update(LeeMemberVO vo) {
		return dao.member_update(vo);
	}

	@Override
	public boolean member_delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String member_salt(String id) {
		return dao.member_salt(id);
	}

	@Override
	public boolean member_reset_password(LeeMemberVO vo) {
		return dao.member_reset_password(vo);
	}

	public LeeMemberVO getinfo(String teacher_id) {
		return dao.getinfo(teacher_id);
	}

}
