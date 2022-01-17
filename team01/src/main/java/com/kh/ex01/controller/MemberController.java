package com.kh.ex01.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.MemberService;
import com.kh.ex01.util.MyFileUploadUtil;
import com.kh.ex01.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final String UPLOAD_PATH = "//192.168.0.234/upload/profile";
		
	@Inject
	private MemberService memberService;

	@RequestMapping("/login")
	public String login() {
		return "/company/member/login";
	}

	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String userid, String userpw, HttpServletRequest request, RedirectAttributes rttr) {
		MemberVo memberVo = memberService.loginRun(userid, userpw);
		System.out.println("MemberController, loginRun, Userid : " + userid + ", Userpw : " + userpw);
		System.out.println("MemberController, loginRun, memberVo : " + memberVo);

		if (memberVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/member/login";
		} else if (memberVo.getAuthority() == 0) {
			rttr.addFlashAttribute("msg", "waitingApprove");
			return "redirect:/member/login";
		}

		HttpSession session = request.getSession();
		MemberVo sendVoData = new MemberVo(); // 세션에는 아이디, 이름, 권한, 직급, 부서, 사번 정보만 전달
		sendVoData.setAuthority(memberVo.getAuthority());
		sendVoData.setUserid(memberVo.getUserid());
		sendVoData.setUsername(memberVo.getUsername());
		sendVoData.setPosition(memberVo.getPosition());
		sendVoData.setDepartment(memberVo.getDepartment());
		sendVoData.setEno(memberVo.getEno());
		sendVoData.setProfileimg(memberVo.getProfileimg());
		session.setAttribute("loginData", sendVoData);

		return "/company/main";
	}

	@RequestMapping(value = "/registForm")
	public String registForm() {
		return "/company/member/memberRegistForm";
	}

	@ResponseBody
	@RequestMapping(value = "/checkState", method = RequestMethod.POST)
	public Map<String, Integer> chekcState(String userid, int eno) {
		int checkId = 0;
		int checkEno = 0;
		checkId = memberService.checkId(userid); // 1 중복 0 비중복
		checkEno = memberService.checkEno(eno); // 1중복 0 비중복
		System.out.println("userid : " + userid +",eno :"+eno);
		System.out.println("checkId : " + checkId +",chedkEno :"+checkEno);
		Map<String, Integer> result = new HashMap<>();
		result.put("checkId", checkId);
		result.put("checkEno", checkEno);
		return result;
	}
	
	@RequestMapping(value = "/registRun", method = RequestMethod.POST)
	public String registRun(MemberVo memberVo, RedirectAttributes rttr) {
		System.out.println("MemberController, registRun, memberVo : " +memberVo);
		memberService.registRun(memberVo);
		rttr.addFlashAttribute("msg", "registSuccess");
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginData");
		rttr.addFlashAttribute("msg", "logout");
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/company/memberApproveList")
	public String memberApproveList(Model model) {
		List<MemberVo> list = memberService.memberApproveList();
		model.addAttribute("approveList", list);
		return "/company/member/memberApproveList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/memberApproveRun")
	public String memberApproveRun(MemberVo memberVo) {
		System.out.println("MemberControler, memberApproveRun, memberVo : " + memberVo);
		memberService.memberApproveRun(memberVo);
		return "success";
	}
	
	@RequestMapping(value = "/company/myPage")
	public String myPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVo memberVo = (MemberVo)session.getAttribute("loginData");
		String userid = memberVo.getUserid();
		memberVo = memberService.getMemberData(userid);
		model.addAttribute("memberData", memberVo);
		return "/company/member/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/myDataModifyRun", method = RequestMethod.POST)
	public String myDataModifyRun(MemberVo memberVo) {
		System.out.println("MemberControler, myDataModifyRun, memberVo : " + memberVo);
		//프로필 이미지 sample 존재하는경우 프로필 사진 변경 및 삭제
		boolean result = MyFileUploadUtil.profileImgChange(UPLOAD_PATH, memberVo.getEno(),"JPG");
		if(result == true) {
			memberVo.setProfileimg("y");
		}
		memberService.myDataModifyRun(memberVo);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/profileImgAjax", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	public String profileImgAjax(MultipartFile file, int eno) throws IOException {
		System.out.println("MemberController, profileImgAjax, eno : " + eno);
		System.out.println("MemberController, profileImgAjax, file : " + file);
		
		String originalName = file.getOriginalFilename();
		System.out.println("MemberController, profileImgAjax, originalName : " + originalName);
		
		String filePath = 
				MyFileUploadUtil.uploadProfileImg(UPLOAD_PATH, originalName, eno, file.getBytes());
		System.out.println("UploadController, filePath: "+ filePath);
			MyFileUploadUtil.makeSampleProfileImg(filePath);
		return filePath;
	}
	
	@ResponseBody
	@RequestMapping(value="/company/displaySample", method=RequestMethod.GET)
	public byte[] displaySample(String fileName) throws Exception {
		System.out.println("MemberController, displaySample, fileName: " + fileName);
		String samplePath = MyFileUploadUtil.getSamplePath(fileName);
		System.out.println("MemberController, displaySample, samplePath: " + samplePath);
		FileInputStream fis = new FileInputStream(samplePath);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
	
	@ResponseBody
	@RequestMapping(value="/company/profileImgLoad", method=RequestMethod.GET)
	public byte[] profileImgLoad(int eno) throws Exception {
		System.out.println("MemberController, profileImgLoad, eno: " + eno);
		FileInputStream fis = new FileInputStream(UPLOAD_PATH + "/profile_" + eno + ".jpg");
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}

//회원 정보 조회하기
	@ResponseBody
	@RequestMapping(value="/company/memberInfo", method=RequestMethod.POST)
	public MemberVo memberInfo(String userid) {
		MemberVo memberVo = memberService.getMemberData(userid);
		return memberVo;
	}
	
	// 사원 조회
//	@RequestMapping(value="/company/search_member", method=RequestMethod.GET)
//	public String searchMember() {
//		return "/company/member/memberSearch";
//	}
	
	// 사원 리스트
	@RequestMapping(value="/company/search_member", method=RequestMethod.GET)
	public String listMember(Model model) {
		List<MemberVo> list = memberService.listMember();
		model.addAttribute("list", list);
		return "/company/member/memberSearch";
	}
	
	// 부서별 사원 검색
	@RequestMapping(value="/company/search_department", method=RequestMethod.GET)
	public String searchDepartment(Model model, String department) {
		List<MemberVo> list = memberService.searchDepartment(department);
		model.addAttribute("list", list);
		return "/company/member/memberSearch";
	}
	
}
