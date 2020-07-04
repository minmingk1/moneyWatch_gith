package mw.main.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MainDAO {
		
	//mybatis�� ����
	private SqlSessionTemplate sqlSession = null; 	
	
	//sqlSession�� �̿��� SQL�� ����
	public MainDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//���� ���� url ���
	public MainDTO video_url() {
		return sqlSession.selectOne("main.video_url");
	}
	public int thisOut(String id) {
		return sqlSession.selectOne("moneyio.thisOut", id);
	}
	public int thisIn(String id) {
		return sqlSession.selectOne("moneyio.thisIn", id);
	}
}
