package com.aviskar.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aviskar.example.model.Student;

@Controller
public class StudentController {

	private static final AtomicLong STUDENT_SEQUENCE = new AtomicLong(1);
	private static final List<Student> STUDENT_TABLE = new ArrayList<>();

	@RequestMapping(path = "/students", method = RequestMethod.GET)
	public String students(Model model) {
		model.addAttribute("students", STUDENT_TABLE);
		return "student-list";
	}

	@RequestMapping(path = "/add-student", method = RequestMethod.GET)
	public String addStudent(Model model) {
		model.addAttribute("student", new Student());
		return "student-form";
	}

	@RequestMapping(path = "/add-student", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute Student student) {
		student.setId(STUDENT_SEQUENCE.getAndIncrement());
		STUDENT_TABLE.add(student);
		return "redirect:/students";
	}

	@RequestMapping(path = "/edit-student", method = RequestMethod.GET)
	public String editStudent(@RequestParam Long id, Model model) {
		Student student = STUDENT_TABLE.stream().filter(s -> s.getId().equals(id)).findFirst().get();
		model.addAttribute("student", student);
		return "student-form";
	}

	@RequestMapping(path = "/edit-student", method = RequestMethod.POST)
	public String editStudent(@ModelAttribute Student student) {
		Student studentInTable = STUDENT_TABLE.stream().filter(s -> s.getId().equals(student.getId())).findFirst()
				.get();
		STUDENT_TABLE.set(STUDENT_TABLE.indexOf(studentInTable), student);
		return "redirect:/students";
	}

	@RequestMapping(path = "/delete-student", method = RequestMethod.GET)
	public String deleteStudent(@RequestParam Long id) {
		Student student = STUDENT_TABLE.stream().filter(s -> s.getId().equals(id)).findFirst().get();
		STUDENT_TABLE.remove(student);
		return "redirect:/students";
	}
}
