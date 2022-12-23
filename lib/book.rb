 class Book 
  attr_reader :title, :checkout_count

  def initialize(attributes)
    @title = attributes[:title]
    @author_first_name = attributes[:author_first_name]
    @author_last_name = attributes[:author_last_name]
    @publication_date = attributes[:publication_date]
    @checkout_count = 0
  end

  def author 
    "#{@author_first_name} #{@author_last_name}"
  end

  def publication_year 
    @publication_date[-4..-1]
  end

  def up_checkout_count 
    @checkout_count += 1
  end
 end
