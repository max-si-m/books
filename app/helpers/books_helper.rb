module BooksHelper
  def owner_actions?(book)
    policy(book).edit? && policy(book).destroy?
  end

  def state_link(book)
    if book.draft?
      link_to 'To publish', publish_book_path(book),
                            method: :post,
                            class: "btn btn-success"
    else
      link_to 'To draft', draft_book_path(book),
                          method: :post,
                          class: "btn btn-warning"
    end
  end

  def books_active_class(key)
    case key
    when 'all'
      params['my'] ? '' : 'active'
    when 'my'
      params['my'] ? 'active' : ''
    end
  end
end
