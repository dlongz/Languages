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
		Optional<Language> optionalLang = langRepo.findById(id);
		if(optionalLang.isPresent()) {
			return optionalLang.get();
		} else {
			return null;
		}
	}
	
	public Language updateLanguage(Long id,Language lang) {
		Optional<Language> optionalLang = langRepo.findById(id);
		if(optionalLang.isPresent()) {
			return langRepo.save(lang);			
		} else {
			return null;
		}
	}
	
	public void deleteBook(Long id) {
		langRepo.deleteById(id);
	}
}
