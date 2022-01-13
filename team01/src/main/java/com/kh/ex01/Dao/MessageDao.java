package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.MessageVo;

@Repository
public class MessageDao {
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.message.";
	
	@Inject
	private SqlSession sqlSession;

	//메시지 수신함 메시지 리스트 데이터
	public List<MessageVo> receiveMessageList(String receiver) {
		List<MessageVo> messageVo = sqlSession.selectList(NAMESPACE + "receiveMessageList", receiver);
		return messageVo;
	}
	
	//메시지 발신함 메시지 리스트 데이터
	public List<MessageVo> sendMessageList(String sender) {
		List<MessageVo> messageVo = sqlSession.selectList(NAMESPACE + "sendMessageList", sender);
		return messageVo;
	}
	
	public void sendMessageRun(MessageVo messageVo) {
		sqlSession.insert(NAMESPACE + "sendMessageRun", messageVo);
	}
	
	public MessageVo getMessageData(int mno) {
		MessageVo messageVo = sqlSession.selectOne(NAMESPACE + "getMessageData", mno);
		return messageVo;
	}
	
	public void readStateChange(int mno) {
		sqlSession.update(NAMESPACE + "readStateChange",mno);
	}

}
