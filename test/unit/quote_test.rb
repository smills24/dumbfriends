require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test "Quote has the right attributes" do
    quote = Quote.new
    assert_respond_to(quote, :title)
    assert_respond_to(quote, :likes)
    assert_respond_to(quote, :commented)
  end


  test "Quote likes increases when quote is liked" do
    quote = Quote.new
    quote.like!
    assert quote.likes = 1  
  end

  test "Quote requires a title to be saved" do
    quote = Quote.new
    assert !quote.save  
  end

  test "Rejects quote title longer than 20 characters" do
    longtitle = "a"*21
    quote = Quote.new(:title => longtitle)
    assert !quote.save
  end

  test "Quote initially has 0 likes" do
    quote = Quote.new
    assert (quote.likes = 0)  
  end

  test "Valid Quote is saved" do
    valid_quote = Quote.new(:title => "Title", :quote_lines_attributes => {0 => {:name => "Person", :said => "Stuff"}})
    assert valid_quote.save  
  end

  test 'Quote has comments attribute' do
    quote = Quote.new
    assert_respond_to(quote, :comments)
  end

  test 'Quote.comments returns an array of the quotes comments' do
    quote = Quote.new(:id => '1')
    quote.save
    comment = Comment.new(:quote_id => '1', :content => 'hey')
    comment.save
    assert quote.comments.include? comment
  end

end
