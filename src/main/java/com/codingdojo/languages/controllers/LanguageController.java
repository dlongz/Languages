package com.codingdojo.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;

@Controller
public class LanguageController {
	private final LanguageService languageService;
	
	public LanguageController(LanguageService languageService) {
		this.languageService = languageService;
	}
	
	@RequestMapping("/languages")
	public String languages(Model model) {
		List<Language> language = languageService.allLanguages();
		model.addAttribute("language", language);
		return "languages.jsp";
	}
	
	@PostMapping("/languages")
	public String create(@Valid @ModelAttribute("language") Language lang, BindingResult result) {
		if (result.hasErrors()) {
			return "/languages.jsp";
		} else {
			return "redirect:/languages";
		}
	}
	
	@RequestMapping("/languages/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language lang = languageService.findLanguage(id);
		model.addAttribute(lang);
		return "/language/show.jsp";
	}
}
