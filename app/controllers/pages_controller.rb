class PagesController < ApplicationController
  
  def home
    @quotes = Quote.all
    @title = "When Dumb Friends Talk"
  end

  def about
    @title = "About this dumb site"
  end

end
