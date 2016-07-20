module BooksHelper
  def is_owner?(book_user)
    book_user == current_user
  end

  def state_link(book)
    title = book.draft? ? 'To publish' : 'To draft'
    link_path = book.draft? ? publish_book_path(book) : draft_book_path(book)

    link_to title, link_path, method: :post
  end
end
