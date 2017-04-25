class QuotesController < ApplicationController
   before_action :set_quotes, only: [:edit, :update, :destroy]
  
  def index
    @quotes=Quote.all
  end
  
  def new
if params[:back]
@quotes=Quote.new(quotes_params)
else
  @quotes=Quote.new 
end
  end
  
  
  def create
    @quotes=Quote.new(quotes_params)
    if @quotes.save
    
    redirect_to quotes_path,notice:"Your favorite quote has posted！"
    
  else
    render 'new'
  end
  end
  
  def confirm
    @quotes=Quote.new(quotes_params)
    render :new if @quotes.invalid?
  end
  
  def edit
  end
  
  def update
    if @quotes.update(quotes_params)
    redirect_to quotes_path,notice:'Updated '
  else 
    render'edit'
  end
end

  def destroy
    @quotes.destroy
    
    redirect_to quotes_path
  end
  
  
  private
    def quotes_params
      params.require(:quote).permit(:content)
    end
    def set_quotes
      @quotes=Quote.find(params[:id])
    end
end
