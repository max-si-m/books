class Admin::DashboardController < Admin::BaseController
  def index
    @users = User.last(10)
    @books = Book.last(10)
  end
end
