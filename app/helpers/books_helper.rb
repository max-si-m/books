module BooksHelper
  def is_owner?(book_user)
    book_user == current_user
  end

  def state_link(book)
    if book.draft?
      link_to 'To publish', publish_book_path(book),
                            method: :post,
                            class: "btn btn-success"
    else
      link_to 'To draft', draft_book_path(book),
                          method: :post,
                          class: "btn btn-danger"
    end
  end
end
