class HistoriesController < ApplicationController
  before_action :set_check, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
     #@histories = History.all
     if (isadmin)
       @histories = History.email_search(params[:id])
     else
       @histories = History.email_search(current_user[:email])
     end
          
  end
  
  def bookindex

    if (isadmin)
      @histories = History.book_search(params[:id])

    end

  end

  def checkout
    @histories = History.all
  end
  # GET /histories/1
  # GET /histories/1.json
  def show

    
  end

  # GET /histories/new
  def new
    @history = History.new
    #@book = Book.find(params[:id])

  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    #@check = History.new(check_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(check_params)
        format.html { redirect_to @check, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @check }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to checks_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @history = History.find(params[:id])


      #@check[:email] = session[:user][:email]

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_params
      params.require(:check).permit(:isbn, :email, :checkout, :checkin, :status)
    end
end
