class CommentsController < ApplicationController

  def comments
    @title = "Comments"
    @quote = Quote.find(params[:id])
  end

  def create
    @comment = Comment.new(params(:comment))
    @comment.save
  end

end
