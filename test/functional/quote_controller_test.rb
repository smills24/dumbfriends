require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
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

end
