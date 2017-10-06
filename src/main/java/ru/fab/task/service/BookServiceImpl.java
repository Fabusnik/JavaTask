package ru.fab.task.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.fab.task.dao.BookDao;
import ru.fab.task.model.Book;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookDao bookDao;


    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }


    @Override
    @Transactional
    public List<Book> listBooks() {
        return this.bookDao.listBooks();
    }
}