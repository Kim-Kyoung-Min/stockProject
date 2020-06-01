package com.bitcamp.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public int writeFreeBoard(BoardVO vo) {
		return boardDAO.writeFreeBoard(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return boardDAO.updateBoard(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) {
		return boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

}