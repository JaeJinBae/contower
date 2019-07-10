package com.webaid.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webaid.domain.BuildingVO;
import com.webaid.domain.ManagerVO;
import com.webaid.domain.MonthlyRentRecordVO;
import com.webaid.domain.OwnerVO;
import com.webaid.domain.RoomVO;
import com.webaid.service.BuildingService;
import com.webaid.service.EmptyroomService;
import com.webaid.service.ManagerService;
import com.webaid.service.MemoService;
import com.webaid.service.MonthlyRentRecordService;
import com.webaid.service.OwnerService;
import com.webaid.service.RepairCompanyService;
import com.webaid.service.RoomService;
import com.webaid.service.SigunguService;
import com.webaid.service.TradeService;


@Controller
@RequestMapping("/owner/*")
public class OwnerController {
	
	private static final Logger logger = LoggerFactory.getLogger(OwnerController.class);

	@Autowired
	private ManagerService mService;
	
	@Autowired
	private OwnerService oService;
	
	@Autowired
	private BuildingService bService;
	
	@Autowired
	private RoomService rService;
	
	@Autowired
	private SigunguService sggService;
	
	@Autowired
	private MemoService memoService;
	
	@Autowired
	private EmptyroomService erService;
	
	@Autowired
	private RepairCompanyService rcService;
	
	@Autowired
	private TradeService tService;
	
	@Autowired
	private MonthlyRentRecordService mrrService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "main/index";
	}
	
	@RequestMapping(value = "/userIdPwChk", method = RequestMethod.POST)
	public ResponseEntity<String> userIdPwChk(@RequestBody Map<String, String> info, HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;
		String id = info.get("id");
		String pw = info.get("pw");
		String type = info.get("type");
		
		if(type.equals("m")){
			ManagerVO vo = mService.selectById(id);
			if(vo == null){
				entity = new ResponseEntity<String>("no", HttpStatus.OK);
			}else{
				if(vo.getPw().equals(pw)){
					
					session.setAttribute("id", vo.getId());
					session.setAttribute("name", vo.getName());
					session.setAttribute("mno", vo.getMno());
					session.setAttribute("mphone", vo.getPhone());
					entity = new ResponseEntity<String>("ok", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("no", HttpStatus.OK);
				}
			}
		}else if(type.equals("o")){
			OwnerVO vo = oService.selectById(id);
			if(vo == null){
				entity = new ResponseEntity<String>("no", HttpStatus.OK);
			}else{
				if(vo.getPw().equals(pw)){
					
					session.setAttribute("id", vo.getId());
					session.setAttribute("name", vo.getName());
					session.setAttribute("ono", vo.getOno());
					session.setAttribute("ophone", vo.getPhone());
					entity = new ResponseEntity<String>("ok", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("no", HttpStatus.OK);
				}
			}
			
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if(session.getAttribute("name").equals("") || session.getAttribute("name") == null){
			session.invalidate();
			return "redirect:/";
		}else{
			return "redirect:/";
		}
		
		//return "redirect:/";
	}
	
	@RequestMapping(value="/ownerMyPage", method = RequestMethod.GET)
	public String ownerMyPage(){
		
		return "sub/ownerMypage";
	}
	
	@RequestMapping(value = "/oMain", method = RequestMethod.GET)
	public String ownerMain(Locale locale, Model model) {
		
		return "sub/ownerMain";
	}
	
	@RequestMapping(value="/oBuiInfo/{bno}", method=RequestMethod.GET)
	public String ownerInfoBuilding(@PathVariable("bno") int bno, Model model){
		BuildingVO buiVO = bService.selectOne(bno);
		List<RoomVO> roomList = rService.selectByBno(bno);
		ManagerVO mVO = mService.selectOne(buiVO.getMno());
		model.addAttribute("buiVO", buiVO);
		model.addAttribute("roomList", roomList);
		model.addAttribute("managerVO", mVO);
		return "sub/ownerBuildingInfo";
	}
	
	@RequestMapping(value = "/oBuiReg", method = RequestMethod.GET)
	public String ownerAddBuilding() {
		
		return "sub/ownerBuildingAdd";
	}
	
	@RequestMapping(value="/oEmptyRoomInfo", method=RequestMethod.GET)
	public String emptyRoomInfo(Model model){
		return "sub/emptyRoom";
	}
	
	@RequestMapping(value="/oRepairCompany", method=RequestMethod.GET)
	public String repairCompany(){
		
		return "sub/oRepairCompany";
	}
	
	@RequestMapping(value="/oTradeInfo", method=RequestMethod.GET)
	public String tradeInfo(){
		return "sub/ownerTrade";
	}
	
	@RequestMapping(value="/getOwnerInfo/{ono}", method=RequestMethod.POST)
	public ResponseEntity<OwnerVO> getOwnerInfo(@PathVariable("ono") int ono){
		ResponseEntity<OwnerVO> entity = null;
		OwnerVO vo = oService.selectOne(ono);
		
		entity = new ResponseEntity<OwnerVO>(vo, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/ownerUpdate", method=RequestMethod.POST)
	public ResponseEntity<OwnerVO> ownerUpdate(@RequestBody OwnerVO vo, HttpSession session){
		ResponseEntity<OwnerVO> entity = null;
		OwnerVO prevVO = oService.selectOne(vo.getOno());
		if(vo.getPw().length() == 0 || vo.getPw().equals("") || vo.getPw() == null){
			vo.setPw(prevVO.getPw());
		}
		session.setAttribute("name", vo.getName());
		session.setAttribute("mphone", vo.getPhone());
		oService.update(vo);
		
		BuildingVO bvo = new BuildingVO();
		bvo.setOno(vo.getOno());
		bvo.setOphone(vo.getPhone());
		bvo.setObirth(vo.getBirth());
		bService.updateOwnerInfo(bvo);
		
		OwnerVO afterVO = oService.selectOne(vo.getOno());
		entity = new ResponseEntity<OwnerVO>(afterVO, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/getBuildingByOno/{ono}", method=RequestMethod.GET)
	public ResponseEntity<List<BuildingVO>> getBuildingByMno(@PathVariable("ono") int ono){
		ResponseEntity<List<BuildingVO>> entity = null;
		List<BuildingVO> list = bService.selectByOno(ono);
		
		entity = new ResponseEntity<List<BuildingVO>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/getMonthlyRentRecord", method=RequestMethod.POST)
	public ResponseEntity<List<MonthlyRentRecordVO>> getMonthlyRentRecord(@RequestBody Map<String, String> info){
		ResponseEntity<List<MonthlyRentRecordVO>> entity = null;
		int bno = Integer.parseInt(info.get("bno"));
		int year = Integer.parseInt(info.get("year"));
		MonthlyRentRecordVO vo = new MonthlyRentRecordVO();
		vo.setBno(bno);
		vo.setRecord_year(year);
		
		List<MonthlyRentRecordVO> list = mrrService.selectByBnoYear(vo);
		
		entity = new ResponseEntity<List<MonthlyRentRecordVO>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/monthlyRentRecordUpdate", method=RequestMethod.POST)
	public ResponseEntity<String> monthlyRentRecordUpdate(@RequestBody List<Map<String, String>> info){
		ResponseEntity<String> entity = null;
		int month = Integer.parseInt(info.get(0).get("month"));
		int bno = Integer.parseInt(info.get(0).get("bno"));
		int year = Integer.parseInt(info.get(0).get("record_year"));
		MonthlyRentRecordVO mrrVO = new MonthlyRentRecordVO();
		mrrVO.setBno(bno);
		mrrVO.setRecord_year(year);
		if(month == 1){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setJanuary(info.get(i).get("mValue"));
				mrrService.update1(mrrVO);
			}
		}else if(month == 2){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setFebruary(info.get(i).get("mValue"));
				mrrService.update2(mrrVO);
			}
		}else if(month == 3){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setMarch(info.get(i).get("mValue"));
				mrrService.update3(mrrVO);
			}
		}else if(month == 4){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setApril(info.get(i).get("mValue"));
				mrrService.update4(mrrVO);
			}
		}else if(month == 5){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setMay(info.get(i).get("mValue"));
				mrrService.update5(mrrVO);
			}
		}else if(month == 6){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setJune(info.get(i).get("mValue"));
				mrrService.update6(mrrVO);
			}
		}else if(month == 7){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setJuly(info.get(i).get("mValue"));
				mrrService.update7(mrrVO);
			}
		}else if(month == 8){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setAugust(info.get(i).get("mValue"));
				mrrService.update8(mrrVO);
			}
		}else if(month == 9){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setSeptember(info.get(i).get("mValue"));
				mrrService.update9(mrrVO);
			}
		}else if(month == 10){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setOctober(info.get(i).get("mValue"));
				mrrService.update10(mrrVO);
			}
		}else if(month == 11){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setNovember(info.get(i).get("mValue"));
				mrrService.update11(mrrVO);
			}
		}else if(month == 12){
			for(int i=0; i < info.size(); i++){
				mrrVO.setRno(Integer.parseInt(info.get(i).get("rno")));
				mrrVO.setDecember(info.get(i).get("mValue"));
				mrrService.update12(mrrVO);
			}
		}
		entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		return entity;
	}
	
	
	
	
	
}
