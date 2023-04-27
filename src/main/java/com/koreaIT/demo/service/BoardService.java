package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.koreaIT.demo.repository.BoardRepository;
import com.koreaIT.demo.vo.Board;

public class BoardService {
	private BoardRepository boardRepository;

	@Autowired
	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	public Board getBoardById(int boardId) {
		
		return boardRepository.getBoardById(boardId);
	}

}
