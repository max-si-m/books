module Admin::BooksHelper
  def admin_state_link(book)
    if book.draft?
      link_to 'To publish', publish_admin_book_path(book),
                            method: :post,
                            class: "btn btn-success"
    else
      link_to 'To draft', draft_admin_book_path(book),
                          method: :post,
                          class: "btn btn-warning"
    end
  end
end
