package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.MessageDao;
import com.kh.ex01.vo.MessageVo;

@Service
public class MessageService {
	
	@Inject
	private MessageDao messageDao;
	
	public List<MessageVo> receiveMessageList(String receiver) {
		List<MessageVo> list = messageDao.receiveMessageList(receiver);
		return list;
	}
	
	public List<MessageVo> sendMessageList(String sender) {
		List<MessageVo> list = messageDao.sendMessageList(sender);
		return list;
	}
	
	public void sendMessageRun(MessageVo messageVo) {
		messageDao.sendMessageRun(messageVo);
	}
	
	public MessageVo getMessageData(int mno) {
		MessageVo messageVo = messageDao.getMessageData(mno);
		return messageVo;
	}
	
	public void readStateChange(int mno) {
		messageDao.readStateChange(mno);
	}
	
	public void senderDeleteStateChange(int mno) {
		messageDao.senderDeleteStateChange(mno);
	}
	
	public void receiverDeleteStateChange(int mno) {
		messageDao.receiverDeleteStateChange(mno);
	}
	public void messageSendCancel(int mno) {
		messageDao.messageSendCancel(mno);
	}
	
	public int mainMessageCount(String userid) {
		int count = messageDao.mainMessageCount(userid);
		return count;
	}
	
}
