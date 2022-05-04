package com.traveleasy.controller;


import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.traveleasy.client.ClientUtils;
import com.traveleasy.model.Company;
import com.traveleasy.model.LexUser;
import com.traveleasy.model.Prediction;
import com.traveleasy.model.Reviews;
import com.traveleasy.model.Travelplan;
import com.traveleasy.model.User;
import com.traveleasy.model.Usertravelplan;
import com.traveleasy.service.AmazonClientService;
import com.traveleasy.service.CompanyService;
import com.traveleasy.service.PredictionService;
import com.traveleasy.service.SignUpService;
import com.traveleasy.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private SignUpService signUpService;

	@Autowired
	private AmazonClientService amazonClientService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private UserService userService;
	
	
//	@Autowired
//	private PollyHelper pollyhelper;
	
	private PredictionService predictionService;

	// @Autowired
	// ClientUtils clientUtils;
	//
	@Autowired
	HomeController(AmazonClientService amazonClientService) {
		this.amazonClientService = amazonClientService;
	}
	
			
	
	
     /* added by chaitrali */
	@GetMapping("/getData")
	public String getData(HttpSession session, ModelMap model) {
		String custId = (String) session.getAttribute("DynamoUser");
		System.out.println("Customer is is as follows"+custId);
		ClientUtils clientUtils = new ClientUtils();
		String response = ClientUtils.userName ; 
        System.out.println("something we are doing"+response);
		ObjectMapper om = new ObjectMapper();
		LexUser ru = null ;
		System.out.println("Response from Dynamo db: " + response);	
		System.out.println("Response from: " + session.getAttribute("lexResp"));	
		try {
			ru = om.readValue(response, LexUser.class);
			System.out.println("Lex Data: "+ru);
			
						
		} catch (JsonParseException e) {
			
			e.printStackTrace();
		} catch (JsonMappingException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		String lexUserId="Shivani";
		String lexCountry="India";
		String lexMonth="June";
		//String lexUserId = ru.getUserId();
		//String lexCountry = ru.getCountry();
		//String lexMonth = ru.getMonth();
		//Need edition
		List<Travelplan> Travelplans = new ArrayList<>();
		Travelplans =companyService.findTravelPlans(lexCountry, lexMonth);
		System.out.println("Exact Matched Travel plan: "+Travelplans);
	
		
		
		/* 4 Dec by chaitrali*/
		if (Travelplans.isEmpty())
		{
			System.out.println("Hey are you coming in error page??????");
			session.setAttribute("errorMessage", "Sorry we currently don't have any plans for "+lexCountry+" in the month of "+lexMonth+"!");
			return "redirect:/errorPage";
		}else
		{
			System.out.println("Hey are you coming in else page??????");
			session.setAttribute("LexUserID", lexUserId);
			session.setAttribute("Travelplans", Travelplans);
			return "redirect:/userTravelPlans";
		}
		
	}
	
	
	/* 4 Dec by chaitrali*/
	@GetMapping("/errorPage")
	public String errorPage() {
		return "errorPage";
	}
	

	@GetMapping("/companyPage")
	public String companyPage() {
		return "companyPage";
	}

	@GetMapping("/userdashboard")
	public String userdashboard() {
		return "userdashboard";
	}

	@GetMapping("/retrievereviews")
	public String retrievereviews() {
		return "retrievereviews";
	}

	@GetMapping("/postreviews")
	public String postreviews() {
		return "postreviews";
	}

	@GetMapping("/")
	public String start() {
		return "loginPage";
	}

	@GetMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}

	@GetMapping("/userHomePage")
	public String userHomePage() {
		return "userHomePage";
	}

	@GetMapping("/companySignup")
	public String companySignup() {
		return "companySignup";
	}
	
	
	@GetMapping("/userTravelPlans")
	public String userTravelPlans(HttpSession session, ModelMap model) {
		
		model.addAttribute(session.getAttribute("Travelplans"));
		System.out.println("userTravelPlans**********"+session.getAttribute("Travelplans"));
		return "userTravelPlans";
	}
	
	@GetMapping("/getTravelPlanByName")
	public String getTravelPlanByName(@RequestParam(value = "planName") String planName, HttpSession session) {
		
		Travelplan tp = new Travelplan();
		tp = companyService.findTravelPlanByName(planName);
		System.out.println("specific travelplan ***********"+tp);
		String lexUserId = (String) session.getAttribute("LexUserID");
		session.setAttribute("LexUserID", lexUserId);
		session.setAttribute("SpecificTravelPlan", tp);
		return "redirect:/specificTravelPlan";
	}
	
	@GetMapping("/specificTravelPlan")
	public void getTravelPlanByName(HttpSession session) {
		session.getAttribute("SpecificTravelPlan");
	}
	
	@GetMapping("/selectPlan")
	public String selectPlan(HttpSession session) {
		
		Travelplan tp = (Travelplan) session.getAttribute("SpecificTravelPlan");
		Usertravelplan up = new Usertravelplan();
		up.setBudget(tp.getBudget());
		up.setCountry(tp.getCountry());
		up.setPlan(tp.getPlan());
		up.setMonth(tp.getMonth());
		String lexUserId = (String) session.getAttribute("LexUserID");
		up.setuserName(lexUserId);
		if(userService.adduserTravelPlan(up))
		{
			session.setAttribute("message1", "Travel Plan selected");
			return "redirect:/specificTravelPlan";
		}else
		{
			session.setAttribute("errorMessage", "Opps! there is some problem!");
			return "redirect:/errorPage";
		}
	
	}
	

	@PostMapping("/customlogin")
	public String customlogin(@RequestParam("username") String username, @RequestParam("pwd") String pwd,
			@RequestParam("role") String role, ModelMap model, HttpSession session) {

		if ("user".equals(role)) {

			User user = signUpService.getuserinfo(username, pwd);

			if (user == null) {
				model.addAttribute("loginError", "Sorry, user is not present please sign up");
				session.setAttribute("message", "Invalid username or Password");
				// throw new ApplicationException(404, "Invalid Username/Password.");
				return "redirect:/loginPage";
				
			}
			
			ArrayList<Usertravelplan> usertravelplans = userService.retrieveUsertravelplans(user.getUsername());
			System.out.println(usertravelplans);
			if(usertravelplans.isEmpty()) {
				System.out.println("null");
			session.setAttribute("usertravelplans", null);
			 session.setAttribute("loggedUser", user);
			session.setAttribute("DynamoUser", user.getUsername());
			session.setAttribute("message", "success");
			return "redirect:/userHomePage";
		}
			
			System.out.println("not null");
			session.setAttribute("usertravelplans", usertravelplans);
	        session.setAttribute("loggedUser", user);
	        session.setAttribute(" User", user.getUsername());
	        session.setAttribute("message", "success");
	        return "redirect:/userHomePage";
	        }
			
			

		if ("company".equals(role)) {
			Company company = companyService.getCompanyinfo(username, pwd);

			if (company == null) {

				model.addAttribute("loginError", "Sorry, company is not present please sign up");
				session.setAttribute("message", "Invalid username or Password");
				// throw new ApplicationException(404, "Invalid Username/Password.");
				return "redirect:/loginPage";
			}
			session.setAttribute("loggedCompany", company);
			session.setAttribute("companyusername", company.getCompUsername());
			session.setAttribute("companyname", company.getCompName());
			session.setAttribute("message", "success");
			return "redirect:/companyPage";
		}

		else
			// session.setAttribute("message", "success");
			return "redirect:/loginPage";
	}

	@RequestMapping(value = "/glogin", method = RequestMethod.GET)
	public String googlePage() {
		return "googlePage";
	}

	@RequestMapping(value = "/glogin", method = RequestMethod.POST)
	public String validatewithgoogle(@RequestParam("id_token") String id_token, ModelMap model, HttpSession session) {

		String email = "";
		String name = "";
		try {
			GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(id_token);

			name = (String) payLoad.get("name");
			email = payLoad.getEmail();
			// System.out.println("User name: " + name);
			// System.out.println("User email: " + email);
			session.setAttribute("userName", name);
			session.setAttribute("id_token", id_token);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		User user = new User();
		user.setUseremailid(email);
		user.setUserfirstname(name);
		session.setAttribute("loggedUser", user.getUserfirstname());
		return "redirect:/lex1";
	}

	@GetMapping("/lex")
	public String lexDemo() {
		return "lex";
	}

	// on submit button click, data read from dynamo db
	@GetMapping("/lex1")
	public String lexDemo1() {
		return "lex1";
	}

	@GetMapping("/testSubmitButton")
	public String testSubmitButton() {
		return "testSubmitButton";
	}

	// testing the api gateway for dynamo read fuction
	@GetMapping("/test")
	public String test() {
		return "test";
	}

	@GetMapping("/userSignup")
	public String userSignup() {
		return "userSignup";
	}

	/*@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session) {
		String id_token = (String) session.getAttribute("id_token");
		if (id_token != null) {
			try {
				GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(id_token);
				if (payLoad != null) {
					payLoad.setExpirationTimeSeconds(1L);
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		session.invalidate();

		return "loginPage";
	}
*/
	@PostMapping("/adduser")
	public String adduser(@RequestParam("fname") String fname,@RequestParam("username") String username, @RequestParam("email") String email,
			@RequestParam("pwd") String pwd, HttpSession session) {

		User user = new User();
		user.setUserfirstname(fname);
		user.setUsername(username);
		user.setUseremailid(email);
		user.setUserpassword(pwd);

		if (signUpService.adduser(user)) {
			session.setAttribute("message", "success");
			return "redirect:/loginPage";
		}
		session.setAttribute("message", "user already exists");
		return "redirect:/userSignup";

	}

	@PostMapping("/addCompany")
	public String addCompany(@RequestParam("email") String email, @RequestParam("pwd") String pwd,
			@RequestParam("cname") String cname, HttpSession session) {
		Company comp = new Company();
		comp.setCompName(cname);
		comp.setCompUsername(email);
		comp.setCompPassword(pwd);

		if (companyService.addCompany(comp)) {

			session.setAttribute("message", "success");
			return "redirect:/loginPage";
		}

		session.setAttribute("message", "company already exists");
		return "redirect:/companySignup";

	}

	@PostMapping("/uploadFiletoS3")
	public String uploadFiletoS3(@RequestPart(value = "file") MultipartFile file) {

		this.amazonClientService.uploadFiletoS3(file);
		return "redirect:/companySignup";
	}

	@PostMapping("/postreviews")
	public String postReview(@RequestPart(value = "reviewimage") MultipartFile reviewimage,
			@RequestParam("username") String username,
	@RequestParam("plan") String plan,@RequestParam("comments") String comments, HttpSession session){
	
		
		String imageurl = this.amazonClientService.uploadReviewFiletoS3(reviewimage, username, plan);
		Reviews review = new Reviews();
		review.setuserName(username);
		review.setPlan(plan);
		review.setComment(comments);
		review.setImageUrl(imageurl);
		if(userService.postReview(review)) {
			ArrayList<Reviews> reviews = userService.retrieveReviews(username);
			System.out.println(reviews);
			session.setAttribute("reviews", reviews);
			session.setAttribute("message", "success");
			return "redirect:/postreviews";
		}
		session.setAttribute("message", "fail");
		return "redirect:/postreviews";
	}

	
	@PostMapping("/traveldata")
	public String travelData(@RequestPart(value = "itinerary") MultipartFile itinerary, 
			@RequestPart(value = "planimage") MultipartFile planimage,@RequestParam("companyname") String companyname,@RequestParam("companyusername") String companyusername, @RequestParam("country") String country,
			@RequestParam("month") String month, @RequestParam("plan") String plan, @RequestParam("budget") int budget, HttpSession session)
	{
		
		System.out.println("Company Name: "+companyname);
		System.out.println("Comapny Username: "+companyusername);
		Long itenerarysize = itinerary.getSize() / 1024 / 1024 ;
		Long planimagesize = planimage.getSize() / 1024 / 1024 ;
		if((itenerarysize <= 10) && (planimagesize <= 10)) {
		String itineraryimgurl	= this.amazonClientService.uploadTravelFiletoS3(itinerary,companyusername,plan);
		String planimgurl =  this.amazonClientService.uploadTravelFiletoS3(planimage,companyusername,plan);		
		Travelplan tp = new Travelplan();
		tp.setCompanyusername(companyusername);
		tp.setCountry(country);
		tp.setMonth(month);
		tp.setPlan(plan);
		tp.setBudget(budget);
		tp.setItineraryimageurl(itineraryimgurl);
		tp.setPlanimageurl(planimgurl);

		if(companyService.addTravelplan(tp)) {	
			 session.setAttribute("companyname", companyname);	
			 session.setAttribute("companyusername", companyusername);	
		session.setAttribute("companymessage", "Travel plan uploaded successfully!!!");
		return "redirect:/companyPage";
		}
		session.setAttribute("companyname", companyname);	
		 session.setAttribute("companyusername", companyusername);	
		session.setAttribute("companymessage", "Please try with unique plan name.");
		return "redirect:/companyPage";
	}
		 session.setAttribute("companyname", companyname);	
		 session.setAttribute("companyusername", companyusername);	
		session.setAttribute("companymessage", "Upload failed!!! Please upload images less than 10MB.");
		return "redirect:/companyPage";

} 
	
	
	/*Edited by Prathyusha on 5th */
	@PostMapping("/travelplandelete")
	public String deleteCompanyTravelplan(@RequestParam(value = "companyname") String companyname,
			@RequestParam("companyusername") String companyusername,
	@RequestParam("travelplanid") Integer travelplanid, HttpSession session){
		if(companyService.deleteTravelplan(travelplanid)) {
			session.setAttribute("companymessage", "deleted");	
			session.setAttribute("companyname", companyname);	
			 session.setAttribute("companyusername", companyusername);
			return "redirect:/companyPage";
		}
		session.setAttribute("companymessage", "deletion failed");
		session.setAttribute("companyname", companyname);	
		 session.setAttribute("companyusername", companyusername);
		return "redirect:/companyPage";
	}
	
//	 @RequestMapping(path="/audio", produces="audio/mpeg3")
//     public @ResponseBody byte[] textToSpeech(@RequestParam("msg") String msg) throws IOException {
//                 InputStream is = pollyhelper.synthesize(msg, OutputFormat.Mp3);
//                 
//                  return StreamUtils.copyToByteArray(is);
//     }
	  @Autowired
	    public void PredictionController(PredictionService predictionService) {
	        this.predictionService = predictionService;
	    }
	    
	   
	    private Prediction createPrediction(String country,String month,String budget1) {
	        ObjectMapper mapper = new ObjectMapper();
	        String predictionJson = getPredictionJson(country,month,budget1);
System.out.println(predictionJson);
	        Prediction prediction = null;
	        try {
	        	prediction = mapper.readValue(predictionJson, Prediction.class);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return prediction;
	    }
	    
	    
	    /* Edited by Prathyusha */
	    @RequestMapping(value = "/prediction")
	    public String getPredication(@RequestParam("country") String country,@RequestParam("month") String month,
	    		@RequestParam("budget") String budget,HttpSession session) {
	    	String budget1 = '$'+ budget;
	    	System.out.println(budget1);
	        Optional result = predictionService.getPrediction(createPrediction(country,month,budget1));
	        Optional result1 = predictionService.getPrediction1(createPrediction(country,month,budget1));
	        if (result.isPresent() && result1.isPresent()) {
	        	session.setAttribute("negative",  String.format("%.0f", (Float) result.get() * 100));
	        	session.setAttribute("positive",  String.format("%.0f", (Float) result1.get() * 100));
	            return "redirect:/prediction";
	        }
	        System.out.println("error");
	        session.setAttribute("companymessage", "Error when calculate probability of response");
	        return "redirect:/prediction";
	    }
	    
	    

	    private String getPredictionJson(String country,String month,String budget1) {
	    	return "{\"country\":\""+ country +"\",\"month\":\"jan\",\"budget\":\""+ budget1 +"\"}";
	    }

	    /*Edited By Chaitrali*/
	    @GetMapping("/downloadTravelPlanItinerary")
	    private ResponseEntity downloadTravelPlanItinerary(String itinerary, String companyname, String plan){
	    	
	    	System.out.println("Values from jsp: "+itinerary+" "+companyname+" "+plan);
	    	String fileName = itinerary.substring(itinerary.lastIndexOf('/') + 1);
	    	byte[] data=this.amazonClientService.downloadFile(fileName, companyname, plan);
	    	
	        // Try to determine file's content type
	        String contentType = null;
	    
	        // Fallback to the default content type if type could not be determined
	        if(contentType == null) {
	            contentType = "application/octet-stream";
	        }
	        return ResponseEntity.ok()
	                .contentType(MediaType.parseMediaType(contentType))
	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
	                .body(data);
		}
	    
	    
	    
	    
	    @GetMapping("/endPage")
		public String endPage() {
			return "endPage";
		}
	    
	    
	    @RequestMapping(value = "/logout", method = RequestMethod.POST)
		public String logout(ModelMap model, HttpSession session) {
			
			String id_token = (String) session.getAttribute("id_token");
			if (id_token != null) {
				try {
					GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(id_token);
					if (payLoad != null) {
						payLoad.setExpirationTimeSeconds(1L);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			session.invalidate();
			return "redirect:/endPage";
		}
	    
	    

		/* Edited by Prathyusha on 5th*/
		@PostMapping("/companytravelplans")
		public String companyTravelplans(@RequestParam(value = "companyname") String companyname,
				@RequestParam("companyusername") String companyusername, HttpSession session){
			ArrayList<Travelplan> tp = companyService.retrieveCompanyTravelplans(companyusername);
			if(tp.isEmpty()) {
				System.out.println(companyusername);
				System.out.println("null");
				session.setAttribute("travelplan", null);
				session.setAttribute("companyname", companyname);	
				session.setAttribute("companymessage", "no travel plans");
				session.setAttribute("notravelplans", "no travel plans");	
				 session.setAttribute("companyusername", companyusername);
				return "redirect:/companyPage";
			}
			String message = "You have " + tp.size() + " plans";
			System.out.println(tp);
			session.setAttribute("travelplan", tp);
			session.setAttribute("companymessage", message);	
			session.setAttribute("companyname", companyname);	
			 session.setAttribute("companyusername", companyusername);
			return "redirect:/companyPage";
			}
	    
		
		@GetMapping("/prediction")
		public String prediction()
		{
			return "prediction";
		}
		
		
		@GetMapping("/getReviews")
		public String getReviews(@RequestParam("plan") String plan, HttpSession session)
		{
			System.out.println("What is the plan:****:"+plan);
			List<Reviews> reviews = new ArrayList<>();
			reviews = companyService.getReviews(plan);
			session.setAttribute("planReview", reviews);
			return "redirect:/specificTravelPlan";
		}
	    
 }
	   

