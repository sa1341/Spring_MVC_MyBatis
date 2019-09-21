package rnb.javalec.pjt.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import rnb.javalec.pjt.service.FoodService;
import rnb.javalec.pjt.vo.Food;

@Controller
public class SearchFoodController {

	private static final Logger logger = LoggerFactory.getLogger(SearchFoodController.class);

	
	@Autowired
	FoodService foodService;
	
   @RequestMapping("/seeRegion")
   public String seeFood(HttpServletRequest request) {

      logger.info(request.getParameter("mloc"));

      String mloc = request.getParameter("mloc");

      if(mloc.equals("수원")) {

         return "region/suwon";
      }else {

         return "region/jeongia";
      }

   }


   @RequestMapping("/fj_koreaFood")
   public String fj_koreaFood() {

      return "food/fj_koreaFood";
   }
   @RequestMapping("/fs_koreaFood")
   public String fs_koreaFood() {

      return "food/fs_koreaFood";
   }
   @RequestMapping("/fj_chinaFood")
   public String fj_chinaFood() {
      
      return "food/fj_chinaFood";
   }
   @RequestMapping("/fs_chinaFood")
   public String fs_chinaFood() {
      
      return "food/fs_chinaFood";
   }
   @RequestMapping("/fj_americaFood")
   public String fj_americaFood() {

      return "food/fj_americaFood";
   }
   @RequestMapping("/fs_americaFood")
   public String fs_americaFood() {

      return "food/fs_americaFood";
   }
   @RequestMapping("/fj_cafeFood")
   public String fj_cafeFood() {

      return "food/fj_cafeFood";
   }
   @RequestMapping("/fs_cafeFood")
   public String fs_cafeFood() {

      return "food/fs_cafeFood";
   }
   @RequestMapping("/fj_japanFood")
   public String fj_japanFood() {

      return "food/fj_japanFood";
   }
   @RequestMapping("/fs_japanFood")
   public String fs_japanFood() {

      return "food/fs_japanFood";
   }
   @RequestMapping("/fj_bunsicFood")
   public String fj_bunsicFood() {

      return "food/fj_bunsicFood";
   }
   @RequestMapping("/fs_bunsicFood")
   public String fs_bunsicFood() {

      return "food/fs_bunsicFood";
   }
   
   
   @RequestMapping("/exfood")
   public String exceptionFood(int fno) {
	   logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	  
	  return "food/fs_bunsicFood";
   }

   @RequestMapping("/fj1_todie")
   public String fj1_todie(int fno, Model model){

	logger.info("fno :" +fno);
	   
	Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	model.addAttribute("fdto", fdto);
	   
      return "food/fj1_todie";
   }   
   @RequestMapping("/yanggobchang")
   public String yanggobchang(int fno, Model model) {

	 logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
      
	  return "food/yanggobchang";
   }
   @RequestMapping("/fj2_jju")
   public String fj2_jju(int fno, Model model) {

	 logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fj2_jju";
   }   
   @RequestMapping("/fj3_mago")
   public String fj3_mago(int fno, Model model) {

	 logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fj3_mago";
   }   
   @RequestMapping("/fj4_ssole")
   public String fj4_ssole(int fno, Model model)  {

	 logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fj4_ssole";
   }   
   @RequestMapping("/fj5_kolee")
   public String fj5_kolee(int fno, Model model)  {

	logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fj5_kolee";
   }   
   @RequestMapping("/fj6_pungchun")
   public String fj6_pungchun(int fno, Model model)  {

	logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fj6_pungchun";
   }   
   @RequestMapping("/fs1_garpung")
   public String fs1_garpung(int fno, Model model)  {

	 logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	 logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fs1_garpung";
   }   
   @RequestMapping("/fs2_banana")
   public String fs2_banana(int fno, Model model)  {

	 logger.info("fno :" +fno);
	   
	 Food fdto = foodService.selectByFno(fno);
	   
	 logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fs2_banana";
   }   

   @RequestMapping("/fs3_doseta")
   public String fs3_doseta(int fno, Model model)  {

	logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fs3_doseta";
   }   

   @RequestMapping("/fs4_mobark")
   public String fs4_mobark(int fno, Model model)  {

	 logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fs4_mobark";
   }   

   @RequestMapping("/fs5_beer")
   public String fs5_beer(int fno, Model model)  {

	 logger.info("fno :" +fno);
	   
	  Food fdto = foodService.selectByFno(fno);
	   
	 logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fs1_garpung";
   }   

   @RequestMapping("/fs6_yangpung")
   public String fs6_yangpung(int fno, Model model)   {

	 logger.info("fno :" +fno);
	   
	 Food fdto = foodService.selectByFno(fno);
	   
	 logger.info(fdto.getFname());
	  
	  model.addAttribute("fdto", fdto);
	   
      return "food/fs6_yangpung";
   }   


}