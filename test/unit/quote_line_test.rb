require 'test_helper'

class QuoteLineTest < ActiveSupport::TestCase
  
  test "Quote Line has correct attributes" do
    quote_line = QuoteLine.new
    assert_respond_to(quote_line, :name)
    assert_respond_to(quote_line, :said)    
  end

  test "Quote Line requires name" do
    quote_line = QuoteLine.new
    assert !quote_line.save
  end

  test "Quote Line requires said" do
    quote_line = QuoteLine.new
    assert !quote_line.save  
  end

  test "Quote Line rejects name longer than 15 chars" do
    long_name = "a"*16
    quote_line = QuoteLine.new(:name => long_name)
    assert !quote_line.save
  end

  test "Quote Line rejects said longer than 140 chars" do
    long_said = "a"*141
    quote_line = QuoteLine.new(:said => long_said)
    assert !quote_line.save
  end

  test "Valid quote line is saved" do
    valid_quote_line = QuoteLine.new(:name => "Steph", :said => "Unit testing rocks!")
    assert valid_quote_line.save  
  end

end
