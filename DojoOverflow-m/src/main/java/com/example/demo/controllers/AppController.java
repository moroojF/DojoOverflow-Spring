package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.models.Answer;
import com.example.demo.services.AppService;
import com.example.demo.models.Question;

@Controller
public class AppController {
	private final AppService appService;
	public AppController(AppService appService) {
		this.appService = appService;
	}
	
	@GetMapping("/")
	public String index() {
		return "redirect:/questions";
	}
	
	@GetMapping("/questions")
	public String dashboard(Model model) {
		model.addAttribute("questions",appService.allQuestions());
		return "dashboard.jsp";
	}
	@GetMapping("/questions/new")
	public String New(@ModelAttribute("question") Question question) {
		return "newQandT.jsp";
	}
	@PostMapping(value="/questions/new")
	public String create(@Valid @ModelAttribute("question") Question question,  BindingResult result, Model model ) {
		if(result.hasErrors()) {
			return "newQandT.jsp";
		}else {
			String[] tags = question.getTagsInput().split(",");
			if(tags.length > 3) {
				model.addAttribute("error","please only add 3 tags!" );
				return "newQandT.jsp";
			}else {
				appService.creatQandT(question, tags);
				return "redirect:/questions/";
			}
		}
	}
	
	@GetMapping("/questions/{id}")
	public String showQuestion(@ModelAttribute("answer") Answer answer,@PathVariable("id") Long id ,Model model ) {
		model.addAttribute("question", appService.findQuestion(id));
		return "showQuestion.jsp";
	}
	
	@PostMapping(value="/questions/{id}/answer")
	public String creatAnswer(@RequestParam("answerText") String answer,@PathVariable("id") Long id ,Model model ) {
		model.addAttribute("question",appService.findQuestion(id));
			appService.creatAnswer(new Answer(answer),(Long)id);
			return "redirect:/questions/"+id;
	}

}	