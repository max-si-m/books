class Admin::BooksController < Admin::BaseController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :publish, :draft]
  before_action :set_genres, only: [:new, :edit, :create, :update]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to admin_books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to admin_books_path, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to admin_books_path, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish
    @book.publishing!
    redirect_to admin_books_path, notice: 'State is updated'
  end

  def draft
    @book.drafting!
    redirect_to admin_books_path, notice: 'State is updated'
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def set_genres
      @genres = Genre.all
    end

    def book_params
      params.require(:book).permit(:title, :author, :logo, :description, :user_id,
                                   genre_ids: [])
    end
end
