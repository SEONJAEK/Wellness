package com.project.wellness.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.wellness.board.service.BoardService;
import com.project.wellness.board.service.ReplyService;
import com.project.wellness.board.vo.BoardVO;
import com.project.wellness.board.vo.PageMaker;
import com.project.wellness.board.vo.ReplyVO;
import com.project.wellness.board.vo.SearchCriteria;



@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "writeView.do", method = RequestMethod.GET)
	public String writeView(HttpServletRequest request) throws Exception{
		logger.info("writeView");

//		if(request.getSession() != null ){
//	       if(request.getSession().getAttribute("userId") != null ) {
//	         vo.setUserId((String) request.getSession().getAttribute("userId"));
//	       }
//		}
		return "board/writeView";
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "write.do", method = RequestMethod.POST)
	public String write(HttpServletRequest request, BoardVO boardVO) throws Exception{
		logger.info("write");
		String user_id = (String) request.getSession().getAttribute("userId");
		boardVO.setUserId(user_id);
		service.write(boardVO);
		
		return "redirect:list.do";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		List<BoardVO> boardlist = service.list(scri);
		model.addAttribute("list", boardlist);
		System.out.println(service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "readView.do", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		System.out.println(replyList);
		model.addAttribute("replyList", replyList);
		
		return "board/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "updateView.do", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		
		service.update(boardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:list.do";
	}

	// 게시판 삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:list.do";
	}
	
	
	//댓글 작성
	@RequestMapping(value="replyWrite.do", method = RequestMethod.POST)
	public String replyWrite(HttpServletRequest request,ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		String user_id = (String) request.getSession().getAttribute("userId");
		vo.setUserId(user_id);
		replyService.writeReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/readView.do";
	}
	
	//댓글 수정 GET
	@RequestMapping(value="replyUpdateView.do", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdateView";
	}
	
	//댓글 수정 POST
	@RequestMapping(value="replyUpdate.do", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.updateReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/readView.do";
	}
	
//	//댓글 삭제 GET
//	@RequestMapping(value="replyDeleteView.do", method = RequestMethod.GET)
//	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
//		logger.info("reply Write");
//		
//		model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
//		model.addAttribute("scri", scri);
//		
//
//		return "board/replyDeleteView";
//	}
	
	//댓글 삭제
	@RequestMapping(value="replyDelete.do", method = RequestMethod.GET)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
		replyService.deleteReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/readView.do";
	}
	

}











