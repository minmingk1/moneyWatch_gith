package mw.main.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MainDAO {
		
	//mybatis占쏙옙 占쏙옙占쏙옙
	private SqlSessionTemplate sqlSession = null;

	//sqlSession占쏙옙 占싱울옙占쏙옙 SQL占쏙옙 占쏙옙占쏙옙
	public MainDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙 url 占쏙옙占�
	public MainDTO video_url() {
		return sqlSession.selectOne("main.video_url");
	}
	public int thisOut(String id) {
		return sqlSession.selectOne("moneyio.thisOut", id);
	}
	public int thisIn(String id) {
		return sqlSession.selectOne("moneyio.thisIn", id);
	}
	public String all_balance(String id) {
		return sqlSession.selectOne("moneyio.id_balance", id);
	}
}
