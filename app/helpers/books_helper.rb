module BooksHelper
  def is_owner?(book_user)
    book_user == current_user
  end
end
