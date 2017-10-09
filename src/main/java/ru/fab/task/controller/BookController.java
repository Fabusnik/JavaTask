package ru.fab.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.fab.task.model.Book;
import ru.fab.task.service.BookService;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "/books/{page}", method = RequestMethod.GET)
    public String listBooks(@PathVariable("page") Integer page, Model model){

        model.addAttribute("book", new Book());

        if (page == null)
            page = 1;

        model.addAttribute("maxPages", bookService.listBooks().size()/10+1);
        model.addAttribute("page", page);

        int endList;
        endList = 10*(page-1)+9;
        if (endList > this.bookService.listBooks().size())
            endList = this.bookService.listBooks().size();

        model.addAttribute("listBooks", this.bookService.listBooks().subList(10*(page-1), endList));
        //model.addAttribute("page", page);
        return "books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book){
        if(book.getId() == 0){
            this.bookService.addBook(book);
        }else {
            this.bookService.updateBook(book);
        }

        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id){
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("/edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model){
        model.addAttribute("book", this.bookService.getBookById(id));
       // model.addAttribute("listBooks", this.bookService.listBooks());

        return "books";
    }

    @RequestMapping("/bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model){
        model.addAttribute("book", this.bookService.getBookById(id));
        return "bookdata";
    }
}
