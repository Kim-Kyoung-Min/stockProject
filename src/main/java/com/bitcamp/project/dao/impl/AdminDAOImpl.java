package com.bitcamp.project.dao.impl;

import java.util.List;

import javax.servlet.jsp.el.ELParseException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.AdminDAO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.AdminVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int writeQuestion(AdminVO vo) {
		return mybatis.insert("admin.writeQuestion", vo);
	}
	@Override
	public int writeAnswer(AdminVO vo) {
		int cnt = mybatis.insert("admin.writeAnswer", vo);
		if(cnt == 1) {
			vo.setQcheck("답변완료");
			mybatis.update("admin.answerSuceess",vo);
		}
		
		return cnt;
	}
	
	
	

	@Override
	public int qnaCount(AdminVO vo) {
		return mybatis.selectOne("admin.qnaCount", vo);
	}
	@Override
	public List<AdminVO> qnaList(PagingVO qnaPage) {
		return mybatis.selectList("admin.qnaList", qnaPage);
	}

	
	public AdminVO qnaDetail(AdminVO vo) {
		return (AdminVO)mybatis.selectOne("admin.qnaDetail", vo);
	}

	@Override
	public int qnaDelete(AdminVO vo) {
		return mybatis.delete("admin.qnaDelete", vo);
	}

	@Override
	public int qnaUpdate(AdminVO vo) {
		return mybatis.update("admin.qnaUpdate", vo);
	}
	@Override
	public List<AdminVO> reportList(AdminVO vo) {
		return mybatis.selectList("admin.reportList", vo);
	}
	
}
