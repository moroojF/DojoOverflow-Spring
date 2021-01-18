package com.example.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.models.Answer;
import com.example.demo.models.Question;
import com.example.demo.models.Tag;
import com.example.demo.repositories.AnswerRepository;
import com.example.demo.repositories.QuestionRepository;
import com.example.demo.repositories.TagRepository;

@Service
public class AppService {
	public final TagRepository tagRepo;
	public final QuestionRepository questionRepo;
	public final AnswerRepository answerRepo;
	public AppService(TagRepository tagRepo,QuestionRepository questionRepo,AnswerRepository answetRepo) {
		this.tagRepo=tagRepo;
		this.questionRepo=questionRepo;
		this.answerRepo=answetRepo;
	}
	public List<Tag> allTags(){
		return tagRepo.findAll();
	}
	public List<Question> allQuestions(){
		return questionRepo.findAll();
	}
	public List<Answer> allAnswers(){
		return answerRepo.findAll();
	}
	private Tag findOrCreate(String subject) {
		Tag tag = this.tagRepo.findBySubject(subject).orElse(null);
		if(tag==null) {
			Tag newTag = new Tag();
			newTag.setSubject(subject.toLowerCase());
			return tagRepo.save(newTag);
		}
		return tag;
	}
	public Question creatQandT(Question question, String[] tags) {
		List<Tag> tagList = new ArrayList<Tag>();
		for(String subject : tags) {
			Tag tag = findOrCreate(subject);
			tagList.add(tag);
		}
		question.setTags(tagList);
		return questionRepo.save(question);
	}
	public Question findQuestion(Long id ) {
		return this.questionRepo.findById(id).orElse(null);
	}
	public Answer creatAnswer(Answer answer, Long q_id) {
		Question q = questionRepo.findById(q_id).get();
		answer.setQuestion(q);
		return answerRepo.save(answer);
	}
	
}
