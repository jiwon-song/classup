package lee;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class LeeMemberDAO implements LeeMemberService {

	@Autowired @Qualifier("bteam") private SqlSession sql;
	@Override
	public boolean member_join(LeeMemberVO vo) {
		return sql.insert("member.mapper.join", vo)>0 ? true : false;
	}
	

	@Override
	public LeeMemberVO member_login(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.login", map);
	}

	@Override
	public void member_myinfo(LeeMemberVO vo) {
		sql.update("member.mapper.memberUpdate", vo);
	}

	@Override
	public boolean member_id_check(String id) {
		return (Integer)sql.selectOne("member.mapper.id_check", id)
				== 0 ? false : true;
	}

	@Override
	public boolean member_update(LeeMemberVO vo) {
		return sql.update("member.mapper.update", vo)>0 ? true : false;
	}

	@Override
	public boolean member_delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String member_salt(String id) {
		return sql.selectOne("member.mapper.salt", id);
	}

	@Override
	public boolean member_reset_password(LeeMemberVO vo) {
		return sql.update("member.mapper.reset_password", vo)>0 
				  ? true : false;
	}


	public LeeMemberVO getinfo(String teacher_id) {
		return sql.selectOne("member.mapper.getinfo", teacher_id);
	}

}
