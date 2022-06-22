package com.ez.wonder.pd.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.wonder.pd.model.PdDetailVO;
import com.ez.wonder.pd.model.ProductService;
import com.ez.wonder.pd.model.ProductVO;
import com.ez.wonder.skill.model.FrameworkVO;
import com.ez.wonder.skill.model.LanguageVO;
import com.ez.wonder.skill.model.SkillService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pd")
@RequiredArgsConstructor
public class PdWriteController {
	private static final Logger logger
	=LoggerFactory.getLogger(PdWriteController.class);

	private final SkillService skillService;
	private final ProductService productService;
	
	

	@GetMapping("/pdWrite")
	public void pdWrite(Model model) {
		logger.info("상품 등록화면");
		
		//2
		List<LanguageVO> langList=skillService.allLanguage();
		logger.info("언어 조회 결과, langList.size={}", langList.size());
		
		List<FrameworkVO> frameList=skillService.allFrame();
		logger.info("언어 조회 결과, langList.size={}", frameList.size());
		
		//3
		model.addAttribute("langList", langList);
		model.addAttribute("frameList", frameList);
		
		
	}
	
	@PostMapping("/pdWrite")
	public void pd_Write_post(HttpServletRequest httpServletRequest, Model model) {
		logger.info("상품 등록");
		
		ProductVO pd = new ProductVO();
		pd.setUserId("test");
		pd.setCateType("product");
		
		logger.info(httpServletRequest.getParameter("pdTitle").getClass().getName());
		logger.info(httpServletRequest.getParameter("pdLang").getClass().getName());
		logger.info(httpServletRequest.getParameter("pdFrame").getClass().getName());

		
		pd.setPdTitle(httpServletRequest.getParameter("pdTitle"));
		pd.setLang(httpServletRequest.getParameter("pdLang"));
		pd.setFrame(httpServletRequest.getParameter("pdFrame"));
		productService.insertPd(pd);
		
		logger.info("PdNo : " + pd.getPdNo());
		
		
		String priceType = httpServletRequest.getParameter("priceType");

		PdDetailVO pdDetail = null; 

		if(priceType.equals("TYPE1")) {
			pdDetail = new PdDetailVO();
			pdDetail.setPdNo(pd.getPdNo());
			pdDetail.setPdType(httpServletRequest.getParameter("pdType"));
			pdDetail.setPdPrice(Integer.parseInt(httpServletRequest.getParameter("pdPrice")));
			pdDetail.setPdTerm(Integer.parseInt(httpServletRequest.getParameter("pdTerm")));
			pdDetail.setEditCount(Integer.parseInt(httpServletRequest.getParameter("editCount")));
			pdDetail.setServiceExplanation(httpServletRequest.getParameter("serviceExplanation"));
			pdDetail.setEditExplanation(httpServletRequest.getParameter("editExplanation"));
			
			if(httpServletRequest.getParameter("commercial").equals("true")) {
				pdDetail.setCommercial("Y");
			} else {
				pdDetail.setCommercial("N");
			}
			if(httpServletRequest.getParameter("codeSupply").equals("true")) {
				pdDetail.setCodeSupply("Y");
			} else {
				pdDetail.setCodeSupply("N");
			}
			if(httpServletRequest.getParameter("payment").equals("true")) {
				pdDetail.setPayment("Y");
			} else {
				pdDetail.setPayment("N");
			}
			if(httpServletRequest.getParameter("customize").equals("true")) {
				pdDetail.setCustomize("Y");
			} else {
				pdDetail.setCustomize("N");
			}
			logger.info(pdDetail.toString());
			
			productService.insertPdDetail(pdDetail);
		} else {
			pdDetail = new PdDetailVO();
			pdDetail.setPdNo(pd.getPdNo());
			pdDetail.setPdType(httpServletRequest.getParameter("pdType1"));
			pdDetail.setPdPrice(Integer.parseInt(httpServletRequest.getParameter("pdPrice1")));
			pdDetail.setPdTerm(Integer.parseInt(httpServletRequest.getParameter("pdTerm1")));
			pdDetail.setEditCount(Integer.parseInt(httpServletRequest.getParameter("editCount1")));
			pdDetail.setServiceExplanation(httpServletRequest.getParameter("serviceExplanation1"));
			pdDetail.setEditExplanation(httpServletRequest.getParameter("editExplanation1"));
			
			if(httpServletRequest.getParameter("commercial1").equals("true")) {
				pdDetail.setCommercial("Y");
			} else {
				pdDetail.setCommercial("N");
			}
			if(httpServletRequest.getParameter("codeSupply1").equals("true")) {
				pdDetail.setCodeSupply("Y");
			} else {
				pdDetail.setCodeSupply("N");
			}
			if(httpServletRequest.getParameter("payment1").equals("true")) {
				pdDetail.setPayment("Y");
			} else {
				pdDetail.setPayment("N");
			}
			if(httpServletRequest.getParameter("customize1").equals("true")) {
				pdDetail.setCustomize("Y");
			} else {
				pdDetail.setCustomize("N");
			}
			logger.info(pdDetail.toString());
			
			productService.insertPdDetail(pdDetail);
			
			pdDetail = new PdDetailVO();
			pdDetail.setPdNo(pd.getPdNo());
			pdDetail.setPdType(httpServletRequest.getParameter("pdType2"));
			pdDetail.setPdPrice(Integer.parseInt(httpServletRequest.getParameter("pdPrice2")));
			pdDetail.setPdTerm(Integer.parseInt(httpServletRequest.getParameter("pdTerm2")));
			pdDetail.setEditCount(Integer.parseInt(httpServletRequest.getParameter("editCount2")));
			pdDetail.setServiceExplanation(httpServletRequest.getParameter("serviceExplanation2"));
			pdDetail.setEditExplanation(httpServletRequest.getParameter("editExplanation2"));
			
			if(httpServletRequest.getParameter("commercial2").equals("true")) {
				pdDetail.setCommercial("Y");
			} else {
				pdDetail.setCommercial("N");
			}
			if(httpServletRequest.getParameter("codeSupply2").equals("true")) {
				pdDetail.setCodeSupply("Y");
			} else {
				pdDetail.setCodeSupply("N");
			}
			if(httpServletRequest.getParameter("payment2").equals("true")) {
				pdDetail.setPayment("Y");
			} else {
				pdDetail.setPayment("N");
			}
			if(httpServletRequest.getParameter("customize2").equals("true")) {
				pdDetail.setCustomize("Y");
			} else {
				pdDetail.setCustomize("N");
			}
			logger.info(pdDetail.toString());
			
			productService.insertPdDetail(pdDetail);

			pdDetail = new PdDetailVO();
			pdDetail.setPdNo(pd.getPdNo());
			pdDetail.setPdType(httpServletRequest.getParameter("pdType3"));
			pdDetail.setPdPrice(Integer.parseInt(httpServletRequest.getParameter("pdPrice3")));
			pdDetail.setPdTerm(Integer.parseInt(httpServletRequest.getParameter("pdTerm3")));
			pdDetail.setEditCount(Integer.parseInt(httpServletRequest.getParameter("editCount3")));
			pdDetail.setServiceExplanation(httpServletRequest.getParameter("serviceExplanation3"));
			pdDetail.setEditExplanation(httpServletRequest.getParameter("editExplanation3"));
			
			if(httpServletRequest.getParameter("commercial3").equals("true")) {
				pdDetail.setCommercial("Y");
			} else {
				pdDetail.setCommercial("N");
			}
			if(httpServletRequest.getParameter("codeSupply3").equals("true")) {
				pdDetail.setCodeSupply("Y");
			} else {
				pdDetail.setCodeSupply("N");
			}
			if(httpServletRequest.getParameter("payment3").equals("true")) {
				pdDetail.setPayment("Y");
			} else {
				pdDetail.setPayment("N");
			}
			if(httpServletRequest.getParameter("customize3").equals("true")) {
				pdDetail.setCustomize("Y");
			} else {
				pdDetail.setCustomize("N");
			}
			logger.info(pdDetail.toString());
			
			productService.insertPdDetail(pdDetail);

		}
		
	}
}
