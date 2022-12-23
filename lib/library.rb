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
    
end