class QuotesController < ApplicationController

  def new
    @quote = Quote.new
    @quote.quote_lines.build
    @title = "Submit a quote"
  end

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      flash[:success] = "Quote successfully submitted"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @quote.destroy
  end


end
