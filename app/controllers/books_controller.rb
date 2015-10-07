class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    if params[:search]
      @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end
  def checkout

      @book = Book.find(params[:id])

      @book[:status] = false
      #For return by admin
      if (!current_user.is_admin)
        @book[:email] = current_user.email
      else
        @user = User.find(params[:user])
        @book[:email] = @user.email;
      end
      @book.save
      @histories=History.new
      @histories[:isbn]=@book[:isbn]
      #For return by admin
      if (!current_user.is_admin)
      @histories[:email] = current_user.email
      else
        @histories[:email]=@user.email;
      end
      @histories[:status]='Checked Out'
      @histories[:checkout]=Time.now
      @histories.save
      redirect_to '/'

      
  end
  def checkin
      @book = Book.find(params[:id])
      @histories=History.new
      @histories[:isbn]= @book[:isbn]
      @histories[:email]= @book[:email]
      @histories[:status]='Checked In'
      @histories[:checkin]=Time.now
      @histories.save
      @book[:status] = true
      @book[:email] = nil
      @book.save
      #send mail to the request list
      if @book[:send_mail_notification] != nil
        @mail_address = @book[:send_mail_notification].split(',');
        #send_email(@book)
          @mail_address.each do |email|
            begin
            UserNotifier.notification_mail(email,@book.title).deliver
            rescue
          end
          end
            @book[:send_mail_notification] = nil
      end
      @book.save
      redirect_to '/'
  end

  def send_email(book)
      UserNotifier.notification_mail(mail_address,title).deliver_now
  end
  #This method will take the current email id for the given book id and then send him/her a mail once the book is returned
  def send_notification
    @book = Book.find(params[:id])
    if @book[:send_mail_notification] != nil
      if  @book[:send_mail_notification].to_s.downcase == 'null' && @book[:send_mail_notification].to_s.downcase == 'nil'
        @book[:send_mail_notification] = current_user.email
      end
      if !(@book[:send_mail_notification].split(',').include? current_user.email)
      #Check if the column already has a value, if yes then append using ','
          @book[:send_mail_notification] += ',' + current_user.email
      end
    else
        @book[:send_mail_notification] = current_user.email
    end
    @book.save
    redirect_to '/'
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @users = []
    User.all.each do |user|
      if !user.is_admin
      @users << [user.email,user.id]
      end
    end
    @users << [current_user.email,current_user.id]

  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
        @book[:status] = true
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
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :description, :author, :status)
    end
end
