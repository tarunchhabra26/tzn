class RecBooksController < ApplicationController
  before_action :set_rec_book, only: [:show, :edit, :update, :destroy]

  # GET /rec_books
  # GET /rec_books.json
  def index
    @rec_books = RecBook.all
  end

  # GET /rec_books/1
  # GET /rec_books/1.json
  def show
  end

  # GET /rec_books/new
  def new
    @rec_book = RecBook.new
  end
  def create_rec_book
    @rec_book = RecBook.find(params[:id])
    @book = Book.new
    @book[:title] = @rec_book.Name
    @book[:description] = @rec_book.Description
    @book[:author] = @rec_book.Author
    @book[:status] = true
    @book[:isbn] = 0;
    respond_to do |format|
      @book[:status] = true
      if @book.save
        @rec_book.destroy
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  helper_method :create_rec_book
  # GET /rec_books/1/edit
  def edit
  end

  # POST /rec_books
  # POST /rec_books.json
  def create
    @rec_book = RecBook.new(rec_book_params)
    respond_to do |format|
      if @rec_book.save
        format.html { redirect_to @rec_book, notice: 'Recommendation was successfully created.' }
        format.json { render :show, status: :created, location: @rec_book }
      else
        format.html { render :new }
        format.json { render json: @rec_book.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /rec_books/1
  # PATCH/PUT /rec_books/1.json
  def update
    respond_to do |format|
      if @rec_book.update(rec_book_params)
        format.html { redirect_to @rec_book, notice: 'Rec book was successfully updated.' }
        format.json { render :show, status: :ok, location: @rec_book }
      else
        format.html { render :edit }
        format.json { render json: @rec_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rec_books/1
  # DELETE /rec_books/1.json
  def destroy
    @rec_book.destroy
    respond_to do |format|
      format.html { redirect_to rec_books_url, notice: 'Rec book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rec_book
      @rec_book = RecBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rec_book_params
      params.require(:rec_book).permit(:Name, :Author, :Description)
    end

end
