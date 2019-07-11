package com.webaid.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
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
import com.webaid.domain.EmptyroomVO;
import com.webaid.domain.ManagerVO;
import com.webaid.domain.MemoVO;
import com.webaid.domain.MonthlyRentRecordVO;
import com.webaid.domain.OwnerVO;
import com.webaid.domain.PageMaker;
import com.webaid.domain.PageMaker3;
import com.webaid.domain.RepairCompanyVO;
import com.webaid.domain.RoomVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.domain.SearchCriteria3;
import com.webaid.domain.SigunguVO;
import com.webaid.domain.TradeVO;
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
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

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
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		
		return "sub/test";
	}
	
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

	@RequestMapping(value="/managerIdChk", method=RequestMethod.POST)
	public ResponseEntity<String> managerIdChk(String id){
		ResponseEntity<String> entity = null;
		try {
			ManagerVO vo = mService.selectById(id);
			if(vo == null){
				entity = new ResponseEntity<String>("ok", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("no", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/managerRegister", method=RequestMethod.POST)
	public ResponseEntity<String> managerRegister(@RequestBody ManagerVO vo){
		ResponseEntity<String> entity = null;
		mService.register(vo);
		entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/ownerExistChk", method=RequestMethod.POST)
	public ResponseEntity<String> ownerExistChk(@RequestBody Map<String, String> info){
		ResponseEntity<String> entity = null;
		OwnerVO newvo = new OwnerVO();
		newvo.setName(info.get("oname"));
		newvo.setPhone(info.get("ophone"));
		OwnerVO vo = oService.selectExistChk(newvo);
		if(vo == null){
			entity = new ResponseEntity<String>("no", HttpStatus.OK);
		}else{
			
			entity = new ResponseEntity<String>(vo.getOno()+"", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/ownerRegister", method=RequestMethod.POST)
	public ResponseEntity<String> ownerRegister(@RequestBody Map<String, String> info){
		ResponseEntity<String> entity = null;
		OwnerVO vo = new OwnerVO();
		vo.setName(info.get("name"));
		vo.setPhone(info.get("phone"));
		vo.setBirth(info.get("birth"));
		vo.setMail(info.get("mail"));
		vo.setId(info.get("id"));
		vo.setPw(info.get("pw"));
		
		oService.register(vo);
		
		int ono = vo.getOno();
		entity = new ResponseEntity<String>(ono+"", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/getOwnerInfo/{ono}", method=RequestMethod.POST)
	public ResponseEntity<OwnerVO> getOwnerInfo(@PathVariable("ono") int ono){
		ResponseEntity<OwnerVO> entity = null;
		OwnerVO vo = oService.selectOne(ono);
		
		entity = new ResponseEntity<OwnerVO>(vo, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/ownerIdChk/{id}", method=RequestMethod.POST)
	public ResponseEntity<String> ownerIdChk(@PathVariable("id") String id){
		ResponseEntity<String> entity = null;
		OwnerVO vo = oService.selectById(id);
		if(vo == null){
			entity = new ResponseEntity<String>("no", HttpStatus.OK);
		}else{
			
			entity = new ResponseEntity<String>("exist", HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value="/getBuildingByMno/{mno}", method=RequestMethod.GET)
	public ResponseEntity<List<BuildingVO>> getBuildingByMno(@PathVariable("mno") int mno){
		ResponseEntity<List<BuildingVO>> entity = null;
		List<BuildingVO> list = bService.selectByMno(mno);
		
		entity = new ResponseEntity<List<BuildingVO>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/getRoomByBnoDate/{bnoList}/{date}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, List<RoomVO>>> getRoomByDate(@PathVariable("bnoList") List<Integer> bnoList, @PathVariable("date") String date){
		ResponseEntity<Map<String, List<RoomVO>>> entity = null;
		Map<String, List<RoomVO>> map = new HashMap<>(); 
		RoomVO vo = new RoomVO();
		
		List<RoomVO> chkInList = new ArrayList<>();
		List<RoomVO> chkOutList = new ArrayList<>();
		for(int i=0; i<bnoList.size(); i++){
			vo.setBno(bnoList.get(i));
			vo.setCheck_in(date);
			vo.setCheck_out(date);
			chkInList.addAll(rService.selectByChkIn(vo));
			chkOutList.addAll(rService.selectByChkOut(vo));
		}
		Collections.sort(chkInList);
		
		Collections.sort(chkOutList, new Comparator<RoomVO>() {

			@Override
			public int compare(RoomVO o1, RoomVO o2) {
				return o1.getCheck_out().compareTo(o2.getCheck_out());
			}
		});		
		
		
		map.put("chkInList", chkInList);
		map.put("chkOutList", chkOutList);
		entity = new ResponseEntity<Map<String,List<RoomVO>>>(map, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(){
		return "sub/signUp";
	}
	
	@RequestMapping(value="/findInfo", method=RequestMethod.GET)
	public String findInfo(){
		return "sub/findInfo";
	}
	
	@RequestMapping(value="/managerMyPage", method=RequestMethod.GET)
	public String managerMyPage(){
		
		return "sub/managerMypage";
	}
	
	@RequestMapping(value = "/mMain", method = RequestMethod.GET)
	public String managerMain(Locale locale, Model model) {
		
		return "sub/managerMain";
	}
	
	@RequestMapping(value = "/oMain", method = RequestMethod.GET)
	public String ownerMain(Locale locale, Model model) {
		
		return "sub/ownerMain";
	}
	
	@RequestMapping(value = "/mBuiReg", method = RequestMethod.GET)
	public String managerAddBuilding() {
		
		return "sub/managerBuildingAdd";
	}
	
	@RequestMapping(value="/emptyRoomInfo", method=RequestMethod.GET)
	public String emptyRoomInfo(Model model){
		return "sub/emptyRoom";
	}
	
	@RequestMapping(value="/repairCompany", method=RequestMethod.GET)
	public String repairCompany(){
		
		return "sub/repairCompany";
	}
	
	@RequestMapping(value="/tradeInfo", method=RequestMethod.GET)
	public String tradeInfo(){
		return "sub/managerTrade";
	}
	
	@RequestMapping(value="/getManagerInfo/{mno}", method=RequestMethod.POST)
	public ResponseEntity<ManagerVO> getManagerInfo(@PathVariable("mno") int mno){
		ResponseEntity<ManagerVO> entity = null;
		ManagerVO vo = mService.selectOne(mno);
		
		entity = new ResponseEntity<ManagerVO>(vo, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/managerUpdate", method=RequestMethod.POST)
	public ResponseEntity<ManagerVO> ManagerUpdate(@RequestBody ManagerVO vo, HttpSession session){
		ResponseEntity<ManagerVO> entity = null;
		ManagerVO prevVO = mService.selectOne(vo.getMno());
		if(vo.getPw().length() == 0 || vo.getPw().equals("") || vo.getPw() == null){
			vo.setPw(prevVO.getPw());
		}
		
		session.setAttribute("name", vo.getName());
		session.setAttribute("mphone", vo.getPhone());
		mService.update(vo);
		
		BuildingVO bvo = new BuildingVO();
		bvo.setMno(vo.getMno());
		bvo.setMphone(vo.getPhone());
		bService.update(bvo);
		
		EmptyroomVO erVO = new EmptyroomVO();
		erVO.setMno(vo.getMno());
		erVO.setMphone(vo.getPhone());
		erService.updateMphone(erVO);
		
		ManagerVO afterVO = mService.selectOne(vo.getMno());
		
		entity = new ResponseEntity<ManagerVO>(afterVO, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/mBuiInfo/{bno}", method=RequestMethod.GET)
	public String managerInfoBuilding(@PathVariable("bno") int bno, Model model){
		BuildingVO buiVO = bService.selectOne(bno);
		List<RoomVO> roomList = rService.selectByBno(bno);
		
		model.addAttribute("buiVO", buiVO);
		model.addAttribute("roomList", roomList);
		return "sub/managerBuildingInfo";
	}
	
	
	
	@RequestMapping(value="/memoByMnoDate", method=RequestMethod.POST)
	public ResponseEntity<List<MemoVO>> getMemoByMnoDate(@RequestBody Map<String, String> info){
		ResponseEntity<List<MemoVO>> entity = null;
		MemoVO vo = new MemoVO();
		vo.setMno(Integer.parseInt(info.get("mno")));
		vo.setMdate(info.get("mdate"));
		try {
			List<MemoVO> list = memoService.selectByMnoDate(vo);
			
			entity = new ResponseEntity<List<MemoVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return entity;
	}
	
	@RequestMapping(value="/memoRegister", method=RequestMethod.POST)
	public ResponseEntity<String> memoResiter(@RequestBody Map<String, String> info){
		ResponseEntity<String> entity = null;
		MemoVO vo = new MemoVO();
		vo.setNo(0);
		vo.setMno(Integer.parseInt(info.get("mno")));
		vo.setMdate(info.get("mdate"));
		vo.setContent(info.get("content"));
		try {
			memoService.register(vo);
			
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return entity;
	}
	
	@RequestMapping(value="/memoUpdate", method=RequestMethod.POST)
	public ResponseEntity<String> memoUpdate(@RequestBody Map<String, String> info){
		ResponseEntity<String> entity = null;
		MemoVO vo = new MemoVO();
		vo.setNo(Integer.parseInt(info.get("no")));
		vo.setMno(Integer.parseInt(info.get("mno")));
		vo.setMdate(info.get("mdate"));
		vo.setContent(info.get("content"));
		try {
			memoService.update(vo);
			
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return entity;
	}
	
	@RequestMapping(value="/memoDelete/{no}", method=RequestMethod.POST)
	public ResponseEntity<String> memoDelete(@PathVariable("no") int no){
		ResponseEntity<String> entity = null;
		MemoVO vo = new MemoVO();
		
		try {
			memoService.delete(no);
			
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return entity;
	}
	
	
	
	@RequestMapping(value="sigunguBySido/{sido_no}")
	public ResponseEntity<List<SigunguVO>> sigunguGet(@PathVariable("sido_no") int sido_no){
		ResponseEntity<List<SigunguVO>> entity = null;
		try {
			List<SigunguVO> list = sggService.selectBySido(sido_no);
			entity = new ResponseEntity<List<SigunguVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/buiInfoReg", method = RequestMethod.POST)
	public ResponseEntity<String> managerBuiReg(@RequestBody Map<String, String> info) {
		ResponseEntity<String> entity = null;
		BuildingVO vo = new BuildingVO();
		vo.setBno(0);
		vo.setBname(info.get("bname"));
		vo.setBaddr_old(info.get("baddr_old"));
		vo.setBaddr_new(info.get("baddr_new"));
		vo.setBpw(info.get("bpw"));
		vo.setHeating(info.get("heating"));
		vo.setBoption(info.get("boption"));
		vo.setCompletion_date(info.get("completion_date"));
		vo.setSite(Integer.parseInt(info.get("site")));
		vo.setGross_area(Integer.parseInt(info.get("gross_area")));
		vo.setRoad(info.get("road"));
		vo.setOno(Integer.parseInt(info.get("ono")));
		vo.setOname(info.get("oname"));
		vo.setOphone(info.get("ophone"));
		vo.setObirth(info.get("obirth"));
		vo.setMno(Integer.parseInt(info.get("mno")));
		vo.setMphone(info.get("mphone"));
		vo.setCnt_one(Integer.parseInt(info.get("cnt_one")));
		vo.setCnt_mitwo(Integer.parseInt(info.get("cnt_mitwo")));
		vo.setCnt_two(Integer.parseInt(info.get("cnt_two")));
		vo.setCnt_three(Integer.parseInt(info.get("cnt_three")));
		vo.setCnt_owner(Integer.parseInt(info.get("cnt_owner")));
		vo.setCnt_store(Integer.parseInt(info.get("cnt_store")));
		vo.setCnt_complete(Integer.parseInt(info.get("cnt_complete")));
		vo.setCnt_empty(Integer.parseInt(info.get("cnt_empty")));
		vo.setTotal_monthly_rent(Integer.parseInt(info.get("total_monthly_rent")));
		vo.setTotal_deposit(Integer.parseInt(info.get("total_deposit")));
		vo.setMemo(info.get("memo"));
		
		
		bService.register(vo);
		
		entity = new ResponseEntity<String>(vo.getBno()+"", HttpStatus.OK);
		return entity;
	}
	
	
	
	@RequestMapping(value="/getBuiInfo/{bno}", method=RequestMethod.POST)
	public ResponseEntity<BuildingVO> getBuiInfo(@PathVariable("bno") int bno){
		ResponseEntity<BuildingVO> entity = null;
		BuildingVO vo = bService.selectOne(bno);
		entity = new ResponseEntity<BuildingVO>(vo, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/buiInfoUpdate", method = RequestMethod.POST)
	public ResponseEntity<String> managerBuiUpdate(BuildingVO vo) {
		ResponseEntity<String> entity = null;
		EmptyroomVO ervo = new EmptyroomVO();
		ervo.setBno(vo.getBno());
		ervo.setBname(vo.getBname());
		ervo.setBaddr_old(vo.getBaddr_old());
		ervo.setBaddr_new(vo.getBaddr_new());
		ervo.setBpw(vo.getBpw());
		ervo.setHeating(vo.getHeating());
		ervo.setBoption(vo.getBoption());
		ervo.setCompletion_date(vo.getCompletion_date());
		
		try {
			bService.update(vo);
			erService.updateByBuiInfo(ervo);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/buiDelete", method=RequestMethod.POST)
	public ResponseEntity<String> buiDelete(int bno){
		ResponseEntity<String> entity = null;
		//bService.delete(bno);
		
		
		
		return entity;
	}
	
	/*@RequestMapping(value = "/mBuiUpdate/{bno}", method = RequestMethod.GET)
	public String managerUpdateBuilding(@PathVariable("bno") int bno, Model model) {
		
		BuildingVO buiVO = bService.selectOne(bno);
		List<RoomVO> roomList = rService.selectByBno(bno);
		
		model.addAttribute("buiVO", buiVO);
		model.addAttribute("roomList", roomList);
		
		return "sub/managerBuildingUpdate";
	}*/
	
	@RequestMapping(value = "/roomReg", method = RequestMethod.POST)
	public ResponseEntity<String> managerRoomReg(@RequestBody List<Map<String, String>> list) {
		ResponseEntity<String> entity = null;
		Calendar cal = Calendar.getInstance();
		RoomVO vo = new RoomVO();
		BuildingVO bvo = bService.selectOne(Integer.parseInt(list.get(0).get("bno")));
		EmptyroomVO ervo = new EmptyroomVO();
		MonthlyRentRecordVO mrrVO = new MonthlyRentRecordVO();
		try {
			for(int i=0; i<list.size(); i++){
				
				vo.setNo(Integer.parseInt(list.get(i).get("no")));
				vo.setBno(Integer.parseInt(list.get(i).get("bno")));
				vo.setBname(list.get(i).get("bname"));
				vo.setRno(Integer.parseInt(list.get(i).get("rno")));
				vo.setState(list.get(i).get("state"));
				vo.setRoom_type(list.get(i).get("room_type"));
				vo.setPay_type(list.get(i).get("pay_type"));
				vo.setTenant(list.get(i).get("tenant"));
				vo.setPhone(list.get(i).get("phone"));
				vo.setCheck_in(list.get(i).get("check_in"));
				vo.setCheck_out(list.get(i).get("check_out"));
				vo.setDeposit(Integer.parseInt(list.get(i).get("deposit")));
				vo.setMonthly_rent(Integer.parseInt(list.get(i).get("monthly_rent")));
				vo.setHope_price(list.get(i).get("hope_price"));
				vo.setSelling_type(list.get(i).get("selling_type"));
				vo.setRepair(list.get(i).get("repair"));
				vo.setCompany(list.get(i).get("company"));
				vo.setCompany_call(list.get(i).get("company_call"));
				vo.setDownpayment(Integer.parseInt(list.get(i).get("downpayment")));
				rService.register(vo);
				
				if(list.get(i).get("state").equals("공실")){
					ervo.setNo(0);
					ervo.setRno(Integer.parseInt(list.get(i).get("rno")));
					ervo.setRoom_type(list.get(i).get("room_type"));
					ervo.setRpw(list.get(i).get("rpw"));
					ervo.setHope_price(list.get(i).get("hope_price"));
					ervo.setSelling_type(list.get(i).get("selling_type"));
					ervo.setBno(Integer.parseInt(list.get(i).get("bno")));
					ervo.setBname(bvo.getBname());
					ervo.setBaddr_old(bvo.getBaddr_old());
					ervo.setBaddr_new(bvo.getBaddr_new());
					ervo.setBpw(bvo.getBpw());
					ervo.setHeating(bvo.getHeating());
					ervo.setBoption(bvo.getBoption());
					ervo.setCompletion_date(bvo.getCompletion_date());
					ervo.setMno(bvo.getMno());
					ervo.setMphone(bvo.getMphone());
					
					erService.register(ervo);
				}
				mrrVO.setBno(bvo.getBno());
				mrrVO.setRno(Integer.parseInt(list.get(i).get("rno")));
				mrrVO.setRecord_year(cal.get(Calendar.YEAR));
				mrrService.register(mrrVO);
			}
			
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/getRoomInfo/{no}", method=RequestMethod.POST)
	public ResponseEntity<RoomVO> getRoomInfo(@PathVariable("no") int no){
		ResponseEntity<RoomVO> entity = null;
		RoomVO vo = rService.selectOne(no);
		entity = new ResponseEntity<RoomVO>(vo, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/getRoomByBno", method=RequestMethod.POST)
	public ResponseEntity<List<RoomVO>> getRoomByBno(@RequestBody Map<String, String> info){
		ResponseEntity<List<RoomVO>> entity = null;
		int bno = Integer.parseInt(info.get("bno"));
		String orderType = info.get("orderType");
		
		List<RoomVO> list = rService.selectByBno(bno);
		entity = new ResponseEntity<List<RoomVO>>(list, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/getRoomByBnoState", method=RequestMethod.POST)
	public ResponseEntity<List<RoomVO>> getRoomByBnoState(@RequestBody Map<String, String> info){
		ResponseEntity<List<RoomVO>> entity = null;
		List<RoomVO> list = null;
		
		int bno = Integer.parseInt(info.get("bno"));
		String state = info.get("state");
		String orderType = info.get("orderType");
		
		RoomVO vo = new RoomVO();
		vo.setBno(bno);
		
		if(state.equals("all")){
			list = rService.selectByBno(bno);
		}else if(state.equals("empty")){
			vo.setState("공실");
			list = rService.selectByBnoState(vo);
		}else if(state.equals("contractComplete")){
			vo.setState("계약완료");
			list = rService.selectByBnoState(vo);
		}
		
		if(list.size()==0){
			entity = new ResponseEntity<List<RoomVO>>(list, HttpStatus.OK);
		}else{
			if(orderType.equals("rno")){
				Collections.sort(list, new Comparator<RoomVO>() {

					@Override
					public int compare(RoomVO o1, RoomVO o2) {
						
						return o1.getBno() < o2.getBno() ? -1 : o1.getBno() > o2.getBno() ? 1 : 0;
					}
					
				});
			}else if(orderType.equals("chkin")){
				Collections.sort(list);
			}else if(orderType.equals("chkout")){
				Collections.sort(list, new Comparator<RoomVO>() {

					@Override
					public int compare(RoomVO o1, RoomVO o2) {
						return o1.getCheck_out().compareTo(o2.getCheck_out());
					}
				});
			}
			entity = new ResponseEntity<List<RoomVO>>(list, HttpStatus.OK);
		}
		
		
		
		return entity;
	}
	
	@RequestMapping(value="/roomRegOne", method=RequestMethod.POST)
	public ResponseEntity<String> roomRegOne(@RequestBody Map<String, String> info){
		logger.info("roomRegOne 진입");
		
		ResponseEntity<String> entity = null;
		
		Calendar cal = Calendar.getInstance();
		MonthlyRentRecordVO mrrVO = new MonthlyRentRecordVO();
		RoomVO rvo = new RoomVO();
		BuildingVO bvo = bService.selectOne(Integer.parseInt(info.get("bno")));
		int cnt_one = bvo.getCnt_one();
		int cnt_mitwo = bvo.getCnt_mitwo();
		int cnt_two = bvo.getCnt_two();
		int cnt_three = bvo.getCnt_three();
		int cnt_owner = bvo.getCnt_owner();
		int cnt_store = bvo.getCnt_store();
		int cnt_complete = bvo.getCnt_complete();
		int cnt_contract_complete = bvo.getCnt_contract_complete();
		int cnt_empty = bvo.getCnt_empty();
		int total_monthly_rent = bvo.getTotal_monthly_rent();
		int total_deposit = bvo.getTotal_deposit();
		
		if(info.get("room_type").equals("one")){
			cnt_one++;
		}else if(info.get("room_type").equals("mitwo")){
			cnt_mitwo++;
		}else if(info.get("room_type").equals("two")){
			cnt_two++;
		}else if(info.get("room_type").equals("three")){
			cnt_three++;
		}else if(info.get("room_type").equals("owner")){
			cnt_owner++;
		}else if(info.get("room_type").equals("store")){
			cnt_store++;
		}		
		
		try {
			String deposit = "";
			String monthly_rent = "";
			String repair = info.get("repair");
			if(info.get("deposit") != "0"){
				deposit = info.get("deposit");
				total_deposit += Integer.parseInt(info.get("deposit"));
			}
			if(info.get("monthly_rent") != "0"){
				monthly_rent = info.get("monthly_rent");
				total_monthly_rent += Integer.parseInt(info.get("monthly_rent"));
			}
			if(repair.length() < 2){
				repair = "";
			}
			rvo.setNo(Integer.parseInt(info.get("no")));
			rvo.setBno(Integer.parseInt(info.get("bno")));
			rvo.setBname(info.get("bname"));
			rvo.setRno(Integer.parseInt(info.get("rno")));
			rvo.setState(info.get("state"));
			rvo.setRoom_type(info.get("room_type"));
			rvo.setPay_type(info.get("pay_type"));
			rvo.setTenant(info.get("tenant"));
			rvo.setPhone(info.get("phone"));
			rvo.setCheck_in(info.get("check_in"));
			rvo.setCheck_out(info.get("check_out"));
			rvo.setDeposit(Integer.parseInt(deposit));
			rvo.setMonthly_rent(Integer.parseInt(monthly_rent));
			rvo.setHope_price(info.get("hope_price"));
			rvo.setSelling_type(info.get("selling_type"));
			rvo.setRepair(repair);
			rvo.setCompany(info.get("company"));
			rvo.setCompany_call(info.get("company_call"));
			rvo.setDownpayment(Integer.parseInt(info.get("downpayment")));
			rService.register(rvo);
			
			mrrVO.setBno(bvo.getBno());
			mrrVO.setRno(Integer.parseInt(info.get("rno")));
			mrrVO.setRecord_year(cal.get(Calendar.YEAR));
			mrrService.register(mrrVO);
			
			if(info.get("state").equals("공실")){
				EmptyroomVO ervo = new EmptyroomVO();
				
				ervo.setNo(0);
				ervo.setRno(Integer.parseInt(info.get("rno")));
				ervo.setRoom_type(info.get("room_type"));
				ervo.setRpw(info.get("rpw"));
				ervo.setHope_price(info.get("hope_price"));
				ervo.setSelling_type(info.get("selling_type"));
				ervo.setBno(Integer.parseInt(info.get("bno")));
				ervo.setBname(bvo.getBname());
				ervo.setBaddr_old(bvo.getBaddr_old());
				ervo.setBaddr_new(bvo.getBaddr_new());
				ervo.setBpw(bvo.getBpw());
				ervo.setHeating(bvo.getHeating());
				ervo.setBoption(bvo.getBoption());
				ervo.setCompletion_date(bvo.getCompletion_date());
				ervo.setMno(bvo.getMno());
				ervo.setMphone(bvo.getMphone());
				
				erService.register(ervo);
				cnt_empty++;
			}else if(info.get("state").equals("계약완료")){
				cnt_contract_complete++;
			}else if(info.get("state").equals("입주완료")){
				cnt_complete++;
			}
			
			BuildingVO bvo2 = new BuildingVO();
			bvo2.setBno(Integer.parseInt(info.get("bno")));
			bvo2.setCnt_one(cnt_one);
			bvo2.setCnt_mitwo(cnt_mitwo);
			bvo2.setCnt_two(cnt_two);
			bvo2.setCnt_three(cnt_three);
			bvo2.setCnt_owner(cnt_owner);
			bvo2.setCnt_store(cnt_store);
			bvo2.setCnt_complete(cnt_complete);
			bvo2.setCnt_contract_complete(cnt_contract_complete);
			bvo2.setCnt_empty(cnt_empty);
			bvo2.setTotal_deposit(total_deposit);
			bvo2.setTotal_monthly_rent(total_monthly_rent);
			
			bService.updateCnt(bvo2);
			
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			e.getMessage();
			System.out.println(e.getMessage());
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.OK);
		}
		
		
		return entity;
	}
	
	@RequestMapping(value = "/roomInfoUpdate", method = RequestMethod.POST)
	public ResponseEntity<String> managerRoomUpdate(@RequestBody Map<String, String> info) {
		ResponseEntity<String> entity = null;
		
		EmptyroomVO ervo = new EmptyroomVO();
		BuildingVO bvo = bService.selectOne(Integer.parseInt(info.get("bno")));
		RoomVO prevVO = rService.selectOne(Integer.parseInt(info.get("no")));
		RoomVO vo = new RoomVO();
		
		int cnt_one = bvo.getCnt_one();
		int cnt_mitwo = bvo.getCnt_mitwo();
		int cnt_two = bvo.getCnt_two();
		int cnt_three = bvo.getCnt_three();
		int cnt_owner = bvo.getCnt_owner();
		int cnt_store = bvo.getCnt_store();
		int cnt_complete = bvo.getCnt_complete();
		int cnt_contract_complete = bvo.getCnt_contract_complete();
		int cnt_empty = bvo.getCnt_empty();
		int total_monthly_rent = bvo.getTotal_monthly_rent();
		int total_deposit = bvo.getTotal_deposit();
		
		try {			
			if((info.get("prevState").equals("입주완료") && info.get("state").equals("공실")) || (info.get("prevState").equals("계약완료") && info.get("state").equals("공실"))){
				System.out.println("입주완료, 계약완료 to 공실");
				ervo.setNo(0);
				ervo.setRno(Integer.parseInt(info.get("rno")));
				ervo.setRoom_type(info.get("room_type"));
				ervo.setRpw(info.get("rpw"));
				ervo.setHope_price(info.get("hope_price"));
				ervo.setSelling_type(info.get("selling_type"));
				ervo.setBno(Integer.parseInt(info.get("bno")));
				ervo.setBname(bvo.getBname());
				ervo.setBaddr_old(bvo.getBaddr_old());
				ervo.setBaddr_new(bvo.getBaddr_new());
				ervo.setBpw(bvo.getBpw());
				ervo.setHeating(bvo.getHeating());
				ervo.setBoption(bvo.getBoption());
				ervo.setCompletion_date(bvo.getCompletion_date());
				ervo.setMno(bvo.getMno());
				ervo.setMphone(bvo.getMphone());
				
				erService.register(ervo);
				
				if(info.get("prevState").equals("입주완료") && info.get("state").equals("공실")){
					cnt_complete--;
					System.out.println("입주완료 ---> 공실");
				}else if(info.get("prevState").equals("계약완료") && info.get("state").equals("공실")){
					cnt_contract_complete--;
					System.out.println("계약완료 ---> 공실");
				}
				cnt_empty++;
				
				
				if(prevVO.getDeposit() > 0){
					total_deposit -= prevVO.getDeposit();
					System.out.println("보증금 값이 0보다 큼");
				}
				if(prevVO.getMonthly_rent() > 0){
					total_monthly_rent -= prevVO.getMonthly_rent();
					System.out.println("월세 값이 0보다 큼");
				}
				
			}else if((info.get("prevState").equals("공실") && info.get("state").equals("입주완료")) || (info.get("prevState").equals("공실") && info.get("state").equals("계약완료"))){				
				System.out.println("공실 to 입주완료, 계약완료 ");
				ervo.setBno(Integer.parseInt(info.get("bno")));
				ervo.setRno(Integer.parseInt(info.get("rno")));
				
				erService.delete(ervo);
				
				if(info.get("prevState").equals("공실") && info.get("state").equals("입주완료")){
					cnt_complete++;
				}else if(info.get("prevState").equals("공실") || info.get("state").equals("계약완료")){
					cnt_contract_complete++;
				}
				cnt_empty--;
				
				if(info.get("deposit").trim().length() != 0){
					total_deposit += Integer.parseInt(info.get("deposit"));
				}
				if(info.get("monthly_rent").trim().length() != 0){
					total_monthly_rent += Integer.parseInt(info.get("monthly_rent"));
				}
			}else if((info.get("prevState").equals("계약완료") && info.get("state").equals("입주완료")) || (info.get("prevState").equals("입주완료") && info.get("state").equals("계약완료"))){
				if(info.get("prevState").equals("계약완료") && info.get("state").equals("입주완료")){
					cnt_contract_complete--;
					cnt_complete++;
				}else if(info.get("prevState").equals("입주완료") || info.get("state").equals("계약완료")){
					cnt_complete--;
					cnt_contract_complete++;
				}
				
				if(prevVO.getDeposit() != Integer.parseInt(info.get("deposit"))){
					total_deposit -= prevVO.getDeposit();
					total_deposit += Integer.parseInt(info.get("deposit"));
				}else if(prevVO.getMonthly_rent() != Integer.parseInt(info.get("monthly_rent"))){
					total_monthly_rent -= prevVO.getMonthly_rent();
					total_monthly_rent += Integer.parseInt(info.get("monthly_rent"));
				}
			}
			
			vo.setNo(Integer.parseInt(info.get("no")));
			vo.setRno(Integer.parseInt(info.get("rno")));
			vo.setState(info.get("state"));
			vo.setRoom_type(info.get("room_type"));
			vo.setPay_type(info.get("pay_type"));
			vo.setTenant(info.get("tenant"));
			vo.setPhone(info.get("phone"));
			vo.setCheck_in(info.get("check_in"));
			vo.setCheck_out(info.get("check_out"));
			vo.setDeposit(Integer.parseInt(info.get("deposit")));
			vo.setMonthly_rent(Integer.parseInt(info.get("monthly_rent")));
			vo.setHope_price(info.get("hope_price"));
			vo.setSelling_type(info.get("selling_type"));
			vo.setRepair(info.get("repair"));
			vo.setCompany(info.get("company"));
			vo.setCompany_call(info.get("company_call"));
			vo.setDownpayment(Integer.parseInt(info.get("downpayment")));
			vo.setMemo(info.get("memo"));
			rService.update(vo);
			
			if(!prevVO.getRoom_type().equals(info.get("room_type"))){
				String prevRoomType = prevVO.getRoom_type();
				String changeRoomType = info.get("room_type");
				if(prevRoomType.equals("one")){
					cnt_one--;
				}else if(prevRoomType.equals("mitwo")){
					cnt_mitwo--;
				}else if(prevRoomType.equals("two")){
					cnt_two--;
				}else if(prevRoomType.equals("three")){
					cnt_three--;
				}else if(prevRoomType.equals("owner")){
					cnt_owner--;
				}else if(prevRoomType.equals("store")){
					cnt_store--;
				}
				
				if(changeRoomType.equals("one")){
					cnt_one++;
				}else if(changeRoomType.equals("mitwo")){
					cnt_mitwo++;
				}else if(changeRoomType.equals("two")){
					cnt_two++;
				}else if(changeRoomType.equals("three")){
					cnt_three++;
				}else if(changeRoomType.equals("owner")){
					cnt_owner++;
				}else if(changeRoomType.equals("store")){
					cnt_store++;
				}
			}
			
			BuildingVO bvo2 = new BuildingVO();
			bvo2.setBno(Integer.parseInt(info.get("bno")));
			bvo2.setCnt_one(cnt_one);
			bvo2.setCnt_mitwo(cnt_mitwo);
			bvo2.setCnt_two(cnt_two);
			bvo2.setCnt_three(cnt_three);
			bvo2.setCnt_owner(cnt_owner);
			bvo2.setCnt_store(cnt_store);
			bvo2.setCnt_complete(cnt_complete);
			bvo2.setCnt_contract_complete(cnt_contract_complete);
			bvo2.setCnt_empty(cnt_empty);
			bvo2.setTotal_deposit(total_deposit);
			bvo2.setTotal_monthly_rent(total_monthly_rent);
			
			bService.updateCnt(bvo2);
			
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/repairUpdate", method=RequestMethod.POST)
	public ResponseEntity<String> updateRepair(@RequestBody Map<String, String> info){
		ResponseEntity<String> entity = null;
		RoomVO vo = new RoomVO();
		
		try {
			vo.setBno(Integer.parseInt(info.get("bno")));
			vo.setNo(Integer.parseInt(info.get("no")));
			vo.setRepair(info.get("repair"));
			
			rService.updateRepair(vo);
			
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.OK);
		}

		return entity;
	}
	
	@RequestMapping(value="/roomDeleteOne", method=RequestMethod.POST)
	public ResponseEntity<String> roomDeleteOne(@RequestBody Map<String, String> info){
		ResponseEntity<String> entity = null;
		
		MonthlyRentRecordVO mrrVO = new MonthlyRentRecordVO();
		
		int no = Integer.parseInt(info.get("no"));
		int rno = Integer.parseInt(info.get("rno"));
		int bno = Integer.parseInt(info.get("bno"));
		
		BuildingVO bvo = bService.selectOne(bno);
		int cnt_one = bvo.getCnt_one();
		int cnt_mitwo = bvo.getCnt_mitwo();
		int cnt_two = bvo.getCnt_two();
		int cnt_three = bvo.getCnt_three();
		int cnt_owner = bvo.getCnt_owner();
		int cnt_store = bvo.getCnt_store();
		int cnt_complete = bvo.getCnt_complete();
		int cnt_contract_complete = bvo.getCnt_contract_complete();
		int cnt_empty = bvo.getCnt_empty();
		int total_monthly_rent = bvo.getTotal_monthly_rent();
		int total_deposit = bvo.getTotal_deposit();
		System.out.println("변경전 원룸개수= "+cnt_one);
		RoomVO prevVO = rService.selectOne(Integer.parseInt(info.get("no")));
		
		//삭제에 따른 원룸, 투룸 등등 각각의 개수 합(cnt_~)중 맞는 타입에 -1 적용
		if(prevVO.getRoom_type().equals("one")){
			cnt_one--;
		}else if(prevVO.getRoom_type().equals("mitwo")){
			cnt_mitwo--;
		}else if(prevVO.getRoom_type().equals("two")){
			cnt_two--;
		}else if(prevVO.getRoom_type().equals("three")){
			cnt_three--;
		}else if(prevVO.getRoom_type().equals("owner")){
			cnt_owner--;
		}else if(prevVO.getRoom_type().equals("store")){
			cnt_store--;
		}
		
		//각각의 state 합에서 조건에 맞는거 찾아서 -1하고 보증금 총합, 월세총합에서 금액 빼기
		if(prevVO.getState().equals("입주완료")){
			cnt_complete--;
			total_deposit -= prevVO.getDeposit();
			total_monthly_rent -= prevVO.getMonthly_rent();
			
		}else if(prevVO.getState().equals("공실")){
			cnt_empty--;
			EmptyroomVO ervo = new EmptyroomVO();
			ervo.setBno(bno);
			ervo.setRno(rno);
			erService.delete(ervo);
		}else if(prevVO.getState().equals("계약완료")){
			cnt_contract_complete--;
			total_deposit -= prevVO.getDeposit();
			total_monthly_rent -= prevVO.getMonthly_rent();
		}
		System.out.println("변경 후 원룸개수= "+cnt_one);
		BuildingVO bvo2 = new BuildingVO();
		bvo2.setBno(Integer.parseInt(info.get("bno")));
		bvo2.setCnt_one(cnt_one);
		bvo2.setCnt_mitwo(cnt_mitwo);
		bvo2.setCnt_two(cnt_two);
		bvo2.setCnt_three(cnt_three);
		bvo2.setCnt_owner(cnt_owner);
		bvo2.setCnt_store(cnt_store);
		bvo2.setCnt_complete(cnt_complete);
		bvo2.setCnt_contract_complete(cnt_contract_complete);
		bvo2.setCnt_empty(cnt_empty);
		bvo2.setTotal_deposit(total_deposit);
		bvo2.setTotal_monthly_rent(total_monthly_rent);
		bService.updateCnt(bvo2);
		
		rService.delete(no);
		
		mrrVO.setBno(bno);
		mrrVO.setRno(rno);
		mrrService.delete(mrrVO);
		entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		return entity;
	}
	
	
	
	@RequestMapping(value="/getEmptyroomAll", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> getEmptyRoomAll(@RequestBody Map<String, String> info){
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		if(info.size() != 0){
			cri.setPage(Integer.parseInt(info.get("page")));
			cri.setPerPageNum(Integer.parseInt(info.get("perPageNum")));
			cri.setSearchType(info.get("searchType"));
			cri.setKeyword1(info.get("keyword1"));
			cri.setKeyword2(info.get("keyword2"));
		}
		
		
		HashMap<String, Object> map=new HashMap<>();
		
		List<EmptyroomVO> list = erService.listSearch(cri);

		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(erService.listSearchCount(cri));
		
		map.put("list", list);
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		return entity;
	}
	
	
	
	@RequestMapping(value="/getRepairCompanyAll", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> getRepairCompanyAll(@RequestBody Map<String, String> info){
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteria3 cri = new SearchCriteria3();
		if(info.size() != 0){
			cri.setPage(Integer.parseInt(info.get("page")));
			cri.setPerPageNum(Integer.parseInt(info.get("perPageNum")));
			cri.setSearchType(info.get("searchType"));
			cri.setKeyword1(info.get("keyword1"));
			cri.setKeyword2(info.get("keyword2"));
			cri.setKeyword3(info.get("keyword3"));
		}
		
		
		HashMap<String, Object> map=new HashMap<>();
		
		List<RepairCompanyVO> list = rcService.listSearch(cri);

		
		PageMaker3 pageMaker = new PageMaker3();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rcService.listSearchCount(cri));
		
		map.put("list", list);
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		return entity;
	}
	
	
	
	@RequestMapping(value="/getTradeAll", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> getTradeAll(@RequestBody Map<String, String> info){
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteria3 cri = new SearchCriteria3();
		if(info.size() != 0){
			cri.setPage(Integer.parseInt(info.get("page")));
			cri.setPerPageNum(Integer.parseInt(info.get("perPageNum")));
			cri.setSearchType(info.get("searchType"));
			cri.setKeyword1(info.get("keyword1"));
			cri.setKeyword2(info.get("keyword2"));
			cri.setKeyword3(info.get("keyword3"));
		}
		
		
		HashMap<String, Object> map=new HashMap<>();
		
		List<TradeVO> list = tService.listSearch(cri);

		
		PageMaker3 pageMaker = new PageMaker3();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rcService.listSearchCount(cri));
		
		map.put("list", list);
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		return entity;
	}
}
