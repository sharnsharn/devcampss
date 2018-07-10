class PortfoliosController < ApplicationController

    def index
        @portfolios = Portfolio.all
        puts "*" * 50
        puts @portfolios.inspect
        puts "*" * 50
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
          else
            format.html { render :new }
          end
        end
    end
end
