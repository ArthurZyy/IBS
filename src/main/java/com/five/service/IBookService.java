package com.five.service;

import java.util.List;

import com.five.pojo.Book;

public interface IBookService {

	public Book getBookById(int bookId);
	public List<Book> getAllBook();
	
}
