package rnb.javalec.pjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapViewController {

	
	@RequestMapping("yanggobchangMapView")
	public String yanggobchangMapView() {
		
		return "map/yanggobchangMapView";
	}
	
	
	
	@RequestMapping("todieMapView")
	public String todieMapView() {
		
		return "map/todieMapView";
	}
	@RequestMapping("jjuMapView")
	public String jjuMapView() {
		return "map/jjuMapView";
	}
	@RequestMapping("magoMapView")
	public String magoMapView() {
		
		return "map/magoMapView";
	}
	@RequestMapping("ssoleMapView")
	public String ssoleMapView() {
		
		return "map/ssoleMapView";
	}
	@RequestMapping("koleeMapView")
	public String koleeMapView() {
		
		return "map/koleeMapView";
	}
	@RequestMapping("pungchunMapView")
	public String punchunMapView() {
		
		return "map/pungchunMapView";
	}
	@RequestMapping("garpungMapView")
	public String garpungMapView() {
		
		return "map/garpungMapView";
	}
	@RequestMapping("bananaMapView")
	public String bananaMapView() {
		
		return "map/bananaMapView";
	}
	@RequestMapping("dosetaMapView")
	public String dosetaMapView() {
		
		return "map/dosetaMapView";
	}
	@RequestMapping("mobarkMapView")
	public String mobarkMapView() {
		
		return "map/mobarkMapView";
	}
	@RequestMapping("beerMapView")
	public String beerMapView() {
		
		return "map/beerMapView";
	}
	@RequestMapping("yangpungMapView")
	public String yangpungMapView() {
		
		return "map/yangpungMapView";
	}
	
	
}
