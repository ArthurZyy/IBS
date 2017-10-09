package com.five.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.five.dao.BookMapper;
import com.five.pojo.Book;
import com.five.service.IBookService;

@Service("bookService")
public class BookService implements IBookService{
	
	@Resource
	private BookMapper bookDao;

	@Override
	public Book getBookById(int bookId) {
		// TODO Auto-generated method stub
		return this.bookDao.selectByPrimaryKey(bookId);
	}

	@Override
	public List<Book> getAllBook() {
		// TODO Auto-generated method stub
		return this.bookDao.getAll();
	}

}
