package com.five.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.pojo.Book;
import com.five.service.IBookService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Resource
	private IBookService bookService;
	
	@RequestMapping("/showBooks")
	public String toIndex(HttpServletRequest request, Model model) {
		List<Book> books = this.bookService.getAllBook();
		request.setAttribute("books", books);
		return "Books";
	}
}
