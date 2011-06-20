require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should redirect to homepage and display correct flash message" do
    post :create, :quote => {:title => "Hi", :likes => '0', :quote_lines_attributes => {0 => {:name => "Steph", :said => "Cool app"}}}
    assert_redirected_to root_path
    assert_equal "Quote successfully submitted", flash[:success]
  end

  test "should show error message if title is blank" do
    post :create, :quote => {:title => "", :likes => 0, :quote_lines_attributes => {0 => {:name => "Steph", :said => "cool app"}}}
    assert_select 'div#error_explanation'
  end

  test "should paginate when more than 30 quotes are on the page" do
    31.times do
      post :create, :quote => {:title => "Hey", :likes => 0, :quote_lines_attributes => {0 => {:name => "Steph", :said => "cool app"}}}  
    end
    get :index
    assert_select 'div.pagination'
  end

  test 'should display correct number of likes' do
    post :create, :quote => {:title => "Hey", :likes => 1, :quote_lines_attributes => {0 => {:name => "Steph", :said => "cool app"}}}
    get :index
    assert_select 'div.like', '1 Like'
  end

  test 'should display correct number of comments' do
    @quote = Quote.create(:title => "Hey", :quote_lines_attributes => {0 => {:name => "Steph", :said => "cool app"}})
    Comment.create(:quote_id => @quote.id, :content => "Woahh")
    get :index
    assert_select 'div.comment', '1 Comment'
  end

  test 'quote should have a comments page' do
    @quote = Quote.new(:title => "Hey", :likes => 1, :quote_lines_attributes => {0 => {:name => "Steph", :said => "cool app"}})
    @quote.save!
    get(:comments, {'id' => @quote.id })
    assert_response :success  
  end

  test 'quote comment page should have the right title and content' do
    @quote = Quote.new(:title => "Hey", :likes => 1, :quote_lines_attributes => {0 => {:name => "Steph", :said => "cool app"}})
    @quote.save!
    get(:comments, {'id' => @quote.id })
    assert_select 'h1', @quote.title
    assert_select 'div.round'
  end

end
