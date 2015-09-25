class HistoriesController < ApplicationController

  def index
    @history= History.all
  end

  def new
    @history = History.new
  end

  def show
    @history = History.find(params[:id])
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])

    if @history.update(history_params)
      redirect_to @history
    else
      render 'edit'
    end
  end

  def create
    @history = History.new(history_params)

    if @history.save
      redirect_to @history
    else
      render 'new'
    end
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy

    redirect_to histories_path
  end

  private
  def history_params
    params.require(:history).permit(:book_id,:user_id,:comment)
  end


end
