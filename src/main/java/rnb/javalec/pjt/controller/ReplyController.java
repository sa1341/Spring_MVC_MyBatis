package rnb.javalec.pjt.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


import rnb.javalec.pjt.service.FoodService;
import rnb.javalec.pjt.vo.Reply;

@Controller 
@RequestMapping("/replies/*")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	
	@Autowired
	FoodService foodService;
	
	// ajax 통신으로  댓글 목록출력
	@GetMapping("/{fno}")
	public ResponseEntity<List<Reply>> getReplies(@PathVariable("fno") int fno) throws Exception{
		
		List<Reply> replyList= foodService.selectReplyByFno(fno);
		
		
		return new ResponseEntity<>(replyList, HttpStatus.OK);
			
	}
	
	
	
	// ajax 통신으로 인한 댓글목록 추가
	@PostMapping("/{fno}")
	public ResponseEntity<List<Reply>> addReply(@PathVariable("fno") int fno, @RequestBody Reply reply) throws Exception{
		
		
		logger.info("addReply....");
		logger.info("FNO: " + fno);
		logger.info("Reply: " + reply);
		
		
		foodService.insertReplyByFno(reply);
		
		List<Reply> replyList= foodService.selectReplyByFno(fno);
		
		
		return new ResponseEntity<>(replyList,HttpStatus.CREATED);
	}
	
	//식당 리뷰댓글 수정처리
	@PutMapping("/{fno}")
	public ResponseEntity<List<Reply>> modify(@PathVariable("fno") int fno, @RequestBody Reply reply) throws Exception{
		
		logger.info("modify reply: " + reply);
		
		Reply reply2 = foodService.selectUserByFno(reply.getRno());
		
		logger.info("reply2:"+reply2);

		if(reply2 != null) {
			
			reply2.setReplyer(reply.getReplyer());
			reply2.setReplytext(reply.getReplytext());
		}
		
		foodService.updateReply(reply2);

		
		List<Reply> replyList= foodService.selectReplyByFno(fno);


		return new ResponseEntity<>(replyList, HttpStatus.CREATED);
				
	}
	
	
	//식당 리뷰댓글 삭제처리
	@DeleteMapping("/{fno}/{rno}")
	public ResponseEntity<List<Reply>> remove(@PathVariable("fno") int fno, @PathVariable("rno") int rno) throws Exception{
		
		logger.info("delete reply: " + rno);
		
		foodService.deleteById(rno);
		
		logger.info("fno: "+ fno);
		
		List<Reply> replyList= foodService.selectReplyByFno(fno);
		
		return new ResponseEntity<> (replyList, HttpStatus.OK);
	}
}
