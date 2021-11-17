class PortfoliosController < ApplicationController
  before_action :set_potfolio_item, only:[:edit, :update, :show, :destroy] 
  layout 'portfolio'
	def index 
		@portfolio_items = Portfolio.all
	end 

	def new 
		@portfolio_item = Portfolio.new
	end

	# POST /blogs or /blogs.json
  def create
    	@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your Portfolio item is now Live." }
      else
        format.html { render :new }
         end
    end
  end

  def edit
  end

   # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: "Portfolio item was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

   # DELETE /blogs/1 or /blogs/1.json
  def destroy
  	#perform the lookup

  	#Destroy the post
    @portfolio_item.destroy

    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Post successfully Removed." }
    end
  end
  def set_potfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
