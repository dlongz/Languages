package com.codingdojo.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	public String languages(Model model, @ModelAttribute("language") Language lang) {
		List<Language> allLang = languageService.allLanguages();
		model.addAttribute("languages", allLang);
		return "languages.jsp";
	}
	
	@PostMapping("/languages")
	public String create(@Valid @ModelAttribute("language") Language lang, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("languages", this.languageService.allLanguages());
			return "/languages.jsp";
		} else {
			this.languageService.createLanguage(lang);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping("/languages/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language lang = languageService.findLanguage(id);
		model.addAttribute("onelang", lang);
		return "/show.jsp";
	}
	
	@RequestMapping("/update/{id}")
	public String updateLang(@PathVariable("id") Long id, Model model) {
		model.addAttribute("language", this.languageService.findLanguage(id));
		return "/edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String editLang(@Valid @ModelAttribute("language") Language lang, BindingResult result, Model model, @PathVariable("id") Long Id) {
		if (result.hasErrors()) {
			model.addAttribute("languages", this.languageService.findLanguage(Id));
			return "/edit.jsp";
		} else {
			this.languageService.updateLanguage(lang);
			return "redirect:/languages";
		}
	}
	
	@DeleteMapping("/destroy/{id}")
	public String destroy(@PathVariable("id") Long id) {
		this.languageService.deleteLang(id);
		return "redirect:/languages";
	}
}
