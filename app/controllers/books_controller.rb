class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :publish, :draft]
  before_action :set_genres, only: [:new, :edit, :create, :update]

  # GET /books
  # GET /books.json
  def index
    @books = params[:my] ? current_user.books.page(params[:page]) : Book.recents.page(params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
    authorize @book
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    authorize @book
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    authorize @book

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    authorize @book

    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish
    authorize @book

    @book.publishing!
    redirect_back 'Status is updated'
  end

  def draft
    authorize @book

    @book.drafting!
    redirect_back 'Status is updated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_genres
      @genres = Genre.all
    end

    def check_owner
      redirect_to root_path, notice: 'Oops' unless @book.user == current_user
    end

    def redirect_back(notice)
      redirect_to(request.referrer || root_path, notice: notice)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :logo, :description,
                                   genre_ids: [])
    end
end
