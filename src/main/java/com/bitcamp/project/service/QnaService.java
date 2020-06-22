package com.bitcamp.project.service;

import java.util.Map;

import com.bitcamp.project.vo.QnaVO;


public interface QnaService {
	public int writeQna(QnaVO vo);
	public Map<String, Object> qnaList(QnaVO vo, int nowPage, int page, String searchStyle, String keyword);
	public QnaVO qnaDetail(QnaVO vo);
	public int qnaDelete(QnaVO vo);
	public int qnaUpdate(QnaVO vo);
}
