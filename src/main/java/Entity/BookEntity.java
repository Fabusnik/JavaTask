package Entity;

import javax.persistence.*;

@Entity
@Table(name = "book", schema = "test")
public class BookEntity {
    private int id;
    private String title;
    private String description;
    private String author;
    private String isbn;
    private int printYear;
    private int readAlready;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "author")
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "isbn")
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    @Basic
    @Column(name = "print_year")
    public int getPrintYear() {
        return printYear;
    }

    public void setPrintYear(int printYear) {
        this.printYear = printYear;
    }

    @Basic
    @Column(name = "read_already")
    public int getReadAlready() {
        return readAlready;
    }

    public void setReadAlready(int readAlready) {
        this.readAlready = readAlready;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BookEntity that = (BookEntity) o;

        if (id != that.id) return false;
        if (printYear != that.printYear) return false;
        if (readAlready != that.readAlready) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (author != null ? !author.equals(that.author) : that.author != null) return false;
        if (isbn != null ? !isbn.equals(that.isbn) : that.isbn != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (isbn != null ? isbn.hashCode() : 0);
        result = 31 * result + printYear;
        result = 31 * result + readAlready;
        return result;
    }

    @Override
    public String toString() {
        return "BookEntity{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", author='" + author + '\'' +
                ", isbn='" + isbn + '\'' +
                ", printYear=" + printYear +
                ", readAlready=" + readAlready +
                '}';
    }
}
