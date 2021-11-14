class PortfoliosController < ApplicationController
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
  	@portfolio_item = Portfolio.find(params[:id])
  end

   # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
  	@portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: "Portfolio item was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

end
