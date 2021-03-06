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
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  def index
    @quotes = Quote.paginate(:page => params[:page])
    @title = "When Dumb Friends Talk"
  end

  def like
    @quote = Quote.find(params[:id])
    @quote.like!
    redirect_to :back
  end
  
  def comments
    @quote = Quote.find(params[:id])
    @comment = Comment.new(:quote_id => params[:id])
    @comments = Comment.where("quote_id = ?", params[:id])
  end

  def submit
    @comment = Comment.new(params[:comments])
    @comment.save!
  end


end
