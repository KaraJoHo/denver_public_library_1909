class Library 
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name 
    @books = []
    @authors = []
  end

  def add_author(author)
    
    @authors << author
    @books += get_author_books(author)

    #  add_books(author)
    #  @books.flatten

    # why can't I do this? calling .flatten on @books
    # works in pry. But the test is returning a nested array? 
    # consider me confused
  end

  # def add_books(author)
  #   @books << get_author_books(author)
  # end

  def get_author_books(author) 
    author.books.map do |book| 
      book
    end
  end

  def publication_time_frame_for(author)
    time_frame = {}
    time_frame[:start] = start_year(author)
    time_frame[:end] = end_year(author)
    time_frame

  end

  def start_year(author)
    pub_years = author.books.map do |book| 
      book.publication_year.to_i
    end

    sorted = pub_years.sort 
    sorted.first.to_s
  end

  def end_year(author)
    pub_years = author.books.map do |book| 
      book.publication_year.to_i
    end

    sorted = pub_years.sort 
    sorted.last.to_s
  end
end