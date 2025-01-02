package kr.co.porkandspoon.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.ManageDTO;
import kr.co.porkandspoon.service.ManageService;

@RestController
public class ManageController {
	
	@Autowired ManageService manageService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 매장관리홈
	@GetMapping(value="/ad/spotManage")
	public ModelAndView spotManageView() {
		return new ModelAndView("/manage/spotManage");
	}
	
	@GetMapping(value="/ad/directManage")
	public ModelAndView directManageView() {
		return new ModelAndView("/manage/directManage");
	}
	
	@GetMapping(value="/ad/brandManage")
	public ModelAndView brandManageView() {
		return new ModelAndView("/manage/brandManage");
	}
	
	
	
	//아르바이트
	
	@GetMapping(value="/ad/part/")
	public ModelAndView partListView() {
		return new ModelAndView("/manage/partList");
	}
	
	@GetMapping(value="/ad/part/List")
	public ModelAndView getPartList() {
		return new ModelAndView("/manage/partList");
	}
	
	@GetMapping(value="/ad/part/Write")
	public ModelAndView partWriteView() {
		return new ModelAndView("/manage/partWrite");
	}
	
	@PostMapping(value = "/ad/part/Write")
	public ModelAndView setPartWrite(
		@AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam Map<String, String> params,
	    @RequestParam("work_date[]") List<String> workDates,
	    @RequestParam("start_time[]") List<String> startTimes,
	    @RequestParam("end_time[]") List<String> endTimes
	) {
	    // 기본 정보 저장
		String creater = userDetails.getUsername();
		params.put("creater", creater);
		
		logger.info("근무 요일 : {}",workDates);
		logger.info("시작 시간 : {}",startTimes);
		logger.info("종료 시간 : {}",endTimes);
		
		
	    manageService.setPartWrite(params, workDates, startTimes, endTimes);
	    return new ModelAndView("/manage/partWrite");
	}
	
	@GetMapping(value="/ad/part/Detail/{part_idx}")
	public ModelAndView partDetail(@PathVariable int part_idx) {
		ManageDTO dto =  manageService.partDetail(part_idx);
		List<ManageDTO>  list =  manageService.scheduleDetail(part_idx);
		
		ModelAndView mav = new ModelAndView("/manage/partDetail");
		mav.addObject("info",dto);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@GetMapping(value="/ad/part/Update/{part_idx}")
	public ModelAndView partUpdateView(@PathVariable int part_idx) {
		ManageDTO dto =  manageService.partDetail(part_idx);
		List<ManageDTO>  list =  manageService.scheduleDetail(part_idx);
		
		ModelAndView mav = new ModelAndView("/manage/partUpdate");
		mav.addObject("info",dto);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@PostMapping(value = "/ad/part/Update")
	public ModelAndView editPart(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam Map<String, String> params,
	    @RequestParam("work_date[]") List<String> workDates,
	    @RequestParam("start_time[]") List<String> startTimes,
	    @RequestParam("end_time[]") List<String> endTimes
	) {
	    if (workDates.isEmpty() || startTimes.isEmpty() || endTimes.isEmpty()) {
	        throw new IllegalArgumentException("근무 요일 및 시간을 모두 입력해야 합니다.");
	    }

	    String updater = userDetails.getUsername();
	    params.put("updater", updater);

	    manageService.editPart(params, workDates, startTimes, endTimes);

	    String part_idx = params.get("part_idx");
	    return new ModelAndView("redirect:/ad/part/Detail/" + part_idx);
	}

	
	@GetMapping(value="/ad/partSchdule")
	public ModelAndView partSchduleView() {
		return new ModelAndView("/manage/partSchdule");
	}
	
	
	
	//휴점
	
	@GetMapping(value="/ad/rest/List")
	public ModelAndView restListView() {
		return new ModelAndView("/manage/restList");
	}
	
	@GetMapping(value="/ad/rest/Write")
	public ModelAndView restWriteView() {
		return new ModelAndView("/manage/restWrite");
	}
	
	@GetMapping(value="/ad/rest/Update")
	public ModelAndView restUpdateView() {
		return new ModelAndView("/manage/restUpdate");
	}
	
	
	
}
