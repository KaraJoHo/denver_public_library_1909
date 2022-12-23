class Author 
  attr_reader :books 

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name 
    [@first_name, @last_name].join(' ')
  end

  def write(book_title, pub_date) 
    @books << Book.new({title: book_title, publication_date: pub_date})
    @books.last
  end

  # def add_book(book)
  # end
end