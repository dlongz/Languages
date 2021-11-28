package com.codingdojo.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository langRepo;
	
	public LanguageService(LanguageRepository langRepo) {
		this.langRepo = langRepo;
	}
	
	public List<Language> allLanguages(){
		return langRepo.findAll();
	}
	
	public Language createLanguage(Language lang) {
		return langRepo.save(lang);
	}
	
	public Language findLanguage(Long id) {
		return this.langRepo.findById(id).orElse(null);
	}
	
	public Language updateLanguage(Language lang) {
		return this.langRepo.save(lang);
	}
	
	public void deleteLang(Long id) {
		langRepo.deleteById(id);
	}
}
